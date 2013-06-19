From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH 1/4] drm/exynos: rename compatible strings for hdmi
 subsystem
Date: Wed, 19 Jun 2013 09:59:10 +0200
Message-ID: <1371628750.4230.3.camel@weser.hi.pengutronix.de>
References: <1371559778-9359-1-git-send-email-rahul.sharma@samsung.com>
	 <1371559778-9359-2-git-send-email-rahul.sharma@samsung.com>
	 <7536863.RugNVV3dBS@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:45605 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933328Ab3FSIBh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Jun 2013 04:01:37 -0400
In-Reply-To: <7536863.RugNVV3dBS@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, s.nawrocki@samsung.com, kgene.kim@samsung.com, devicetree-discuss@lists.ozlabs.org, sw0312.kim@samsung.com, joshi@samsung.com, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, rob.herring@calxeda.com, grant.likely@linaro.org

Am Mittwoch, den 19.06.2013, 09:52 +0200 schrieb Tomasz Figa:
> Hi Rahul,
> 
> On Tuesday 18 of June 2013 18:19:35 Rahul Sharma wrote:
> > This patch renames the combatible strings for hdmi, mixer, ddc
> > and hdmiphy. It follows the convention of using compatible string
> > which represent the SoC in which the IP was added for the first
> > time.
> > 
> > Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> > ---
> >  Documentation/devicetree/bindings/video/exynos_hdmi.txt    |    6
> > ++++-- Documentation/devicetree/bindings/video/exynos_hdmiddc.txt |   
> > 4 ++-- Documentation/devicetree/bindings/video/exynos_hdmiphy.txt |   
> > 6 ++++-- Documentation/devicetree/bindings/video/exynos_mixer.txt   |  
> >  7 +++++-- drivers/gpu/drm/exynos/exynos_ddc.c                        |
> >    2 +- drivers/gpu/drm/exynos/exynos_hdmi.c                       |   
> > 2 +- drivers/gpu/drm/exynos/exynos_hdmiphy.c                    |    4
> > +++- drivers/gpu/drm/exynos/exynos_mixer.c                      |   12
> > ++++++------ 8 files changed, 26 insertions(+), 17 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/video/exynos_hdmi.txt
> > b/Documentation/devicetree/bindings/video/exynos_hdmi.txt index
> > 589edee..2ac01ca 100644
> > --- a/Documentation/devicetree/bindings/video/exynos_hdmi.txt
> > +++ b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
> > @@ -1,7 +1,9 @@
> >  Device-Tree bindings for drm hdmi driver
> > 
> >  Required properties:
> > -- compatible: value should be "samsung,exynos5-hdmi".
> > +- compatible: value should be one among the following:
> > +	1) "samsung,exynos4210-hdmi"
> > +	2) "samsung,exynos4212-hdmi"
> >  - reg: physical base address of the hdmi and length of memory mapped
> >  	region.
> >  - interrupts: interrupt number to the cpu.
> > @@ -15,7 +17,7 @@ Required properties:
> >  Example:
> > 
> >  	hdmi {
> > -		compatible = "samsung,exynos5-hdmi";
> > +		compatible = "samsung,exynos4212-hdmi";
> 
> Sorry, but it's a NAK from me.
> 
> DeviceTree bindings are considered an ABI. This is to allow older dtbs to 
> work with new kernels.
> 
> If you just change the binding this way, you break all the existing users 
> of this compatible value.
> 
> In addition you are doing it in a way that breaks bisection:
>  - patch 1/4 breaks existing in-tree users of current compatible values,
>  - after patch 2 and 3 it is still broken,
>  - and eventually all in-tree users are fixed by patch 4 (but you can't 
> fix out-of-tree users).
> 
> Please do it without changing existing compatible values. Even if they are 
> misleading, this is all can be described in the documentation - just list 
> SoCs that can be used with each compatible value there.
> 

Or you could just introduce the new compatible value and make all
in-tree users use this, but keep the old values around and still accept
them in the drivers. This way you get the goodness of the cleaner new
symbols without breaking existing users. Just mark the old values as
deprecated in the documentation, so no new devicetree usees them.

Regards,
Lucas
-- 
Pengutronix e.K.                           | Lucas Stach                 |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-5076 |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
