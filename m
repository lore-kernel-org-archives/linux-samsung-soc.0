From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: [PATCH v2] pwm: samsung: add missing s3c->pwm_id
Date: Fri, 14 Dec 2012 15:58:58 +0900
Message-ID: <1355468338-12611-1-git-send-email-jy0922.shim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:29932 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751232Ab2LNG6t (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Dec 2012 01:58:49 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: thierry.reding@avionic-design.de
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com

The s3c->pwm_id is used to calculate offset of related register.

Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
---
Changelog from v1:
 - move the assignment code to below.

 drivers/pwm/pwm-samsung.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pwm/pwm-samsung.c b/drivers/pwm/pwm-samsung.c
index 023a3be..0704a2a 100644
--- a/drivers/pwm/pwm-samsung.c
+++ b/drivers/pwm/pwm-samsung.c
@@ -222,6 +222,7 @@ static int s3c_pwm_probe(struct platform_device *pdev)
 
 	/* calculate base of control bits in TCON */
 	s3c->tcon_base = id == 0 ? 0 : (id * 4) + 4;
+	s3c->pwm_id = id;
 	s3c->chip.dev = &pdev->dev;
 	s3c->chip.ops = &s3c_pwm_ops;
 	s3c->chip.base = -1;
-- 
1.7.9.5
