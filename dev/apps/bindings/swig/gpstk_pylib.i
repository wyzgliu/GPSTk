%module(directors="1") gpstk_pylib
%{
    // time:
    #include "../../../src/TimeSystem.hpp"
    #include "../../../src/TimeTag.hpp"
    #include "../../../src/TimeConstants.hpp"
    #include "../../../src/TimeConverters.hpp"
    #include "../../../src/Week.hpp"
    #include "../../../src/WeekSecond.hpp"
    #include "../../../src/UnixTime.hpp"
    #include "../../../src/ANSITime.hpp"
    #include "../../../src/CivilTime.hpp"
    #include "../../../src/MathBase.hpp"
    #include "../../../src/CommonTime.hpp"
    #include "../../../src/Exception.hpp"
    #include "../../../src/GPSZcount.hpp"
    #include "../../../src/GPSWeek.hpp"
    #include "../../../src/GPSWeekSecond.hpp"
    #include "../../../src/GPSWeekZcount.hpp"
    #include "../../../src/JulianDate.hpp"
    #include "../../../src/BDSWeekSecond.hpp"
    #include "../../../src/GALWeekSecond.hpp"
    #include "../../../src/QZSWeekSecond.hpp"
    #include "../../../src/MJD.hpp"
    #include "../../../src/SystemTime.hpp"
    #include "../../../src/TimeString.hpp"
    #include "../../../src/YDSTime.hpp"
    #include "../../../src/TimeSystemCorr.hpp"

    // util:
    #include "../../../src/StringUtils.hpp"
    #include "../../../src/geometry.hpp"
    #include "../../../src/gps_constants.hpp"
    #include "../../../src/SatID.hpp"
    #include "../../../src/ObsIDInitializer.hpp"
    #include "../../../src/ObsID.hpp"
    #include "../../../src/GNSSconstants.hpp"
    #include "../../../src/Triple.hpp"
    #include "../../../src/ReferenceFrame.hpp"
    #include "../../../src/EllipsoidModel.hpp"
    #include "../../../src/Xvt.hpp"
    #include "../../../src/StringUtils.hpp"
    #include "../../../src/Position.hpp"
    #include "../../../src/Xv.hpp"
    #include "../../../src/convhelp.hpp"
    #include "../../../src/VectorBase.hpp"
    #include "../../../src/Vector.hpp"
    #include "../../../src/AstronomicalFunctions.hpp"

    #include "../../../src/XvtStore.hpp"
    #include "../../../src/PZ90Ellipsoid.hpp"
    #include "../../../src/WGS84Ellipsoid.hpp"
    #include "../../../src/gpstkplatform.h"
    #include "../../../src/FFStreamError.hpp"
    #include "../../../src/FileStore.hpp"
    #include "../../../src/BinUtils.hpp"
    #include "../../../src/FFData.hpp"
    #include "../../../src/EngNav.hpp"
    #include "../../../src/YumaBase.hpp"
    #include "../../../src/FFStream.hpp"
    #include "../../../src/FFTextStream.hpp"
    #include "../../../src/AlmOrbit.hpp"
    #include "../../../src/YumaHeader.hpp"
    #include "../../../src/EngAlmanac.hpp"
    #include "../../../src/OrbElem.hpp"
    #include "../../../src/OrbElemStore.hpp"
    #include "../../../src/YumaStream.hpp"
    #include "../../../src/YumaData.hpp"
    #include "../../../src/GPSAlmanacStore.hpp"
    #include "../../../src/YumaAlmanacStore.hpp"
    #include "../../../src/SVNumXRef.hpp"
    #include "../../../src/RinexSatID.hpp"
    #include "../../../src/GPS_URA.hpp"
    #include "../../../src/BrcClockCorrection.hpp"
    #include "../../../src/BrcKeplerOrbit.hpp"
    #include "../../../src/EngEphemeris.hpp"
    #include "../../../src/GPSEphemerisStore.hpp"
    #include "../../../src/GalEphemeris.hpp"
    #include "../../../src/GalEphemerisStore.hpp"
    #include "../../../src/GloEphemeris.hpp"

    // RINEX things:
    #include "../../../src/RinexSatID.hpp"
    #include "../../../src/RinexClockBase.hpp"
    #include "../../../src/RinexObsBase.hpp"
    #include "../../../src/RinexObsHeader.hpp"
    #include "../../../src/RinexObsData.hpp"
    #include "../../../src/RinexObsID.hpp"
    #include "../../../src/RinexClockHeader.hpp"
    #include "../../../src/RinexClockData.hpp"
    #include "../../../src/RinexClockStream.hpp"
    #include "../../../src/RinexObsStream.hpp"
    #include "../../../src/RinexNavBase.hpp"
    #include "../../../src/RinexNavHeader.hpp"
    #include "../../../src/RinexNavStream.hpp"
    #include "../../../src/RinexNavData.hpp"
    #include "../../../src/RinexMetBase.hpp"
    #include "../../../src/RinexMetHeader.hpp"
    #include "../../../src/RinexMetStream.hpp"
    #include "../../../src/RinexMetData.hpp"
    #include "../../../src/Rinex3NavBase.hpp"
    #include "../../../src/Rinex3NavHeader.hpp"
    #include "../../../src/Rinex3NavStream.hpp"
    #include "../../../src/Rinex3NavData.hpp"
    #include "../../../src/OrbElemRinex.hpp"
    #include "../../../src/Rinex3ClockBase.hpp"
    #include "../../../src/Rinex3ObsBase.hpp"
    #include "../../../src/Rinex3ObsHeader.hpp"
    #include "../../../src/Rinex3ObsData.hpp"
    #include "../../../src/Rinex3ObsStream.hpp"
    #include "../../../src/Rinex3ClockHeader.hpp"
    #include "../../../src/Rinex3ClockData.hpp"
    #include "../../../src/Rinex3ClockStream.hpp"
    #include "../../../src/Rinex3EphemerisStore.hpp"

    // SP3 things:
    #include "../../../src/TabularSatStore.hpp"
    #include "../../../src/ClockSatStore.hpp"
    #include "../../../src/SP3Base.hpp"
    #include "../../../src/SP3SatID.hpp"
    #include "../../../src/SP3Header.hpp"
    #include "../../../src/SP3Data.hpp"
    #include "../../../src/SP3Stream.hpp"
    #include "../../../src/PositionSatStore.hpp"
    #include "../../../src/SP3EphemerisStore.hpp"
    #include "../../../src/RinexUtilities.hpp"

    // SEM things:
    #include "../../../src/SEMBase.hpp"
    #include "../../../src/SEMHeader.hpp"
    #include "../../../src/SEMStream.hpp"
    #include "../../../src/SEMData.hpp"
    #include "../../../src/SEMAlmanacStore.hpp"

    #include "../../../src/Matrix.hpp"
    #include "../../../src/Bancroft.hpp"
    #include "../../../src/ValidType.hpp"
    #include "../../../src/ObsEpochMap.hpp"
    #include "../../../src/WxObsMap.hpp"
    #include "../../../src/TropModel.hpp"
    #include "../../../src/CheckPRData.hpp"
    #include "../../../src/PRSolution2.hpp"
    #include "../../../src/ExtractData.hpp"


    #include "../../../src/FFBinaryStream.hpp"
    #include "../../../src/FICBase.hpp"
    #include "../../../src/FICStreamBase.hpp"
    #include "../../../src/FICStream.hpp"
    #include "../../../src/FICHeader.hpp"
    #include "../../../src/FICData.hpp"


    typedef std::map< char, std::string> IdToValue;
    typedef std::map<gpstk::RinexSatID, std::vector<gpstk::RinexDatum> > DataMap;
    typedef std::map<gpstk::RinexMetHeader::RinexMetType, double> RinexMetMap;
    using namespace gpstk;
%}

// =============================================================
//  Section 1: C++ template containers & typedefs
// =============================================================
%feature("autodoc","1");
%include "doc/doc.i"
%include "std_string.i"
%include "std_vector.i"
%include "std_pair.i"
%include "std_map.i"
%include "std_list.i"
%include "std_set.i"
%include "std_multimap.i"

%rename(__str__) *::asString() const;
%rename(toCommonTime) *::convertToCommonTime() const;
%ignore *::dump;
%ignore *::operator<<;
%ignore operator<<;

%include "src/typemaps.i"
%include "src/std_vector_extra.i" // renamed since std_vector.i part of core swig
%include "src/std_map_extra.i"
%include "src/std_set_extra.i"

typedef std::map< char, std::string> IdToValue;
typedef std::map<RinexSatID, std::vector<RinexDatum> > DataMap;
typedef std::map<RinexMetHeader::RinexMetType, double> RinexMetMap;

%include "src/Exception.i"

// =============================================================
//  Section 2: Time classes
// =============================================================
%include "src/TimeSystem.i"
%include "../../../src/TimeTag.hpp"
%include "../../../src/TimeConstants.hpp"

// functions only modifiy reference parameters, not useful in python ATM
// %include "../../../src/TimeConverters.hpp"
%ignore gpstk::CommonTime::get;
%include "../../../src/CommonTime.hpp"
%include "../../../src/Week.hpp"
%include "../../../src/WeekSecond.hpp"
%feature("notabstract") UnixTime;
%include "../../../src/UnixTime.hpp"
%feature("notabstract") SystemTime;
%include "../../../src/SystemTime.hpp"
%feature("notabstract") ANSITime;
%include "../../../src/ANSITime.hpp"
%feature("notabstract") CivilTime;
%include "src/CivilTime.i"
%include "../../../src/GPSZcount.hpp"
%include "../../../src/GPSWeek.hpp"
%feature("notabstract") GPSWeekSecond;
%include "../../../src/GPSWeekSecond.hpp"
%feature("notabstract") GPSWeekZcount;
%include "../../../src/GPSWeekZcount.hpp"
%feature("notabstract") JulianDate;
%include "../../../src/JulianDate.hpp"
%feature("notabstract") BDSWeekSecond;
%include "../../../src/BDSWeekSecond.hpp"
%feature("notabstract") GALWeekSecond;
%include "../../../src/GALWeekSecond.hpp"
%feature("notabstract") QZSWeekSecond;
%include "../../../src/QZSWeekSecond.hpp"
%feature("notabstract") MJD;
%include "../../../src/MJD.hpp"
%feature("notabstract") YDSTime;
%include "../../../src/YDSTime.hpp"
%include "src/TimeString.i"
%include "../../../src/TimeSystemCorr.hpp"


// =============================================================
//  Section 3: General/Utils classes
// =============================================================
// Utils stuff

%include "../../../src/geometry.hpp"
%include "../../../src/gps_constants.hpp"
%include "src/SatID.i"
%include "../../../src/ObsIDInitializer.hpp"
%include "../../../src/ObsID.hpp"
%include "../../../src/GNSSconstants.hpp"
%include "src/Triple.i"
%include "src/ReferenceFrame.i"
%include "../../../src/EllipsoidModel.hpp"
%include "../../../src/Xvt.hpp"
%include "src/Position.i"
%include "../../../src/convhelp.hpp"
%include "../../../src/Xv.hpp"
%include "src/VectorBase.i"
%include "src/Vector.i"
%include "../../../src/AstronomicalFunctions.hpp"



// =============================================================
//  Section 4: "XvtStore and friends"
// =============================================================
%include "../../../src/PZ90Ellipsoid.hpp"
%include "../../../src/WGS84Ellipsoid.hpp"

%include "../../../src/XvtStore.hpp"
%template(XvtStore_SatID)  gpstk::XvtStore<gpstk::SatID>;
%template(XvtStore_string) gpstk::XvtStore<std::string>;

%include "../../../src/gpstkplatform.h"
%include "../../../src/FFStreamError.hpp"
%include "../../../src/FileStore.hpp"
%include "../../../src/BinUtils.hpp"
%include "../../../src/FFData.hpp"
%include "../../../src/EngNav.hpp"
%include "../../../src/YumaBase.hpp"
%include "../../../src/FFStream.hpp"
%include "../../../src/FFTextStream.hpp"
%include "../../../src/AlmOrbit.hpp"
%include "../../../src/YumaHeader.hpp"
%ignore gpstk::EngAlmanac::getUTC;
%include "../../../src/EngAlmanac.hpp"

%include "../../../src/OrbElem.hpp"
%include "../../../src/OrbElemStore.hpp"
%include "../../../src/AlmOrbit.hpp"
%include "../../../src/YumaStream.hpp"
%include "../../../src/YumaData.hpp"
%include "../../../src/GPSAlmanacStore.hpp"
%template(FileStore_YumaHeader) gpstk::FileStore<gpstk::YumaHeader>;
%include "../../../src/YumaAlmanacStore.hpp"

%include "../../../src/SVNumXRef.hpp"
%include "../../../src/RinexSatID.hpp"
%include "../../../src/GPS_URA.hpp"
%include "../../../src/BrcClockCorrection.hpp"
%include "../../../src/BrcKeplerOrbit.hpp"
%include "../../../src/EngEphemeris.hpp"
%include "../../../src/GPSEphemerisStore.hpp"
%include "../../../src/GalEphemeris.hpp"
%include "../../../src/GalEphemerisStore.hpp"
%include "../../../src/GloEphemeris.hpp"
%include "../../../src/GloEphemerisStore.hpp"


// RINEX things:
%rename (toEngEphemeris) *::operator EngEphemeris() const;
%rename (toGalEphemeris) *::operator GalEphemeris() const;
%rename (toGloEphemeris) *::operator GloEphemeris() const;
%rename (toAlmOrbit) *::operator AlmOrbit() const;
%include "../../../src/RinexSatID.hpp"
%include "../../../src/RinexClockBase.hpp"
%include "../../../src/RinexObsBase.hpp"
%include "../../../src/RinexObsHeader.hpp"
%include "../../../src/RinexObsData.hpp"
%include "../../../src/RinexObsID.hpp"
%include "../../../src/RinexObsStream.hpp"
%include "../../../src/RinexClockHeader.hpp"
%include "../../../src/RinexClockData.hpp"
%include "../../../src/RinexClockStream.hpp"

%include "../../../src/RinexNavBase.hpp"
%include "../../../src/RinexNavHeader.hpp"
%include "../../../src/RinexNavStream.hpp"
%include "../../../src/RinexNavData.hpp"

%include "../../../src/RinexMetBase.hpp"
%include "../../../src/RinexMetHeader.hpp"
%include "../../../src/RinexMetStream.hpp"
%include "src/RinexMetData.i"

%include "../../../src/Rinex3NavBase.hpp"
%include "../../../src/Rinex3NavHeader.hpp"
%include "../../../src/Rinex3NavStream.hpp"
%include "../../../src/Rinex3NavData.hpp"
%include "../../../src/OrbElemRinex.hpp"
%include "../../../src/Rinex3ClockBase.hpp"
%include "../../../src/Rinex3ObsBase.hpp"
%include "../../../src/Rinex3ObsHeader.hpp"
%include "../../../src/Rinex3ObsData.hpp"
%include "../../../src/Rinex3ObsStream.hpp"
%include "../../../src/Rinex3ClockHeader.hpp"
%include "../../../src/Rinex3ClockData.hpp"
%include "../../../src/Rinex3ClockStream.hpp"
%include "../../../src/Rinex3EphemerisStore.hpp"



// SP3 things:
%include "../../../src/TabularSatStore.hpp"
%include "src/ClockSatStore.i"
%include "../../../src/SP3Base.hpp"
%include "../../../src/SP3SatID.hpp"
%include "../../../src/SP3Header.hpp"
%include "../../../src/SP3Data.hpp"
%include "../../../src/SP3Stream.hpp"
%include "src/PositionSatStore.i"
%include "../../../src/SP3EphemerisStore.hpp"
%include "../../../src/RinexUtilities.hpp"


// SEM things:
%include "../../../src/SEMBase.hpp"
%include "../../../src/SEMHeader.hpp"
%include "../../../src/SEMStream.hpp"
%include "../../../src/SEMData.hpp"
%template(FileStore_SEMHeader) gpstk::FileStore<gpstk::SEMHeader>;
%include "../../../src/SEMAlmanacStore.hpp"


%include "../../../src/ValidType.hpp"
%include "../../../src/ObsEpochMap.hpp"
%include "../../../src/WxObsMap.hpp"
%include "../../../src/TropModel.hpp"
%include "../../../src/PRSolution2.hpp"
%include "../../../src/ExtractData.hpp"


%include "../../../src/FFBinaryStream.hpp"
%include "../../../src/FICBase.hpp"
%include "../../../src/FICStreamBase.hpp"
%include "../../../src/FICStream.hpp"
%include "../../../src/FICHeader.hpp"
%include "../../../src/FICData.hpp"


// Encapsulation of many the __str__, __getitem__, etc. functions to avoid clutter.
// When the only change to a class is adding a simple wrapper, add to pythonfunctions
// instead of creating another small file.
%include "src/pythonfunctions.i"
%include "src/FileIO.i"