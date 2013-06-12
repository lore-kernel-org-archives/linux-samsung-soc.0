From: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFC 0/2] exynos5250/hdmi: replace dummy hdmiphy clock with pmu
 reg control
Date: Wed, 12 Jun 2013 13:18:14 +0900
Message-ID: <CAAQKjZMuSQhbYtOyni-RdHhXu0fv3U2Dm_2iqRLe0smSt_jjjQ@mail.gmail.com>
References: <1370935073-7475-1-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0015976866637054005=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1370935073-7475-1-git-send-email-rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
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
To: Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, sunil joshi <joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, DRI mailing list <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rahul Sharma <r.sh.open-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--===============0015976866637054005==
Content-Type: multipart/alternative; boundary=089e013d174a76197104deed4dd7

--089e013d174a76197104deed4dd7
Content-Type: text/plain; charset=ISO-8859-1

Hi Rahul,

This patch is important to us. Actually, previous hdmi driver had
controlled hdmiphy HDMI_PHY_CONTROL as if that were a clock but now that
doesn't exist anymore. So we need to discuss how hdmiphy should be handled.
I konw that you had already posted hdmiphy relevant patch set, [PATCH 0/4]
drm/exynos: hdmi: move hdmiphy related code to hdmiphy driver.

I think we can couple pmu register controlling codes with that patch set
without RFC. Could you update and post them again? like below,
[PATCH 0/4] drm/exynos: hdmi: move hdmiphy related code to hdmiphy driver +
[RFC 0/2] exynos5250/hdmi: replace dummy hdmiphy clock with pmu reg control

And then let's start review :)

Thanks,
Inki Dae



2013/6/11 Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

> Previously, hdmiphy is added as a dummy clock in clock file for
> exynos SoCs. Enable/Disable to this clock, actually toggles the power
> control bit in PMU, instead of controlling the clock gate.
>
> This RFC adds the support to parse hdmiphy control node which is a child
> node to hdmi, and map the pmu register to toggle the power control bit.
>
> This is based on drm-next branch in Inki Dae's tree.
>
> Rahul Sharma (2):
>   drm/exynos: replace dummy hdmiphy clock with pmu register control
>   ARM/dts: add hdmiphy power control pmu register to hdmi dt node
>
>  arch/arm/boot/dts/exynos5250.dtsi    |    6 +++
>  drivers/gpu/drm/exynos/exynos_hdmi.c |   69
> ++++++++++++++++++++++++++++++----
>  drivers/gpu/drm/exynos/regs-hdmi.h   |    4 ++
>  3 files changed, 71 insertions(+), 8 deletions(-)
>
> --
> 1.7.10.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--089e013d174a76197104deed4dd7
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi Rahul,<br><br></div>This patch is important t=
o us. Actually, previous hdmi driver had controlled hdmiphy HDMI_PHY_CONTRO=
L as if that were a clock but now that doesn&#39;t exist anymore. So we nee=
d to discuss how hdmiphy should be handled.<br>

I konw that you had already posted hdmiphy relevant patch set, [PATCH 0/4] =
drm/exynos: hdmi: move hdmiphy related code to hdmiphy driver.<br><br></div=
><div>I think we can couple pmu register controlling codes with that patch =
set without RFC. Could you update and post them again? like below,<br>
[PATCH 0/4] drm/exynos: hdmi: move hdmiphy related code to hdmiphy driver +=
 [RFC 0/2] exynos5250/hdmi: replace dummy hdmiphy clock with pmu reg contro=
l<br><br></div><div>And then let&#39;s start review :)<br></div><div><div>
<br></div><div>Thanks,<br>Inki Dae<br></div><div><br></div></div></div><div=
 class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">2013/6/11 Rahul S=
harma <span dir=3D"ltr">&lt;<a href=3D"mailto:rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" tar=
get=3D"_blank">rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org</a>&gt;</span><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Previously, hdmiphy is added as a dummy cloc=
k in clock file for<br>
exynos SoCs. Enable/Disable to this clock, actually toggles the power<br>
control bit in PMU, instead of controlling the clock gate.<br>
<br>
This RFC adds the support to parse hdmiphy control node which is a child<br=
>
node to hdmi, and map the pmu register to toggle the power control bit.<br>
<br>
This is based on drm-next branch in Inki Dae&#39;s tree.<br>
<br>
Rahul Sharma (2):<br>
=A0 drm/exynos: replace dummy hdmiphy clock with pmu register control<br>
=A0 ARM/dts: add hdmiphy power control pmu register to hdmi dt node<br>
<br>
=A0arch/arm/boot/dts/exynos5250.dtsi =A0 =A0| =A0 =A06 +++<br>
=A0drivers/gpu/drm/exynos/exynos_hdmi.c | =A0 69 ++++++++++++++++++++++++++=
++++----<br>
=A0drivers/gpu/drm/exynos/regs-hdmi.h =A0 | =A0 =A04 ++<br>
=A03 files changed, 71 insertions(+), 8 deletions(-)<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
1.7.10.4<br>
<br>
--<br>
To unsubscribe from this list: send the line &quot;unsubscribe linux-samsun=
g-soc&quot; in<br>
the body of a message to <a href=3D"mailto:majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org">major=
domo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org</a><br>
More majordomo info at =A0<a href=3D"http://vger.kernel.org/majordomo-info.=
html" target=3D"_blank">http://vger.kernel.org/majordomo-info.html</a><br>
</font></span></blockquote></div><br></div>

--089e013d174a76197104deed4dd7--

--===============0015976866637054005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0015976866637054005==--
