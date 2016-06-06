From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [GIT PULL 2/8] arm64: exynos: Mach/soc changes for v4.8
Date: Mon, 06 Jun 2016 14:25:27 +0200
Message-ID: <1465215933-22709-3-git-send-email-k.kozlowski@samsung.com>
References: <1465215933-22709-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:11738 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751861AbcFFM1C (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Jun 2016 08:27:02 -0400
In-reply-to: <1465215933-22709-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>


The following changes since commit 1a695a905c18548062509178b98bc91e67510864:

  Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc64-4.8

for you to fetch changes up to 3b3428e384b7aff6093d1a6773027c9095182c6b:

  arm64: exynos: Select SOC specific drivers (2016-05-30 08:44:33 +0200)

----------------------------------------------------------------
Samsung arm64 update for v4.8:
1. Select drivers/soc/samsung.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      arm64: exynos: Select SOC specific drivers

 arch/arm64/Kconfig.platforms | 1 +
 1 file changed, 1 insertion(+)
