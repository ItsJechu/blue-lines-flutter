import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/auth/firebase_auth/auth_util.dart';

DateTime getTodayFirstHour() {
  return DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day);
}

DateTime getTodayFirstHourCopy() {
  DateTime now = DateTime.now();
  return DateTime(
      now.year, now.month, now.day); // Solo mantiene la parte de la fecha.
}
