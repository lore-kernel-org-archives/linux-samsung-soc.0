From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] [media] exynos4-is: cleanup a define
Date: Fri, 8 Nov 2013 01:52:24 -0800 (PST)
Message-ID: <20131108095224.GJ27977@elgon.mountain>
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
To: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, kernel-janitors@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Grant Likely <grant.likely@linaro.org>, Mauro Carvalho Chehab <m.chehab@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

This define is only used in s5pcsis_irq_handler():

	if ((status & S5PCSIS_INTSRC_NON_IMAGE_DATA) && pktbuf->data) {

The problem is that "status" is a 32 bit and (0xff << 28) is larger than
32 bits and that sets off a static checker warning.  I consulted with
Sylwester Nawrocki and the define should actually be (0xf << 28).

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/platform/exynos4-is/mipi-csis.c b/drivers/media/platform/exynos4-is/mipi-csis.c
index 9fc2af6..31dfc50 100644
--- a/drivers/media/platform/exynos4-is/mipi-csis.c
+++ b/drivers/media/platform/exynos4-is/mipi-csis.c
@@ -91,7 +91,7 @@ MODULE_PARM_DESC(debug, "Debug level (0-2)");
 #define S5PCSIS_INTSRC_ODD_BEFORE	(1 << 29)
 #define S5PCSIS_INTSRC_ODD_AFTER	(1 << 28)
 #define S5PCSIS_INTSRC_ODD		(0x3 << 28)
-#define S5PCSIS_INTSRC_NON_IMAGE_DATA	(0xff << 28)
+#define S5PCSIS_INTSRC_NON_IMAGE_DATA	(0xf << 28)
 #define S5PCSIS_INTSRC_FRAME_START	(1 << 27)
 #define S5PCSIS_INTSRC_FRAME_END	(1 << 26)
 #define S5PCSIS_INTSRC_ERR_SOT_HS	(0xf << 12)
