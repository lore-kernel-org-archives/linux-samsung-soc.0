From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 0/3] Add display support for Origen board
Date: Fri,  7 Jun 2013 16:37:12 +0530
Message-ID: <1370603235-11193-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f181.google.com ([209.85.192.181]:34924 "EHLO
	mail-pd0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753862Ab3FGLVg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Jun 2013 07:21:36 -0400
Received: by mail-pd0-f181.google.com with SMTP id 14so2036569pdj.26
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Jun 2013 04:21:36 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, patches@linaro.org

The patches are based in Kukjin's for-next branch.

Sachin Kamat (2):
  ARM: dts: exynos4210: Add LCD related pinctrl entries
  ARM: dts: Add FIMD node to Origen4210 board

Tushar Behera (1):
  ARM: dts: Set BUCK7 as always on for Origen board

 arch/arm/boot/dts/exynos4210-origen.dts   |   22 +++++++++
 arch/arm/boot/dts/exynos4210-pinctrl.dtsi |   75 +++++++++++++++++++++++++++++
 2 files changed, 97 insertions(+)

-- 
1.7.9.5
