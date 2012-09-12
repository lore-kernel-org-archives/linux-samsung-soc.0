From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 0/3] ARM: EXYNOS: Add generic PWM lookup support
Date: Wed, 12 Sep 2012 17:03:29 +0530
Message-ID: <1347449612-382-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:39691 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751039Ab2ILLgh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Sep 2012 07:36:37 -0400
Received: by pbbrr13 with SMTP id rr13so2138853pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Sep 2012 04:36:37 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, thierry.reding@avionic-design.de, tushar.behera@linaro.org, sachin.kamat@linaro.org, patches@linaro.org

This series adds support for generic PWM framework which requires
that the board setup code register a static mapping that can be
used to match PWM consumers to providers.

This series is based on for-next branch of Kukjin's tree.

Sachin Kamat (2):
  ARM: EXYNOS: Add generic PWM lookup support for SMDK4X12
  ARM: EXYNOS: Add generic PWM lookup support for SMDKV310

Tushar Behera (1):
  ARM: EXYNOS: Use generic pwm driver in Origen board

 arch/arm/mach-exynos/Kconfig         |    3 +++
 arch/arm/mach-exynos/mach-origen.c   |    6 ++++++
 arch/arm/mach-exynos/mach-smdk4x12.c |    6 ++++++
 arch/arm/mach-exynos/mach-smdkv310.c |    7 +++++++
 4 files changed, 22 insertions(+), 0 deletions(-)

-- 
1.7.4.1
