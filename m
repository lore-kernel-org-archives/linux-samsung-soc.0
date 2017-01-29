From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 3/4] ARM: dts: exynos: for v4.11, 2nd round
Date: Sun, 29 Jan 2017 22:06:28 +0200
Message-ID: <20170129200630.22083-3-krzk@kernel.org>
References: <20170129200630.22083-1-krzk@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:49306 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751869AbdA2UH4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 29 Jan 2017 15:07:56 -0500
In-Reply-To: <20170129200630.22083-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>

Hi,

On top of previous pull request.

Best regards,
Krzysztof


The following changes since commit bca9085e0ae93253bc93ce218c85ac7d7e7f1831:

  ARM: dts: exynos: remove Exynos4212 support (dead code) (2017-01-11 18:28:43 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-4.11-2

for you to fetch changes up to dfaf06baad0c088a55570f7a324949c498f2106c:

  ARM: dts: exynos: Fix indentation of EHCI and OHCI ports (2017-01-29 21:03:46 +0200)

----------------------------------------------------------------
Samsung DeviceTree update for v4.11, second round:
1. Use bigger reserved memory region for Multi Format Codec on all Exynos
   chipsets so it could decode FullHD easily.

----------------------------------------------------------------
Javier Martinez Canillas (1):
      ARM: dts: exynos: Increase MFC left reserved memory region size

Krzysztof Kozlowski (1):
      ARM: dts: exynos: Fix indentation of EHCI and OHCI ports

 arch/arm/boot/dts/exynos-mfc-reserved-memory.dtsi |  2 +-
 arch/arm/boot/dts/exynos4.dtsi                    | 24 +++++++++++------------
 2 files changed, 13 insertions(+), 13 deletions(-)
