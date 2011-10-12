From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] ARM: Samsung: Move fimc plat. device from board files to
 plat-samsung
Date: Wed, 12 Oct 2011 17:31:25 +0200
Message-ID: <1318433485-1757-1-git-send-email-s.nawrocki@samsung.com>
References: <039b01cc8730$594ab530$0be01f90$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:32043 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752323Ab1JLPbd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Oct 2011 11:31:33 -0400
Received: from euspt1 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LSY009GZLSJU3@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 12 Oct 2011 16:31:31 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LSY00CRRLSI4O@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 12 Oct 2011 16:31:31 +0100 (BST)
In-reply-to: <039b01cc8730$594ab530$0be01f90$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, m.szyprowski@samsung.com, riverful.kim@samsung.com, sw0312.kim@samsung.com, s.nawrocki@samsung.com, Kyungmin Park <kyungmin.park@samsung.com>

Move the platform device definitions from boards code to plat-samsung
to avoid multiple instances when multiple board support is compiled in.
The boards should select at least S5P_DEV_FIMC0 to enable FIMC support.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
Hi Kgene,

To decrease overall diff size, if it's not too late yet, you might want to
squash parts of this patch with previous commits:

0513218 ARM: S5PV210: Add support for M-5MOLS image sensor on UNIVERSAL_C210
39aefab ARM: S5PV210: Add support for NOON010PC30 sensor on GONI board

Here is the optional new patch summary:

ARM: Samsung: Add fimc platform device for s5p-fimc media device driver

The s5p-fimc driver now creates an aggregate media device which is bound
to "s5p-fimc-md" platform device. This patch adds such a platform device
instance to be registered by each board that requires FIMC device support.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

Sorry for the noise. 

Regards,
Sylwester
---
 arch/arm/mach-exynos4/mach-universal_c210.c |    5 -----
 arch/arm/mach-s5pv210/mach-goni.c           |    5 -----
 arch/arm/plat-samsung/devs.c                |    5 +++++
 arch/arm/plat-samsung/include/plat/devs.h   |    1 +
 4 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/arch/arm/mach-exynos4/mach-universal_c210.c b/arch/arm/mach-exynos4/mach-universal_c210.c
index 18cf5c7..2096c8b 100644
--- a/arch/arm/mach-exynos4/mach-universal_c210.c
+++ b/arch/arm/mach-exynos4/mach-universal_c210.c
@@ -920,11 +920,6 @@ static struct s5p_platform_fimc fimc_md_platdata = {
 	.num_clients	= ARRAY_SIZE(universal_camera_sensors),
 };
 
-struct platform_device s5p_device_fimc_md = {
-	.name	= "s5p-fimc-md",
-	.id	= -1,
-};
-
 static struct gpio universal_camera_gpios[] = {
 	{ GPIO_CAM_LEVEL_EN(1),	GPIOF_OUT_INIT_HIGH, "CAM_LVL_EN1" },
 	{ GPIO_CAM_LEVEL_EN(2),	GPIOF_OUT_INIT_LOW,  "CAM_LVL_EN2" },
diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-s5pv210/mach-goni.c
index 01e4867..61da205 100644
--- a/arch/arm/mach-s5pv210/mach-goni.c
+++ b/arch/arm/mach-s5pv210/mach-goni.c
@@ -849,11 +849,6 @@ struct s5p_platform_fimc goni_fimc_md_platdata __initdata = {
 	.num_clients	= ARRAY_SIZE(goni_camera_sensors),
 };
 
-struct platform_device s5p_device_fimc_md = {
-	.name		= "s5p-fimc-md",
-	.id		= -1,
-};
-
 static struct platform_device *goni_devices[] __initdata = {
 	&s3c_device_fb,
 	&s5p_device_onenand,
diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
index cb6fd9e..4ca8b57 100644
--- a/arch/arm/plat-samsung/devs.c
+++ b/arch/arm/plat-samsung/devs.c
@@ -204,6 +204,11 @@ struct platform_device s5p_device_fimc0 = {
 		.coherent_dma_mask	= DMA_BIT_MASK(32),
 	},
 };
+
+struct platform_device s5p_device_fimc_md = {
+	.name	= "s5p-fimc-md",
+	.id	= -1,
+};
 #endif /* CONFIG_S5P_DEV_FIMC0 */
 
 #ifdef CONFIG_S5P_DEV_FIMC1
diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/plat-samsung/include/plat/devs.h
index 8f19241..ab633c9 100644
--- a/arch/arm/plat-samsung/include/plat/devs.h
+++ b/arch/arm/plat-samsung/include/plat/devs.h
@@ -77,6 +77,7 @@ extern struct platform_device s5p_device_fimc0;
 extern struct platform_device s5p_device_fimc1;
 extern struct platform_device s5p_device_fimc2;
 extern struct platform_device s5p_device_fimc3;
+extern struct platform_device s5p_device_fimc_md;
 extern struct platform_device s5p_device_fimd0;
 extern struct platform_device s5p_device_hdmi;
 extern struct platform_device s5p_device_i2c_hdmiphy;
-- 
1.7.7
