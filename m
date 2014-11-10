From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH v6 4/5] regulator: of: Pass the regulator description in the match table
Date: Mon, 10 Nov 2014 14:43:54 +0100
Message-ID: <1415627035-3088-5-git-send-email-javier.martinez@collabora.co.uk>
References: <1415627035-3088-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1415627035-3088-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Olof Johansson <olof@lixom.net>, Chris Zhong <zyw@rock-chips.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

Drivers can use the of_regulator_match() function to parse the regulator
init_data from DT. A match table is used to specify the name of the node
containing the regulators, the device node and to return the init_data
to the caller.

But also the static regulator descriptor is needed to correctly extract
some DT properties like the regulator initial and suspend modes. Use the
match table to pass that information.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---

This patch only adds the struct regulator_desc pointer to the struct
of_regulator_match and does not fill this in all the the drivers to
keep the series short. A following series will change all regulator
drivers to be sure that all of them pass it to of_regulator_match().

Changes in v6: None

 drivers/regulator/of_regulator.c       | 3 ++-
 include/linux/regulator/of_regulator.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index 945486f..cbc1d71 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -221,7 +221,8 @@ int of_regulator_match(struct device *dev, struct device_node *node,
 				continue;
 
 			match->init_data =
-				of_get_regulator_init_data(dev, child, NULL);
+				of_get_regulator_init_data(dev, child,
+							   match->desc);
 			if (!match->init_data) {
 				dev_err(dev,
 					"failed to parse DT for regulator %s\n",
diff --git a/include/linux/regulator/of_regulator.h b/include/linux/regulator/of_regulator.h
index 8d1d136..763953f 100644
--- a/include/linux/regulator/of_regulator.h
+++ b/include/linux/regulator/of_regulator.h
@@ -13,6 +13,7 @@ struct of_regulator_match {
 	void *driver_data;
 	struct regulator_init_data *init_data;
 	struct device_node *of_node;
+	const struct regulator_desc *desc;
 };
 
 #if defined(CONFIG_OF)
-- 
2.1.0
