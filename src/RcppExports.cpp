// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

#ifdef RCPP_USE_GLOBAL_ROSTREAM
Rcpp::Rostream<true>&  Rcpp::Rcout = Rcpp::Rcpp_cout_get();
Rcpp::Rostream<false>& Rcpp::Rcerr = Rcpp::Rcpp_cerr_get();
#endif

// rcpp_boundary
Rcpp::DataFrame rcpp_boundary(Rcpp::LogicalMatrix image);
RcppExport SEXP _mapscanner_rcpp_boundary(SEXP imageSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< Rcpp::LogicalMatrix >::type image(imageSEXP);
    rcpp_result_gen = Rcpp::wrap(rcpp_boundary(image));
    return rcpp_result_gen;
END_RCPP
}
// rcpp_components
Rcpp::IntegerMatrix rcpp_components(Rcpp::LogicalMatrix image);
RcppExport SEXP _mapscanner_rcpp_components(SEXP imageSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< Rcpp::LogicalMatrix >::type image(imageSEXP);
    rcpp_result_gen = Rcpp::wrap(rcpp_components(image));
    return rcpp_result_gen;
END_RCPP
}
// rcpp_concaveman
Rcpp::DataFrame rcpp_concaveman(Rcpp::DataFrame xy, Rcpp::NumericVector hull_in, const double concavity, const double length_threshold);
RcppExport SEXP _mapscanner_rcpp_concaveman(SEXP xySEXP, SEXP hull_inSEXP, SEXP concavitySEXP, SEXP length_thresholdSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< Rcpp::DataFrame >::type xy(xySEXP);
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type hull_in(hull_inSEXP);
    Rcpp::traits::input_parameter< const double >::type concavity(concavitySEXP);
    Rcpp::traits::input_parameter< const double >::type length_threshold(length_thresholdSEXP);
    rcpp_result_gen = Rcpp::wrap(rcpp_concaveman(xy, hull_in, concavity, length_threshold));
    return rcpp_result_gen;
END_RCPP
}
// rcpp_edge_thin
int rcpp_edge_thin(Rcpp::LogicalMatrix image);
RcppExport SEXP _mapscanner_rcpp_edge_thin(SEXP imageSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< Rcpp::LogicalMatrix >::type image(imageSEXP);
    rcpp_result_gen = Rcpp::wrap(rcpp_edge_thin(image));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_mapscanner_rcpp_boundary", (DL_FUNC) &_mapscanner_rcpp_boundary, 1},
    {"_mapscanner_rcpp_components", (DL_FUNC) &_mapscanner_rcpp_components, 1},
    {"_mapscanner_rcpp_concaveman", (DL_FUNC) &_mapscanner_rcpp_concaveman, 4},
    {"_mapscanner_rcpp_edge_thin", (DL_FUNC) &_mapscanner_rcpp_edge_thin, 1},
    {NULL, NULL, 0}
};

RcppExport void R_init_mapscanner(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
