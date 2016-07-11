From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [GIT PULL 3/4] arm64: dts: exynos: Minor fix for v4.8, last round
Date: Mon, 11 Jul 2016 18:41:17 +0200
Message-ID: <1468255278-32162-3-git-send-email-k.kozlowski@samsung.com>
References: <1468255278-32162-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:39730 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933769AbcGKQlf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Jul 2016 12:41:35 -0400
In-Reply-To: <1468255278-32162-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>

Hi,

Last round of commits for v4.8.

Best regards,
Krzysztof


The following changes since commit 1a695a905c18548062509178b98bc91e67510864:

  Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-4.8-2

for you to fetch changes up to a1924466b784fbb64f10eeb213d335e3d1728b8b:

  arm64: dts: exynos: Modify the voltage range for BUCK2 for exynos7 (2016-07-06 09:43:42 +0200)

----------------------------------------------------------------
Samsung DeviceTree changes for ARM64 for v4.8:
1. Adjust the voltage of CPU buck regulator so scaling could work.

----------------------------------------------------------------
Abhilash Kesavan (1):
      arm64: dts: exynos: Modify the voltage range for BUCK2 for exynos7

 arch/arm64/boot/dts/exynos/exynos7-espresso.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
