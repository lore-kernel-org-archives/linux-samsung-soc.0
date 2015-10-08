From: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Subject: Re: [PATCHv3 1/2] ARM: exynos_defconfig: Enable rtl8152 ethernet
 driver for Odroid-XU4
Date: Thu, 08 Oct 2015 11:27:13 +0200
Message-ID: <1444296433.9895.234.camel@collabora.co.uk>
References: <1444276117-3657-1-git-send-email-linux.amoon@gmail.com>
	 <5077751.tKglqqEUaI@wuerfel> <56161F53.50505@samsung.com>
	 <26439960.pU0jZ9hpjg@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:59872 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755285AbbJHJ1R convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Oct 2015 05:27:17 -0400
In-Reply-To: <26439960.pU0jZ9hpjg@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, linux-samsung-soc@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Anand Moon <linux.amoon@gmail.com>, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>

On Thu, 2015-10-08 at 10:37 +0200, Arnd Bergmann wrote:
> On Thursday 08 October 2015 16:46:27 Krzysztof Kozlowski wrote:
> > On 08.10.2015 16:41, Arnd Bergmann wrote:
> > > On Thursday 08 October 2015 03:48:36 Anand Moon wrote:
> > > > diff --git a/arch/arm/configs/exynos_defconfig
> > > > b/arch/arm/configs/exynos_defconfig
> > > > index 1ff2bfa..5d1937b 100644
> > > > --- a/arch/arm/configs/exynos_defconfig
> > > > +++ b/arch/arm/configs/exynos_defconfig
> > > > @@ -61,6 +61,7 @@ CONFIG_BLK_DEV_DM=y
> > > >  CONFIG_DM_CRYPT=m
> > > >  CONFIG_NETDEVICES=y
> > > >  CONFIG_SMSC911X=y
> > > > +CONFIG_USB_RTL8152=y
> > > >  CONFIG_USB_USBNET=y
> > > >  CONFIG_USB_NET_SMSC75XX=y
> > > >  CONFIG_USB_NET_SMSC95XX=y
> > > 
> > > Can we make that a loadable module for multi_v7_defconfig?
> > 
> > What about nfsroot boots? We were discussing this also here:
> > http://linux-arm-kernel.infradead.narkive.com/lG5g4hrB/patch-arm-mu
> > lti-v7-defconfig-enable-usb3503
> > 
> > and actually I would be happy to see a confirmed policy about that.
> > Everything should be a module for multi_v7?
> 
> We try to make as much as possible modular here, and NFS root is a
> corner
> case: it's possible to do NFS root with an initramfs, but it's easier
> not
> to. Is it something you do a lot on this hardware?

It's a workflow thing though, not a hardware specific thing. I
personally tend to use NFS root quite often and so do various
colleagues irrespective of the hardware (and an XU4 is bound to appear
on my desk someday). 

Now I personally really don't mind whether NFS root requires a ramdisk
or not (though some consistency would be nice). However deciding it on
a per device basis just makes everything quite fuzzy (e.g. my recent
rockchip multi_v7 patchset first ended up in a similar discussion,
though v2 was merged without further comments when I indicated in the
cover letter that i used the NFS root use-case as one of the deciding
factors for y vs. m).

It would be really good to see someone put their foot down on the
general policy (e.g. the arm-soc maintainers?), such that this
discussion doesn't need to happen every time :)

-- 
Sjoerd Simons
Collabora Ltd.
