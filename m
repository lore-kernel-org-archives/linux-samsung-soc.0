From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: [PATCH 1/3] ARM: S3C64XX: Add SDMA clocks
Date: Mon, 31 May 2010 13:28:39 +0200
Message-ID: <4c67e6ad.887b0e0a.49b7.2837@mx.google.com>
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
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org
List-Id: linux-samsung-soc@vger.kernel.org

This adds the clock definition bits for SDMA.

Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
---
 arch/arm/mach-s3c64xx/clock.c |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/clock.c b/arch/arm/mach-s3c64xx/clock.c
index 7e03f0a..1362d31 100644
--- a/arch/arm/mach-s3c64xx/clock.c
+++ b/arch/arm/mach-s3c64xx/clock.c
@@ -230,6 +230,18 @@ static struct clk init_clocks_disable[] = {
 		.parent		= &clk_h,
 		.enable		= s3c64xx_hclk_ctrl,
 		.ctrlbit	= S3C_CLKCON_HCLK_DMA1,
+	}, {
+		.name		= "sdma0",
+		.id		= -1,
+		.parent		= &clk_h,
+		.enable		= s3c64xx_hclk_ctrl,
+		.ctrlbit	= S3C_CLKCON_HCLK_SDMA0,
+	}, {
+		.name		= "sdma1",
+		.id		= -1,
+		.parent		= &clk_h,
+		.enable		= s3c64xx_hclk_ctrl,
+		.ctrlbit	= S3C_CLKCON_HCLK_SDMA1,
 	},
 };
 
-- 
1.7.0.4
