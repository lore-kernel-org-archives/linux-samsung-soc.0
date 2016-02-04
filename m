From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 20/51] mtd: docg3: switch to mtd_ooblayout_ops
Date: Thu,  4 Feb 2016 11:06:43 +0100
Message-ID: <1454580434-32078-21-git-send-email-boris.brezillon@free-electrons.com>
References: <1454580434-32078-1-git-send-email-boris.brezillon@free-electrons.com>
Reply-To: boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCIPJ6FA2QLBB4OFZS2QKGQEFFUZDMA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1454580434-32078-1-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, punnaiah choudary kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Replace the nand_ecclayout definition by the equivalent mtd_ooblayout_ops
definition.

Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/mtd/devices/docg3.c | 38 +++++++++++++++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 6b516e1..0f63f51 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -73,10 +73,38 @@ MODULE_PARM_DESC(reliable_mode, "Set the docg3 mode (0=normal MLC, 1=fast, "
  * @eccpos: ecc positions (byte 7 is Hamming ECC, byte 8-14 are BCH ECC)
  * @oobfree: free pageinfo bytes (byte 0 until byte 6, byte 15
  */
-static struct nand_ecclayout docg3_oobinfo = {
-	.eccbytes = 8,
-	.eccpos = {7, 8, 9, 10, 11, 12, 13, 14},
-	.oobfree = {{0, 7}, {15, 1} },
+static int docg3_ooblayout_ecc(struct mtd_info *mtd, int section,
+			       struct mtd_oob_region *oobregion)
+{
+	if (section)
+		return -ERANGE;
+
+	oobregion->offset = 7;
+	oobregion->length = 8;
+
+	return 0;
+}
+
+static int docg3_ooblayout_free(struct mtd_info *mtd, int section,
+				struct mtd_oob_region *oobregion)
+{
+	if (section > 1)
+		return -ERANGE;
+
+	if (!section) {
+		oobregion->offset = 0;
+		oobregion->length = 7;
+	} else {
+		oobregion->offset = 15;
+		oobregion->length = 1;
+	}
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops nand_ooblayout_docg3_ops = {
+	.ecc = docg3_ooblayout_ecc,
+	.free = docg3_ooblayout_free,
 };
 
 static inline u8 doc_readb(struct docg3 *docg3, u16 reg)
@@ -1857,7 +1885,7 @@ static int __init doc_set_driver_info(int chip_id, struct mtd_info *mtd)
 	mtd->_read_oob = doc_read_oob;
 	mtd->_write_oob = doc_write_oob;
 	mtd->_block_isbad = doc_block_isbad;
-	mtd_set_ecclayout(mtd, &docg3_oobinfo);
+	mtd_set_ooblayout(mtd, &nand_ooblayout_docg3_ops);
 	mtd->oobavail = 8;
 	mtd->ecc_strength = DOC_ECC_BCH_T;
 
-- 
2.1.4
