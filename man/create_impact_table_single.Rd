% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_impact_table_single.R
\name{create_impact_table_single}
\alias{create_impact_table_single}
\title{\code{create_impact_table_single}}
\usage{
create_impact_table_single(data.linked, data.units, link.to = "zips",
  zcta.dataset = NULL, counties. = NULL, map.month, map.unitID,
  metric = "N")
}
\arguments{
\item{data.linked}{data for plotting as output from disperseR::link_all_units()}

\item{data.units}{information on unit locations as output from disperseR::units()}

\item{link.to}{spatial scale for plotting. One of 'zips', 'counties', or 'grids' that should match original input to disperseR::link_all_units()}

\item{zcta.dataset}{ZIP code/ZCTA sptial dataset as imported by disperseR::get_data() or subset thereof}

\item{counties.}{US counties dataset as imported using USAboundaries::us_counties( ) or subset thereof}

\item{map.month}{specific month to map in form YYYYMM if time.agg = 'month'. Can be created using disperseR::get_yearmon()}

\item{map.unitID}{specific unit to map as string. Must match 'ID' column in data.units.}

\item{metric}{plotting metric in `data.linked` input. Defaults to 'hyads', the default output of disperseR::calculate_exposure().}
}
\value{
An sf data.table of impacts for a single unit and month suitable for plotting
}
\description{
`create_impact_table_single()` takes output from `link_all_units()` and creates a table of spatial impacts
}
