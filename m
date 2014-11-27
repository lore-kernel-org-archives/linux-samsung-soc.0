From: Kukjin Kim <kgene@kernel.org>
Subject: [GIT PULL 2/4] Samsung serial updates for v3.19
Date: Thu, 27 Nov 2014 16:06:35 +0900
Message-ID: <5476CD7B.4020808@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.19.201]:36266 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750922AbaK0HGj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 Nov 2014 02:06:39 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: arm@kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>

Hi Arnd, Olof, Kevin

Please pull this branch for exynos7 SoC into arm-soc.
Note Greg agreed to upstream via arm-soc tree.

Thanks,
Kukjin

The following changes since commit f114040e3ea6e07372334ade75d1ee0775c355e1:

  Linux 3.18-rc1 (2014-10-19 18:08:38 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
tags/samsung-driver

for you to fetch changes up to edeeec85f7145fe8f2a5ffe250a8ee6b1fe4ab28:

  serial: samsung: Fix serial config dependencies for exynos7
(2014-11-22 00:09:25 +0900)

----------------------------------------------------------------
Samsung driver update for v3.19

- Change samsung serial dependencies for exynos7 (ARMv8)

----------------------------------------------------------------
Pankaj Dubey (1):
      serial: samsung: Fix serial config dependencies for exynos7

 drivers/tty/serial/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
