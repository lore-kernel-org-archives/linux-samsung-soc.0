From: Inki Dae <inki.dae@samsung.com>
Subject: RE: [PATCH 1/4] drm/exynos: rename compatible strings for hdmi
	subsystem
Date: Wed, 19 Jun 2013 17:27:08 +0900
Message-ID: <00a001ce6cc6$ca1807e0$5e4817a0$%dae@samsung.com>
References: <1371559778-9359-1-git-send-email-rahul.sharma@samsung.com>
 <1371559778-9359-2-git-send-email-rahul.sharma@samsung.com>
 <7536863.RugNVV3dBS@flatron> <1371628750.4230.3.camel@weser.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:24359 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932873Ab3FSI1Q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Jun 2013 04:27:16 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOM00HCZSQCS1T0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Jun 2013 17:27:09 +0900 (KST)
In-reply-to: <1371628750.4230.3.camel@weser.hi.pengutronix.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Lucas Stach' <l.stach@pengutronix.de>, 'Tomasz Figa' <tomasz.figa@gmail.com>
Cc: kgene.kim@samsung.com, devicetree-discuss@lists.ozlabs.org, sw0312.kim@samsung.com, joshi@samsung.com, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, rob.herring@calxeda.com, s.nawrocki@samsung.com, grant.likely@linaro.org, 'Rahul Sharma' <rahul.sharma@samsung.com>



> -----Original Message-----
> From: dri-devel-bounces+inki.dae=samsung.com@lists.freedesktop.org
> [mailto:dri-devel-bounces+inki.dae=samsung.com@lists.freedesktop.org] On
> Behalf Of Lucas Stach
> Sent: Wednesday, June 19, 2013 4:59 PM
> To: Tomasz Figa
> Cc: kgene.kim@samsung.com; devicetree-discuss@lists.ozlabs.org;
> sw0312.kim@samsung.com; joshi@samsung.com;
dri-devel@lists.freedesktop.org;
> linux-samsung-soc@vger.kernel.org; rob.herring@calxeda.com;
> s.nawrocki@samsung.com; grant.likely@linaro.org; Rahul Sharma
> Subject: Re: [PATCH 1/4] drm/exynos: rename compatible strings for hdmi
> subsystem
> 
> Am Mittwoch, den 19.06.2013, 09:52 +0200 schrieb Tomasz Figa:
> > Hi Rahul,
> >
> > On Tuesday 18 of June 2013 18:19:35 Rahul Sharma wrote:
> > > This patch renames the combatible strings for hdmi, mixer, ddc
> > > and hdmiphy. It follows the convention of using compatible string
> > > which represent the SoC in which the IP was added for the first
> > > time.
> > >
> > > Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> > > ---
> > >  Documentation/devicetree/bindings/video/exynos_hdmi.txt    |    6
> > > ++++-- Documentation/devicetree/bindings/video/exynos_hdmiddc.txt |
> > > 4 ++-- Documentation/devicetree/bindings/video/exynos_hdmiphy.txt |
> > > 6 ++++-- Documentation/devicetree/bindings/video/exynos_mixer.txt   |
> > >  7 +++++-- drivers/gpu/drm/exynos/exynos_ddc.c
|
> > >    2 +- drivers/gpu/drm/exynos/exynos_hdmi.c                       |
> > > 2 +- drivers/gpu/drm/exynos/exynos_hdmiphy.c                    |    4
> > > +++- drivers/gpu/drm/exynos/exynos_mixer.c                      |   12
> > > ++++++------ 8 files changed, 26 insertions(+), 17 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/video/exynos_hdmi.txt
> > > b/Documentation/devicetree/bindings/video/exynos_hdmi.txt index
> > > 589edee..2ac01ca 100644
> > > --- a/Documentation/devicetree/bindings/video/exynos_hdmi.txt
> > > +++ b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
> > > @@ -1,7 +1,9 @@
> > >  Device-Tree bindings for drm hdmi driver
> > >
> > >  Required properties:
> > > -- compatible: value should be "samsung,exynos5-hdmi".
> > > +- compatible: value should be one among the following:
> > > +	1) "samsung,exynos4210-hdmi"
> > > +	2) "samsung,exynos4212-hdmi"
> > >  - reg: physical base address of the hdmi and length of memory mapped
> > >  	region.
> > >  - interrupts: interrupt number to the cpu.
> > > @@ -15,7 +17,7 @@ Required properties:
> > >  Example:
> > >
> > >  	hdmi {
> > > -		compatible = "samsung,exynos5-hdmi";
> > > +		compatible = "samsung,exynos4212-hdmi";
> >
> > Sorry, but it's a NAK from me.
> >
> > DeviceTree bindings are considered an ABI. This is to allow older dtbs
> to
> > work with new kernels.
> >
> > If you just change the binding this way, you break all the existing
> users
> > of this compatible value.
> >
> > In addition you are doing it in a way that breaks bisection:
> >  - patch 1/4 breaks existing in-tree users of current compatible values,
> >  - after patch 2 and 3 it is still broken,
> >  - and eventually all in-tree users are fixed by patch 4 (but you can't
> > fix out-of-tree users).
> >
> > Please do it without changing existing compatible values. Even if they
> are
> > misleading, this is all can be described in the documentation - just
> list
> > SoCs that can be used with each compatible value there.
> >
> 
> Or you could just introduce the new compatible value and make all
> in-tree users use this, but keep the old values around and still accept
> them in the drivers. This way you get the goodness of the cleaner new
> symbols without breaking existing users. Just mark the old values as
> deprecated in the documentation, so no new devicetree usees them.
> 

That's a good idea. We really need to mitigate such misleading somehow or
other.

Thanks,
Inki Dae

> Regards,
> Lucas
> --
> Pengutronix e.K.                           | Lucas Stach                 |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-5076 |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
