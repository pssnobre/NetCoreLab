using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    public class MoviesController : Controller
    {
        private readonly AppDbContext _context;

        public MoviesController(AppDbContext context)
        {
            _context = context;
        }

        // GET: Movies
        public async Task<IActionResult> List()
        {
            var vm = new VMMovieList
            {
                MoviesList = _context.Movies.Include(m => m.CategoryNavigation).ToList(),
                Movie = new Movie()
            };

            ViewData["Category"] = BindSelectList();

            return View(vm);
        }

        public async Task<IActionResult> Filter([Bind("Id,Title,Description,Year,Category")] Movie movie)
        {
            var vm = new VMMovieList
            {
                MoviesList = GetMovies(movie),
                Movie = new Movie()
            };
            ViewData["Category"] = BindSelectList();

            return View("List", vm);
        }

        // GET: Movies
        public async Task<IActionResult> Index()
        {
            var appDbContext = _context.Movies.Include(m => m.CategoryNavigation);
            return View(await appDbContext.ToListAsync());
        }

        // GET: Movies/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var movie = await _context.Movies
                .Include(m => m.CategoryNavigation)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (movie == null)
            {
                return NotFound();
            }

            return View(movie);
        }

        // GET: Movies/Create
        public IActionResult Create()
        {
            ViewData["Category"] = new SelectList(_context.Categories, "Id", "Title");
            return View();
        }

        // POST: Movies/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Title,Description,Year,Category")] Movie movie)
        {
            if (ModelState.IsValid)
            {
                _context.Add(movie);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(List));
            }
            ViewData["Category"] = new SelectList(_context.Categories, "Id", "Title", movie.Category);
            return View(movie);
        }

        // GET: Movies/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var movie = await _context.Movies.FindAsync(id);
            if (movie == null)
            {
                return NotFound();
            }
            ViewData["Category"] = new SelectList(_context.Categories, "Id", "Title", movie.Category);
            return View(movie);
        }

        // POST: Movies/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,Title,Description,Year,Category")] Movie movie)
        {
            if (id != movie.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(movie);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!MovieExists(movie.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(List));
            }
            ViewData["Category"] = new SelectList(_context.Categories, "Id", "Title", movie.Category);
            return View(movie);
        }

        // GET: Movies/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var movie = await _context.Movies
                .Include(m => m.CategoryNavigation)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (movie == null)
            {
                return NotFound();
            }

            return View(movie);
        }

        // POST: Movies/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var movie = await _context.Movies.FindAsync(id);
            _context.Movies.Remove(movie);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(List));
        }

        private bool MovieExists(int id)
        {
            return _context.Movies.Any(e => e.Id == id);
        }

        private IEnumerable<Movie> GetMovies(Movie movie)
        {
            var movies = _context.Movies.Include(m => m.CategoryNavigation).ToList();

            if (!string.IsNullOrEmpty(movie.Title))
            {
                movies = movies.Where(x => x.Title.ToLower().Contains(movie.Title.ToLower())).ToList();
            }
            if (!string.IsNullOrEmpty(movie.Description))
            {
                movies = movies.Where(x => x.Description.ToLower().Contains(movie.Description.ToLower())).ToList();
            }
            if (movie.Year > 0)
            {
                movies = movies.Where(x => x.Year == movie.Year).ToList();
            }
            if (movie.Category > 0)
            {
                movies = movies.Where(x => x.Category == movie.Category).ToList();
            }

            return movies;
        }

        private List<SelectListItem> BindSelectList()
        {
            var items = new SelectList(_context.Categories, "Id", "Title").ToList();
            items.Insert(0, (new SelectListItem { Text = "Select...", Value = "0" }));
            return items;
        }
    }
}
