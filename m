From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 1/2] ARM: SAMSUNG: Delete an error message for a failed memory
 allocation in three functions
Date: Wed, 4 Oct 2017 13:11:56 +0200
Message-ID: <ae29b97e-9a60-fdf4-5bd2-af33f6081446@users.sourceforge.net>
References: <75c352ad-c51e-2e63-2f93-0f14522ff09c@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <75c352ad-c51e-2e63-2f93-0f14522ff09c@users.sourceforge.net>
Content-Language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 4 Oct 2017 09:33:52 +0200

Omit extra messages for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/arm/plat-samsung/adc.c          | 8 ++------
 arch/arm/plat-samsung/platformdata.c | 4 +---
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/arm/plat-samsung/adc.c b/arch/arm/plat-samsung/adc.c
index daf3db9f0058..f8d6206e4daa 100644
--- a/arch/arm/plat-samsung/adc.c
+++ b/arch/arm/plat-samsung/adc.c
@@ -239,10 +239,8 @@ struct s3c_adc_client *s3c_adc_register(struct platform_device *pdev,
 		return ERR_PTR(-EINVAL);
 
 	client = kzalloc(sizeof(struct s3c_adc_client), GFP_KERNEL);
-	if (!client) {
-		dev_err(&pdev->dev, "no memory for adc client\n");
+	if (!client)
 		return ERR_PTR(-ENOMEM);
-	}
 
 	client->pdev = pdev;
 	client->is_ts = is_ts;
@@ -345,10 +343,8 @@ static int s3c_adc_probe(struct platform_device *pdev)
 	unsigned tmp;
 
 	adc = devm_kzalloc(dev, sizeof(struct adc_device), GFP_KERNEL);
-	if (adc == NULL) {
-		dev_err(dev, "failed to allocate adc_device\n");
+	if (!adc)
 		return -ENOMEM;
-	}
 
 	spin_lock_init(&adc->lock);
 
diff --git a/arch/arm/plat-samsung/platformdata.c b/arch/arm/plat-samsung/platformdata.c
index b430e9946287..6cf52ee7eeec 100644
--- a/arch/arm/plat-samsung/platformdata.c
+++ b/arch/arm/plat-samsung/platformdata.c
@@ -29,10 +29,8 @@ void __init *s3c_set_platdata(void *pd, size_t pdsize,
 	}
 
 	npd = kmemdup(pd, pdsize, GFP_KERNEL);
-	if (!npd) {
-		printk(KERN_ERR "%s: cannot clone platform data\n", pdev->name);
+	if (!npd)
 		return NULL;
-	}
 
 	pdev->dev.platform_data = npd;
 	return npd;
-- 
2.14.2
