From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: s3c64xx: Tidy up handling of regulator GPIO lookups
Date: Fri, 12 Apr 2019 09:14:58 +0200
Message-ID: <20190412071458.23122-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Rather than unconditionally registering the GPIO lookup table only do so
for devices that require it.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
[Fixed up to also handle wm5102 and wm5102 reva]
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
This modified patch from Charles is sitting in one of
my regulator branches.
Krzsystof are you collecting S3C patches?
The MAINATINERS file seems to be lacking an S3C maintainer
currently...
---
 arch/arm/mach-s3c64xx/mach-crag6410-module.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/mach-crag6410-module.c b/arch/arm/mach-s3c64xx/mach-crag6410-module.c
index 76c4855a03bc..937d0a83f8fd 100644
--- a/arch/arm/mach-s3c64xx/mach-crag6410-module.c
+++ b/arch/arm/mach-s3c64xx/mach-crag6410-module.c
@@ -328,6 +328,8 @@ static const struct {
 	int num_i2c_devs;
 	const struct spi_board_info *spi_devs;
 	int num_spi_devs;
+
+	struct gpiod_lookup_table *gpiod_table;
 } gf_mods[] = {
 	{ .id = 0x01, .rev = 0xff, .name = "1250-EV1 Springbank" },
 	{ .id = 0x02, .rev = 0xff, .name = "1251-EV1 Jura" },
@@ -362,13 +364,16 @@ static const struct {
 	  .i2c_devs = wm1255_devs, .num_i2c_devs = ARRAY_SIZE(wm1255_devs) },
 	{ .id = 0x3c, .rev = 0xff, .name = "1273-EV1 Longmorn" },
 	{ .id = 0x3d, .rev = 0xff, .name = "1277-EV1 Littlemill",
-	  .i2c_devs = wm1277_devs, .num_i2c_devs = ARRAY_SIZE(wm1277_devs) },
+	  .i2c_devs = wm1277_devs, .num_i2c_devs = ARRAY_SIZE(wm1277_devs),
+	  .gpiod_table = &wm8994_gpiod_table },
 	{ .id = 0x3e, .rev = 0, .name = "WM5102-6271-EV1-CS127 Amrut",
 	  .spi_devs = wm5102_reva_spi_devs,
-	  .num_spi_devs = ARRAY_SIZE(wm5102_reva_spi_devs) },
+	  .num_spi_devs = ARRAY_SIZE(wm5102_reva_spi_devs),
+	  .gpiod_table = &wm5102_reva_gpiod_table },
 	{ .id = 0x3e, .rev = -1, .name = "WM5102-6271-EV1-CS127 Amrut",
 	  .spi_devs = wm5102_spi_devs,
-	  .num_spi_devs = ARRAY_SIZE(wm5102_spi_devs) },
+	  .num_spi_devs = ARRAY_SIZE(wm5102_spi_devs),
+	  .gpiod_table = &wm5102_gpiod_table },
 	{ .id = 0x3f, .rev = -1, .name = "WM2200-6271-CS90-M-REV1",
 	  .i2c_devs = wm2200_i2c, .num_i2c_devs = ARRAY_SIZE(wm2200_i2c) },
 };
@@ -408,6 +413,9 @@ static int wlf_gf_module_probe(struct i2c_client *i2c,
 
 		spi_register_board_info(gf_mods[i].spi_devs,
 					gf_mods[i].num_spi_devs);
+
+		if (gf_mods[i].gpiod_table)
+			gpiod_add_lookup_table(gf_mods[i].gpiod_table);
 	} else {
 		dev_warn(&i2c->dev, "Unknown module ID 0x%x revision %d\n",
 			 id, rev + 1);
-- 
2.20.1
