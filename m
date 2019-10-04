From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 0/7] regulator: switch to using [devm_]fwnode_gpiod_get_index
Date: Fri,  4 Oct 2019 16:10:10 -0700
Message-ID: <20191004231017.130290-1-dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Sangbeom Kim <sbkim73@samsung.com>, Support Opensource <support.opensource@diasemi.com>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

This series swiches regulator drivers form using
[devm_]gpiod_get_from_of_node() that is scheduled to be removed in favor
of [devm_]fwnode_gpiod_get_index() that behaves more like standard
[devm_]gpiod_get_index() and will potentially handle secondary software
nodes in cases we need to augment platform firmware.

This depends on the new code that can be found in
ib-fwnode-gpiod-get-index immutable branch of Linus' Walleij tree:

	git pull git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git ib-fwnode-gpiod-get-index

I hope that it would be possible to pull in this immutable branch and
not wait until after 5.5 merge window.

Thanks!

Dmitry Torokhov (7):
  regulator: s5m8767: switch to using devm_fwnode_gpiod_get
  regulator: slg51000: switch to using fwnode_gpiod_get_index
  regulator: tps65090: switch to using devm_fwnode_gpiod_get
  regulator: s2mps11: switch to using devm_fwnode_gpiod_get
  regulator: da9211: switch to using devm_fwnode_gpiod_get
  regulator: tps65132: switch to using devm_fwnode_gpiod_get()
  regulator: max77686: switch to using fwnode_gpiod_get_index

 drivers/regulator/da9211-regulator.c   | 12 ++++++------
 drivers/regulator/max77686-regulator.c |  5 +++--
 drivers/regulator/s2mps11.c            |  7 +++----
 drivers/regulator/s5m8767.c            |  7 +++----
 drivers/regulator/slg51000-regulator.c | 13 +++++--------
 drivers/regulator/tps65090-regulator.c | 26 +++++++++++++++-----------
 drivers/regulator/tps65132-regulator.c | 17 ++++++++++-------
 7 files changed, 45 insertions(+), 42 deletions(-)

-- 
2.23.0.581.g78d2f28ef7-goog
