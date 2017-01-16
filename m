From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v3 2/4] PM / devfreq: exynos-ppmu: Show the registred device
 for ppmu device
Date: Mon, 16 Jan 2017 21:26:05 +0900
Message-ID: <1484569567-29810-3-git-send-email-cw00.choi@samsung.com>
References: <1484569567-29810-1-git-send-email-cw00.choi@samsung.com>
 <CGME20170116122609epcas5p37255926620af7c0db7373bb8d08a756c@epcas5p3.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:48058 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750998AbdAPM0e (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 16 Jan 2017 07:26:34 -0500
In-reply-to: <1484569567-29810-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-pm@vger.kernel.org
Cc: myungjoo.ham@samsung.com, kyungmin.park@samsung.com, cw00.choi@samsung.com, rjw@rjwysocki.net, linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

This patch just adds the simple log to show the PPMU device's registration
during the kernel booting.

Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 drivers/devfreq/event/exynos-ppmu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/devfreq/event/exynos-ppmu.c b/drivers/devfreq/event/exynos-ppmu.c
index fb3706faf5bd..9b7350935b73 100644
--- a/drivers/devfreq/event/exynos-ppmu.c
+++ b/drivers/devfreq/event/exynos-ppmu.c
@@ -643,6 +643,9 @@ static int exynos_ppmu_probe(struct platform_device *pdev)
 				"failed to add devfreq-event device\n");
 			return PTR_ERR(edev[i]);
 		}
+
+		pr_info("exynos-ppmu: new PPMU device registered %s (%s)\n",
+			dev_name(&pdev->dev), desc[i].name);
 	}
 
 	clk_prepare_enable(info->ppmu.clk);
-- 
1.9.1
