From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Late Exynos stuff for v3.10
Date: Tue, 23 Apr 2013 17:06:38 -0700
Message-ID: <20130424000638.GA9067@quad.lixom.net>
References: <5176B499.1000208@samsung.com>
 <51770697.7080504@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:38051 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756057Ab3DXAGf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Apr 2013 20:06:35 -0400
Received: by mail-pa0-f42.google.com with SMTP id kl13so807262pab.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2013 17:06:34 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <51770697.7080504@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi,

On Wed, Apr 24, 2013 at 07:09:27AM +0900, Kukjin Kim wrote:

> Arnd, Olof,
> 
> Since above request should be too late, so I did sort out like
> following. I think, it should be fine to you ;-) Sorry for noise.
> 
> Note that others will be queued for v3.11.
> 

[..]


>  ----------------------------------------------------------------
>  This includes late exynos stuff for v3.10 and 2nd version for pull
> request 1) enables usb2phy, usb3phy and dwc3-exynos for exynos5250
> 2) support chip id with dt
> 
>  ----------------------------------------------------------------
>  Doug Anderson (1):
>        ARM: dts: Disable the RTC by default on exynos5
> 
>  Thomas Abraham (3):
>        ARM: dts: add mshc controller node for Exynos4x12 SoCs
>        ARM: EXYNOS: Create virtual I/O mapping for Chip-ID
> controller using device tree
>        ARM: dts: Add chip-id controller node on Exynos4/5 SoC
> 
>  Vivek Gautam (5):
>        ARM: dts: Enabling samsung-usb2phy driver for exynos5250
>        ARM: dts: Enabling samsung-usb3phy driver for exynos5250
>        ARM: dts: Add device tree bindings for dwc3-exynos
>        ARM: dts: Enabling dwc3-exynos driver for exynos5250
>        ARM: EXYNOS: Enable XHCI support on exynos5


Can I please ask you to make our life a little easier by telling us what the
specific problems these patches solve are? What I am looking for is something
along the lines of:

--

This branch includes some last-minute enablements of DT contents for features
that are queued for 3.10:
 - USB PHY drivers on Exynos 5250
 - MMC (mshc) on Exynos 4x12
 - XCHI (USB 3.0) on Exynos 5250

It also contains a fix to disable RTC on exynos [because ... you fill in this
part].

--

It doesn't have to be something super-elaborate, but I'd like it to be sort of
self-documenting in a way that I don't have to look through the series of
patches to get an overview of what's in the branch. Of course we'll also do
that to review the code, but having the description there makes things easier
for us to tell if we should even be looking at it, etc.



Thanks!

-Olof
