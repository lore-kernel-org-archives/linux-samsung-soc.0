From: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Subject: [PATCH 0/3 v3] Fix Exynos USB on kernels with USB Gadget support
Date: Mon, 15 Sep 2014 12:52:31 +0200
Message-ID: <1410778354-31210-1-git-send-email-sjoerd.simons@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:38757 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753237AbaIOKwy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Sep 2014 06:52:54 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Sjoerd Simons <sjoerd.simons@collabora.co.uk>

When building a kernel with support for both USB host and USB Gadget su=
pport on
the dwc3 controller on the Exynos5 soc will go into USB OTG mode unless
otherwise specified in the dtb, which is unhelpful for boards hooked up=
 to run
as USB host.

=46irst patch in this set explicitely set the dual-role mode for the dw=
c3
controller on Peach pi and Peach pit boards to host mode. Second patch =
adds
similar updates for Arndale Octa as reported by Andreas F=C3=A4rber. La=
st patch
enables gadget mode in the default exynos config to more easily catch/t=
rigger
issues like these.

I suspect the Samsung SMDK5420 DTS might need similar changes, so it wo=
uld be
great if users of those board could verify this.

Changes in v2: alphabetically sort the dts entries
Changes in v3: Add DTS updates for arndale octa

Sjoerd Simons (3):
  ARM: dts: exynos: Explicitly set dr_mode on peach-pit and peach-pi
  ARM: dts: exynos: Explicitly set dr_mode on arndale-octa
  ARM: exynos_defconfig: enable USB gadget support

 arch/arm/boot/dts/exynos5420-arndale-octa.dts | 4 ++++
 arch/arm/boot/dts/exynos5420-peach-pit.dts    | 8 ++++++++
 arch/arm/boot/dts/exynos5420.dtsi             | 4 ++--
 arch/arm/boot/dts/exynos5800-peach-pi.dts     | 8 ++++++++
 arch/arm/configs/exynos_defconfig             | 1 +
 5 files changed, 23 insertions(+), 2 deletions(-)

--=20
2.1.0
