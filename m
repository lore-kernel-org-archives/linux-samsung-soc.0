From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 6/7] s5p-csis: Allow to specify pixel clock's source through
 platform data
Date: Mon, 17 Sep 2012 12:54:32 +0200
Message-ID: <1347879273-30463-3-git-send-email-s.nawrocki@samsung.com>
References: <1347878888-30001-1-git-send-email-s.nawrocki@samsung.com>
 <1347879273-30463-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <1347879273-30463-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: kyungmin.park@samsung.com, sw0312.kim@samsung.com, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Depending on the sensor configuration it might be required to adjust
the CSIS's output pixel clock so it is greater than its input pixel
clock, in order to avoid the input data FIFO overflow.

Use platform data to select SCLK_CSIS clock from CMU as a source, rather
than CSI APB clock.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/media/video/s5p-fimc/mipi-csis.c | 4 +++-
 include/linux/platform_data/mipi-csis.h  | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/video/s5p-fimc/mipi-csis.c b/drivers/media/video/s5p-fimc/mipi-csis.c
index 1a2db5d..fbfe739 100644
--- a/drivers/media/video/s5p-fimc/mipi-csis.c
+++ b/drivers/media/video/s5p-fimc/mipi-csis.c
@@ -306,8 +306,10 @@ static void s5pcsis_set_params(struct csis_state *state)
 		val |= S5PCSIS_CTRL_ALIGN_32BIT;
 	else /* 24-bits */
 		val &= ~S5PCSIS_CTRL_ALIGN_32BIT;
-	/* Not using external clock. */
+
 	val &= ~S5PCSIS_CTRL_WCLK_EXTCLK;
+	if (pdata->wclk_source)
+		val |= S5PCSIS_CTRL_WCLK_EXTCLK;
 	s5pcsis_write(state, S5PCSIS_CTRL, val);
 
 	/* Update the shadow register. */
diff --git a/include/linux/platform_data/mipi-csis.h b/include/linux/platform_data/mipi-csis.h
index 8b703e1..bf34e17 100644
--- a/include/linux/platform_data/mipi-csis.h
+++ b/include/linux/platform_data/mipi-csis.h
@@ -1,5 +1,5 @@
 /*
- * Copyright (C) 2010-2011 Samsung Electronics Co., Ltd.
+ * Copyright (C) 2010 - 2012 Samsung Electronics Co., Ltd.
  *
  * Samsung S5P/Exynos SoC series MIPI CSIS device support
  *
@@ -14,11 +14,13 @@
 /**
  * struct s5p_platform_mipi_csis - platform data for S5P MIPI-CSIS driver
  * @clk_rate:    bus clock frequency
+ * @wclk_source: CSI wrapper clock selection: 0 - bus clock, 1 - ext. SCLK_CAM
  * @lanes:       number of data lanes used
  * @hs_settle:   HS-RX settle time
  */
 struct s5p_platform_mipi_csis {
 	unsigned long clk_rate;
+	u8 wclk_source;
 	u8 lanes;
 	u8 hs_settle;
 };
-- 
1.7.11.3
