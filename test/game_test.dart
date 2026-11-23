import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_dinozor_kosusu/oyun_dinozor_kosusu.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(dinozorConfig.title.length, 33);
    expect(dinozorConfig.tagline.length, 33);
    for (final s in dinozorConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler üretilir ve bot tarafından geçilir', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(dinozorRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: dinozorId, optionalMechanics: dinozorRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(dinozorRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
