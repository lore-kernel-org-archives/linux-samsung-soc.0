From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [GIT PULL 0/9] ARM: EXYNOS: Pull request for v4.5
Date: Wed, 02 Dec 2015 10:39:37 +0900
Message-ID: <1449020386-20250-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:62719 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753637AbbLBBkI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Dec 2015 20:40:08 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, arm@kernel.org, Kukjin Kim <kgene@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kevin Hilman <khilman@linaro.org>, k.kozlowski@samsung.com

Hi Kukjin,

A lot of stuff for v4.5 with 3 dependencies split into
separate tags. The need for dependency is explained both
in merge-commit and in description of a tag which is using
the dependency.

The order goes like (but of course dependencies
could be pulled all at once at beginning):
1. tags/samsung-dt-syscon-restart-4.5
2. tags/samsung-soc-4.5
3. tags/samsung-clk-arm64-symbols-4.5
4. tags/samsung-soc64-4.5
5. tags/samsung-drivers-4.5
6. tags/samsung-clk-exynos4-4.5
7. tags/samsung-dt-4.5
8. tags/samsung-dt64-4.5
9. tags/samsung-defconfig-4.5

I split dependencies to three tags so clock or other folks could
easily grab them if needed.

Please share your comments or pull as early as possible as we have here
some more dependencies than usual.


Kind regards,
Krzysztof
