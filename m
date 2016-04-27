From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [GIT PULL] ARM: EXYNOS: fixes for v4.6
Date: Wed, 27 Apr 2016 08:22:34 +0200
Message-ID: <1461738154-8335-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:54659 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750731AbcD0GWu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Apr 2016 02:22:50 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Hi,

Please pull one fix for current release.

Best regards,
Krzysztof



The following changes since commit f55532a0c0b8bb6148f4e07853b876ef73bc69ca:

  Linux 4.6-rc1 (2016-03-26 16:03:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-fixes-4.6

for you to fetch changes up to a0a966b83873f33778710a4fc59240244b0734a5:

  ARM: EXYNOS: Properly skip unitialized parent clock in power domain on (2016-04-25 11:35:37 +0200)

----------------------------------------------------------------
Fix for more theoretical than practical OOPS on first turn on of a exynos
power domain, if there was no turn off before. Usually all power domains
are on, so the first action is to turn off but some older bootloaders
might behave differently.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: EXYNOS: Properly skip unitialized parent clock in power domain on

 arch/arm/mach-exynos/pm_domains.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
