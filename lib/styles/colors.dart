import 'package:brewery/extension/extension.dart';
import 'package:flutter/material.dart';

Color primaryYellow = Color(getColorHexFromStr("#EAC763"));
Color shadowPurple = Color(getColorHexFromStr("#6A30E7"));
Color shadowBlackButton = Color(getColorHexFromStr("#3327631A"));
Color secondaryPurple = Color(getColorHexFromStr("#563BA4"));
Color softPurple = Color(getColorHexFromStr("#8973CC"));
Color disabledPurple = Color(getColorHexFromStr("#C4B9E6"));
Color lightPurple = Color(getColorHexFromStr("#D2CBEA"));
Color dateRangePurple = Color(getColorHexFromStr("#B497F3"));
Color dateTodayPurple = Color(getColorHexFromStr("#ECE5FC"));
Color primaryBlack = Color(getColorHexFromStr("#191432"));
Color placeholder = Color(getColorHexFromStr("#B9B6C1"));
Color monoPurple = Color(getColorHexFromStr("#817D90"));
Color monoGravel = Color(getColorHexFromStr("#837D90"));
Color monoGravelLight = Color(getColorHexFromStr("#B9B6C1"));
Color monoGravelLighter = Color(getColorHexFromStr("#E0DEE3"));
Color monoGravelLightest = Color(getColorHexFromStr("#F5F4F6"));
Color monoBlack = Color(getColorHexFromStr("#1E1432"));
Color monochrome = Color(getColorHexFromStr("#F9F8FC"));
Color primaryGreen = Color(getColorHexFromStr("#86BA15"));
Color whiteBg = Color(getColorHexFromStr("#FEFEFF"));
Color greenSuccess = Color(getColorHexFromStr("#86BA15"));
Color yellowPending = Color(getColorHexFromStr("#E7B62E"));
Color redFailed = Color(getColorHexFromStr("#D64065"));
Color darkPurple = Color(getColorHexFromStr("#4A15BA"));
Color darkBlue = Color(getColorHexFromStr("#1B0066"));
Color purple = Color(getColorHexFromStr("8E26E2"));
Color circlePurpleOne = Color(getColorHexFromStr("340D87"));
Color circlePurpleTwo = Color(getColorHexFromStr("6A30E7"));
Color circlePurpleThree = Color(getColorHexFromStr("3A1D8B"));
Color circlePurpleFour = Color(getColorHexFromStr("B76060")).withOpacity(0.2);
Color gravel = Color(getColorHexFromStr("#837D90"));
Color monochromeGravelLight = Color(getColorHexFromStr("#E0DEE3"));
Color strawberryLight = Color(getColorHexFromStr("#FAE7EC"));
Color errorRed = Color(getColorHexFromStr("C30000"));
Color primaryWhite = Color(getColorHexFromStr("#FEFEFF"));
Color primaryModal = Color(getColorHexFromStr("#C8C8C8"));
Color mainMint = Color(getColorHexFromStr("#C9FF57"));
Color redInfo = Color(getColorHexFromStr("#A40000"));
Color softGravelBg = Color(getColorHexFromStr("#F6F6FA"));
Color gravelCircleOne = Color(getColorHexFromStr("#ECE5FC"));
Color gravelCircleTwo = Color(getColorHexFromStr("#EAE1FF"));
Color speakoutBg = Color(getColorHexFromStr("#F1A69F"));
Color stockPurpleStatus = Color(getColorHexFromStr("#8E62ED"));

LinearGradient primaryGradient = LinearGradient(
  colors: [softPurple, primaryYellow],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

LinearGradient secondaryGradient = LinearGradient(
  colors: [purple, darkPurple],
  begin: const Alignment(0.0, 1.3),
  end: const Alignment(0.5, -1.0),
);
