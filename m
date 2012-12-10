From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 0/3] add mie driver for exynos
Date: Mon, 10 Dec 2012 18:27:39 +0900
Message-ID: <CAAQKjZOVVU0fjj5VruQ-m8pgPoBATpXuzKsZv2F+Ux-aLtcLHw@mail.gmail.com>
References: <1354795695-28009-1-git-send-email-rcsekar@samsung.com>
	<CAAQKjZM278TfT=dcVJoKRPqWpdChaJv2N6v4O_D-xsxJOLKeRQ@mail.gmail.com>
	<CACP_E+JdiVxD05k0F57bmXWw1WKiS_NNviXOXYUVegwi5MnrsQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2060290128=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <CACP_E+JdiVxD05k0F57bmXWw1WKiS_NNviXOXYUVegwi5MnrsQ@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: =?ISO-8859-1?Q?St=E9phane_Marchesin?= <stephane.marchesin@gmail.com>
Cc: kgene.kim@samsung.com, "R. Chandrasekar" <rcsekar@samsung.com>, devicetree-discuss@lists.ozlabs.org, joshi@samsung.com, dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, rcsekar.samsung@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

--===============2060290128==
Content-Type: multipart/alternative; boundary=14dae93a169938edab04d07c2d56

--14dae93a169938edab04d07c2d56
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2012/12/10 St=E9phane Marchesin <stephane.marchesin@gmail.com>

> On Sun, Dec 9, 2012 at 10:26 PM, Inki Dae <inki.dae@samsung.com> wrote:
> >
> >
> > 2012/12/6 R. Chandrasekar <rcsekar@samsung.com>
> >
> >> From: "R. Chandrasekar" <rcsekar@samsung.com>
> >>
> >> this patch set adds the driver support for the dithering functionality
> of
> >> the
> >> mobile image enhancement (mie) module.
> >>
> >> device tree support is added for mie.
> >>
> >> fimd adds the mie module as plugin and calls the dithering function.
> >> dithere is
> >> required when the panels bpp is less then fimd output.
> >>
> >> though mie mie has other functionalities, current system uses only
> >> dithereing.
> >>
> >
> > Please, move mie module into drivers/video/exynos. The mie is a interfa=
ce
> > between fimd and lcd panel(or mipi-dsi, eDP) to enhance image to be
> > displayed. And it seems like that this doesn't need drm
> framework-relevant
> > interfaces, such as gem.
>
> Well, if you want to support it from the DRM, it should live in
> drivers/gpu/drm, and I don't think you should add another platform
> driver in the first place. The profusion of platform drivers in exynos
> makes it really difficult to support suspend/resume and initialization
> properly as many devices which operate separately need to sync through
> global variables.
>
>
MIE could be used by linux framebuffer-based specific driver(s3c-fb) also.
If linux framebuffer-based driver want to use this mie module, should the
mie module be placed in drivers/video coping it? I think it's not good so
it's better way to use this mie module commonly without duplicated codes.
And mipi-dsi and eDP drivers also have their own platform device/driver and
are being used by exynos drm driver or s3c-fb driver. Of course, for some
IPs such as mie between display controller and lcd panel, It seems like
that there should be proper framework or interfaces in drivers/video/exynos
or somewhere so that other frameworks can use it commonly. And drm and
linux framebuffer drivers should call the interfaces.

Thanks,
Inki Dae

St=E9phane
>
>
> >
> > And also, please refer to the below link, Common Display Framework, for
> more
> > generic way.
> >
> >
> http://lists.freedesktop.org/archives/dri-devel/2012-November/030888.html
> >
> > Thanks,
> > Inki Dae
> >
> >>
> >> R. Chandrasekar (3):
> >>   DTS: exynos: add device tree support for exynos mie
> >>   drm: fimd: add mie plugin support for dithering
> >>   drm: mie: add mie driver for exynos
> >>
> >>  arch/arm/boot/dts/exynos5250.dtsi               |    7 +-
> >>  drivers/gpu/drm/exynos/Kconfig                  |    7 +
> >>  drivers/gpu/drm/exynos/Makefile                 |    1 +
> >>  drivers/gpu/drm/exynos/exynos_drm_fimd.c        |   58 +++++-
> >>  drivers/gpu/drm/exynos/exynos_drm_fimd_common.h |   20 ++
> >>  drivers/gpu/drm/exynos/exynos_drm_mie.c         |  250
> >> +++++++++++++++++++++++
> >>  drivers/gpu/drm/exynos/exynos_drm_mie.h         |   50 +++++
> >>  drivers/gpu/drm/exynos/exynos_regs-mie.h        |   75 +++++++
> >>  8 files changed, 465 insertions(+), 3 deletions(-)
> >>  create mode 100644 drivers/gpu/drm/exynos/exynos_drm_fimd_common.h
> >>  create mode 100644 drivers/gpu/drm/exynos/exynos_drm_mie.c
> >>  create mode 100644 drivers/gpu/drm/exynos/exynos_drm_mie.h
> >>  create mode 100644 drivers/gpu/drm/exynos/exynos_regs-mie.h
> >>
> >> --
> >> 1.7.9.5
> >>
> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >> http://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
> >
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > http://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--14dae93a169938edab04d07c2d56
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">2012/12/10 St=E9phane Marchesin <span di=
r=3D"ltr">&lt;<a href=3D"mailto:stephane.marchesin@gmail.com" target=3D"_bl=
ank">stephane.marchesin@gmail.com</a>&gt;</span><br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
<div class=3D"im">On Sun, Dec 9, 2012 at 10:26 PM, Inki Dae &lt;<a href=3D"=
mailto:inki.dae@samsung.com">inki.dae@samsung.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; 2012/12/6 R. Chandrasekar &lt;<a href=3D"mailto:rcsekar@samsung.com">r=
csekar@samsung.com</a>&gt;<br>
&gt;<br>
&gt;&gt; From: &quot;R. Chandrasekar&quot; &lt;<a href=3D"mailto:rcsekar@sa=
msung.com">rcsekar@samsung.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; this patch set adds the driver support for the dithering functiona=
lity of<br>
&gt;&gt; the<br>
&gt;&gt; mobile image enhancement (mie) module.<br>
&gt;&gt;<br>
&gt;&gt; device tree support is added for mie.<br>
&gt;&gt;<br>
&gt;&gt; fimd adds the mie module as plugin and calls the dithering functio=
n.<br>
&gt;&gt; dithere is<br>
&gt;&gt; required when the panels bpp is less then fimd output.<br>
&gt;&gt;<br>
&gt;&gt; though mie mie has other functionalities, current system uses only=
<br>
&gt;&gt; dithereing.<br>
&gt;&gt;<br>
&gt;<br>
&gt; Please, move mie module into drivers/video/exynos. The mie is a interf=
ace<br>
&gt; between fimd and lcd panel(or mipi-dsi, eDP) to enhance image to be<br=
>
&gt; displayed. And it seems like that this doesn&#39;t need drm framework-=
relevant<br>
&gt; interfaces, such as gem.<br>
<br>
</div>Well, if you want to support it from the DRM, it should live in<br>
drivers/gpu/drm, and I don&#39;t think you should add another platform<br>
driver in the first place. The profusion of platform drivers in exynos<br>
makes it really difficult to support suspend/resume and initialization<br>
properly as many devices which operate separately need to sync through<br>
global variables.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br></font></span></blockquo=
te><div><br>MIE could be used by linux framebuffer-based specific driver(s3=
c-fb) also. If linux framebuffer-based driver want to use this mie module, =
should the mie module be placed in drivers/video coping it? I think it&#39;=
s not good so it&#39;s better way to use this mie module commonly without d=
uplicated codes. And mipi-dsi and eDP drivers also have their own platform =
device/driver and are being used by exynos drm driver or s3c-fb driver. Of =
course, for some IPs such as mie between display controller and lcd panel, =
It seems like that there should be proper framework or interfaces in driver=
s/video/exynos or somewhere so that other frameworks can use it commonly. A=
nd drm and linux framebuffer drivers should call the interfaces.<br>
=A0<br>Thanks,<br>Inki Dae<br><br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><spa=
n class=3D"HOEnZb"><font color=3D"#888888">
St=E9phane<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
&gt;<br>
&gt; And also, please refer to the below link, Common Display Framework, fo=
r more<br>
&gt; generic way.<br>
&gt;<br>
&gt; <a href=3D"http://lists.freedesktop.org/archives/dri-devel/2012-Novemb=
er/030888.html" target=3D"_blank">http://lists.freedesktop.org/archives/dri=
-devel/2012-November/030888.html</a><br>
&gt;<br>
&gt; Thanks,<br>
&gt; Inki Dae<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; R. Chandrasekar (3):<br>
&gt;&gt; =A0 DTS: exynos: add device tree support for exynos mie<br>
&gt;&gt; =A0 drm: fimd: add mie plugin support for dithering<br>
&gt;&gt; =A0 drm: mie: add mie driver for exynos<br>
&gt;&gt;<br>
&gt;&gt; =A0arch/arm/boot/dts/exynos5250.dtsi =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A07 +-<br>
&gt;&gt; =A0drivers/gpu/drm/exynos/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A07 +<br>
&gt;&gt; =A0drivers/gpu/drm/exynos/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A01 +<br>
&gt;&gt; =A0drivers/gpu/drm/exynos/exynos_drm_fimd.c =A0 =A0 =A0 =A0| =A0 5=
8 +++++-<br>
&gt;&gt; =A0drivers/gpu/drm/exynos/exynos_drm_fimd_common.h | =A0 20 ++<br>
&gt;&gt; =A0drivers/gpu/drm/exynos/exynos_drm_mie.c =A0 =A0 =A0 =A0 | =A025=
0<br>
&gt;&gt; +++++++++++++++++++++++<br>
&gt;&gt; =A0drivers/gpu/drm/exynos/exynos_drm_mie.h =A0 =A0 =A0 =A0 | =A0 5=
0 +++++<br>
&gt;&gt; =A0drivers/gpu/drm/exynos/exynos_regs-mie.h =A0 =A0 =A0 =A0| =A0 7=
5 +++++++<br>
&gt;&gt; =A08 files changed, 465 insertions(+), 3 deletions(-)<br>
&gt;&gt; =A0create mode 100644 drivers/gpu/drm/exynos/exynos_drm_fimd_commo=
n.h<br>
&gt;&gt; =A0create mode 100644 drivers/gpu/drm/exynos/exynos_drm_mie.c<br>
&gt;&gt; =A0create mode 100644 drivers/gpu/drm/exynos/exynos_drm_mie.h<br>
&gt;&gt; =A0create mode 100644 drivers/gpu/drm/exynos/exynos_regs-mie.h<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; 1.7.9.5<br>
&gt;&gt;<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; dri-devel mailing list<br>
&gt;&gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@lists=
.freedesktop.org</a><br>
&gt;&gt; <a href=3D"http://lists.freedesktop.org/mailman/listinfo/dri-devel=
" target=3D"_blank">http://lists.freedesktop.org/mailman/listinfo/dri-devel=
</a><br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; dri-devel mailing list<br>
&gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.fre=
edesktop.org</a><br>
&gt; <a href=3D"http://lists.freedesktop.org/mailman/listinfo/dri-devel" ta=
rget=3D"_blank">http://lists.freedesktop.org/mailman/listinfo/dri-devel</a>=
<br>
&gt;<br>
_______________________________________________<br>
dri-devel mailing list<br>
<a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesk=
top.org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/dri-devel" target=
=3D"_blank">http://lists.freedesktop.org/mailman/listinfo/dri-devel</a><br>
</div></div></blockquote></div><br>

--14dae93a169938edab04d07c2d56--

--===============2060290128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2060290128==--
