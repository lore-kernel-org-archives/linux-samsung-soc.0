From: Shailendra Verma <shailendra.v@samsung.com>
Subject: [PATCH] exynos-gsc: Clean up file handle in open() error path.
Date: Fri, 02 Dec 2016 10:15:27 +0530
Message-ID: <1480653927-6850-1-git-send-email-shailendra.v@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Junghak Sung <jh1009.sung@samsung.com>, Julia Lawall <Julia.Lawall@lip6.fr>, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Shailendra Verma <shailendra.v@samsung.com>, Shailendra Verma <shailendra.capricorn@gmail.com>
Cc: vidushi.koul@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

The File handle is not yet added in the vfd list.So no need to call
v4l2_fh_del(&ctx->fh) if it fails to create control.

Signed-off-by: Shailendra Verma <shailendra.v@samsung.com>
---
 drivers/media/platform/exynos-gsc/gsc-m2m.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/exynos-gsc/gsc-m2m.c b/drivers/media/platform/exynos-gsc/gsc-m2m.c
index 9f03b79..5ea97c1 100644
--- a/drivers/media/platform/exynos-gsc/gsc-m2m.c
+++ b/drivers/media/platform/exynos-gsc/gsc-m2m.c
@@ -664,8 +664,8 @@ static int gsc_m2m_open(struct file *file)
 
 error_ctrls:
 	gsc_ctrls_delete(ctx);
-error_fh:
 	v4l2_fh_del(&ctx->fh);
+error_fh:
 	v4l2_fh_exit(&ctx->fh);
 	kfree(ctx);
 unlock:
-- 
1.7.9.5
