\name{source_sqlite}
\alias{source_sqlite}
\title{Create an sqlite data source.}
\usage{
  source_sqlite(path, table)
}
\arguments{
  \item{path}{path to sqlite database}

  \item{table}{name of table in database}
}
\description{
  To see exactly what SQL is being sent to the database,
  you can set option \code{dplyr.show_sql} to true:
  \code{options(dplyr.show_sql = TRUE).} If you're
  wondering why a particularly query is slow, it can be
  helpful to see the query plan. You can do this by setting
  \code{options(dplyr.explain_sql = TRUE)}. The output of
  SQLite's query plans is relatively easy to make sense of
  and is explained at \url{http://www.sqlite.org/eqp.html}.
  You may also find the explanation of how SQL indices
  works to be helpful:
  \url{http://www.sqlite.org/queryplanner.html}.
}
\examples{
db_path <- system.file("db", "baseball.sqlite3", package = "dplyr")
baseball_s <- source_sqlite(db_path, "baseball")
dim(baseball_s)
names(baseball_s)
head(baseball_s)

players <- group_by(baseball_s, id)
summarise(players, g = mean(g), n = count())
}

