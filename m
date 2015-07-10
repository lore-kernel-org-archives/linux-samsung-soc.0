From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH] Drop owner assignment from i2c_driver (and platform left-overs)
Date: Fri, 10 Jul 2015 14:04:27 +0900
Message-ID: <1436504668-1405-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:58020 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750938AbbGJFEb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Jul 2015 01:04:31 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,


The i2c drivers also do not have to set 'owner' field because
i2c_register_driver() will do it instead.

'owner' is removed from i2c drivers, which I was able to compile
with allyesconfig (arm, arm64, i386, x86_64, ppc64).
Only compile-tested.

The coccinelle script which generated the patch was sent here:
http://www.spinics.net/lists/kernel/msg2029903.html


Best regards,
Krzysztof

Krzysztof Kozlowski (1):
  ARM: EXYNOS: pmu: Drop owner assignment

 arch/arm/mach-exynos/pmu.c | 1 -
 1 file changed, 1 deletion(-)

-- 
1.9.1
