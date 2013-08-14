From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH 20/29] watchdog: s3c2410_wdt: simplify use of
 devm_ioremap_resource
Date: Wed, 14 Aug 2013 11:11:24 +0200
Message-ID: <1376471493-22215-21-git-send-email-Julia.Lawall@lip6.fr>
References: <1376471493-22215-1-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1376471493-22215-1-git-send-email-Julia.Lawall@lip6.fr>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-watchdog@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Wim Van Sebroeck <wim@iguana.be>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Remove unneeded error handling on the result of a call to
platform_get_resource when the value is passed to devm_ioremap_resource.

Move the call to platform_get_resource adjacent to the call to
devm_ioremap_resource to make the connection between them more clear.

A simplified version of the semantic patch that makes this change is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression pdev,res,n,e,e1;
expression ret != 0;
identifier l;
@@

- res = platform_get_resource(pdev, IORESOURCE_MEM, n);
  ... when != res
- if (res == NULL) { ... \(goto l;\|return ret;\) }
  ... when != res
+ res = platform_get_resource(pdev, IORESOURCE_MEM, n);
  e = devm_ioremap_resource(e1, res);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/watchdog/s3c2410_wdt.c |    7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 6a22cf5..9fbc993 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -325,12 +325,6 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 	dev = &pdev->dev;
 	wdt_dev = &pdev->dev;
 
-	wdt_mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (wdt_mem == NULL) {
-		dev_err(dev, "no memory resource specified\n");
-		return -ENOENT;
-	}
-
 	wdt_irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
 	if (wdt_irq == NULL) {
 		dev_err(dev, "no irq resource specified\n");
@@ -339,6 +333,7 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 	}
 
 	/* get the memory region for the watchdog timer */
+	wdt_mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	wdt_base = devm_ioremap_resource(dev, wdt_mem);
 	if (IS_ERR(wdt_base)) {
 		ret = PTR_ERR(wdt_base);
