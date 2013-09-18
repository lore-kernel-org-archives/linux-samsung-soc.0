From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH v5 1/4] ARM: S3C24XX: number the dma clocks
Date: Wed, 18 Sep 2013 21:19:17 +0200
Message-ID: <201309182119.17617.heiko@sntech.de>
References: <201309182118.28391.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201309182118.28391.heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: kgene.kim@samsung.com
Cc: Dan Williams <djbw@fb.com>, Vinod Koul <vinod.koul@intel.com>, linus.walleij@linaro.org, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Each dma channel has its own clock. The upcoming dma driver wants to
handle these itself and therefore needs to be able to get the correct
clock for a channel.

Therefore rename the dma clocks to "dma.X" for s3c2412, s3c2416 and
s3c2443. This does not change the behaviour for the old dma driver at
all, as all dma clocks are still always on and not handled by the old
dma driver at all.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
changes since v2:
- remove noise from commit message

 arch/arm/mach-s3c24xx/clock-s3c2412.c  |    8 ++++----
 arch/arm/mach-s3c24xx/common-s3c2443.c |   12 ++++++------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/clock-s3c2412.c b/arch/arm/mach-s3c24xx/clock-s3c2412.c
index d8f253f..11b3b28 100644
--- a/arch/arm/mach-s3c24xx/clock-s3c2412.c
+++ b/arch/arm/mach-s3c24xx/clock-s3c2412.c
@@ -484,22 +484,22 @@ static struct clk init_clocks_disable[] = {
 
 static struct clk init_clocks[] = {
 	{
-		.name		= "dma",
+		.name		= "dma.0",
 		.parent		= &clk_h,
 		.enable		= s3c2412_clkcon_enable,
 		.ctrlbit	= S3C2412_CLKCON_DMA0,
 	}, {
-		.name		= "dma",
+		.name		= "dma.1",
 		.parent		= &clk_h,
 		.enable		= s3c2412_clkcon_enable,
 		.ctrlbit	= S3C2412_CLKCON_DMA1,
 	}, {
-		.name		= "dma",
+		.name		= "dma.2",
 		.parent		= &clk_h,
 		.enable		= s3c2412_clkcon_enable,
 		.ctrlbit	= S3C2412_CLKCON_DMA2,
 	}, {
-		.name		= "dma",
+		.name		= "dma.3",
 		.parent		= &clk_h,
 		.enable		= s3c2412_clkcon_enable,
 		.ctrlbit	= S3C2412_CLKCON_DMA3,
diff --git a/arch/arm/mach-s3c24xx/common-s3c2443.c b/arch/arm/mach-s3c24xx/common-s3c2443.c
index f6b9f2e..65d3eef 100644
--- a/arch/arm/mach-s3c24xx/common-s3c2443.c
+++ b/arch/arm/mach-s3c24xx/common-s3c2443.c
@@ -438,32 +438,32 @@ static struct clk init_clocks_off[] = {
 
 static struct clk init_clocks[] = {
 	{
-		.name		= "dma",
+		.name		= "dma.0",
 		.parent		= &clk_h,
 		.enable		= s3c2443_clkcon_enable_h,
 		.ctrlbit	= S3C2443_HCLKCON_DMA0,
 	}, {
-		.name		= "dma",
+		.name		= "dma.1",
 		.parent		= &clk_h,
 		.enable		= s3c2443_clkcon_enable_h,
 		.ctrlbit	= S3C2443_HCLKCON_DMA1,
 	}, {
-		.name		= "dma",
+		.name		= "dma.2",
 		.parent		= &clk_h,
 		.enable		= s3c2443_clkcon_enable_h,
 		.ctrlbit	= S3C2443_HCLKCON_DMA2,
 	}, {
-		.name		= "dma",
+		.name		= "dma.3",
 		.parent		= &clk_h,
 		.enable		= s3c2443_clkcon_enable_h,
 		.ctrlbit	= S3C2443_HCLKCON_DMA3,
 	}, {
-		.name		= "dma",
+		.name		= "dma.4",
 		.parent		= &clk_h,
 		.enable		= s3c2443_clkcon_enable_h,
 		.ctrlbit	= S3C2443_HCLKCON_DMA4,
 	}, {
-		.name		= "dma",
+		.name		= "dma.5",
 		.parent		= &clk_h,
 		.enable		= s3c2443_clkcon_enable_h,
 		.ctrlbit	= S3C2443_HCLKCON_DMA5,
-- 
1.7.10.4
