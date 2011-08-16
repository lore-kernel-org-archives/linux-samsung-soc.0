From: Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH 2/3] ARM: S5PC100: use dma-pl330 device name for clock
Date: Wed, 17 Aug 2011 00:31:05 +0300
Message-ID: <1313530266-14939-3-git-send-email-vz@mleia.com>
References: <1313530266-14939-1-git-send-email-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1313530266-14939-1-git-send-email-vz@mleia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Boojin Kim <boojin.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Vladimir Zapolskiy <vz@mleia.com>
List-Id: linux-samsung-soc@vger.kernel.org

This change replaces s3c-pl330.x clock device names with dma-pl330.x,
otherwise there won't be a correspondence between clock device name
and amba device name, thus clocks can't be enabled.

Fixes runtime errors on clk_get() from drivers/dma/pl330.c:
  dma-pl330 dma-pl330.0: Cannot get operation clock.
  dma-pl330: probe of dma-pl330.0 failed with error -22

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
Cc: Boojin Kim <boojin.kim@samsung.com>
---
 arch/arm/mach-s5pc100/clock.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-s5pc100/clock.c b/arch/arm/mach-s5pc100/clock.c
index 6527c05..8d47709 100644
--- a/arch/arm/mach-s5pc100/clock.c
+++ b/arch/arm/mach-s5pc100/clock.c
@@ -460,13 +460,13 @@ static struct clk init_clocks_off[] = {
 		.ctrlbit	= (1 << 2),
 	}, {
 		.name		= "dma",
-		.devname	= "s3c-pl330.1",
+		.devname	= "dma-pl330.1",
 		.parent		= &clk_div_d1_bus.clk,
 		.enable		= s5pc100_d1_0_ctrl,
 		.ctrlbit	= (1 << 1),
 	}, {
 		.name		= "dma",
-		.devname	= "s3c-pl330.0",
+		.devname	= "dma-pl330.0",
 		.parent		= &clk_div_d1_bus.clk,
 		.enable		= s5pc100_d1_0_ctrl,
 		.ctrlbit	= (1 << 0),
-- 
1.7.5.1
