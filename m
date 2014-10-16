From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 2nd] Samsung fixes 2nd for v3.18
Date: Fri, 17 Oct 2014 08:23:39 +0900
Message-ID: <5440537B.9060506@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:38077 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750969AbaJPXXp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Oct 2014 19:23:45 -0400
Received: by mail-pa0-f43.google.com with SMTP id lf10so4338309pab.16
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Oct 2014 16:23:45 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: arm@kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi,

This is required for previous exynos_defconfig updates including USB 
gadget. Please pull.

Note, this branch is based on previous tags/samsung-defconfig.

Thanks,
Kukjin

---
The following changes since commit 508423bebcda29eb0ba7c627f895387dad7cdcd6:

   ARM: exynos_defconfig: enable USB gadget support (2014-09-25 18:20:18 
+0900)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/samsung-fixes-2

for you to fetch changes up to 4e03394e939135adcd453bd538ea02d98a30473b:

   ARM: dts: Explicitly set dr_mode on exynos5420-arndale-octa 
(2014-10-17 08:17:35 +0900)

----------------------------------------------------------------
2nd Samsung fixes for v3.18
- Explicitly set dr_mode on exynos5800-peach-pi, exynos5420-peach-pit
   and exynos5420-arndale-octa boards, because the USB dwc3 controller
   will not work properly without dr_mode as host on above boards if
   the USB host and gadget are enabled in kernel configuration both.

----------------------------------------------------------------
Sjoerd Simons (2):
       ARM: dts: Explicitly set dr_mode on exynos Peach boards
       ARM: dts: Explicitly set dr_mode on exynos5420-arndale-octa

  arch/arm/boot/dts/exynos5420-arndale-octa.dts | 4 ++++
  arch/arm/boot/dts/exynos5420-peach-pit.dts    | 8 ++++++++
  arch/arm/boot/dts/exynos5420.dtsi             | 4 ++--
  arch/arm/boot/dts/exynos5800-peach-pi.dts     | 8 ++++++++
  4 files changed, 22 insertions(+), 2 deletions(-)
