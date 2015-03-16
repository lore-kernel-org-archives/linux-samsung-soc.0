From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH 0/3] ARM: dts: Define stdout-patch for Exynos Chromebooks
Date: Mon, 16 Mar 2015 11:28:27 +0100
Message-ID: <1426501710-24177-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:51619 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753100AbbCPK2n (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Mar 2015 06:28:43 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Andreas Faerber <afaerber@suse.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

The kernel can use as the default console a serial port if is defined
as stdout device in the Device Tree.
    
This allows a board to be booted without the need of having a console
parameter in the kernel command line.

This small series add a stdout-path property for Exynos5 Chromebooks and
is composed of the following patches:

Javier Martinez Canillas (3):
  ARM: dts: Define stdout-path property for Peach boards
  ARM: dts: Define stdout-path property for Snow board
  ARM: dts: Define stdout-path property for Spring board

 arch/arm/boot/dts/exynos5250-snow.dts      | 1 +
 arch/arm/boot/dts/exynos5250-spring.dts    | 1 +
 arch/arm/boot/dts/exynos5420-peach-pit.dts | 4 ++++
 arch/arm/boot/dts/exynos5800-peach-pi.dts  | 4 ++++
 4 files changed, 10 insertions(+)

Best regards,
Javier
