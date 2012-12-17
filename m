From: =?ISO-8859-1?Q?St=E9phane_Marchesin?=
	<stephane.marchesin@gmail.com>
Subject: Re: [PATCH 0/3] add mie driver for exynos
Date: Mon, 17 Dec 2012 10:59:50 -0800
Message-ID: <CACP_E++aObqEoO7wYDd=5xUkZ9Fo=hz5V5nQpNk_dVeOHmeizQ@mail.gmail.com>
References: <1354795695-28009-1-git-send-email-rcsekar@samsung.com>
 <CAAQKjZM278TfT=dcVJoKRPqWpdChaJv2N6v4O_D-xsxJOLKeRQ@mail.gmail.com>
 <CACP_E+JdiVxD05k0F57bmXWw1WKiS_NNviXOXYUVegwi5MnrsQ@mail.gmail.com>
 <CAAQKjZOVVU0fjj5VruQ-m8pgPoBATpXuzKsZv2F+Ux-aLtcLHw@mail.gmail.com>
 <CACP_E++D=_akHO5tLw-XQKj8BPbhoy3SE9AUJGd5i-pvA2qsfw@mail.gmail.com> <CAAQKjZPkfAs9Ff6_odxY95zT0Obw0x8SvkuMjB41O+HG2cVefA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f53.google.com ([209.85.216.53]:48434 "EHLO
	mail-qa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753725Ab2LQTAa convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Dec 2012 14:00:30 -0500
Received: by mail-qa0-f53.google.com with SMTP id a19so2676449qad.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Dec 2012 11:00:30 -0800 (PST)
In-Reply-To: <CAAQKjZPkfAs9Ff6_odxY95zT0Obw0x8SvkuMjB41O+HG2cVefA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: kgene.kim@samsung.com, "R. Chandrasekar" <rcsekar@samsung.com>, devicetree-discuss@lists.ozlabs.org, joshi@samsung.com, dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, rcsekar.samsung@gmail.com

On Tue, Dec 11, 2012 at 8:01 PM, Inki Dae <inki.dae@samsung.com> wrote:
>
>
> 2012/12/12 St=E9phane Marchesin <stephane.marchesin@gmail.com>
>>
>> On Mon, Dec 10, 2012 at 1:27 AM, Inki Dae <inki.dae@samsung.com> wro=
te:
>> >
>> >
>> > 2012/12/10 St=E9phane Marchesin <stephane.marchesin@gmail.com>
>> >>
>> >> On Sun, Dec 9, 2012 at 10:26 PM, Inki Dae <inki.dae@samsung.com> =
wrote:
>> >> >
>> >> >
>> >> > 2012/12/6 R. Chandrasekar <rcsekar@samsung.com>
>> >> >
>> >> >> From: "R. Chandrasekar" <rcsekar@samsung.com>
>> >> >>
>> >> >> this patch set adds the driver support for the dithering
>> >> >> functionality
>> >> >> of
>> >> >> the
>> >> >> mobile image enhancement (mie) module.
>> >> >>
>> >> >> device tree support is added for mie.
>> >> >>
>> >> >> fimd adds the mie module as plugin and calls the dithering fun=
ction.
>> >> >> dithere is
>> >> >> required when the panels bpp is less then fimd output.
>> >> >>
>> >> >> though mie mie has other functionalities, current system uses =
only
>> >> >> dithereing.
>> >> >>
>> >> >
>> >> > Please, move mie module into drivers/video/exynos. The mie is a
>> >> > interface
>> >> > between fimd and lcd panel(or mipi-dsi, eDP) to enhance image t=
o be
>> >> > displayed. And it seems like that this doesn't need drm
>> >> > framework-relevant
>> >> > interfaces, such as gem.
>> >>
>> >> Well, if you want to support it from the DRM, it should live in
>> >> drivers/gpu/drm, and I don't think you should add another platfor=
m
>> >> driver in the first place. The profusion of platform drivers in e=
xynos
>> >> makes it really difficult to support suspend/resume and initializ=
ation
>> >> properly as many devices which operate separately need to sync th=
rough
>> >> global variables.
>> >>
>> >
>> > MIE could be used by linux framebuffer-based specific driver(s3c-f=
b)
>> > also.
>>
>> Yes, but it is a DRM driver we're talking about here. Again it is
>> really difficult to work with it across suspend-resume. I don't thin=
k
>
>
> You want to use Exynos drm core framework just for suspend/resume to =
MIE
> module? as I mentioned before, I think the framework suitable to MIE =
is
> Common Display Framework. Of course, maybe you should add new feature=
s to
> Common Display Framework for it like MIPI DBI bus support framework b=
ecause
> current Common Display Framework supports only display bus. Logically=
, MIE
> should be used without dependency of any frameworks such as Linux
> Framebuffer or DRM frameworks. And see the below hardware path,
>
> fimd--------mie-----------------------------lcd panel
> fimd--------mie--------mipi-dsi----------lcd panel
> fimd--------mie--------eDP---------------lcd panel
>
> Thus, the MIE is placed between fimd and lcd panel, mipi dsi or eDP.

But for example the MIE only affects one of the layers. So your
drawing doesn't match reality. You'd need to pass a layer number
somehow which the API doesn't seem to allow...

> And
> fimd, as display controller, could be controlled by linux framebuffer=
 or drm
> framework.
>

I don't think it's a valid point. If the framebuffer is properly done
on top of the DRM, you don't need all of that at all.

St=E9phane


>>
>> the DRM was ever meant to be a collection of independent platform
>> drivers.
>>
>>
>> > If linux framebuffer-based driver want to use this mie module, sho=
uld
>> > the
>> > mie module be placed in drivers/video coping it? I think it's not =
good
>> > so
>> > it's better way to use this mie module commonly without duplicated
>> > codes.
>> > And mipi-dsi and eDP drivers also have their own platform device/d=
river
>> > and
>> > are being used by exynos drm driver or s3c-fb driver. Of course, f=
or
>> > some
>> > IPs such as mie between display controller and lcd panel, It seems=
 like
>> > that
>> > there should be proper framework or interfaces in drivers/video/ex=
ynos
>> > or
>> > somewhere so that other frameworks can use it commonly. And drm an=
d
>> > linux
>> > framebuffer drivers should call the interfaces.
>>
>> For the short term, I think it's fine to duplicate the code.
>>
>> For the longer term, I think framebuffer support should be provided =
by
>> the drm framebuffer compat layer, and s3c-fb should disappear. This =
is
>> what has been done with all the other DRM drivers.
>>
>> St=E9phane
>>
>>
>> >
>> > Thanks,
>> > Inki Dae
>> >
>> >> St=E9phane
>> >>
>> >>
>> >> >
>> >> > And also, please refer to the below link, Common Display Framew=
ork,
>> >> > for
>> >> > more
>> >> > generic way.
>> >> >
>> >> >
>> >> >
>> >> > http://lists.freedesktop.org/archives/dri-devel/2012-November/0=
30888.html
>> >> >
>> >> > Thanks,
>> >> > Inki Dae
>> >> >
>> >> >>
>> >> >> R. Chandrasekar (3):
>> >> >>   DTS: exynos: add device tree support for exynos mie
>> >> >>   drm: fimd: add mie plugin support for dithering
>> >> >>   drm: mie: add mie driver for exynos
>> >> >>
>> >> >>  arch/arm/boot/dts/exynos5250.dtsi               |    7 +-
>> >> >>  drivers/gpu/drm/exynos/Kconfig                  |    7 +
>> >> >>  drivers/gpu/drm/exynos/Makefile                 |    1 +
>> >> >>  drivers/gpu/drm/exynos/exynos_drm_fimd.c        |   58 +++++-
>> >> >>  drivers/gpu/drm/exynos/exynos_drm_fimd_common.h |   20 ++
>> >> >>  drivers/gpu/drm/exynos/exynos_drm_mie.c         |  250
>> >> >> +++++++++++++++++++++++
>> >> >>  drivers/gpu/drm/exynos/exynos_drm_mie.h         |   50 +++++
>> >> >>  drivers/gpu/drm/exynos/exynos_regs-mie.h        |   75 ++++++=
+
>> >> >>  8 files changed, 465 insertions(+), 3 deletions(-)
>> >> >>  create mode 100644 drivers/gpu/drm/exynos/exynos_drm_fimd_com=
mon.h
>> >> >>  create mode 100644 drivers/gpu/drm/exynos/exynos_drm_mie.c
>> >> >>  create mode 100644 drivers/gpu/drm/exynos/exynos_drm_mie.h
>> >> >>  create mode 100644 drivers/gpu/drm/exynos/exynos_regs-mie.h
>> >> >>
>> >> >> --
>> >> >> 1.7.9.5
>> >> >>
>> >> >> _______________________________________________
>> >> >> dri-devel mailing list
>> >> >> dri-devel@lists.freedesktop.org
>> >> >> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>> >> >
>> >> >
>> >> >
>> >> > _______________________________________________
>> >> > dri-devel mailing list
>> >> > dri-devel@lists.freedesktop.org
>> >> > http://lists.freedesktop.org/mailman/listinfo/dri-devel
>> >> >
>> >> _______________________________________________
>> >> dri-devel mailing list
>> >> dri-devel@lists.freedesktop.org
>> >> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>> >
>> >
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>
>
