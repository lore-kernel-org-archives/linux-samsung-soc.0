From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [GIT PULL 0/3] ARM: EXYNOS: Second round for v4.7
Date: Wed, 27 Apr 2016 11:10:53 +0200
Message-ID: <1461748256-4394-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:37522 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752462AbcD0JLO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Apr 2016 05:11:14 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Hi,

Last round with stuff for v4.7. No external dependencies. Organized as:

1. tags/samsung-dt-4.7-2
2. tags/samsung-dt-exynos-srom-fixup-4.7
   DT changes, this is also an internal dependency for SROM driver.
3. tags/samsung-drivers-exynos-srom-4.7
   (includes branch #2 above)

Best regards,
Krzysztof
