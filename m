From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] PM / devfreq: exynos-ppmu: remove useless assignment
Date: Tue,  1 Oct 2019 14:46:41 +0200
Message-ID: <20191001124641.22896-1-m.szyprowski@samsung.com>
References: <CGME20191001124646eucas1p2768afab3fc8fbaaf7c2bcf1966b06781@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The error code is propagated to the caller, so there is no need to keep
it additionally in the unused variable.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/devfreq/event/exynos-ppmu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/devfreq/event/exynos-ppmu.c b/drivers/devfreq/event/exynos-ppmu.c
index 87b42055e6bc..85c7a77bf3f0 100644
--- a/drivers/devfreq/event/exynos-ppmu.c
+++ b/drivers/devfreq/event/exynos-ppmu.c
@@ -673,7 +673,6 @@ static int exynos_ppmu_probe(struct platform_device *pdev)
 	for (i = 0; i < info->num_events; i++) {
 		edev[i] = devm_devfreq_event_add_edev(&pdev->dev, &desc[i]);
 		if (IS_ERR(edev[i])) {
-			ret = PTR_ERR(edev[i]);
 			dev_err(&pdev->dev,
 				"failed to add devfreq-event device\n");
 			return PTR_ERR(edev[i]);
-- 
2.17.1
