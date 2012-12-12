From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 0/3] add mie driver for exynos
Date: Wed, 12 Dec 2012 13:01:46 +0900
Message-ID: <CAAQKjZPkfAs9Ff6_odxY95zT0Obw0x8SvkuMjB41O+HG2cVefA@mail.gmail.com>
References: <1354795695-28009-1-git-send-email-rcsekar@samsung.com>
	<CAAQKjZM278TfT=dcVJoKRPqWpdChaJv2N6v4O_D-xsxJOLKeRQ@mail.gmail.com>
	<CACP_E+JdiVxD05k0F57bmXWw1WKiS_NNviXOXYUVegwi5MnrsQ@mail.gmail.com>
	<CAAQKjZOVVU0fjj5VruQ-m8pgPoBATpXuzKsZv2F+Ux-aLtcLHw@mail.gmail.com>
	<CACP_E++D=_akHO5tLw-XQKj8BPbhoy3SE9AUJGd5i-pvA2qsfw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1832950259=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <CACP_E++D=_akHO5tLw-XQKj8BPbhoy3SE9AUJGd5i-pvA2qsfw@mail.gmail.com>
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

--===============1832950259==
Content-Type: multipart/alternative; boundary=e89a8fb1f18876aad004d09fdb3f

--e89a8fb1f18876aad004d09fdb3f
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2012/12/12 St=E9phane Marchesin <stephane.marchesin@gmail.com>

> On Mon, Dec 10, 2012 at 1:27 AM, Inki Dae <inki.dae@samsung.com> wrote:
> >
> >
> > 2012/12/10 St=E9phane Marchesin <stephane.marchesin@gmail.com>
> >>
> >> On Sun, Dec 9, 2012 at 10:26 PM, Inki Dae <inki.dae@samsung.com> wrote=
:
> >> >
> >> >
> >> > 2012/12/6 R. Chandrasekar <rcsekar@samsung.com>
> >> >
> >> >> From: "R. Chandrasekar" <rcsekar@samsung.com>
> >> >>
> >> >> this patch set adds the driver support for the dithering
> functionality
> >> >> of
> >> >> the
> >> >> mobile image enhancement (mie) module.
> >> >>
> >> >> device tree support is added for mie.
> >> >>
> >> >> fimd adds the mie module as plugin and calls the dithering function=
.
> >> >> dithere is
> >> >> required when the panels bpp is less then fimd output.
> >> >>
> >> >> though mie mie has other functionalities, current system uses only
> >> >> dithereing.
> >> >>
> >> >
> >> > Please, move mie module into drivers/video/exynos. The mie is a
> >> > interface
> >> > between fimd and lcd panel(or mipi-dsi, eDP) to enhance image to be
> >> > displayed. And it seems like that this doesn't need drm
> >> > framework-relevant
> >> > interfaces, such as gem.
> >>
> >> Well, if you want to support it from the DRM, it should live in
> >> drivers/gpu/drm, and I don't think you should add another platform
> >> driver in the first place. The profusion of platform drivers in exynos
> >> makes it really difficult to support suspend/resume and initialization
> >> properly as many devices which operate separately need to sync through
> >> global variables.
> >>
> >
> > MIE could be used by linux framebuffer-based specific driver(s3c-fb)
> also.
>
> Yes, but it is a DRM driver we're talking about here. Again it is
> really difficult to work with it across suspend-resume. I don't think
>

You want to use Exynos drm core framework just for suspend/resume to MIE
module? as I mentioned before, I think the framework suitable to MIE is
Common Display Framework. Of course, maybe you should add new features to
Common Display Framework for it like MIPI DBI bus support framework because
current Common Display Framework supports only display bus. Logically, MIE
should be used without dependency of any frameworks such as Linux
Framebuffer or DRM frameworks. And see the below hardware path,

fimd--------mie-----------------------------lcd panel
fimd--------mie--------mipi-dsi----------lcd panel
fimd--------mie--------eDP---------------lcd panel

Thus, the MIE is placed between fimd and lcd panel, mipi dsi or eDP. And
fimd, as display controller, could be controlled by linux framebuffer or
drm framework.


> the DRM was ever meant to be a collection of independent platform
> drivers.
>

> > If linux framebuffer-based driver want to use this mie module, should t=
he
> > mie module be placed in drivers/video coping it? I think it's not good =
so
> > it's better way to use this mie module commonly without duplicated code=
s.
> > And mipi-dsi and eDP drivers also have their own platform device/driver
> and
> > are being used by exynos drm driver or s3c-fb driver. Of course, for so=
me
> > IPs such as mie between display controller and lcd panel, It seems like
> that
> > there should be proper framework or interfaces in drivers/video/exynos =
or
> > somewhere so that other frameworks can use it commonly. And drm and lin=
ux
> > framebuffer drivers should call the interfaces.
>
> For the short term, I think it's fine to duplicate the code.
>
> For the longer term, I think framebuffer support should be provided by
> the drm framebuffer compat layer, and s3c-fb should disappear. This is
> what has been done with all the other DRM drivers.
>
> St=E9phane
>
>
> >
> > Thanks,
> > Inki Dae
> >
> >> St=E9phane
> >>
> >>
> >> >
> >> > And also, please refer to the below link, Common Display Framework,
> for
> >> > more
> >> > generic way.
> >> >
> >> >
> >> >
> http://lists.freedesktop.org/archives/dri-devel/2012-November/030888.html
> >> >
> >> > Thanks,
> >> > Inki Dae
> >> >
> >> >>
> >> >> R. Chandrasekar (3):
> >> >>   DTS: exynos: add device tree support for exynos mie
> >> >>   drm: fimd: add mie plugin support for dithering
> >> >>   drm: mie: add mie driver for exynos
> >> >>
> >> >>  arch/arm/boot/dts/exynos5250.dtsi               |    7 +-
> >> >>  drivers/gpu/drm/exynos/Kconfig                  |    7 +
> >> >>  drivers/gpu/drm/exynos/Makefile                 |    1 +
> >> >>  drivers/gpu/drm/exynos/exynos_drm_fimd.c        |   58 +++++-
> >> >>  drivers/gpu/drm/exynos/exynos_drm_fimd_common.h |   20 ++
> >> >>  drivers/gpu/drm/exynos/exynos_drm_mie.c         |  250
> >> >> +++++++++++++++++++++++
> >> >>  drivers/gpu/drm/exynos/exynos_drm_mie.h         |   50 +++++
> >> >>  drivers/gpu/drm/exynos/exynos_regs-mie.h        |   75 +++++++
> >> >>  8 files changed, 465 insertions(+), 3 deletions(-)
> >> >>  create mode 100644 drivers/gpu/drm/exynos/exynos_drm_fimd_common.h
> >> >>  create mode 100644 drivers/gpu/drm/exynos/exynos_drm_mie.c
> >> >>  create mode 100644 drivers/gpu/drm/exynos/exynos_drm_mie.h
> >> >>  create mode 100644 drivers/gpu/drm/exynos/exynos_regs-mie.h
> >> >>
> >> >> --
> >> >> 1.7.9.5
> >> >>
> >> >> _______________________________________________
> >> >> dri-devel mailing list
> >> >> dri-devel@lists.freedesktop.org
> >> >> http://lists.freedesktop.org/mailman/listinfo/dri-devel
> >> >
> >> >
> >> >
> >> > _______________________________________________
> >> > dri-devel mailing list
> >> > dri-devel@lists.freedesktop.org
> >> > http://lists.freedesktop.org/mailman/listinfo/dri-devel
> >> >
> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >> http://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
> >
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--e89a8fb1f18876aad004d09fdb3f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">2012/12/12 St=E9phane Marchesin <span di=
r=3D"ltr">&lt;<a href=3D"mailto:stephane.marchesin@gmail.com" target=3D"_bl=
ank">stephane.marchesin@gmail.com</a>&gt;</span><br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
<div class=3D"HOEnZb"><div class=3D"h5">On Mon, Dec 10, 2012 at 1:27 AM, In=
ki Dae &lt;<a href=3D"mailto:inki.dae@samsung.com">inki.dae@samsung.com</a>=
&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; 2012/12/10 St=E9phane Marchesin &lt;<a href=3D"mailto:stephane.marches=
in@gmail.com">stephane.marchesin@gmail.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Sun, Dec 9, 2012 at 10:26 PM, Inki Dae &lt;<a href=3D"mailto:in=
ki.dae@samsung.com">inki.dae@samsung.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; 2012/12/6 R. Chandrasekar &lt;<a href=3D"mailto:rcsekar@samsu=
ng.com">rcsekar@samsung.com</a>&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; From: &quot;R. Chandrasekar&quot; &lt;<a href=3D"mailto:r=
csekar@samsung.com">rcsekar@samsung.com</a>&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; this patch set adds the driver support for the dithering =
functionality<br>
&gt;&gt; &gt;&gt; of<br>
&gt;&gt; &gt;&gt; the<br>
&gt;&gt; &gt;&gt; mobile image enhancement (mie) module.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; device tree support is added for mie.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; fimd adds the mie module as plugin and calls the ditherin=
g function.<br>
&gt;&gt; &gt;&gt; dithere is<br>
&gt;&gt; &gt;&gt; required when the panels bpp is less then fimd output.<br=
>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; though mie mie has other functionalities, current system =
uses only<br>
&gt;&gt; &gt;&gt; dithereing.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Please, move mie module into drivers/video/exynos. The mie is=
 a<br>
&gt;&gt; &gt; interface<br>
&gt;&gt; &gt; between fimd and lcd panel(or mipi-dsi, eDP) to enhance image=
 to be<br>
&gt;&gt; &gt; displayed. And it seems like that this doesn&#39;t need drm<b=
r>
&gt;&gt; &gt; framework-relevant<br>
&gt;&gt; &gt; interfaces, such as gem.<br>
&gt;&gt;<br>
&gt;&gt; Well, if you want to support it from the DRM, it should live in<br=
>
&gt;&gt; drivers/gpu/drm, and I don&#39;t think you should add another plat=
form<br>
&gt;&gt; driver in the first place. The profusion of platform drivers in ex=
ynos<br>
&gt;&gt; makes it really difficult to support suspend/resume and initializa=
tion<br>
&gt;&gt; properly as many devices which operate separately need to sync thr=
ough<br>
&gt;&gt; global variables.<br>
&gt;&gt;<br>
&gt;<br>
&gt; MIE could be used by linux framebuffer-based specific driver(s3c-fb) a=
lso.<br>
<br>
</div></div>Yes, but it is a DRM driver we&#39;re talking about here. Again=
 it is<br>
really difficult to work with it across suspend-resume. I don&#39;t think<b=
r></blockquote><div><br>You want to use Exynos drm core framework just for =
suspend/resume to MIE module? as I mentioned before, I think the framework =
suitable to MIE is Common Display Framework. Of course, maybe you should ad=
d new features to Common Display Framework for it like MIPI DBI bus support=
 framework because current Common Display Framework supports only display b=
us. Logically, MIE should be used without dependency of any frameworks such=
 as Linux Framebuffer or DRM frameworks. And see the below hardware path,<b=
r>
<br>fimd--------mie-----------------------------lcd panel<br>fimd--------mi=
e--------mipi-dsi----------lcd panel<br>fimd--------mie--------eDP---------=
------lcd panel<br><br>Thus, the MIE is placed between fimd and lcd panel, =
mipi dsi or eDP. And fimd, as display controller, could be controlled by li=
nux framebuffer or drm framework.<br>
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
the DRM was ever meant to be a collection of independent platform<br>
drivers.<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im"><br>
&gt; If linux framebuffer-based driver want to use this mie module, should =
the<br>
&gt; mie module be placed in drivers/video coping it? I think it&#39;s not =
good so<br>
&gt; it&#39;s better way to use this mie module commonly without duplicated=
 codes.<br>
&gt; And mipi-dsi and eDP drivers also have their own platform device/drive=
r and<br>
&gt; are being used by exynos drm driver or s3c-fb driver. Of course, for s=
ome<br>
&gt; IPs such as mie between display controller and lcd panel, It seems lik=
e that<br>
&gt; there should be proper framework or interfaces in drivers/video/exynos=
 or<br>
&gt; somewhere so that other frameworks can use it commonly. And drm and li=
nux<br>
&gt; framebuffer drivers should call the interfaces.<br>
<br>
</div>For the short term, I think it&#39;s fine to duplicate the code.<br>
<br>
For the longer term, I think framebuffer support should be provided by<br>
the drm framebuffer compat layer, and s3c-fb should disappear. This is<br>
what has been done with all the other DRM drivers.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
St=E9phane<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Inki Dae<br>
&gt;<br>
&gt;&gt; St=E9phane<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; And also, please refer to the below link, Common Display Fram=
ework, for<br>
&gt;&gt; &gt; more<br>
&gt;&gt; &gt; generic way.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; <a href=3D"http://lists.freedesktop.org/archives/dri-devel/20=
12-November/030888.html" target=3D"_blank">http://lists.freedesktop.org/arc=
hives/dri-devel/2012-November/030888.html</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Thanks,<br>
&gt;&gt; &gt; Inki Dae<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; R. Chandrasekar (3):<br>
&gt;&gt; &gt;&gt; =A0 DTS: exynos: add device tree support for exynos mie<b=
r>
&gt;&gt; &gt;&gt; =A0 drm: fimd: add mie plugin support for dithering<br>
&gt;&gt; &gt;&gt; =A0 drm: mie: add mie driver for exynos<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; =A0arch/arm/boot/dts/exynos5250.dtsi =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 | =A0 =A07 +-<br>
&gt;&gt; &gt;&gt; =A0drivers/gpu/drm/exynos/Kconfig =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0| =A0 =A07 +<br>
&gt;&gt; &gt;&gt; =A0drivers/gpu/drm/exynos/Makefile =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 | =A0 =A01 +<br>
&gt;&gt; &gt;&gt; =A0drivers/gpu/drm/exynos/exynos_drm_fimd.c =A0 =A0 =A0 =
=A0| =A0 58 +++++-<br>
&gt;&gt; &gt;&gt; =A0drivers/gpu/drm/exynos/exynos_drm_fimd_common.h | =A0 =
20 ++<br>
&gt;&gt; &gt;&gt; =A0drivers/gpu/drm/exynos/exynos_drm_mie.c =A0 =A0 =A0 =
=A0 | =A0250<br>
&gt;&gt; &gt;&gt; +++++++++++++++++++++++<br>
&gt;&gt; &gt;&gt; =A0drivers/gpu/drm/exynos/exynos_drm_mie.h =A0 =A0 =A0 =
=A0 | =A0 50 +++++<br>
&gt;&gt; &gt;&gt; =A0drivers/gpu/drm/exynos/exynos_regs-mie.h =A0 =A0 =A0 =
=A0| =A0 75 +++++++<br>
&gt;&gt; &gt;&gt; =A08 files changed, 465 insertions(+), 3 deletions(-)<br>
&gt;&gt; &gt;&gt; =A0create mode 100644 drivers/gpu/drm/exynos/exynos_drm_f=
imd_common.h<br>
&gt;&gt; &gt;&gt; =A0create mode 100644 drivers/gpu/drm/exynos/exynos_drm_m=
ie.c<br>
&gt;&gt; &gt;&gt; =A0create mode 100644 drivers/gpu/drm/exynos/exynos_drm_m=
ie.h<br>
&gt;&gt; &gt;&gt; =A0create mode 100644 drivers/gpu/drm/exynos/exynos_regs-=
mie.h<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; --<br>
&gt;&gt; &gt;&gt; 1.7.9.5<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; _______________________________________________<br>
&gt;&gt; &gt;&gt; dri-devel mailing list<br>
&gt;&gt; &gt;&gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-de=
vel@lists.freedesktop.org</a><br>
&gt;&gt; &gt;&gt; <a href=3D"http://lists.freedesktop.org/mailman/listinfo/=
dri-devel" target=3D"_blank">http://lists.freedesktop.org/mailman/listinfo/=
dri-devel</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; _______________________________________________<br>
&gt;&gt; &gt; dri-devel mailing list<br>
&gt;&gt; &gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@=
lists.freedesktop.org</a><br>
&gt;&gt; &gt; <a href=3D"http://lists.freedesktop.org/mailman/listinfo/dri-=
devel" target=3D"_blank">http://lists.freedesktop.org/mailman/listinfo/dri-=
devel</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; dri-devel mailing list<br>
&gt;&gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@lists=
.freedesktop.org</a><br>
&gt;&gt; <a href=3D"http://lists.freedesktop.org/mailman/listinfo/dri-devel=
" target=3D"_blank">http://lists.freedesktop.org/mailman/listinfo/dri-devel=
</a><br>
&gt;<br>
&gt;<br>
_______________________________________________<br>
dri-devel mailing list<br>
<a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesk=
top.org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/dri-devel" target=
=3D"_blank">http://lists.freedesktop.org/mailman/listinfo/dri-devel</a><br>
</div></div></blockquote></div><br>

--e89a8fb1f18876aad004d09fdb3f--

--===============1832950259==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1832950259==--
