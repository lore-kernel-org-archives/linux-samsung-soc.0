From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v6 2/3] v4l: Move s5p-fimc driver into Video capture devices
Date: Mon, 16 May 2011 14:05:38 +0200
Message-ID: <1305547539-13194-3-git-send-email-s.nawrocki@samsung.com>
References: <1305547539-13194-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <1305547539-13194-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, laurent.pinchart@ideasonboard.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, riverful.kim@samsung.com, kgene.kim@samsung.com, sungchun.kang@samsung.com, jonghun.han@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

s5p-fimc now also implements a camera capture video node so move
it under the "Video capture devices" Kconfig menu. Also update
the entry to reflect the driver's coverage of EXYNOS4 SoCs and
separate the Makefile entry from the soc-camera drivers set.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/media/video/Kconfig  |   19 +++++++++++--------
 drivers/media/video/Makefile |    1 +
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/media/video/Kconfig b/drivers/media/video/Kconfig
index d61414e..a705493 100644
--- a/drivers/media/video/Kconfig
+++ b/drivers/media/video/Kconfig
@@ -934,6 +934,17 @@ config VIDEO_MX2
 	  This is a v4l2 driver for the i.MX27 and the i.MX25 Camera Sensor
 	  Interface
 
+config  VIDEO_SAMSUNG_S5P_FIMC
+	tristate "Samsung S5P and EXYNOS4 camera host interface driver"
+	depends on VIDEO_DEV && VIDEO_V4L2 && PLAT_S5P
+	select VIDEOBUF2_DMA_CONTIG
+	select V4L2_MEM2MEM_DEV
+	---help---
+	  This is a v4l2 driver for Samsung S5P and EXYNOS4 camera
+	  host interface and video postprocessor.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called s5p-fimc.
 
 #
 # USB Multimedia device configuration
@@ -1029,13 +1040,5 @@ config VIDEO_MEM2MEM_TESTDEV
 	  This is a virtual test device for the memory-to-memory driver
 	  framework.
 
-config  VIDEO_SAMSUNG_S5P_FIMC
-	tristate "Samsung S5P FIMC (video postprocessor) driver"
-	depends on VIDEO_DEV && VIDEO_V4L2 && PLAT_S5P
-	select VIDEOBUF2_DMA_CONTIG
-	select V4L2_MEM2MEM_DEV
-	help
-	  This is a v4l2 driver for the S5P camera interface
-	  (video postprocessor)
 
 endif # V4L_MEM2MEM_DRIVERS
diff --git a/drivers/media/video/Makefile b/drivers/media/video/Makefile
index a10e4c3..9519160 100644
--- a/drivers/media/video/Makefile
+++ b/drivers/media/video/Makefile
@@ -165,6 +165,7 @@ obj-$(CONFIG_VIDEO_PXA27x)		+= pxa_camera.o
 obj-$(CONFIG_VIDEO_SH_MOBILE_CSI2)	+= sh_mobile_csi2.o
 obj-$(CONFIG_VIDEO_SH_MOBILE_CEU)	+= sh_mobile_ceu_camera.o
 obj-$(CONFIG_VIDEO_OMAP1)		+= omap1_camera.o
+
 obj-$(CONFIG_VIDEO_SAMSUNG_S5P_FIMC) 	+= s5p-fimc/
 
 obj-$(CONFIG_ARCH_DAVINCI)		+= davinci/
-- 
1.7.5
