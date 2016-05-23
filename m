From: "Steinar H. Gunderson" <sgunderson@bigfoot.com>
Subject: Re: Endless "supply vcc not found, using dummy regulator"
Date: Mon, 23 May 2016 15:47:37 +0200
Message-ID: <20160523134737.GA21683@sesse.net>
References: <20160521144308.GA13960@sesse.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassarossa.samfundet.no ([193.35.52.29]:52755 "EHLO
	cassarossa.samfundet.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753251AbcEWNrp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 May 2016 09:47:45 -0400
Content-Disposition: inline
In-Reply-To: <20160521144308.GA13960@sesse.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: 823552@bugs.debian.org, broonie@kernel.org

On Sat, May 21, 2016 at 04:43:08PM +0200, Steinar H. Gunderson wrote:
> I still have this problem.
> 
> I've noticed that somehow, there's a huge amount of USB PHYs being autodetected;
> probably related to this issue.
> 
>   sesse@soldroid:~$ ls -ld /sys/devices/platform/usb_phy* | wc -l
>   4288

I've tracked this down partially. It has to do with probe deferral;
for whatever reason, the vdd33 regulator isn't available when the dwc3 driver
comes up, and this causes the probe to defer. For each and every such
deferral, these messages are printed by the regulator subsystem as part of
things attempted probed before vdd33. I don't understand entirely why
it tries 2000+ times before it succeeds, but then I don't understand probe
deferral very well to begin with. I also don't know if there's a way to avoid
these messages for each time, but it seems this is a common problem:

  https://lkml.org/lkml/2016/3/16/269

In this case, it's not just an annoyance, though; they're so many that they
keep the system from booting unless loglevel is turned down. Cc-ing Mark in
case he has any insights (I hope I have the right email address).

The reason for the huge amount of PHYs is that the driver doesn't clean them
up on failure (including probe deferral), so they leak. This is easy to fix;
I'm attaching a small fix below.

>From 6df2ebcbaae74577d49dbbc41e28d52084a124b0 Mon Sep 17 00:00:00 2001
From: "Steinar H. Gunderson" <sesse@google.com>
Date: Mon, 23 May 2016 15:44:37 +0200
Subject: [PATCH 1/1] dwc3-exynos: Clean up phys on probe failure.

Otherwise, they would leak, which is especially bad given probe deferral
(one could end up with thousands of dead phys after a normal boot)

Signed-off-by: Steinar H. Gunderson <sesse@google.com>
---
 drivers/usb/dwc3/dwc3-exynos.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
index dd5cb55..4104ef5 100644
--- a/drivers/usb/dwc3/dwc3-exynos.c
+++ b/drivers/usb/dwc3/dwc3-exynos.c
@@ -202,6 +202,8 @@ err4:
 err3:
 	regulator_disable(exynos->vdd33);
 err2:
+	platform_device_unregister(exynos->usb2_phy);
+	platform_device_unregister(exynos->usb3_phy);
 	clk_disable_unprepare(exynos->axius_clk);
 	clk_disable_unprepare(exynos->susp_clk);
 	clk_disable_unprepare(exynos->clk);

/* Steinar */
-- 
Homepage: https://www.sesse.net/
