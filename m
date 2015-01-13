From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 0/6] Enable HDMI support on Exynos platforms
Date: Tue, 13 Jan 2015 10:39:45 +0100
Message-ID: <1421141991-15155-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:17556 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750990AbbAMJkA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Jan 2015 04:40:00 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NI400HF60DDSKA0@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 Jan 2015 09:44:01 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, kyungmin.park@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>, Amit Daniel Kachhap <amit.daniel@samsung.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Ulf Hansson <ulf.hansson@linaro.org>

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
and requires 2 patches that have been merged to v3.19-rc4:
'clk: samsung: exynos4: set parent of sclk_hdmiphy to hdmi'
(commit df019a5c0f7083001cb694f44821ca506425bda2) and
'PM / Domains: Export of_genpd_get_from_provider function'
(commit 7496fcbe8a643097efc061160e1c3b65ee2fa350).

Regards
Marek Szyprowski

Change log:

v2:
- rewrote subdomains patch according to suggestions from Geert
  Uytterhoeven and Amit Daniel Kachhap.

v1 resend: (http://www.spinics.net/lists/linux-samsung-soc/msg39428.html)
- added handling of generic 'power-domains' binding in subdomains

v1: (http://www.spinics.net/lists/linux-samsung-soc/msg38914.html)
- resolved power domain on/off issue with 'clk: samsung: exynos4: set
  parent of mixer gate clock to hdmi' patch

v0: (http://www.spinics.net/lists/linux-samsung-soc/msg33498.html)
- first attempt, used 'always on' power domains hack


Andrzej Hajda (1):
  ARM: dts: exynos5250: add display power domain

Marek Szyprowski (4):
  ARM: Exynos: add support for sub-power domains
  ARM: dts: exynos4: add hdmi related nodes
  ARM: dts: exynos4: add dependency between TV and LCD0 power domains
  ARM: dts: exynos4412-odroid: enable hdmi support

Tomasz Stanislawski (1):
  ARM: dts: exynos4210-universal_c210: enable hdmi support

 .../bindings/arm/exynos/power_domain.txt           |  2 +
 arch/arm/boot/dts/exynos4.dtsi                     | 41 ++++++++++++++++
 arch/arm/boot/dts/exynos4210-universal_c210.dts    | 57 ++++++++++++++++++++++
 arch/arm/boot/dts/exynos4210.dtsi                  |  8 +++
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi    | 44 +++++++++++++++++
 arch/arm/boot/dts/exynos4x12.dtsi                  | 11 +++++
 arch/arm/boot/dts/exynos5250.dtsi                  | 10 ++++
 arch/arm/mach-exynos/pm_domains.c                  | 28 +++++++++++
 8 files changed, 201 insertions(+)

-- 
1.9.2
