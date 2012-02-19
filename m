From: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
Subject: Re: [PATCH 06/12] ARM: S3C24XX: change the ARCH_S3C2410 to ARCH_S3C24XX
Date: Sun, 19 Feb 2012 22:53:40 +0000
Message-ID: <4F417D74.7020108@gmx.de>
References: <1329346545-16373-1-git-send-email-kgene.kim@samsung.com> <1329346545-16373-7-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout-de.gmx.net ([213.165.64.23]:51577 "HELO
	mailout-de.gmx.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1754026Ab2BSWyD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 19 Feb 2012 17:54:03 -0500
In-Reply-To: <1329346545-16373-7-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Chris Ball <cjb@laptop.org>, David Woodhouse <dwmw2@infradead.org>, Alessandro Zummo <a.zummo@towertech.it>, Grant Likely <grant.likely@secretlab.ca>, Greg Kroah-Hartman <gregkh@suse.de>, Felipe Balbi <balbi@ti.com>, Wim Van Sebroeck <wim@iguana.be>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lrg@ti.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Russell King <rmk+kernel@arm.linux.org.uk>

Hi,

On 02/15/2012 10:55 PM, Kukjin Kim wrote:
> This patch changes the ARCH name to "ARCH_S3C24XX" for Samsung
> S3C2410, S3C2412, S3C2413, S3C2416, S3C2440, S3C2442, S3C2443,
> and S3C2450 SoCs so that we can merge the mach-xxx directories
> and plat-s3c24xx dir. to just one mach-s3c24xx for them.

Great.

> I think this should be sent to upstream via samsung tree because
> this touches many samsung stuff.

Okay, feel free to do so.

> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Richard Purdie <rpurdie@rpsys.net>
> Cc: Chris Ball <cjb@laptop.org>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Grant Likely <grant.likely@secretlab.ca>
> Cc: Greg Kroah-Hartman <gregkh@suse.de>
> Cc: Felipe Balbi <balbi@ti.com>
> Cc: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>

for the framebuffer (video) part:
Acked-by: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>

> Cc: Wim Van Sebroeck <wim@iguana.be>
> Cc: Sangbeom Kim <sbkim73@samsung.com>
> Cc: Liam Girdwood <lrg@ti.com>
> Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>
> Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---

Best regards,

Florian Tobias Schandinat
