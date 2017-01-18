

class Album extends React.Component {
    constructor(props) {
        super(props);
        this.state = {page: 1, search_value: 'Star Wars', movies: props.data};
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
    getMore() {
        // TODO: jQuery is not the React way to handle this
        $.ajax({
            type : 'GET',
            url : "/api/v1/movies/search.json?page=" + this.state.page + "&title=" + $('#search-movies-box').val(),
            success : function(data){
                this.setState({ movies : data });
            }.bind(this)
        });
    }
    submit(e) {
        e.preventDefault();
        this.getMore();


    }
    prevPage(e) {
        let page;
        page = this.state.page  -1;
        if (page < 1) {
            page = 1;
        } else {
            this.setState({page:(this.state.page - 1 )}, function () {
                this.getMore();
            });
        }

    }
    nextPage(e) {
        this.setState({page:(this.state.page + 1)}, function () {
            this.getMore();
        });
    }
    prevButton() {
        if (this.state.page > 1)
        return (

                <button  className="btn btn-primary" type="button" onClick={this.prevPage.bind(this)}>Prev</button>
            )

    }
    gallery() {
        return (
            <div className='album text-muted'>
                <div className='row'>
                    <div className="col-lg-1 col-centered ">
                        {this.prevButton()}
                    </div>
                    <div className="col-lg-1 col-centered ">
                        <button  className="btn btn-primary" type="button" onClick={this.nextPage.bind(this)}>Next</button>
                    </div>
                </div>
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
        )
    }
    render() {
        return (
            <div>
                <section className="jumbotron text-center">
                    <div className="container-fluid">
                        <div className="row">
                            <div className="col">
                                <h1 className="jumbotron-heading">Movie Flix</h1>
                                <p className="lead text-muted">Search Movies from themoviedb</p>
                            </div>

                        </div>
                        <br/>
                        <div className="row">
                            <div className="col-lg-6 col-centered offset">
                                <form className="form-inline" onSubmit={this.submit.bind(this)}>
                                    <div className="input-group all-width">
                                        <input id="search-movies-box"  type="text" className="form-control" placeholder="Search for..." />
                                      <span className="input-group-btn">
                                        <button className="btn btn-primary" type="button">Search</button>
                                      </span>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                </section>
                {this.gallery()}

            </div>
        );
    }
}

