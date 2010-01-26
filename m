From: jassisinghbrar@gmail.com
Subject: Samsung: New driver for AC97 controllers
Date: Tue, 26 Jan 2010 14:51:31 +0900
Message-ID: <1264485091-13750-1-git-send-email-jassisinghbrar@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:38231 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752168Ab0AZGBx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jan 2010 01:01:53 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org
Cc: ben-linux@fluff.org, broonie@opensource.wolfsonmicro.com, lrg@slimlogic.co.uk, linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>

From: Jassi Brar <jassi.brar@samsung.com>

Hi,
 I am going to submit new driver for the AC97-ver-2.0 controllers found in
Samsung SoCs. The driver is named generic s3c-ac97.c
 The driver has been tested for on s3c64xx and newer SoCs and is confirmed
to support Playback/Capture and VRA.

 A machine driver, for SMDKs with wm9713 as AC97 codec attached, has also
been added. The driver is generic enough to be used as such with newer SoCs.

 The controller driver patch is meant for Mark Brown's for-2.6.34
 Other patches apply cleanly against the Ben Dooks' next-samsung

 The s3c-ac97.c is meant to replace s3c2443-ac97.c after someone confirms
Playback/Capture to work fine. My smdk2443 seems to not play any sound though
the DAI link is establised and the codec detected fine.
So, my opinion is that the new driver is atleast as good as the old one.
If that is good enough, I have patches ready that switch the only two users
of s3c2443-ac97.c(smdk2443 and ln2440sbc) to use this new driver.

Regards.
