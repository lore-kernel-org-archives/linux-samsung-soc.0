From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Subject: [PATCH] media: fimc-capture: get rid of two warnings
Date: Fri, 23 Mar 2018 08:57:20 -0400
Message-ID: <6ccd228e0cfce2a4f44558422d25c60fcb1a6710.1521809837.git.mchehab@s-opensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, Mauro Carvalho Chehab <mchehab@s-opensource.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, Linux Media Mailing List <linux-media@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Smatch produces two warnings when building this file:
	./arch/x86/include/asm/bitops.h:433:22: warning: asm output is not an lvalue
	./arch/x86/include/asm/bitops.h:433:22: warning: asm output is not an lvalue

On some asm instructions.

I suspect that those asm instructions might not be producing the
right code, so, better to use two intermediate vars, get rid of
the warnings and of the risk of producing a wrong code.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 drivers/media/platform/exynos4-is/fimc-capture.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/exynos4-is/fimc-capture.c b/drivers/media/platform/exynos4-is/fimc-capture.c
index ed9302caa004..a3cdac188190 100644
--- a/drivers/media/platform/exynos4-is/fimc-capture.c
+++ b/drivers/media/platform/exynos4-is/fimc-capture.c
@@ -670,10 +670,13 @@ static void fimc_capture_try_selection(struct fimc_ctx *ctx,
 		return;
 	}
 	if (target == V4L2_SEL_TGT_COMPOSE) {
+		u32 tmp_min_h = ffs(sink->width) - 3;
+		u32 tmp_min_v = ffs(sink->height) - 1;
+
 		if (ctx->rotation != 90 && ctx->rotation != 270)
 			align_h = 1;
-		max_sc_h = min(SCALER_MAX_HRATIO, 1 << (ffs(sink->width) - 3));
-		max_sc_v = min(SCALER_MAX_VRATIO, 1 << (ffs(sink->height) - 1));
+		max_sc_h = min(SCALER_MAX_HRATIO, 1 << tmp_min_h);
+		max_sc_v = min(SCALER_MAX_VRATIO, 1 << tmp_min_v);
 		min_sz = var->min_out_pixsize;
 	} else {
 		u32 depth = fimc_get_format_depth(sink->fmt);
-- 
2.14.3
