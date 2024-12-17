// import 'package:csm_app/core/localization/locale_controller.dart';
// import 'package:csm_app/core/services/services.dart';
// import 'package:get_it/get_it.dart';
// import '../../controllers/announcement/announcement_controller.dart';
// import '../../controllers/auth/forgot_password_controller.dart';
// import '../../controllers/auth/login_controller.dart';
// import '../../controllers/auth/reset_password_controller.dart';
// import '../../controllers/choose_ticket_type_controller.dart';
// import '../../controllers/contact_controller.dart';
// import '../../controllers/knowledge_base/knowledge_base_controller.dart';
// import '../../controllers/outage/outage_controller.dart';
// import '../../controllers/privacy_controller.dart';
// import '../../controllers/terms_conditions_controller.dart';

// final sl = GetIt.instance;

// class ServiceLocator {
//   static void init() {
//     //GetX controllers
//     sl.registerSingleton<LocaleController>(LocaleController());
//     sl.registerSingleton<MyServices>(MyServices());
//     sl.registerLazySingleton<LoginControllerImp>(() => LoginControllerImp());
//     sl.registerLazySingleton<PrivacyPolicyControllerImp>(() => PrivacyPolicyControllerImp());
//     sl.registerLazySingleton<TermsAndConditionsControllerImp>(() => TermsAndConditionsControllerImp());
//     sl.registerLazySingleton<ContactControllerImp>(() => ContactControllerImp());
//     sl.registerLazySingleton<KnowledgeBaseControllerImp>(() => KnowledgeBaseControllerImp());
//     sl.registerLazySingleton<ChooseTicketTypeControllerImp>(() => ChooseTicketTypeControllerImp());
//     // more than one object
//     sl.registerLazySingleton<AnnouncementsControllerImp>(() => AnnouncementsControllerImp());
//     sl.registerLazySingleton<OutagesControllerImp>(() => OutagesControllerImp());
//     sl.registerLazySingleton<ForgotPasswordControllerImp>(() => ForgotPasswordControllerImp());
//     sl.registerLazySingleton<ResetPasswordControllerImp>(() => ResetPasswordControllerImp());

//     // ///DATA SOURCE
//     // sl.registerLazySingleton<BaseMovieRemoteDataSource>(
//     //         () => MovieRemoteDataSource());
//   }
// }
