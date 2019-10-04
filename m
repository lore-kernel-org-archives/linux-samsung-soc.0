From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 4/7] regulator: s2mps11: switch to using devm_fwnode_gpiod_get
Date: Fri,  4 Oct 2019 16:10:14 -0700
Message-ID: <20191004231017.130290-5-dmitry.torokhov@gmail.com>
References: <20191004231017.130290-1-dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191004231017.130290-1-dmitry.torokhov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Sangbeom Kim <sbkim73@samsung.com>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

devm_gpiod_get_from_of_node() is being retired in favor of
devm_fwnode_gpiod_get_index(), that behaves similar to
devm_gpiod_get_index(), but can work with arbitrary firmware node. It
will also be able to support secondary software nodes.

Let's switch this driver over.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

 drivers/regulator/s2mps11.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 5bc00884cf51..4f2dc5ebffdc 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -844,10 +844,9 @@ static void s2mps14_pmic_dt_parse_ext_control_gpio(struct platform_device *pdev,
 		if (!rdata[reg].init_data || !rdata[reg].of_node)
 			continue;
 
-		gpio[reg] = devm_gpiod_get_from_of_node(&pdev->dev,
-				rdata[reg].of_node,
-				"samsung,ext-control-gpios",
-				0,
+		gpio[reg] = devm_fwnode_gpiod_get(&pdev->dev,
+				of_fwnode_handle(rdata[reg].of_node),
+				"samsung,ext-control",
 				GPIOD_OUT_HIGH | GPIOD_FLAGS_BIT_NONEXCLUSIVE,
 				"s2mps11-regulator");
 		if (PTR_ERR(gpio[reg]) == -ENOENT)
-- 
2.23.0.581.g78d2f28ef7-goog
