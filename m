From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: [PATCH] pwm: samsung: add missing s3c->pwm_id
Date: Fri, 14 Dec 2012 13:20:09 +0900
Message-ID: <1355458809-12290-1-git-send-email-jy0922.shim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:63669 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755452Ab2LNEUC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Dec 2012 23:20:02 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: thierry.reding@avionic-design.de
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com

The s3c->pwm_id is used to calculate offset of related register.

Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
---
 drivers/pwm/pwm-samsung.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pwm/pwm-samsung.c b/drivers/pwm/pwm-samsung.c
index 023a3be..b415102 100644
--- a/drivers/pwm/pwm-samsung.c
+++ b/drivers/pwm/pwm-samsung.c
@@ -220,6 +220,8 @@ static int s3c_pwm_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
+	s3c->pwm_id = id;
+
 	/* calculate base of control bits in TCON */
 	s3c->tcon_base = id == 0 ? 0 : (id * 4) + 4;
 	s3c->chip.dev = &pdev->dev;
-- 
1.7.9.5
