From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 1/2] [media] exynos-gsc: Fix unbalanced pm_runtime_enable()
 error
Date: Tue, 17 Jan 2017 21:30:00 -0300
Message-ID: <1484699402-28738-1-git-send-email-javier@osg.samsung.com>
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
To: linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org, Shuah Khan <shuahkh@osg.samsung.com>, Andi Shyti <andi.shyti@samsung.com>, Inki Dae <inki.dae@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Commit a006c04e6218 ("[media] exynos-gsc: Fixup clock management at
->remove()") changed the driver's .remove function logic to fist do
a pm_runtime_get_sync() to make sure the device is powered before
attempting to gate the gsc clock.

But the commit also removed a pm_runtime_disable() call that leads
to an unbalanced pm_runtime_enable() error if the driver is removed
and re-probed:

exynos-gsc 13e00000.video-scaler: Unbalanced pm_runtime_enable!
exynos-gsc 13e10000.video-scaler: Unbalanced pm_runtime_enable!

Fixes: a006c04e6218 ("[media] exynos-gsc: Fixup clock management at ->remove()")
Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---

 drivers/media/platform/exynos-gsc/gsc-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/exynos-gsc/gsc-core.c b/drivers/media/platform/exynos-gsc/gsc-core.c
index cbf75b6194b4..83272f10722d 100644
--- a/drivers/media/platform/exynos-gsc/gsc-core.c
+++ b/drivers/media/platform/exynos-gsc/gsc-core.c
@@ -1118,6 +1118,7 @@ static int gsc_remove(struct platform_device *pdev)
 		clk_disable_unprepare(gsc->clock[i]);
 
 	pm_runtime_put_noidle(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
 
 	dev_dbg(&pdev->dev, "%s driver unloaded\n", pdev->name);
 	return 0;
-- 
2.7.4
