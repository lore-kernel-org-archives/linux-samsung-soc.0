From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v4 2/6] Documentation: exynos5250-clock: Add div_i2s1 and
 div_i2s2
Date: Thu, 25 Jul 2013 10:37:33 +0530
Message-ID: <1374728857-4208-3-git-send-email-rahul.sharma@samsung.com>
References: <1374728857-4208-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:53588 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751106Ab3GYEoz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Jul 2013 00:44:55 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQH00EL86IUSKJ0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 25 Jul 2013 13:44:54 +0900 (KST)
In-reply-to: <1374728857-4208-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, mturquette@linaro.org, inki.dae@samsung.com, s.nawrocki@samsung.com, thomas.abraham@linaro.org, joshi@samsung.com, r.sh.open@gmail.com, Tushar Behera <tushar.behera@linaro.org>

From: Tushar Behera <tushar.behera@linaro.org>

commit 79d743c177f9 ("clk: exynos5250: Add enum entries for divider
clock of i2s1 and i2s2") added two new clock entries. Add the clock
entry enum numbers to documentation.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 Documentation/devicetree/bindings/clock/exynos5250-clock.txt |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/exynos5250-clock.txt b/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
index 1a05761..bea503f 100644
--- a/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
+++ b/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
@@ -59,6 +59,8 @@ clock which they consume.
   sclk_spi0		154
   sclk_spi1		155
   sclk_spi2		156
+  div_i2s1		157
+  div_i2s2		158
 
 
    [Peripheral Clock Gates]
-- 
1.7.10.4
