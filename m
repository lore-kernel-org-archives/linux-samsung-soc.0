From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH v2 1/3] pwm: samsung: add missing device pointer to struct
 pwm_chip
Date: Fri, 03 Aug 2012 15:45:56 +0900
Message-ID: <001601cd7143$a29d0780$e7d71680$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:15579 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750843Ab2HCGp6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Aug 2012 02:45:58 -0400
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thierry Reding' <thierry.reding@avionic-design.de>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>

This patch adds missing device pointer to struct pwm_chip. If the
device pointer is NULL, pwmchip_add() will return error.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
Tested on SMDKV310 board
 drivers/pwm/pwm-samsung.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/pwm/pwm-samsung.c b/drivers/pwm/pwm-samsung.c
index d103865..e5187c0 100644
--- a/drivers/pwm/pwm-samsung.c
+++ b/drivers/pwm/pwm-samsung.c
@@ -225,6 +225,7 @@ static int s3c_pwm_probe(struct platform_device *pdev)
 
 	/* calculate base of control bits in TCON */
 	s3c->tcon_base = id == 0 ? 0 : (id * 4) + 4;
+	s3c->chip.dev = &pdev->dev;
 	s3c->chip.ops = &s3c_pwm_ops;
 	s3c->chip.base = -1;
 	s3c->chip.npwm = 1;
-- 
1.7.1
