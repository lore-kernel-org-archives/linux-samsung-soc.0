From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 2/4] Samsung 3rd DT updates for v3.15
Date: Fri, 21 Mar 2014 07:30:41 +0900
Message-ID: <532B6C11.5070607@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f52.google.com ([209.85.160.52]:46677 "EHLO
	mail-pb0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933337AbaCTWgF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Mar 2014 18:36:05 -0400
Received: by mail-pb0-f52.google.com with SMTP id rr13so1589343pbb.39
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Mar 2014 15:36:04 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, "arm@kernel.org" <arm@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

The following changes since commit ba0d7ed391b7b3fb5ca98d9cf4d067b7f5ed956b:

   ARM: dts: enable ahci sata and sata phy for exynos5250 (2014-03-18 
07:49:14 +0900)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/samsung-dt-3

for you to fetch changes up to 55ace6b285d7350d5b562ba065656c8242629a32:

   ARM: dts: Keep some essential LDOs enabled for arndale-octa board 
(2014-03-21 04:27:45 +0900)

----------------------------------------------------------------
Samsung 3rd DT updates for v3.15

- Arndale Octa board updates:
   LDO3 and LDO23 enabled for soft-reset
   LDO9 enabled for USB operation
   MDMA1 disabled to avoid imprecise external abort

Note that this is based on previous tags/samsung-dt-2

----------------------------------------------------------------
Tushar Behera (2):
       ARM: dts: Disable MDMA1 node for arndale-octa board
       ARM: dts: Keep some essential LDOs enabled for arndale-octa board

  arch/arm/boot/dts/exynos5420-arndale-octa.dts | 15 +++++++++++++++
  1 file changed, 15 insertions(+)
