/// Generated file. Do not edit.
///
/// Original: lib/common/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 24 (12 per locale)
///
/// Built on 2024-03-14 at 02:10 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	en(languageCode: 'en', build: Translations.build),
	zh(languageCode: 'zh', build: _StringsZh.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	String get title => 'Hunan Normal University';
	String get ok => 'Ok';
	String get cancel => 'Cancel';
	late final _StringsTabEn tab = _StringsTabEn._(_root);
	late final _StringsPullToRefreshEn pullToRefresh = _StringsPullToRefreshEn._(_root);
}

// Path: tab
class _StringsTabEn {
	_StringsTabEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get news => 'News';
	String get message => 'Message';
	String get app => 'App';
	String get profile => 'My';
}

// Path: pullToRefresh
class _StringsPullToRefreshEn {
	_StringsPullToRefreshEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get idle => 'Pull down Refresh';
	String get release => 'Release to Refresh';
	String get refreshing => 'Updating...';
	String get complete => 'Refresh completed!';
	String get failed => 'Refresh failed!';
}

// Path: <root>
class _StringsZh implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsZh.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.zh,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsZh _root = this; // ignore: unused_field

	// Translations
	@override String get title => '湖南师范大学';
	@override String get ok => '确定';
	@override String get cancel => '取消';
	@override late final _StringsTabZh tab = _StringsTabZh._(_root);
	@override late final _StringsPullToRefreshZh pullToRefresh = _StringsPullToRefreshZh._(_root);
}

// Path: tab
class _StringsTabZh implements _StringsTabEn {
	_StringsTabZh._(this._root);

	@override final _StringsZh _root; // ignore: unused_field

	// Translations
	@override String get news => '新闻';
	@override String get message => '消息';
	@override String get app => '应用';
	@override String get profile => '我的';
}

// Path: pullToRefresh
class _StringsPullToRefreshZh implements _StringsPullToRefreshEn {
	_StringsPullToRefreshZh._(this._root);

	@override final _StringsZh _root; // ignore: unused_field

	// Translations
	@override String get idle => '下拉刷新';
	@override String get release => '松开刷新';
	@override String get refreshing => '正在请求数据...';
	@override String get complete => '刷新完成！';
	@override String get failed => '刷新失败！';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'title': return 'Hunan Normal University';
			case 'ok': return 'Ok';
			case 'cancel': return 'Cancel';
			case 'tab.news': return 'News';
			case 'tab.message': return 'Message';
			case 'tab.app': return 'App';
			case 'tab.profile': return 'My';
			case 'pullToRefresh.idle': return 'Pull down Refresh';
			case 'pullToRefresh.release': return 'Release to Refresh';
			case 'pullToRefresh.refreshing': return 'Updating...';
			case 'pullToRefresh.complete': return 'Refresh completed!';
			case 'pullToRefresh.failed': return 'Refresh failed!';
			default: return null;
		}
	}
}

extension on _StringsZh {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'title': return '湖南师范大学';
			case 'ok': return '确定';
			case 'cancel': return '取消';
			case 'tab.news': return '新闻';
			case 'tab.message': return '消息';
			case 'tab.app': return '应用';
			case 'tab.profile': return '我的';
			case 'pullToRefresh.idle': return '下拉刷新';
			case 'pullToRefresh.release': return '松开刷新';
			case 'pullToRefresh.refreshing': return '正在请求数据...';
			case 'pullToRefresh.complete': return '刷新完成！';
			case 'pullToRefresh.failed': return '刷新失败！';
			default: return null;
		}
	}
}
