From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: Re: [PATCH v5 0/5] drm/exynos: introduce generic zpos and blending
 properties
Date: Tue, 23 Feb 2016 10:10:47 +0100
Message-ID: <CA+M3ks4Dzf27hMvGS+rHPYPwvww7=X=VGCurXK3N1CoVZD=fug@mail.gmail.com>
References: <1453905883-6807-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2023165165=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1453905883-6807-1-git-send-email-m.szyprowski@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Fabien Dessenne <fabien.dessenne@st.com>, Vincent Abriou <vincent.abriou@st.com>
List-Id: linux-samsung-soc@vger.kernel.org

--===============2023165165==
Content-Type: multipart/alternative; boundary=001a11c378e43179d2052c6c53ba

--001a11c378e43179d2052c6c53ba
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Any news on those patches ?
Could we rely on them to upstream z-order fix on sti driver ?

Regards,
Benjamin

2016-01-27 15:44 GMT+01:00 Marek Szyprowski <m.szyprowski@samsung.com>:

> Hello all,
>
> This patch series is a continuation of rework of blending support in
> Exynos DRM driver. Some background can be found here:
> http://www.spinics.net/lists/dri-devel/msg96969.html
>
> Daniel Vetter suggested that zpos property should be made generic, with
> well-defined semantics. This patchset is my proposal for such generic
> zpos property:
> - added zpos properties to drm core and plane state structures,
> - added helpers for normalizing zpos properties of given set of planes,
> - well defined semantics: planes are sorted by zpos values and then plane
>   id value if zpos equals.
>
> The next part is a result of my survey on introducing generic plane
> blending related properties:
> http://www.spinics.net/lists/dri-devel/msg98106.html
>
> Ville Syrj=C3=A4l=C3=A4 suggested that blending mode should be defined by=
 a pair
> of 2 factors, which define generic blending equation. I've implemented
> this approach. I hope that this code can be a base for further discussion
> on generic blending support. For more information, see patch 4/5.
>
> Patches are based on top of v4.5-rc1 release.
>
> Best regards
> Marek Szyprowski
> Samsung R&D Institute Poland
>
> Changelog:
>
> v5:
> - added patch with new generic blending and alpha properties
> - changed patchseries topic to "drm/exynos: introduce generic zpos and
>   blending properties"
> - moved all generic code to separate drm_blend.c file
>
> v4: http://www.spinics.net/lists/dri-devel/msg98654.html
> - made min/max values of zpos property driver dependent (request of
>   Ville Syrj=C3=A4l=C3=A4)
> - adjusted some comments
>
> v3: http://www.spinics.net/lists/dri-devel/msg98207.html
> - on request of Daniel Vetter, moved all normalization process to DRM
>   core, drivers can simply use plane_state->normalized_zpos in their
>   atomic_check/update callbacks with no additional changes needed
> - updated documentation
>
> v2: http://www.spinics.net/lists/dri-devel/msg98093.html
> - dropped 2 fixes for Exynos DRM, which got merged in meantime
> - added more comments and kernel docs for core functions as suggested
>   by Daniel Vetter
> - reworked initialization of zpos properties (moved assiging property
>   class to common code), now the code in the driver is even simpler
> - while reworking of intialization of zpos property code, did the same
>   change to generic rotation property
>
> v1: http://www.spinics.net/lists/dri-devel/msg97709.html
> - initial version
>
> Patch summary:
>
> Marek Szyprowski (5):
>   drm: add generic zpos property
>   drm/exynos: use generic code for managing zpos plane property
>   drm: simplify initialization of rotation property
>   drm: add generic blending related properties
>   drm/exynos: add support for blending properties
>
>  Documentation/DocBook/gpu.tmpl                  |  57 +++-
>  drivers/gpu/drm/Makefile                        |   2 +-
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c |  10 +-
>  drivers/gpu/drm/drm_atomic.c                    |  16 ++
>  drivers/gpu/drm/drm_atomic_helper.c             |   6 +
>  drivers/gpu/drm/drm_blend.c                     | 337
> ++++++++++++++++++++++++
>  drivers/gpu/drm/drm_crtc.c                      |  29 +-
>  drivers/gpu/drm/drm_crtc_internal.h             |   3 +
>  drivers/gpu/drm/exynos/exynos_drm_drv.h         |   7 +-
>  drivers/gpu/drm/exynos/exynos_drm_plane.c       | 128 +++++----
>  drivers/gpu/drm/exynos/exynos_mixer.c           |   6 +-
>  drivers/gpu/drm/i915/intel_display.c            |   6 +-
>  drivers/gpu/drm/msm/mdp/mdp5/mdp5_plane.c       |   3 +-
>  drivers/gpu/drm/omapdrm/omap_drv.c              |   3 +-
>  include/drm/drm_crtc.h                          |  36 ++-
>  include/uapi/drm/drm_mode.h                     | 101 +++++++
>  16 files changed, 669 insertions(+), 81 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_blend.c
>
> --
> 1.9.2
>
>


--=20

Benjamin Gaignard

Graphic Working Group

Linaro.org <http://www.linaro.org/> *=E2=94=82 *Open source software for AR=
M SoCs

Follow *Linaro: *Facebook <http://www.facebook.com/pages/Linaro> | Twitter
<http://twitter.com/#!/linaroorg> | Blog
<http://www.linaro.org/linaro-blog/>

--001a11c378e43179d2052c6c53ba
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Any news on those patches ?</div><d=
iv>Could we rely on them to upstream z-order fix on sti driver ?</div><div>=
<br></div><div>Regards,</div><div>Benjamin</div></div><div class=3D"gmail_e=
xtra"><br><div class=3D"gmail_quote">2016-01-27 15:44 GMT+01:00 Marek Szypr=
owski <span dir=3D"ltr">&lt;<a href=3D"mailto:m.szyprowski@samsung.com" tar=
get=3D"_blank">m.szyprowski@samsung.com</a>&gt;</span>:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">Hello all,<br>
<br>
This patch series is a continuation of rework of blending support in<br>
Exynos DRM driver. Some background can be found here:<br>
<a href=3D"http://www.spinics.net/lists/dri-devel/msg96969.html" rel=3D"nor=
eferrer" target=3D"_blank">http://www.spinics.net/lists/dri-devel/msg96969.=
html</a><br>
<br>
Daniel Vetter suggested that zpos property should be made generic, with<br>
well-defined semantics. This patchset is my proposal for such generic<br>
zpos property:<br>
- added zpos properties to drm core and plane state structures,<br>
- added helpers for normalizing zpos properties of given set of planes,<br>
- well defined semantics: planes are sorted by zpos values and then plane<b=
r>
=C2=A0 id value if zpos equals.<br>
<br>
The next part is a result of my survey on introducing generic plane<br>
blending related properties:<br>
<a href=3D"http://www.spinics.net/lists/dri-devel/msg98106.html" rel=3D"nor=
eferrer" target=3D"_blank">http://www.spinics.net/lists/dri-devel/msg98106.=
html</a><br>
<br>
Ville Syrj=C3=A4l=C3=A4 suggested that blending mode should be defined by a=
 pair<br>
of 2 factors, which define generic blending equation. I&#39;ve implemented<=
br>
this approach. I hope that this code can be a base for further discussion<b=
r>
on generic blending support. For more information, see patch 4/5.<br>
<br>
Patches are based on top of v4.5-rc1 release.<br>
<br>
Best regards<br>
Marek Szyprowski<br>
Samsung R&amp;D Institute Poland<br>
<br>
Changelog:<br>
<br>
v5:<br>
- added patch with new generic blending and alpha properties<br>
- changed patchseries topic to &quot;drm/exynos: introduce generic zpos and=
<br>
=C2=A0 blending properties&quot;<br>
- moved all generic code to separate drm_blend.c file<br>
<br>
v4: <a href=3D"http://www.spinics.net/lists/dri-devel/msg98654.html" rel=3D=
"noreferrer" target=3D"_blank">http://www.spinics.net/lists/dri-devel/msg98=
654.html</a><br>
- made min/max values of zpos property driver dependent (request of<br>
=C2=A0 Ville Syrj=C3=A4l=C3=A4)<br>
- adjusted some comments<br>
<br>
v3: <a href=3D"http://www.spinics.net/lists/dri-devel/msg98207.html" rel=3D=
"noreferrer" target=3D"_blank">http://www.spinics.net/lists/dri-devel/msg98=
207.html</a><br>
- on request of Daniel Vetter, moved all normalization process to DRM<br>
=C2=A0 core, drivers can simply use plane_state-&gt;normalized_zpos in thei=
r<br>
=C2=A0 atomic_check/update callbacks with no additional changes needed<br>
- updated documentation<br>
<br>
v2: <a href=3D"http://www.spinics.net/lists/dri-devel/msg98093.html" rel=3D=
"noreferrer" target=3D"_blank">http://www.spinics.net/lists/dri-devel/msg98=
093.html</a><br>
- dropped 2 fixes for Exynos DRM, which got merged in meantime<br>
- added more comments and kernel docs for core functions as suggested<br>
=C2=A0 by Daniel Vetter<br>
- reworked initialization of zpos properties (moved assiging property<br>
=C2=A0 class to common code), now the code in the driver is even simpler<br=
>
- while reworking of intialization of zpos property code, did the same<br>
=C2=A0 change to generic rotation property<br>
<br>
v1: <a href=3D"http://www.spinics.net/lists/dri-devel/msg97709.html" rel=3D=
"noreferrer" target=3D"_blank">http://www.spinics.net/lists/dri-devel/msg97=
709.html</a><br>
- initial version<br>
<br>
Patch summary:<br>
<br>
Marek Szyprowski (5):<br>
=C2=A0 drm: add generic zpos property<br>
=C2=A0 drm/exynos: use generic code for managing zpos plane property<br>
=C2=A0 drm: simplify initialization of rotation property<br>
=C2=A0 drm: add generic blending related properties<br>
=C2=A0 drm/exynos: add support for blending properties<br>
<br>
=C2=A0Documentation/DocBook/gpu.tmpl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 57 +++-<br>
=C2=A0drivers/gpu/drm/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c |=C2=A0 10 +-<br>
=C2=A0drivers/gpu/drm/drm_atomic.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 16 ++<br>
=C2=A0drivers/gpu/drm/drm_atomic_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +<br>
=C2=A0drivers/gpu/drm/drm_blend.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 337 ++++++++++++++++++++++++<br>
=C2=A0drivers/gpu/drm/drm_crtc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 29 +-<br>
=C2=A0drivers/gpu/drm/drm_crtc_internal.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0drivers/gpu/drm/exynos/exynos_drm_drv.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A07 +-<br>
=C2=A0drivers/gpu/drm/exynos/exynos_drm_plane.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
 128 +++++----<br>
=C2=A0drivers/gpu/drm/exynos/exynos_mixer.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
=C2=A0drivers/gpu/drm/i915/intel_display.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
=C2=A0drivers/gpu/drm/msm/mdp/mdp5/mdp5_plane.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A03 +-<br>
=C2=A0drivers/gpu/drm/omapdrm/omap_drv.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
=C2=A0include/drm/drm_crtc.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 36 ++-<br>
=C2=A0include/uapi/drm/drm_mode.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 101 +++++++<br>
=C2=A016 files changed, 669 insertions(+), 81 deletions(-)<br>
=C2=A0create mode 100644 drivers/gpu/drm/drm_blend.c<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
1.9.2<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature"><span style=3D"border-collapse:collapse;fo=
nt-family:arial,sans-serif;font-size:13px"><p style=3D"margin-top:0px;margi=
n-right:0px;margin-bottom:0px;margin-left:0px">Benjamin Gaignard=C2=A0</p><=
p style=3D"margin-top:0px;margin-right:0px;margin-bottom:0px;margin-left:0p=
x">Graphic Working Group</p><p style=3D"margin-top:0px;margin-right:0px;mar=
gin-bottom:0px;margin-left:0px"><span lang=3D"EN-US" style=3D"font-size:10p=
t;color:rgb(0,176,80)"><span style=3D"color:rgb(0,68,252)"><a href=3D"http:=
//www.linaro.org/" style=3D"color:rgb(0,0,204)" target=3D"_blank">Linaro.or=
g</a></span><b>=C2=A0</b></span><b><span lang=3D"EN-US" style=3D"font-size:=
10pt">=E2=94=82=C2=A0</span></b><span lang=3D"EN-US" style=3D"font-size:10p=
t">Open source software for ARM SoCs</span></p><p style=3D"margin-top:0px;m=
argin-right:0px;margin-bottom:0px;margin-left:0px"><u></u></p><p style=3D"m=
argin-top:0px;margin-right:0px;margin-bottom:0px;margin-left:0px"><span lan=
g=3D"EN-US" style=3D"font-size:10pt">Follow=C2=A0<b>Linaro:=C2=A0</b></span=
><span style=3D"font-size:10pt;color:rgb(0,68,252)"><a href=3D"http://www.f=
acebook.com/pages/Linaro" style=3D"color:rgb(0,0,204)" target=3D"_blank"><s=
pan style=3D"color:blue">Facebook</span></a></span><span style=3D"font-size=
:10pt">=C2=A0|=C2=A0<span style=3D"color:rgb(0,68,252)"><a href=3D"http://t=
witter.com/#!/linaroorg" style=3D"color:rgb(0,0,204)" target=3D"_blank"><sp=
an style=3D"color:blue">Twitter</span></a></span>=C2=A0|=C2=A0<span style=
=3D"color:rgb(0,68,252)"><a href=3D"http://www.linaro.org/linaro-blog/" sty=
le=3D"color:rgb(0,0,204)" target=3D"_blank"><span style=3D"color:blue">Blog=
</span></a></span></span></p></span></div>
</div>

--001a11c378e43179d2052c6c53ba--

--===============2023165165==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============2023165165==--
