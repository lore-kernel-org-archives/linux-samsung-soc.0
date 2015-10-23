From: Kukjin Kim <kgene@kernel.org>
Subject: [GIT PULL 2/5] Late Samsung DT64 update for v4.4
Date: Sat, 24 Oct 2015 06:21:39 +0900
Message-ID: <562AA4E3.1000001@kernel.org>
References: <562AA40E.4050407@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:38062 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751294AbbJWVWO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Oct 2015 17:22:14 -0400
In-Reply-To: <562AA40E.4050407@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

The following changes since commit 6ff33f3902c3b1c5d0db6b1e2c70b6d76fba357f:

  Linux 4.3-rc1 (2015-09-12 16:35:56 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
tags/samsung-dt64

for you to fetch changes up to c60ce7fe82c46d9480b85858828e3042dfe6c9bf:

  arm64: dts: Add BUS1 instance pinctrl support for exynos7 (2015-10-08
07:18:33 +0900)

----------------------------------------------------------------
Samsung arm64 DT update for v4.4

- add BUS1 instance pinctrl support on exynos7 SoC

----------------------------------------------------------------
Alim Akhtar (1):
      arm64: dts: Add BUS1 instance pinctrl support for exynos7

 arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi | 103
++++++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos7.dtsi         |   7 ++
 2 files changed, 110 insertions(+)
