From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 21/23] staging: mt29f_spinand: switch to mtd_ooblayout_ops
Date: Mon,  7 Dec 2015 23:26:16 +0100
Message-ID: <1449527178-5930-22-git-send-email-boris.brezillon@free-electrons.com>
References: <1449527178-5930-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1449527178-5930-1-git-send-email-boris.brezillon@free-electrons.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: devel@driverdev.osuosl.org, linux-mips@linux-mips.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-sunxi@googlegroups.com, Ralf Baechle <ralf@linux-mips.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, linux-kernel@vger.kernel.org, Josh Wu <josh.wu@atmel.com>, Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, punnaiah choudary kalluri <punnaia@xilinx.com>, Kyungmin Park <kyungmin.park@samsung.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Stefan Agner <stefan@agner.ch>, Daniel Mack <daniel@zonque.org>
List-Id: linux-samsung-soc@vger.kernel.org

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/staging/mt29f_spinand/mt29f_spinand.c | 44 ++++++++++++++++-----------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/mt29f_spinand/mt29f_spinand.c b/drivers/staging/mt29f_spinand/mt29f_spinand.c
index cb9d5ab..967d50a 100644
--- a/drivers/staging/mt29f_spinand/mt29f_spinand.c
+++ b/drivers/staging/mt29f_spinand/mt29f_spinand.c
@@ -42,23 +42,29 @@ static inline struct spinand_state *mtd_to_state(struct mtd_info *mtd)
 static int enable_hw_ecc;
 static int enable_read_hw_ecc;
 
-static struct nand_ecclayout spinand_oob_64 = {
-	.eccbytes = 24,
-	.eccpos = {
-		1, 2, 3, 4, 5, 6,
-		17, 18, 19, 20, 21, 22,
-		33, 34, 35, 36, 37, 38,
-		49, 50, 51, 52, 53, 54, },
-	.oobfree = {
-		{.offset = 8,
-			.length = 8},
-		{.offset = 24,
-			.length = 8},
-		{.offset = 40,
-			.length = 8},
-		{.offset = 56,
-			.length = 8},
-	}
+static int spinand_oob_64_eccpos(struct mtd_info *mtd, int eccbyte)
+{
+	if (eccbyte > 23)
+		return -ERANGE;
+
+	return ((eccbyte / 6) * 16) + 1;
+}
+
+static int spinand_oob_64_oobfree(struct mtd_info *mtd, int section,
+				  struct nand_oobfree *oobfree)
+{
+	if (section > 3)
+		return -ERANGE;
+
+	oobfree->offset = (section * 16) + 8;
+	oobfree->length = 8;
+
+	return 0;
+}
+
+const struct mtd_ooblayout_ops spinand_oob_64_ops = {
+	.eccpos = spinand_oob_64_eccpos,
+	.oobfree = spinand_oob_64_oobfree,
 };
 #endif
 
@@ -883,7 +889,6 @@ static int spinand_probe(struct spi_device *spi_nand)
 
 	chip->ecc.strength = 1;
 	chip->ecc.total	= chip->ecc.steps * chip->ecc.bytes;
-	chip->ecc.layout = &spinand_oob_64;
 	chip->ecc.read_page = spinand_read_page_hwecc;
 	chip->ecc.write_page = spinand_write_page_hwecc;
 #else
@@ -911,6 +916,9 @@ static int spinand_probe(struct spi_device *spi_nand)
 	mtd->priv = chip;
 	mtd->dev.parent = &spi_nand->dev;
 	mtd->oobsize = 64;
+#ifdef CONFIG_MTD_SPINAND_ONDIEECC
+	mtd_set_ooblayout(mtd, &spinand_oob_64_ops);
+#endif
 
 	if (nand_scan(mtd, 1))
 		return -ENXIO;
-- 
2.1.4
