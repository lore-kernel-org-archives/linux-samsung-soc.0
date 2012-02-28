From: Wim Van Sebroeck <wim@iguana.be>
Subject: Re: [PATCH 06/12] ARM: S3C24XX: change the ARCH_S3C2410 to ARCH_S3C24XX
Date: Tue, 28 Feb 2012 12:44:43 +0100
Message-ID: <20120228114443.GA21563@spo001.leaseweb.com>
References: <1329346545-16373-1-git-send-email-kgene.kim@samsung.com> <1329346545-16373-7-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ns1.pc-advies.be ([83.149.101.17]:45483 "EHLO
	spo001.leaseweb.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753035Ab2B1MLj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Feb 2012 07:11:39 -0500
Content-Disposition: inline
In-Reply-To: <1329346545-16373-7-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Chris Ball <cjb@laptop.org>, David Woodhouse <dwmw2@infradead.org>, Alessandro Zummo <a.zummo@towertech.it>, Grant Likely <grant.likely@secretlab.ca>, Greg Kroah-Hartman <gregkh@suse.de>, Felipe Balbi <balbi@ti.com>, Florian Tobias Schandinat <FlorianSchandinat@gmx.de>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lrg@ti.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Russell King <rmk+kernel@arm.linux.org.uk>

Hi Kim,

> This patch changes the ARCH name to "ARCH_S3C24XX" for Samsung
> S3C2410, S3C2412, S3C2413, S3C2416, S3C2440, S3C2442, S3C2443,
> and S3C2450 SoCs so that we can merge the mach-xxx directories
> and plat-s3c24xx dir. to just one mach-s3c24xx for them.
> 
> I think this should be sent to upstream via samsung tree because
> this touches many samsung stuff.
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Richard Purdie <rpurdie@rpsys.net>
> Cc: Chris Ball <cjb@laptop.org>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Grant Likely <grant.likely@secretlab.ca>
> Cc: Greg Kroah-Hartman <gregkh@suse.de>
> Cc: Felipe Balbi <balbi@ti.com>
> Cc: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
> Cc: Wim Van Sebroeck <wim@iguana.be>
> Cc: Sangbeom Kim <sbkim73@samsung.com>
> Cc: Liam Girdwood <lrg@ti.com>
> Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>
> Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>

For the watchdog-part:
Acked-by: Wim Van Sebroeck <wim@iguana.be>

Kind regards,
Wim.
