From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [RFC PATCH 0/2] ARM: EXYNOS: Fix Suspend-to-RAM on Exynos5420
Date: Fri, 27 Mar 2015 15:21:35 +0100
Message-ID: <1427466097-7287-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:39372 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752768AbbC0OVv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Mar 2015 10:21:51 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, Kevin Hilman <khilman@linaro.org>, Tyler Baker <tyler.baker@linaro.org>, Steve Capper <steve.capper@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Hello,

Suspend-to-RAM is currently not working. Abhilash Kesavan traced down
to the MDMA0 DMA controller clock to be disabled during suspend and
that it must stay enaled during suspend or the system is not able to
resume.

This series is an attempt to fix the issue and is composed of patches:

Javier Martinez Canillas (2):
  clk: exynos5420: Add alias for MDMA0 controller clock
  ARM: EXYNOS: Make sure that the Exynos5420 MDMA0 clock is enabled
    during suspend

 arch/arm/mach-exynos/suspend.c       | 15 +++++++++++++++
 drivers/clk/samsung/clk-exynos5420.c |  2 +-
 2 files changed, 16 insertions(+), 1 deletion(-)

Patch #1 just adds an alias fo the MDMA0 clock so a lookup is registered.

Patch #2 enables the MDMA0 clock before entering into a suspend state and
disables it again once the system has been resumed.

The patches are a RFC because I'm not sure if this is the best approach
to solve the issue. So feedback will be highly appreciated.

Best regards,
Javier
