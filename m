From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v4 0/9] Enable HDMI support on Exynos platforms
Date: Tue, 20 Jan 2015 13:16:50 +0100
Message-ID: <1421756219-21037-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:40504 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753346AbbATMRH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Jan 2015 07:17:07 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NIH00E2C6B8BQ70@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 20 Jan 2015 12:21:08 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, jy0922.shim@samsung.com, kyungmin.park@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>, Amit Daniel Kachhap <amit.daniel@samsung.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Ulf Hansson <ulf.hansson@linaro.org>

Hi all,

This is yet another approach to submit patches, which enables HDMI
support for two Exynos based platforms: UniversalC210 and Odroid X2/U3.

Beside DTS changes, this patchset adds parent domain support for Exynos
PM domains. This was the most controversial patch in the previous
attempts, but I hope I fixes all reported issues and made it really
generic. For more details see individual patches.

The patchset is based on my previous patch:
'ARM: DTS: Exynos: convert to generic power domain bindings'
(http://www.spinics.net/lists/linux-samsung-soc/msg40584.html)
and 'PM / Domains: Export of_genpd_get_from_provider function'
patch merged as commit 7496fcbe8a643097efc061160e1c3b65ee2fa350
to v3.19-rc4.

Thanks to Tobias Jakobi for testing and finding out that the already
merged exynos4 clocks hierarchy fixup (commit
df019a5c0f7083001cb694f44821ca506425bda2 'clk: samsung: exynos4: set
parent of sclk_hdmiphy to hdmi') doesn't work in all cases. To finlly
solve the power on/off issues I've decided to simply add 'hdmi' clock
handling also to mixer module.

Regards
Marek Szyprowski


Changelog:

v4:
- added patches, which add 'hdmi' clock handling to mixed block, this
  finally solves the initialization related issues, thanks for Tobias
  Jakobi for testing
- added acks/reviewed/tested by tags

v3: (http://www.spinics.net/lists/linux-samsung-soc/msg41020.html)
- added a note on defining subdomains to generic PM domain binding
  documentation (requested by Ulf Hansson)

v2: (http://www.spinics.net/lists/linux-samsung-soc/msg40980.html)
- rewrote subdomains patch according to suggestions from Geert
  Uytterhoeven and Amit Daniel Kachhap.

v1 resend: (http://www.spinics.net/lists/linux-samsung-soc/msg39428.html)
- added handling of generic 'power-domains' binding in subdomains

v1: (http://www.spinics.net/lists/linux-samsung-soc/msg38914.html)
- resolved power domain on/off issue with 'clk: samsung: exynos4: set
  parent of mixer gate clock to hdmi' patch

v0: (http://www.spinics.net/lists/linux-samsung-soc/msg33498.html)
- first attempt, used 'always on' power domains hack


Patch summary:

Andrzej Hajda (1):
  ARM: dts: exynos5250: add display power domain

Marek Szyprowski (7):
  PM / Domains: Add a note about power domain subdomains
  ARM: Exynos: add support for sub-power domains
  ARM: dts: exynos4: add hdmi related nodes
  ARM: dts: exynos4: add dependency between TV and LCD0 power domains
  ARM: dts: exynos4412-odroid: enable hdmi support
  ARM: dts: Exynos: add 'hdmi' clock to mixer nodes
  drm/exynos: fix mixer start sequence

Tomasz Stanislawski (1):
  ARM: dts: exynos4210-universal_c210: enable hdmi support

 .../bindings/arm/exynos/power_domain.txt           |  2 +
 .../devicetree/bindings/power/power_domain.txt     | 29 +++++++++++
 arch/arm/boot/dts/exynos4.dtsi                     | 41 ++++++++++++++++
 arch/arm/boot/dts/exynos4210-universal_c210.dts    | 57 ++++++++++++++++++++++
 arch/arm/boot/dts/exynos4210.dtsi                  |  8 +++
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi    | 44 +++++++++++++++++
 arch/arm/boot/dts/exynos4x12.dtsi                  | 11 +++++
 arch/arm/boot/dts/exynos5250.dtsi                  | 15 +++++-
 arch/arm/boot/dts/exynos5420.dtsi                  |  5 +-
 arch/arm/mach-exynos/pm_domains.c                  | 28 +++++++++++
 drivers/gpu/drm/exynos/exynos_mixer.c              |  9 ++++
 11 files changed, 245 insertions(+), 4 deletions(-)

-- 
1.9.2
