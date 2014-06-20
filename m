From: Tushar Behera <tushar.b@samsung.com>
Subject: [PATCH v2 0/2] ARM: dts: Peach-pi audio support and cleanup
Date: Fri, 20 Jun 2014 13:50:17 +0530
Message-ID: <1403252419-28352-1-git-send-email-tushar.b@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f54.google.com ([209.85.160.54]:58544 "EHLO
	mail-pb0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965273AbaFTIXY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Jun 2014 04:23:24 -0400
Received: by mail-pb0-f54.google.com with SMTP id un15so2853159pbc.41
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jun 2014 01:23:23 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, broonie@kernel.org, dianders@chromium.org, trblinux@gmail.com

The patchset is dependent on following patch.
[1] ARM: dts: Update the parent for Audss clocks in Exynos5420
https://lkml.org/lkml/2014/6/11/36

During the review of v1, it was pointed out that it would be better to
sort DTS files for Peach-pit and Peach-pi boards. Patch 2 is a step
towards that activity.

Tushar Behera (2):
  ARM: dts: Enable audio support for Peach-pi board
  ARM: dts: Sort nodes within Peach-pit/Peach-pi dts files

 arch/arm/boot/dts/exynos5420-peach-pit.dts |  236 ++++++++++++++--------------
 arch/arm/boot/dts/exynos5800-peach-pi.dts  |  218 ++++++++++++++-----------
 2 files changed, 245 insertions(+), 209 deletions(-)

-- 
1.7.9.5
