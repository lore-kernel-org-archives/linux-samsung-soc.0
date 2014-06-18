From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH V2 0/2] Sound support for Exynos4412 Odroid X2, U3 board
Date: Wed, 18 Jun 2014 18:22:29 +0200
Message-ID: <1403108551-25058-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:14959 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751534AbaFRQWw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Jun 2014 12:22:52 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree@vger.kernel.org, broonie@kernel.org
Cc: pawel.moll@arm.com, mark.rutland@arm.com, galak@codeaurora.org, zhen1.chen@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, alsa-devel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

This series adds basic sound support for the Odroid X2/U3 boards.
It relies on specific Exynos Audio Subsystem clock parent and
frequencies being pre-configured.

My full testing git branch has been pushed to:
git://linuxtv.org/snawrocki/samsung.git v3.16-rc1-odroid-sound-clk

It can be browsed at:
http://git.linuxtv.org/cgit.cgi/snawrocki/samsung.git/log/?h=v3.16-rc1-odroid-sound-clk

I didn't use the simple-card since there is going to be added
one more CPU interface using the secondary I2S and IDMA.

Sylwester Nawrocki (2):
  ASoC: samsung: Add machine driver for Odroid X2/U3
  doc: dt bindings: Document Odroid X2/U3 audio subsystem bindings

 .../bindings/sound/samsung,odroidx2-max98090.txt   |   35 ++++
 sound/soc/samsung/Kconfig                          |    8 +
 sound/soc/samsung/Makefile                         |    2 +
 sound/soc/samsung/odroidx2_max98090.c              |  191 ++++++++++++++++++++
 4 files changed, 236 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,odroidx2-max98090.txt
 create mode 100644 sound/soc/samsung/odroidx2_max98090.c

--
1.7.9.5
