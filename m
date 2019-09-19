From: =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>
Subject: [RFC PATCH v2 03/11] devfreq: exynos-bus: Change goto-based logic
 to if-else logic
Date: Thu, 19 Sep 2019 16:22:28 +0200
Message-ID: <20190919142236.4071-4-a.swigon@samsung.com>
References: <20190919142236.4071-1-a.swigon@samsung.com>
        <CGME20190919142323eucas1p2fc73a765389432f880fa28945fd28975@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190919142236.4071-1-a.swigon@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@partner.samsung.com>, cw00.choi@samsung.com, myungjoo.ham@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, georgi.djakov@linaro.org, leonard.crestez@nxp.com, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, krzk@kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

From: Artur Świgoń <a.swigon@partner.samsung.com>

This patch improves code readability by changing the following construct:

>    if (cond)
>        goto passive;
>    foo();
>    goto out;
>passive:
>    bar();
>out:

into this:

>    if (cond)
>        bar();
>    else
>        foo();

Signed-off-by: Artur Świgoń <a.swigon@partner.samsung.com>
---
 drivers/devfreq/exynos-bus.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/devfreq/exynos-bus.c b/drivers/devfreq/exynos-bus.c
index f85bed241631..60ad4319fd80 100644
--- a/drivers/devfreq/exynos-bus.c
+++ b/drivers/devfreq/exynos-bus.c
@@ -420,19 +420,13 @@ static int exynos_bus_probe(struct platform_device *pdev)
 		goto err_reg;
 
 	if (passive)
-		goto passive;
+		ret = exynos_bus_profile_init_passive(bus, profile);
+	else
+		ret = exynos_bus_profile_init(bus, profile);
 
-	ret = exynos_bus_profile_init(bus, profile);
 	if (ret < 0)
 		goto err;
 
-	goto out;
-passive:
-	ret = exynos_bus_profile_init_passive(bus, profile);
-	if (ret < 0)
-		goto err;
-
-out:
 	max_state = bus->devfreq->profile->max_state;
 	min_freq = (bus->devfreq->profile->freq_table[0] / 1000);
 	max_freq = (bus->devfreq->profile->freq_table[max_state - 1] / 1000);
-- 
2.17.1
