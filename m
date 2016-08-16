From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [RFC 01/17] clk: bcm2835: Rename clk_register to avoid name conflict
Date: Tue, 16 Aug 2016 15:34:58 +0200
Message-ID: <1471354514-24224-2-git-send-email-k.kozlowski@samsung.com>
References: <1471354514-24224-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1471354514-24224-1-git-send-email-k.kozlowski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, alsa-devel@alsa-project.org
Cc: a.hajda@samsung.com, Javier Martinez Canillas <javier@osg.samsung.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

During clk_register_*() API refactoring, macros will be used for hiding
and narrowing the scope of changes thus leading to a name conflict with
clk_register found in bcm2835 clk driver.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/clk/bcm/clk-bcm2835.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index 7a7970865c2d..b77a8efbfce7 100644
--- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -1262,12 +1262,12 @@ static struct clk *bcm2835_register_gate(struct bcm2835_cprman *cprman,
 typedef struct clk *(*bcm2835_clk_register)(struct bcm2835_cprman *cprman,
 					    const void *data);
 struct bcm2835_clk_desc {
-	bcm2835_clk_register clk_register;
+	bcm2835_clk_register bcm2835_clk_register;
 	const void *data;
 };
 
 /* assignment helper macros for different clock types */
-#define _REGISTER(f, ...) { .clk_register = (bcm2835_clk_register)f, \
+#define _REGISTER(f, ...) { .bcm2835_clk_register = (bcm2835_clk_register)f, \
 			    .data = __VA_ARGS__ }
 #define REGISTER_PLL(...)	_REGISTER(&bcm2835_register_pll,	\
 					  &(struct bcm2835_pll_data)	\
@@ -1825,8 +1825,8 @@ static int bcm2835_clk_probe(struct platform_device *pdev)
 
 	for (i = 0; i < asize; i++) {
 		desc = &clk_desc_array[i];
-		if (desc->clk_register && desc->data)
-			clks[i] = desc->clk_register(cprman, desc->data);
+		if (desc->bcm2835_clk_register && desc->data)
+			clks[i] = desc->bcm2835_clk_register(cprman, desc->data);
 	}
 
 	return of_clk_add_provider(dev->of_node, of_clk_src_onecell_get,
-- 
1.9.1
