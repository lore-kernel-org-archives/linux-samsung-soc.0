From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: ARM: EXYNOS: dts: DTS fixes for 4.1
Date: Wed, 06 May 2015 09:58:23 +0900
Message-ID: <1430873903-22787-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:60365 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753027AbbEFA6l (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 May 2015 20:58:41 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Kevin Hilman <khilman@linaro.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Dear Kukjin,

This groups important fix for current RC cycle, well tested and
present on mailing list for some time.

Best regards,
Krzysztof

----------------------------------------------------------------
The following changes since commit 5ebe6afaf0057ac3eaeb98defd5456894b446d22:

  Linux 4.1-rc2 (2015-05-03 19:22:23 -0700)

are available in the git repository at:

  https://github.com/krzk/linux.git tags/samsung-dt-fixes-4.1

for you to fetch changes up to d52ccd7b731f881df051331c92a5c54a94adf516:

  ARM: dts: Make DP a consumer of DISP1 power domain on Exynos5420 (2015-05-05 19:15:57 +0900)

----------------------------------------------------------------
Fix for imprecise external abort on Exynos5420 boards introduced after adding
display power domain in DTS.

----------------------------------------------------------------
Javier Martinez Canillas (1):
      ARM: dts: Make DP a consumer of DISP1 power domain on Exynos5420

 arch/arm/boot/dts/exynos5420.dtsi | 1 +
 1 file changed, 1 insertion(+)
