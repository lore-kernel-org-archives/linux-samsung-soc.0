From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 0/4] ARM: dts: exynos: Second round of Spring support
Date: Wed, 19 Nov 2014 16:56:20 +0100
Message-ID: <1416412585-10809-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:60226 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754350AbaKSP4D (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Nov 2014 10:56:03 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Vincent Palatin <vpalatin@chromium.org>, Doug Anderson <dianders@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Tomasz Figa <t.figa@samsung.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>

Hello,

=46ollowing the initial merge of the HP Chromebook 11 device tree,
here's a few follow-ups. A sound series is prepared separately.

Regards,
Andreas


Andreas F=C3=A4rber (4):
  ARM: dts: Add usb3503 pinctrl to exynos5250-spring
  ARM: dts: Add temperature sensor to exynos5250-spring
  ARM: exynos_defconfig: Enable LM90 driver
  ARM: dts: Add trackpad to exynos5250-spring

 arch/arm/boot/dts/exynos5250-spring.dts | 30 +++++++++++++++++++++++++=
+++++
 arch/arm/configs/exynos_defconfig       |  3 ++-
 2 files changed, 32 insertions(+), 1 deletion(-)

--=20
2.1.2
