From: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 0/3] drm/exynos: Add device tree support for IPP driver
Date: Sun, 21 Apr 2013 01:11:35 +0900
Message-ID: <CAAQKjZOWQpNbEf+VA2oYCp1s3BG3zC7FVU9xj7zdKNQmJpGN8w@mail.gmail.com>
References: <1366192384-18829-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0364582451040107919=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1366192384-18829-1-git-send-email-s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, DRI mailing list <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--===============0364582451040107919==
Content-Type: multipart/alternative; boundary=047d7b34382cf9d45c04dacd169d

--047d7b34382cf9d45c04dacd169d
Content-Type: text/plain; charset=ISO-8859-1

Hi Sylwester,

DRM FIMC driver could be more cleaned up with this patch series. And your
third patch
And just minor issue. The second patch has build warnings like below,

WARNING: static const char * array should probably be static const char *
const
#111: FILE: drivers/gpu/drm/exynos/exynos_drm_fimc.c:89:
+static const char * fimc_clock_names[] = {

ERROR: "foo * bar" should be "foo *bar"
#111: FILE: drivers/gpu/drm/exynos/exynos_drm_fimc.c:89:


This is a minor issue so I can fix them. And as you already know, now drm
fimc driver should be more cleaned up. Your patch set looks good to me but
I'd like to take more opinions from others.

And you can find my comments at the third patch.

Thanks,
Inki Dae



2013/4/17 Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

> Hi Inki,
>
> This small patch series adds device tree support for the DRM FIMC driver.
> The binding documentation can be found in -next at
> Documentation/devicetree/
> bindings/media/samsung-fimc.txt.
> It will make the driver dependent on OF. This patch series is needed in
> 3.10 to ensure simultaneous operation of the DRM FIMC and the camera ISP
> on Exynos4x12.
>
> Changes since v1:
>  - removed devm_kfree() that got erroneously re-added in patch 2/3 during
>    rebase.
>
> Thanks,
> Sylwester
>
> Sylwester Nawrocki (3):
>   drm/exynos: Remove redundant devm_kfree()
>   drm/exynos: Rework fimc clocks handling
>   drm/exynos: Add device tree support for fimc ipp driver
>
>  drivers/gpu/drm/exynos/Kconfig           |    2 +-
>  drivers/gpu/drm/exynos/exynos_drm_fimc.c |  264
> ++++++++++++++++--------------
>  drivers/gpu/drm/exynos/regs-fimc.h       |    7 +-
>  3 files changed, 147 insertions(+), 126 deletions(-)
>
> --
> 1.7.9.5
>
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--047d7b34382cf9d45c04dacd169d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi Sylwester,<br><br></div><div>DRM FIMC driver =
could be more cleaned up with this patch series. And your third patch <br><=
/div><div>And just minor issue. The second patch has build warnings like be=
low,<br>
</div><div><br>WARNING: static const char * array should probably be static=
 const char * const<br>
#111: FILE: drivers/gpu/drm/exynos/exynos_drm_fimc.c:89:<br>+static const c=
har * fimc_clock_names[] =3D {<br><br>ERROR: &quot;foo * bar&quot; should b=
e &quot;foo *bar&quot;<br>#111: FILE: drivers/gpu/drm/exynos/exynos_drm_fim=
c.c:89:<br>

<br><br></div><div>This is a minor issue so I can fix them. And as you alre=
ady know, now drm fimc driver should be more cleaned up. Your patch set loo=
ks good to me but I&#39;d like to take more opinions from others.</div>
<br></div>And you can find my comments at the third patch.<br><div><br><div=
>Thanks,<br>Inki Dae<br></div><div><br></div></div></div><div class=3D"gmai=
l_extra"><br><br><div class=3D"gmail_quote">2013/4/17 Sylwester Nawrocki <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" target=3D"_bl=
ank">s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org</a>&gt;</span><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hi Inki,<br>
<br>
This small patch series adds device tree support for the DRM FIMC driver.<b=
r>
The binding documentation can be found in -next at Documentation/devicetree=
/<br>
bindings/media/samsung-fimc.txt.<br>
It will make the driver dependent on OF. This patch series is needed in<br>
3.10 to ensure simultaneous operation of the DRM FIMC and the camera ISP<br=
>
on Exynos4x12.<br>
<br>
Changes since v1:<br>
=A0- removed devm_kfree() that got erroneously re-added in patch 2/3 during=
<br>
=A0 =A0rebase.<br>
<br>
Thanks,<br>
Sylwester<br>
<br>
Sylwester Nawrocki (3):<br>
=A0 drm/exynos: Remove redundant devm_kfree()<br>
=A0 drm/exynos: Rework fimc clocks handling<br>
=A0 drm/exynos: Add device tree support for fimc ipp driver<br>
<br>
=A0drivers/gpu/drm/exynos/Kconfig =A0 =A0 =A0 =A0 =A0 | =A0 =A02 +-<br>
=A0drivers/gpu/drm/exynos/exynos_drm_fimc.c | =A0264 ++++++++++++++++------=
--------<br>
=A0drivers/gpu/drm/exynos/regs-fimc.h =A0 =A0 =A0 | =A0 =A07 +-<br>
=A03 files changed, 147 insertions(+), 126 deletions(-)<br>
<br>
--<br>
1.7.9.5<br>
<br>
_______________________________________________<br>
dri-devel mailing list<br>
<a href=3D"mailto:dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">dri-devel-PD4FTy7X32lzq7FAFJ/aeQ@public.gmane.org=
top.org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/dri-devel" target=
=3D"_blank">http://lists.freedesktop.org/mailman/listinfo/dri-devel</a><br>
</blockquote></div><br></div>

--047d7b34382cf9d45c04dacd169d--

--===============0364582451040107919==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0364582451040107919==--
