From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 18/19 v4] s5p-fimc: Correct crop offset alignment on exynos4
Date: Thu, 01 Sep 2011 17:30:22 +0200
Message-ID: <1314891023-14227-19-git-send-email-s.nawrocki@samsung.com>
References: <1314891023-14227-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <1314891023-14227-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: mchehab@redhat.com, m.szyprowski@samsung.com, kyungmin.park@samsung.com, s.nawrocki@samsung.com, sw0312.kim@samsung.com, riverful.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Horizontal crop offset must be multiple of 2 otherwise
color distortion occurs.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/media/video/s5p-fimc/fimc-core.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/video/s5p-fimc/fimc-core.c b/drivers/media/video/s5p-fimc/fimc-core.c
index a528a76..8978360 100644
--- a/drivers/media/video/s5p-fimc/fimc-core.c
+++ b/drivers/media/video/s5p-fimc/fimc-core.c
@@ -1898,7 +1898,7 @@ static struct samsung_fimc_variant fimc0_variant_exynos4 = {
 	.has_mainscaler_ext = 1,
 	.min_inp_pixsize = 16,
 	.min_out_pixsize = 16,
-	.hor_offs_align	 = 1,
+	.hor_offs_align	 = 2,
 	.out_buf_count	 = 32,
 	.pix_limit	 = &s5p_pix_limit[1],
 };
@@ -1910,7 +1910,7 @@ static struct samsung_fimc_variant fimc3_variant_exynos4 = {
 	.has_mainscaler_ext = 1,
 	.min_inp_pixsize = 16,
 	.min_out_pixsize = 16,
-	.hor_offs_align	 = 1,
+	.hor_offs_align	 = 2,
 	.out_buf_count	 = 32,
 	.pix_limit	 = &s5p_pix_limit[3],
 };
-- 
1.7.6
