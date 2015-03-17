From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 0/3] ARM: dts: Define stdout-patch for Exynos Chromebooks
Date: Tue, 17 Mar 2015 06:27:19 +0100
Message-ID: <2791862.CZRe5DtPad@wuerfel>
References: <1426501710-24177-1-git-send-email-javier.martinez@collabora.co.uk> <075601d06054$d94e6fa0$8beb4ee0$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.130]:54443 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750777AbbCQF2G (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Mar 2015 01:28:06 -0400
In-Reply-To: <075601d06054$d94e6fa0$8beb4ee0$@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: 'Javier Martinez Canillas' <javier.martinez@collabora.co.uk>, 'Olof Johansson' <olof@lixom.net>, 'Doug Anderson' <dianders@chromium.org>, 'Andreas Faerber' <afaerber@suse.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On Tuesday 17 March 2015 10:51:13 Kukjin Kim wrote:
> Javier Martinez Canillas wrote:
> > 
> > The kernel can use as the default console a serial port if is defined
> > as stdout device in the Device Tree.
> > 
> > This allows a board to be booted without the need of having a console
> > parameter in the kernel command line.
> > 
> > This small series add a stdout-path property for Exynos5 Chromebooks and
> > is composed of the following patches:
> > 
> > Javier Martinez Canillas (3):
> >   ARM: dts: Define stdout-path property for Peach boards
> >   ARM: dts: Define stdout-path property for Snow board
> >   ARM: dts: Define stdout-path property for Spring board
> > 
> >  arch/arm/boot/dts/exynos5250-snow.dts      | 1 +
> >  arch/arm/boot/dts/exynos5250-spring.dts    | 1 +
> >  arch/arm/boot/dts/exynos5420-peach-pit.dts | 4 ++++
> >  arch/arm/boot/dts/exynos5800-peach-pi.dts  | 4 ++++
> >  4 files changed, 10 insertions(+)
> > 
> + Arnd
> 
> Basically, I have no objection to add stdout-path property on board DT but I
> need to ask other ARM guys how they think about? Always I'm questioned what
> should be defined in bootloader before entering kernel and IMHO kernel can do
> it, it should be defined in bootloader though 
> 
> Let's wait for other opinions...
> 

We're trying to do this on all machines now so we can replace
debug_ll with earlycon for any normal use case aside from early
early boot debugging.

Please merge this patch set.

	Arnd
