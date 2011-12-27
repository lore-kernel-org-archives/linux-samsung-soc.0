From: Kamil Debski <k.debski@samsung.com>
Subject: [PATCH 2/3] s5p-g2d: add G2D to mach-nuri
Date: Tue, 27 Dec 2011 14:21:27 +0100
Message-ID: <1324992088-12037-3-git-send-email-k.debski@samsung.com>
References: <1324992088-12037-1-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:29472 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753544Ab1L0NVj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Dec 2011 08:21:39 -0500
Received: from euspt2 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LWV000R36G1AE40@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Dec 2011 13:21:37 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LWV00I056G1ZL@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Dec 2011 13:21:37 +0000 (GMT)
In-reply-to: <1324992088-12037-1-git-send-email-k.debski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, k.debski@samsung.com, jaeryul.oh@samsung.com, jtp.park@samsung.com, kgene.kim@samsung.com, sachin.kamat@linaro.org

G2D is a 2D graphics accelerator engine present in the s5p family
of Samsung SoCs. It is capable of bitblt and raster operations on
images having dimensions of up to 8000x8000.

Signed-off-by: Kamil Debski <k.debski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/Kconfig     |    1 +
 arch/arm/mach-exynos/mach-nuri.c |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 4e36e8f..3bd0eec 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -271,6 +271,7 @@ config MACH_NURI
 	select S5P_DEV_FIMC1
 	select S5P_DEV_FIMC2
 	select S5P_DEV_FIMC3
+	select S5P_DEV_G2D
 	select S5P_DEV_MFC
 	select S5P_DEV_USB_EHCI
 	select S5P_SETUP_MIPIPHY
diff --git a/arch/arm/mach-exynos/mach-nuri.c b/arch/arm/mach-exynos/mach-nuri.c
index 4df7d3e..3df8bf4 100644
--- a/arch/arm/mach-exynos/mach-nuri.c
+++ b/arch/arm/mach-exynos/mach-nuri.c
@@ -1261,6 +1261,7 @@ static struct platform_device *nuri_devices[] __initdata = {
 	&s3c_device_i2c3,
 	&i2c9_gpio,
 	&s3c_device_adc,
+	&s5p_device_g2d,
 	&s3c_device_rtc,
 	&s5p_device_mfc,
 	&s5p_device_mfc_l,
-- 
1.7.0.4
