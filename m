From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 0/3] add mie driver for exynos
Date: Mon, 10 Dec 2012 15:26:03 +0900
Message-ID: <CAAQKjZM278TfT=dcVJoKRPqWpdChaJv2N6v4O_D-xsxJOLKeRQ@mail.gmail.com>
References: <1354795695-28009-1-git-send-email-rcsekar@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1278951949=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1354795695-28009-1-git-send-email-rcsekar@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: "R. Chandrasekar" <rcsekar@samsung.com>
Cc: kgene.kim@samsung.com, devicetree-discuss@lists.ozlabs.org, joshi@samsung.com, dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, rcsekar.samsung@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

--===============1278951949==
Content-Type: multipart/alternative; boundary=e89a8fb1f7eebbf64204d079a3f8

--e89a8fb1f7eebbf64204d079a3f8
Content-Type: text/plain; charset=ISO-8859-1

2012/12/6 R. Chandrasekar <rcsekar@samsung.com>

> From: "R. Chandrasekar" <rcsekar@samsung.com>
>
> this patch set adds the driver support for the dithering functionality of
> the
> mobile image enhancement (mie) module.
>
> device tree support is added for mie.
>
> fimd adds the mie module as plugin and calls the dithering function.
> dithere is
> required when the panels bpp is less then fimd output.
>
> though mie mie has other functionalities, current system uses only
> dithereing.
>
>
Please, move mie module into drivers/video/exynos. The mie is a interface
between fimd and lcd panel(or mipi-dsi, eDP) to enhance image to be
displayed. And it seems like that this doesn't need drm framework-relevant
interfaces, such as gem.

And also, please refer to the below link, Common Display Framework, for
more generic way.

http://lists.freedesktop.org/archives/dri-devel/2012-November/030888.html

Thanks,
Inki Dae


> R. Chandrasekar (3):
>   DTS: exynos: add device tree support for exynos mie
>   drm: fimd: add mie plugin support for dithering
>   drm: mie: add mie driver for exynos
>
>  arch/arm/boot/dts/exynos5250.dtsi               |    7 +-
>  drivers/gpu/drm/exynos/Kconfig                  |    7 +
>  drivers/gpu/drm/exynos/Makefile                 |    1 +
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c        |   58 +++++-
>  drivers/gpu/drm/exynos/exynos_drm_fimd_common.h |   20 ++
>  drivers/gpu/drm/exynos/exynos_drm_mie.c         |  250
> +++++++++++++++++++++++
>  drivers/gpu/drm/exynos/exynos_drm_mie.h         |   50 +++++
>  drivers/gpu/drm/exynos/exynos_regs-mie.h        |   75 +++++++
>  8 files changed, 465 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/gpu/drm/exynos/exynos_drm_fimd_common.h
>  create mode 100644 drivers/gpu/drm/exynos/exynos_drm_mie.c
>  create mode 100644 drivers/gpu/drm/exynos/exynos_drm_mie.h
>  create mode 100644 drivers/gpu/drm/exynos/exynos_regs-mie.h
>
> --
> 1.7.9.5
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--e89a8fb1f7eebbf64204d079a3f8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">2012/12/6 R. Chandrasekar <span dir=3D"l=
tr">&lt;<a href=3D"mailto:rcsekar@samsung.com" target=3D"_blank">rcsekar@sa=
msung.com</a>&gt;</span><br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
From: &quot;R. Chandrasekar&quot; &lt;<a href=3D"mailto:rcsekar@samsung.com=
">rcsekar@samsung.com</a>&gt;<br>
<br>
this patch set adds the driver support for the dithering functionality of t=
he<br>
mobile image enhancement (mie) module.<br>
<br>
device tree support is added for mie.<br>
<br>
fimd adds the mie module as plugin and calls the dithering function. dither=
e is<br>
required when the panels bpp is less then fimd output.<br>
<br>
though mie mie has other functionalities, current system uses only ditherei=
ng.<br>
<br></blockquote><div><br>Please, move mie module into drivers/video/exynos=
. The mie is a interface between fimd and lcd panel(or mipi-dsi, eDP) to en=
hance image to be displayed. And it seems like that this doesn&#39;t need d=
rm framework-relevant interfaces, such as gem.<br>
<br>And also, please refer to the below link, Common Display Framework, for=
 more generic way.<br>=A0=A0=A0=A0=A0=A0=A0 <a href=3D"http://lists.freedes=
ktop.org/archives/dri-devel/2012-November/030888.html">http://lists.freedes=
ktop.org/archives/dri-devel/2012-November/030888.html</a><br>
<br>Thanks,<br>Inki Dae<br>=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
R. Chandrasekar (3):<br>
=A0 DTS: exynos: add device tree support for exynos mie<br>
=A0 drm: fimd: add mie plugin support for dithering<br>
=A0 drm: mie: add mie driver for exynos<br>
<br>
=A0arch/arm/boot/dts/exynos5250.dtsi =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A07=
 +-<br>
=A0drivers/gpu/drm/exynos/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A07 +<br>
=A0drivers/gpu/drm/exynos/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A01 +<br>
=A0drivers/gpu/drm/exynos/exynos_drm_fimd.c =A0 =A0 =A0 =A0| =A0 58 +++++-<=
br>
=A0drivers/gpu/drm/exynos/exynos_drm_fimd_common.h | =A0 20 ++<br>
=A0drivers/gpu/drm/exynos/exynos_drm_mie.c =A0 =A0 =A0 =A0 | =A0250 +++++++=
++++++++++++++++<br>
=A0drivers/gpu/drm/exynos/exynos_drm_mie.h =A0 =A0 =A0 =A0 | =A0 50 +++++<b=
r>
=A0drivers/gpu/drm/exynos/exynos_regs-mie.h =A0 =A0 =A0 =A0| =A0 75 +++++++=
<br>
=A08 files changed, 465 insertions(+), 3 deletions(-)<br>
=A0create mode 100644 drivers/gpu/drm/exynos/exynos_drm_fimd_common.h<br>
=A0create mode 100644 drivers/gpu/drm/exynos/exynos_drm_mie.c<br>
=A0create mode 100644 drivers/gpu/drm/exynos/exynos_drm_mie.h<br>
=A0create mode 100644 drivers/gpu/drm/exynos/exynos_regs-mie.h<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
1.7.9.5<br>
<br>
_______________________________________________<br>
dri-devel mailing list<br>
<a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesk=
top.org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/dri-devel" target=
=3D"_blank">http://lists.freedesktop.org/mailman/listinfo/dri-devel</a><br>
</font></span></blockquote></div><br>

--e89a8fb1f7eebbf64204d079a3f8--

--===============1278951949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1278951949==--
