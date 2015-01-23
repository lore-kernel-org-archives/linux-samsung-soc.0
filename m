From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH] ARM: DTS: Exynos: add 'dr_mode' property to hsotg devices
Date: Fri, 23 Jan 2015 16:11:39 +0900
Message-ID: <0d1e01d036db$d51fc070$7f5f4150$@kernel.org>
References: <1421677965-30821-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:22870 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751877AbbAWHLl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Jan 2015 02:11:41 -0500
In-reply-to: 
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: 'Robert Baldyga' <r.baldyga@samsung.com>, 'Paul Zimmerman' <paulz@synopsys.com>, 'Kukjin Kim' <kgene@kernel.org>

Kukjin Kim wrote:
> 
> Marek Szyprowski wrote:
> >
> > All currently supported boards use hsotg/dwc2 controller in device
> > ('peripheral') mode, so add property which sets correct operation mode.
> > This patch fixes support in recent changes in dwc2 driver, which added
> > support for dual-role devices.
> >
> > Suggested-by: Paul Zimmerman <Paul.Zimmerman@synopsys.com>

Maybe typo Paul's email? Let me fix his e-mail to "paulz at ..."

- Kukjin

> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > ---
> >  arch/arm/boot/dts/exynos3250-monk.dts           | 1 +
> >  arch/arm/boot/dts/exynos3250-rinato.dts         | 1 +
> >  arch/arm/boot/dts/exynos4210-trats.dts          | 1 +
> >  arch/arm/boot/dts/exynos4210-universal_c210.dts | 1 +
> >  arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 1 +
> >  arch/arm/boot/dts/exynos4412-trats2.dts         | 1 +
> >  arch/arm/boot/dts/s5pv210-aquila.dts            | 1 +
> >  arch/arm/boot/dts/s5pv210-goni.dts              | 1 +
> >  arch/arm/boot/dts/s5pv210-smdkv210.dts          | 1 +
> >  9 files changed, 9 insertions(+)
> >
> Looks good to me, will apply.
> 
> Thanks,
> Kukjin
