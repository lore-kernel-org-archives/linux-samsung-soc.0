From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [GIT PULL/PATCH] Fix for current cycle - v4.7
Date: Mon, 11 Jul 2016 09:34:17 +0200
Message-ID: <1468222458-4265-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, krzk@kernel.org, k.kozlowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Arnd, Kevin and Olof,

I got only one fix for this release cycle, so can you apply it directly
instead of pull request?

Best regards,
Krzysztof

Alim Akhtar (1):
  arm64: dts: Fix RTC by providing rtc_src clock

 arch/arm64/boot/dts/exynos/exynos7-espresso.dts | 3 +++
 1 file changed, 3 insertions(+)

-- 
1.9.1
