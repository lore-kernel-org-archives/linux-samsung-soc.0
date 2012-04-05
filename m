From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 0/2] ARM: SAMSUNG: Add platform data support for s5p-tv driver
Date: Thu,  5 Apr 2012 13:54:54 +0530
Message-ID: <1333614296-13256-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:47027 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751890Ab2DEIdH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Apr 2012 04:33:07 -0400
Received: by pbcun15 with SMTP id un15so1286145pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Apr 2012 01:33:06 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, t.stanislaws@samsung.com, patches@linaro.org

s5p-tv driver in 3.4-rc1 makes device platform data mandatory. This patchset
adds the related platform data in plat-samsung.

Tushar Behera (2):
  ARM: SAMSUNG: Add API to set platform data for s5p-tv driver
  ARM: EXYNOS: Set HDMI platform data in Origen board

 arch/arm/mach-exynos/mach-origen.c        |    7 +++++++
 arch/arm/plat-samsung/devs.c              |   25 +++++++++++++++++++++++++
 arch/arm/plat-samsung/include/plat/hdmi.h |   16 ++++++++++++++++
 3 files changed, 48 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/plat-samsung/include/plat/hdmi.h

-- 
1.7.4.1
