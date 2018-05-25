From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 6/8] drm/exynos: fix scaler_task_done return type
Date: Fri, 25 May 2018 17:50:13 +0200
Message-ID: <20180525155030.3667352-6-arnd@arndb.de>
References: <20180525155030.3667352-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180525155030.3667352-1-arnd@arndb.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>
Cc: linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Andrzej Pietrasiewicz <andrzej.p@samsung.com>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Modern gcc versions warn about returning a ternary operator with an 'int'
type in a function returning type 'bool':

drivers/gpu/drm/exynos/exynos_drm_scaler.c: In function 'scaler_task_done':
drivers/gpu/drm/exynos/exynos_drm_scaler.c:402:47: error: ?: using integer constants in boolean context [-Werror=int-in-bool-context]
  return val & SCALER_INT_STATUS_FRAME_END ? 0 : -EINVAL;

>From context, it becomes clear that this should have been 'int',
so I'm fixing it, along with parenthesizing the expression to make
it clearer what is meant here (I got confused at first, after seeing
the warning).

Fixes: 01fb9185dc18 ("drm/exynos: Add driver for Exynos Scaler module")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/exynos/exynos_drm_scaler.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_scaler.c b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
index 63b05b7c846a..4ad49d7782cd 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_scaler.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
@@ -397,9 +397,9 @@ static inline u32 scaler_get_int_status(struct scaler_context *scaler)
 	return scaler_read(SCALER_INT_STATUS);
 }
 
-static inline bool scaler_task_done(u32 val)
+static inline int scaler_task_done(u32 val)
 {
-	return val & SCALER_INT_STATUS_FRAME_END ? 0 : -EINVAL;
+	return (val & SCALER_INT_STATUS_FRAME_END) ? 0 : -EINVAL;
 }
 
 static irqreturn_t scaler_irq_handler(int irq, void *arg)
-- 
2.9.0
