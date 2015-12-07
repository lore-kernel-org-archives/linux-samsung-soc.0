From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 22/23] mtd: nand: kill layout field
Date: Mon,  7 Dec 2015 23:26:17 +0100
Message-ID: <1449527178-5930-23-git-send-email-boris.brezillon@free-electrons.com>
References: <1449527178-5930-1-git-send-email-boris.brezillon@free-electrons.com>
Reply-To: boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCIPJ6FA2QLBB2MPTCZQKGQEPAOZXOY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1449527178-5930-1-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, punnaiah choudary kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/mtd/nand/nand_base.c | 8 --------
 drivers/mtd/nand/nand_bch.c  | 9 ---------
 include/linux/mtd/nand.h     | 1 -
 3 files changed, 18 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 6440c5d..85deacb 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4148,13 +4148,6 @@ int nand_scan_tail(struct mtd_info *mtd)
 	chip->oob_poi = chip->buffers->databuf + mtd->writesize;
 
 	/*
-	 * Set the provided ECC layout. If ecc->layout is NULL, the MTD core
-	 * will just leave mtd->ooblayout to NULL, if it's not NULL, it will
-	 * set ->ooblayout to the default ecclayout wrapper.
-	 */
-	mtd_set_ecclayout(mtd, ecc->layout);
-
-	/*
 	 * If no default placement scheme is given, select an appropriate one.
 	 */
 	if (!mtd->ooblayout && (ecc->mode != NAND_ECC_SOFT_BCH)) {
@@ -4401,7 +4394,6 @@ int nand_scan_tail(struct mtd_info *mtd)
 	mtd->writebufsize = mtd->writesize;
 
 	/* propagate ecc info to mtd_info */
-	mtd_set_ecclayout(mtd, ecc->layout);
 	mtd->ecc_strength = ecc->strength;
 	mtd->ecc_step_size = ecc->size;
 	/*
diff --git a/drivers/mtd/nand/nand_bch.c b/drivers/mtd/nand/nand_bch.c
index 2937b49..3b90643 100644
--- a/drivers/mtd/nand/nand_bch.c
+++ b/drivers/mtd/nand/nand_bch.c
@@ -158,15 +158,6 @@ struct nand_bch_control *nand_bch_init(struct mtd_info *mtd)
 
 	eccsteps = mtd->writesize/eccsize;
 
-	/*
-	 * Rely on the default ecclayout to ooblayout wrapper provided by MTD
-	 * core if ecc.layout is not NULL.
-	 * FIXME: this should be removed when all callers have moved to the
-	 * mtd_ooblayout_ops approach.
-	 */
-	if (nand->ecc.layout)
-		mtd_set_ecclayout(mtd, nand->ecc.layout);
-
 	/* if no ecc placement scheme was provided, build one */
 	if (!mtd->ooblayout) {
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 9ba9daba..f4ba147 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -494,7 +494,6 @@ struct nand_ecc_ctrl {
 	int strength;
 	int prepad;
 	int postpad;
-	struct nand_ecclayout	*layout;
 	void *priv;
 	void (*hwctl)(struct mtd_info *mtd, int mode);
 	int (*calculate)(struct mtd_info *mtd, const uint8_t *dat,
-- 
2.1.4
