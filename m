From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH] ARM: S5PC110: enable PWM timers for GONI board
Date: Fri, 10 Jun 2011 07:42:49 +0200
Message-ID: <001e01cc2731$3bcc5770$b3650650$%szyprowski@samsung.com>
References: <1307429115-13402-1-git-send-email-m.szyprowski@samsung.com>
 <4DF14536.4030304@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:53196 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751847Ab1FJFmx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Jun 2011 01:42:53 -0400
Received: from spt2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LMK00F2D7VG45@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Jun 2011 06:42:52 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LMK00F7B7VEAA@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Jun 2011 06:42:50 +0100 (BST)
In-reply-to: <4DF14536.4030304@samsung.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, 'Kyungmin Park' <kyungmin.park@samsung.com>

Hello,

On Friday, June 10, 2011 12:12 AM Kukjin Kim wrote:

> On 06/06/11 23:45, Marek Szyprowski wrote:
> > s5p_timer requires PWM device to be compiled in. Add aproperiate Kconfig
> > select directive for GONI machine, so compilation won't fail if GONI is
> > the only machine compiled into the kernel.
> >
> > Signed-off-by: Marek Szyprowski<m.szyprowski@samsung.com>
> > Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
> >
> > ---
> >   arch/arm/mach-s5pv210/Kconfig |    1 +
> >   1 files changed, 1 insertions(+), 0 deletions(-)
> >
> > diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-
> s5pv210/Kconfig
> > index 37b5a97..aceafb4 100644
> > --- a/arch/arm/mach-s5pv210/Kconfig
> > +++ b/arch/arm/mach-s5pv210/Kconfig
> > @@ -92,6 +92,7 @@ config MACH_GONI
> >   	select S3C_DEV_I2C2
> >   	select S3C_DEV_USB_HSOTG
> >   	select S5P_DEV_ONENAND
> > +	select SAMSUNG_DEV_PWM
> >   	select SAMSUNG_DEV_KEYPAD
> >   	select S5PV210_SETUP_FB_24BPP
> >   	select S5PV210_SETUP_I2C1
> 
> Yeah, SAMSUNG_DEV_PWM is required to use s5p-time.c for HRT.
> So I think following is better.
> 
> Marek, if you don't mind, I'd like to apply below...
> 
> diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
> index e98f5c5..7f9ff2a 100644
> --- a/arch/arm/plat-s5p/Kconfig
> +++ b/arch/arm/plat-s5p/Kconfig
> @@ -39,6 +39,7 @@ config S5P_GPIO_INT
> 
>   config S5P_HRT
>          bool
> +       select SAMSUNG_DEV_PWM
>          help
>            Use the High Resolution timer support
> 
> Thanks.

Yes, this one looks better.

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center
