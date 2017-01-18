

class Album extends React.Component {
    constructor(props) {
        super(props);
        this.state = {search_value: 'Star Wars', movies: props.data};
        this.state
    }

    renderPhoto(i) {
        movie = this.state.movies[i];
        if (movie == null) return ''; // Not enough movies in the result set
        return(<div className="col">

            <div className='card'>
                <img src={movie.backdrop_path_m} alt='Card image cap' />
                <p className='card-text'>
                    <b>{movie.title}</b><br/>

                    <b>Release Date: {movie.release_date}</b><br/>
                    <b>Average Vote: {movie.vote_average}</b><br/>
                    <br/>{movie.overview}</p>
            </div>
        </div>);
    }
    submit(e) {
        e.preventDefault();
        // TODO: jQuery is not the React way to handle this
        $.ajax({
            type : 'GET',
            url : "/api/v1/movies/search.json?title=" + $('#search-movies-box').val(),
            success : function(data){
                this.setState({ movies : data });
            }.bind(this)
        });
    }
    render() {
        return (
            <div>
                <section className="jumbotron text-center">
                    <div className="container">
                        <h1 className="jumbotron-heading">Movie Flix</h1>
                        <p className="lead text-muted">Search Movies from themoviedb</p>
                        <form className="form-inline" onSubmit={this.submit.bind(this)}>
                            <div className="form-group offset-sm-4  mx-sm-4">
                                <input  className="form-control" id="search-movies-box"  />
                            </div>
                            <button  className="btn btn-primary" >Search</button>
                        </form>
                    </div>

                </section>
            <div className='album text-muted'>
                <div className='container-fluid'>
                    <div className='row'>
                        {this.renderPhoto(0)}
                        {this.renderPhoto(1)}
                        {this.renderPhoto(2)}
                    </div>
                    <div className='row'>
                        {this.renderPhoto(3)}
                        {this.renderPhoto(4)}
                        {this.renderPhoto(5)}
                    </div>
                    <div className='row'>
                        {this.renderPhoto(6)}
                        {this.renderPhoto(7)}
                        {this.renderPhoto(8)}
                    </div>
                </div>
            </div>
            </div>);
    }
}

