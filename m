From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/2] media: exynos-gsc: drop obsolete capabilities
Date: Tue, 31 Oct 2017 17:45:43 +0100
Message-ID: <20171031164544.2401-1-m.szyprowski@samsung.com>
References: <CGME20171031164549eucas1p2322d11106997b38122e5d2be47eb7808@eucas1p2.samsung.com>
Return-path: <linux-media-owner@vger.kernel.org>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Hans Verkuil <hverkuil@xs4all.nl>
List-Id: linux-samsung-soc@vger.kernel.org

Setting both V4L2_CAP_VIDEO_CAPTURE_MPLANE and V4L2_CAP_VIDEO_OUTPUT_MPLANE
for mem2mem video nodes is obsolete since commit f0476a83d61a ("[media]
V4L: Add capability flags for memory-to-memory devices"). It was enough
time to adapt all users to the new flags, so drop the legacy caps for now
to match other mem2mem drivers.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/media/platform/exynos-gsc/gsc-m2m.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/exynos-gsc/gsc-m2m.c b/drivers/media/platform/exynos-gsc/gsc-m2m.c
index 722d7c45bf9e..785e67752194 100644
--- a/drivers/media/platform/exynos-gsc/gsc-m2m.c
+++ b/drivers/media/platform/exynos-gsc/gsc-m2m.c
@@ -298,9 +298,7 @@ static int gsc_m2m_querycap(struct file *file, void *fh,
 	strlcpy(cap->card, GSC_MODULE_NAME " gscaler", sizeof(cap->card));
 	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
 		 dev_name(&gsc->pdev->dev));
-	cap->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M_MPLANE |
-		V4L2_CAP_VIDEO_CAPTURE_MPLANE |	V4L2_CAP_VIDEO_OUTPUT_MPLANE;
-
+	cap->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M_MPLANE;
 	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }
-- 
2.14.2
