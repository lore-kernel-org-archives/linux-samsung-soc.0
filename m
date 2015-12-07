From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 18/23] mtd: nand: bch: switch to nand_ecclayout_pos
Date: Mon,  7 Dec 2015 23:26:13 +0100
Message-ID: <1449527178-5930-19-git-send-email-boris.brezillon@free-electrons.com>
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
 drivers/mtd/nand/nand_bch.c | 33 +++++++++++----------------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/nand/nand_bch.c b/drivers/mtd/nand/nand_bch.c
index 9cff544..2937b49 100644
--- a/drivers/mtd/nand/nand_bch.c
+++ b/drivers/mtd/nand/nand_bch.c
@@ -32,13 +32,11 @@
 /**
  * struct nand_bch_control - private NAND BCH control structure
  * @bch:       BCH control structure
- * @ecclayout: private ecc layout for this BCH configuration
  * @errloc:    error location array
  * @eccmask:   XOR ecc mask, allows erased pages to be decoded as valid
  */
 struct nand_bch_control {
 	struct bch_control   *bch;
-	struct nand_ecclayout ecclayout;
 	unsigned int         *errloc;
 	unsigned char        *eccmask;
 };
@@ -124,7 +122,6 @@ struct nand_bch_control *nand_bch_init(struct mtd_info *mtd)
 {
 	struct nand_chip *nand = mtd_to_nand(mtd);
 	unsigned int m, t, eccsteps, i;
-	struct nand_ecclayout *layout = nand->ecc.layout;
 	struct nand_bch_control *nbc = NULL;
 	unsigned char *erased_page;
 	unsigned int eccsize = nand->ecc.size;
@@ -161,8 +158,17 @@ struct nand_bch_control *nand_bch_init(struct mtd_info *mtd)
 
 	eccsteps = mtd->writesize/eccsize;
 
+	/*
+	 * Rely on the default ecclayout to ooblayout wrapper provided by MTD
+	 * core if ecc.layout is not NULL.
+	 * FIXME: this should be removed when all callers have moved to the
+	 * mtd_ooblayout_ops approach.
+	 */
+	if (nand->ecc.layout)
+		mtd_set_ecclayout(mtd, nand->ecc.layout);
+
 	/* if no ecc placement scheme was provided, build one */
-	if (!layout) {
+	if (!mtd->ooblayout) {
 
 		/* handle large page devices only */
 		if (mtd->oobsize < 64) {
@@ -171,24 +177,7 @@ struct nand_bch_control *nand_bch_init(struct mtd_info *mtd)
 			goto fail;
 		}
 
-		layout = &nbc->ecclayout;
-		layout->eccbytes = eccsteps*eccbytes;
-
-		/* reserve 2 bytes for bad block marker */
-		if (layout->eccbytes+2 > mtd->oobsize) {
-			printk(KERN_WARNING "no suitable oob scheme available "
-			       "for oobsize %d eccbytes %u\n", mtd->oobsize,
-			       eccbytes);
-			goto fail;
-		}
-		/* put ecc bytes at oob tail */
-		for (i = 0; i < layout->eccbytes; i++)
-			layout->eccpos[i] = mtd->oobsize-layout->eccbytes+i;
-
-		layout->oobfree[0].offset = 2;
-		layout->oobfree[0].length = mtd->oobsize-2-layout->eccbytes;
-
-		nand->ecc.layout = layout;
+		mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
 	}
 
 	/* sanity checks */
-- 
2.1.4
