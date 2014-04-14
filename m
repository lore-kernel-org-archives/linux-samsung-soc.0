From: Tomasz Stanislawski <t.stanislaws@samsung.com>
Subject: [PATCH 2/4] drm: exynos: mixer: fix using usleep() in atomic context
Date: Mon, 14 Apr 2014 17:00:20 +0200
Message-ID: <1397487622-3577-3-git-send-email-t.stanislaws@samsung.com>
References: <1397487622-3577-1-git-send-email-t.stanislaws@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1397487622-3577-1-git-send-email-t.stanislaws@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Cc: Tomasz Stanislawski <t.stanislaws@samsung.com>, pawel.moll@arm.com, b.zolnierkie@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, rahul.sharma@samsung.com, m.chehab@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

This patch fixes calling usleep_range() after taking reg_slock
using spin_lock_irqsave(). The mdelay() is used instead.
Waiting in atomic context is not the best idea in general.
Hopefully, waiting occurs only when Video Processor fails
to reset correctly.

Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_mixer.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index ce28881..e3306c8 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -615,7 +615,7 @@ static void vp_win_reset(struct mixer_context *ctx)
 		/* waiting until VP_SRESET_PROCESSING is 0 */
 		if (~vp_reg_read(res, VP_SRESET) & VP_SRESET_PROCESSING)
 			break;
-		usleep_range(10000, 12000);
+		mdelay(10);
 	}
 	WARN(tries == 0, "failed to reset Video Processor\n");
 }
-- 
1.7.9.5
