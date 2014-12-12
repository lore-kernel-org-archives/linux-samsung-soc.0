From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH 0/3] Small updates to Snow and Peach Pit/Pi DTS
Date: Fri, 12 Dec 2014 11:25:48 +0100
Message-ID: <1418379951-5551-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:33847 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757345AbaLLK0P (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Dec 2014 05:26:15 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Hello Kukjin,

This series adds some DTS snippets that were missing in the mainline
Snow and Peach Pit/Pi Device Trees but are present in the downstream
ChromeOS kernel.

The series is composed of the following patches:

Javier Martinez Canillas (3):
  ARM: dts: Add power and lid GPIO keys pinctrl for exynos5250-snow
  ARM: dts: Add lid GPIO key device node for Peach boards
  ARM: dts: Set Peach boards USB WebCam regulators to always on

 arch/arm/boot/dts/exynos5250-snow.dts      | 16 ++++++++++++++++
 arch/arm/boot/dts/exynos5420-peach-pit.dts | 19 ++++++++++++++++++-
 arch/arm/boot/dts/exynos5800-peach-pi.dts  | 20 +++++++++++++++++++-
 3 files changed, 53 insertions(+), 2 deletions(-)

Patch #1 adds some pinctrl lines for the GPIO keys in the Snow DTS.

Patch #2 adds a device node and pinctrl lines for the lid GPIO in
the Peach boards DTS.

Patch #3 sets the regulators that supply voltage to the USB WebCam
in Peach boards as always on.

Best regards,
Javier
