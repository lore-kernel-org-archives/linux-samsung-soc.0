From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH 1/4] drm/exynos: rename compatible strings for hdmi subsystem
Date: Wed, 19 Jun 2013 15:02:59 +0530
Message-ID: <CAPdUM4OmQqkmuW3pUHuTRsZfLDwuj30aoKeA0L8Kbqn4qa1fUA@mail.gmail.com>
References: <1371559778-9359-1-git-send-email-rahul.sharma@samsung.com>
	<1371559778-9359-2-git-send-email-rahul.sharma@samsung.com>
	<7536863.RugNVV3dBS@flatron>
	<1371628750.4230.3.camel@weser.hi.pengutronix.de>
	<00a001ce6cc6$ca1807e0$5e4817a0$%dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f180.google.com ([74.125.82.180]:53950 "EHLO
	mail-we0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934057Ab3FSJdA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Jun 2013 05:33:00 -0400
Received: by mail-we0-f180.google.com with SMTP id w56so4304117wes.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jun 2013 02:32:59 -0700 (PDT)
In-Reply-To: <00a001ce6cc6$ca1807e0$5e4817a0$%dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Lucas Stach <l.stach@pengutronix.de>, Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, sw0312.kim@samsung.com, joshi@samsung.com, dri-devel@lists.freedesktop.org, kgene.kim@samsung.com, rob.herring@calxeda.com, s.nawrocki@samsung.com, grant.likely@linaro.org, Rahul Sharma <rahul.sharma@samsung.com>

Hi All,

On Wed, Jun 19, 2013 at 1:57 PM, Inki Dae <inki.dae@samsung.com> wrote:
>
>
>> -----Original Message-----
>> From: dri-devel-bounces+inki.dae=samsung.com@lists.freedesktop.org
>> [mailto:dri-devel-bounces+inki.dae=samsung.com@lists.freedesktop.org] On
>> Behalf Of Lucas Stach
>> Sent: Wednesday, June 19, 2013 4:59 PM
>> To: Tomasz Figa
>> Cc: kgene.kim@samsung.com; devicetree-discuss@lists.ozlabs.org;
>> sw0312.kim@samsung.com; joshi@samsung.com;
> dri-devel@lists.freedesktop.org;
>> linux-samsung-soc@vger.kernel.org; rob.herring@calxeda.com;
>> s.nawrocki@samsung.com; grant.likely@linaro.org; Rahul Sharma
>> Subject: Re: [PATCH 1/4] drm/exynos: rename compatible strings for hdmi
>> subsystem
>>
>> Am Mittwoch, den 19.06.2013, 09:52 +0200 schrieb Tomasz Figa:
>> > Hi Rahul,
>> >
>> > On Tuesday 18 of June 2013 18:19:35 Rahul Sharma wrote:
>> > > This patch renames the combatible strings for hdmi, mixer, ddc
>> > > and hdmiphy. It follows the convention of using compatible string
>> > > which represent the SoC in which the IP was added for the first
>> > > time.
>> > >
>> > > Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
>> > > ---
>> > >  Documentation/devicetree/bindings/video/exynos_hdmi.txt    |    6
>> > > ++++-- Documentation/devicetree/bindings/video/exynos_hdmiddc.txt |
>> > > 4 ++-- Documentation/devicetree/bindings/video/exynos_hdmiphy.txt |
>> > > 6 ++++-- Documentation/devicetree/bindings/video/exynos_mixer.txt   |
>> > >  7 +++++-- drivers/gpu/drm/exynos/exynos_ddc.c
> |
>> > >    2 +- drivers/gpu/drm/exynos/exynos_hdmi.c                       |
>> > > 2 +- drivers/gpu/drm/exynos/exynos_hdmiphy.c                    |    4
>> > > +++- drivers/gpu/drm/exynos/exynos_mixer.c                      |   12
>> > > ++++++------ 8 files changed, 26 insertions(+), 17 deletions(-)
>> > >
>> > > diff --git a/Documentation/devicetree/bindings/video/exynos_hdmi.txt
>> > > b/Documentation/devicetree/bindings/video/exynos_hdmi.txt index
>> > > 589edee..2ac01ca 100644
>> > > --- a/Documentation/devicetree/bindings/video/exynos_hdmi.txt
>> > > +++ b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
>> > > @@ -1,7 +1,9 @@
>> > >  Device-Tree bindings for drm hdmi driver
>> > >
>> > >  Required properties:
>> > > -- compatible: value should be "samsung,exynos5-hdmi".
>> > > +- compatible: value should be one among the following:
>> > > + 1) "samsung,exynos4210-hdmi"
>> > > + 2) "samsung,exynos4212-hdmi"
>> > >  - reg: physical base address of the hdmi and length of memory mapped
>> > >   region.
>> > >  - interrupts: interrupt number to the cpu.
>> > > @@ -15,7 +17,7 @@ Required properties:
>> > >  Example:
>> > >
>> > >   hdmi {
>> > > -         compatible = "samsung,exynos5-hdmi";
>> > > +         compatible = "samsung,exynos4212-hdmi";
>> >
>> > Sorry, but it's a NAK from me.
>> >
>> > DeviceTree bindings are considered an ABI. This is to allow older dtbs
>> to
>> > work with new kernels.
>> >
>> > If you just change the binding this way, you break all the existing
>> users
>> > of this compatible value.
>> >
>> > In addition you are doing it in a way that breaks bisection:
>> >  - patch 1/4 breaks existing in-tree users of current compatible values,
>> >  - after patch 2 and 3 it is still broken,
>> >  - and eventually all in-tree users are fixed by patch 4 (but you can't
>> > fix out-of-tree users).
>> >

@Tomasz, I understand your point but how is it possible to change
compatible types in driver as well as in dtbs by not breaking either of them
other then putting changes in a single patch. I ensured that hdmi stuff is
intact with whole series merged in either tree (drm or arch). Please suggest
a better way.

The Only existing user is Exynos5250, which is modified in the same patch
set.

>> > Please do it without changing existing compatible values. Even if they
>> are
>> > misleading, this is all can be described in the documentation - just
>> list
>> > SoCs that can be used with each compatible value there.
>> >
>>
>> Or you could just introduce the new compatible value and make all
>> in-tree users use this, but keep the old values around and still accept
>> them in the drivers. This way you get the goodness of the cleaner new
>> symbols without breaking existing users. Just mark the old values as
>> deprecated in the documentation, so no new devicetree usees them.
>>

I agree, above is a decent approach, but in this case we have only one
user for this compatible type including in flight patches which I have
modified along.

If it seems better to keep old compatible type (deprecated), it is fine
with me.

>
> That's a good idea. We really need to mitigate such misleading somehow or
> other.

Please sugggest me how to proceed.

regards,
Rahul Sharma.

>
> Thanks,
> Inki Dae
>
>> Regards,
>> Lucas
>> --
>> Pengutronix e.K.                           | Lucas Stach                 |
>> Industrial Linux Solutions                 | http://www.pengutronix.de/  |
>> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-5076 |
>> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
