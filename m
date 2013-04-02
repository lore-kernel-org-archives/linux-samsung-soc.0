From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH V3 0/7] Update Arndale board support
Date: Tue,  2 Apr 2013 13:45:00 +0530
Message-ID: <1364890507-19261-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f53.google.com ([209.85.210.53]:58899 "EHLO
	mail-da0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932234Ab3DBI0r (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Apr 2013 04:26:47 -0400
Received: by mail-da0-f53.google.com with SMTP id n34so91570dal.12
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Apr 2013 01:26:47 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, patches@linaro.org

Arndale board support has been updated using pin-control and
common clock framework.

The patchset is based on Kukjin's for-next.
commit d58f6a153f40 ("Merge branch 'next/clk-exynos-2' into for-next")

It depends on following patchset.

[PATCH 0/2] ARM: dts: Add default pin states for client nodes on Exynos4/5 platforms
http://comments.gmane.org/gmane.linux.kernel.samsung-soc/16559

Following 2 patches have been newly added in this patchset because
of changes during 3.9 merge window.
1/7: ARM: dts: Add pin-control related changes for Arndale board
2/7: ARM: dts: Add disable-wp for card slot on exynos5250-arndale

Amit Daniel Kachhap (1):
  ARM: dts: Add PMIC node entry for Arndale board

Sachin Kamat (4):
  ARM: dts: Add disable-wp for card slot on exynos5250-arndale
  ARM: dts: Add vmmc regulator support for Arndale board
  ARM: dts: Add MFC codec support for Arndale board
  ARM: dts: Add HDMI HPD and regulator node for Arndale board

Tushar Behera (2):
  ARM: dts: Add pin-control related changes for Arndale board
  ARM: dts: Add gpio-button entries for Arndale board

 arch/arm/boot/dts/exynos5250-arndale.dts |  343 +++++++++++++++++++++++++++++-
 1 file changed, 333 insertions(+), 10 deletions(-)

-- 
1.7.9.5
