From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 0/2] ARM: S3C64xx: cpuidle cleanups
Date: Mon, 14 May 2012 16:06:15 +0200
Message-ID: <1337004377-17732-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:64654 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756366Ab2ENOGT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 May 2012 10:06:19 -0400
Received: by wgbdr13 with SMTP id dr13so4694305wgb.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 May 2012 07:06:18 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: ben-linux@fluff.org, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com
Cc: linux-arm-kernel@lists.infradead.org, linaro-dev@lists.linaro.org, patches@linaro.org, linux-samsung-soc@vger.kernel.org, heiko@sntech.de

These couple of patches use the new cpuidle core api to refactor
some part of the code. The first one declares the states directly
in the driver declaration and the second one use the timekeeping
flag to let the cpuidle core to compute the idle time.

I don't have this board, I was not able to test these patches.

Daniel Lezcano (2):
  ARM: s3c64xx: cpuidle - declare the states with the new api
  ARM: s3c64xx: cpuidle - use timekeeping wrapper

 arch/arm/mach-s3c64xx/cpuidle.c |   45 +++++++++++++--------------------------
 1 files changed, 15 insertions(+), 30 deletions(-)

-- 
1.7.5.4
