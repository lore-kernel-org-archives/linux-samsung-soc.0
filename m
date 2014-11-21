From: Kukjin Kim <kgene@kernel.org>
Subject: [GIT PULL 1/2] Samsung fixes for v3.18
Date: Fri, 21 Nov 2014 22:23:38 +0900
Message-ID: <546F3CDA.6000908@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.19.201]:35915 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755232AbaKUNXo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Nov 2014 08:23:44 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: arm@kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

The following changes since commit fc14f9c1272f62c3e8d01300f52467c0d9af50f9:

  Linux 3.18-rc5 (2014-11-16 16:36:20 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
tags/samsung-fixes-v3.18

for you to fetch changes up to 0526f276f94758245ac5886604fe8c805c1b6d2c:

  ARM: dts: Explicitly set dr_mode on exynos5250-snow (2014-11-19
16:52:15 +0900)

----------------------------------------------------------------
Samsung fixes for v3.18

- explicitly set dr_mode on exynos5250-snow
  this is required when kernel is built with USB gadget support.

----------------------------------------------------------------
Sjoerd Simons (1):
      ARM: dts: Explicitly set dr_mode on exynos5250-snow

 arch/arm/boot/dts/exynos5250-snow.dts | 4 ++++
 arch/arm/boot/dts/exynos5250.dtsi     | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)
