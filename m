From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH v2 0/4] ARM: dts: Add LCD and PWM support for exynos4210-origen
Date: Tue, 11 Jun 2013 11:59:48 +0530
Message-ID: <1370932192-19365-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f178.google.com ([209.85.192.178]:60363 "EHLO
	mail-pd0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751079Ab3FKGoY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Jun 2013 02:44:24 -0400
Received: by mail-pd0-f178.google.com with SMTP id w11so3844609pde.9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Jun 2013 23:44:24 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, t.figa@samsung.com, sachin.kamat@linaro.org, tushar.behera@linaro.org, patches@linaro.org

This series is based on for-next branch of Kukjin's tree.
Tested on Origen board.

Changes since v1:
* Split LCD patch into LCD and PWM as suggested by Tomasz Figa.
* Added all PWM output nodes to pinctrl dtsi file.

Sachin Kamat (3):
  ARM: dts: exynos4210: Add PWM related pinctrl entries
  ARM: dts: exynos4210: Add LCD related pinctrl entries
  ARM: dts: Add FIMD node to Origen4210 board

Tushar Behera (1):
  ARM: dts: Set BUCK7 as always on for Origen board

 arch/arm/boot/dts/exynos4210-origen.dts   |   22 +++++++
 arch/arm/boot/dts/exynos4210-pinctrl.dtsi |   89 +++++++++++++++++++++++++++++
 2 files changed, 111 insertions(+)

-- 
1.7.9.5
