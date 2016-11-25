From: Shailendra Verma <shailendra.v@samsung.com>
Subject: [PATCH] Media: Platform: Exynos4-is: - Fix for error handling
Date: Fri, 25 Nov 2016 10:09:31 +0530
Message-ID: <1480048771-19745-1-git-send-email-shailendra.v@samsung.com>
Return-path: <linux-media-owner@vger.kernel.org>
Sender: linux-media-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Shailendra Verma <shailendra.v@samsung.com>, Shailendra Verma <shailendra.capricorn@gmail.com>
Cc: vidushi.koul@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

The File handle is not yet added in the vfd list.So no need to call 
v4l2_fh_del(&ctx->fh) if it fails to create control.

Signed-off-by: Shailendra Verma <shailendra.v@samsung.com>
---
 drivers/media/platform/exynos4-is/fimc-m2m.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/exynos4-is/fimc-m2m.c b/drivers/media/platform/exynos4-is/fimc-m2m.c
index 6028e4f..d8724fe 100644
--- a/drivers/media/platform/exynos4-is/fimc-m2m.c
+++ b/drivers/media/platform/exynos4-is/fimc-m2m.c
@@ -663,8 +663,8 @@ static int fimc_m2m_open(struct file *file)
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 error_c:
 	fimc_ctrls_delete(ctx);
-error_fh:
 	v4l2_fh_del(&ctx->fh);
+error_fh:
 	v4l2_fh_exit(&ctx->fh);
 	kfree(ctx);
 unlock:
-- 
1.7.9.5
