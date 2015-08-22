From: Yakir Yang <yakir.yang.rk@gmail.com>
Subject: Re: [PATCH v3 0/14] Add Analogix Core Display Port Driver
Date: Sat, 22 Aug 2015 06:13:32 -0400
Message-ID: <CADTe4T46E1+nz0oXPC1HjK4aX6M2bmphsAQnmZ5rW0oQY9rWNA@mail.gmail.com>
References: <1439995728-18046-1-git-send-email-ykk@rock-chips.com>
 <105A0032-83A0-4B75-AE94-258F12451670@gmail.com>
 <55D6F6F8.70504@rock-chips.com>
 <8384E112-E1F4-4CD3-85BF-A2A25989783F@gmail.com>
 <20150821131631.GC22118@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0731619836=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20150821131631.GC22118@ulmo.nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <treding@nvidia.com>
Cc: "seanpaul@google.com" <seanpaul@google.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Yakir Yang <ykk@rock-chips.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Vincent Palatin <vpalatin@chromium.org>, Kishon Vijay Abraham I <kishon@ti.com>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, Russell King <rmk+kernel@arm.linux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "dianders@google.com" <dianders@google.com>, "ajaynumb@gmail.com" <ajaynumb@gmail.com>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Fabio Estevam <fabio.estevam@freesc>
List-Id: linux-samsung-soc@vger.kernel.org

--===============0731619836==
Content-Type: multipart/alternative; boundary=001a1140a10cf9cf7d051de3a2a5

--001a1140a10cf9cf7d051de3a2a5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Thierry,

2015-08-21 9:16 GMT-04:00 Thierry Reding <treding@nvidia.com>:

> On Fri, Aug 21, 2015 at 08:24:16PM +0900, Jingoo Han wrote:
> > On 2015. 8. 21., at PM 7:01, Yakir Yang <ykk@rock-chips.com> wrote:
> > >
> > > Hi Jingoo,
> > >
> > >> =E5=9C=A8 2015/8/21 16:20, Jingoo Han =E5=86=99=E9=81=93:
> > >>> On 2015. 8. 19., at PM 11:48, Yakir Yang <ykk@rock-chips.com> wrote=
:
> > >>
> > >> .....
> > >>
> > >>> .../bindings/video/analogix_dp-rockchip.txt        |   83 ++
> > >>> .../devicetree/bindings/video/exynos_dp.txt        |   51 +-
> > >>> arch/arm/boot/dts/exynos5250-arndale.dts           |   10 +-
> > >>> arch/arm/boot/dts/exynos5250-smdk5250.dts          |   10 +-
> > >>> arch/arm/boot/dts/exynos5250-snow.dts              |   12 +-
> > >>> arch/arm/boot/dts/exynos5250-spring.dts            |   12 +-
> > >>> arch/arm/boot/dts/exynos5420-peach-pit.dts         |   12 +-
> > >>> arch/arm/boot/dts/exynos5420-smdk5420.dts          |   10 +-
> > >>> arch/arm/boot/dts/exynos5800-peach-pi.dts          |   12 +-
> > >>> drivers/gpu/drm/bridge/Kconfig                     |    5 +
> > >>> drivers/gpu/drm/bridge/Makefile                    |    1 +
> > >>> drivers/gpu/drm/bridge/analogix_dp_core.c          | 1382
> +++++++++++++++++++
> > >>> drivers/gpu/drm/bridge/analogix_dp_core.h          |  286 ++++
> > >>> drivers/gpu/drm/bridge/analogix_dp_reg.c           | 1294
> ++++++++++++++++++
> > >>> .../exynos_dp_reg.h =3D> bridge/analogix_dp_reg.h}   |  270 ++--
> > >>> drivers/gpu/drm/exynos/Kconfig                     |    5 +-
> > >>> drivers/gpu/drm/exynos/Makefile                    |    2 +-
> > >>> drivers/gpu/drm/exynos/analogix_dp-exynos.c        |  347 +++++
> > >> Would you change this file name to "exynos_dp.c"?
> > >
> > > Sorry, I don't think so  ;(
> > >
> > > I think IP_name+Soc_name would be better in this re-use case.
> >
> > So? Is there the naming rule such as "IP_name+SoC_name"?
> >
> > > Beside I see
> > > there are lots of driver named with this format in kernel, such as
> dw_hdmi & dw_mmc
> >
> > Please look at other dw cases.
> > For example, look at dw_pcie.
> >
> > drivers/pci/host/
> > pcie-designware.c
> > pci-spear13xx.c
> > pci-exynos.c
> >
> > In this case, pci-spear13xx.c and pci-exynos.c do not use
> "IP_name+SoC_name", even though these are dw IPs.
> >
> > Also, naming consistency is more important.
> > Now, Exynos DRM files are using "exynos_drm_" prefix.
> >
> > drivers/gpu/drm/exynos/
> > exynos_drm_buf.c
> > exynos_drm_core.c
> > ....
> >
> > However, "analogix_dp-exynos.c" looks very inconsistent.
> >
> > If there is no strict naming rule, please use "exynos_dp.c"
> > or "exynos_drm_dp.c".
>
> Exynos DRM maintainers get to pick their filenames, so Yakir, please
> rename as Jingoo suggested.
>
> Even if you didn't the first thing that would go into the Exynos DRM
> driver tree after this is merged is a rename patch anyway.
>
>
Okay, thanks for your remind ;)

- Yakir



> Thierry
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
>
>

--001a1140a10cf9cf7d051de3a2a5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Thierry,<br><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">2015-08-21 9:16 GMT-04:00 Thierry Reding <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:treding@nvidia.com" target=3D"_blank">treding@nvidia=
.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb=
"><div class=3D"h5">On Fri, Aug 21, 2015 at 08:24:16PM +0900, Jingoo Han wr=
ote:<br>
&gt; On 2015. 8. 21., at PM 7:01, Yakir Yang &lt;<a href=3D"mailto:ykk@rock=
-chips.com">ykk@rock-chips.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Hi Jingoo,<br>
&gt; &gt;<br>
&gt; &gt;&gt; =E5=9C=A8 2015/8/21 16:20, Jingoo Han =E5=86=99=E9=81=93:<br>
&gt; &gt;&gt;&gt; On 2015. 8. 19., at PM 11:48, Yakir Yang &lt;<a href=3D"m=
ailto:ykk@rock-chips.com">ykk@rock-chips.com</a>&gt; wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; .....<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&gt; .../bindings/video/analogix_dp-rockchip.txt=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A083 ++<br>
&gt; &gt;&gt;&gt; .../devicetree/bindings/video/exynos_dp.txt=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A051 +-<br>
&gt; &gt;&gt;&gt; arch/arm/boot/dts/exynos5250-arndale.dts=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A010 +-<br>
&gt; &gt;&gt;&gt; arch/arm/boot/dts/exynos5250-smdk5250.dts=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A010 +-<br>
&gt; &gt;&gt;&gt; arch/arm/boot/dts/exynos5250-snow.dts=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A012 +-<br>
&gt; &gt;&gt;&gt; arch/arm/boot/dts/exynos5250-spring.dts=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A012 +-<br>
&gt; &gt;&gt;&gt; arch/arm/boot/dts/exynos5420-peach-pit.dts=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A012 +-<br>
&gt; &gt;&gt;&gt; arch/arm/boot/dts/exynos5420-smdk5420.dts=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A010 +-<br>
&gt; &gt;&gt;&gt; arch/arm/boot/dts/exynos5800-peach-pi.dts=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A012 +-<br>
&gt; &gt;&gt;&gt; drivers/gpu/drm/bridge/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 5 +<br>
&gt; &gt;&gt;&gt; drivers/gpu/drm/bridge/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt; &gt;&gt;&gt; drivers/gpu/drm/bridge/analogix_dp_core.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 1382 +++++++++++++++++++<br>
&gt; &gt;&gt;&gt; drivers/gpu/drm/bridge/analogix_dp_core.h=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 286 ++++<br>
&gt; &gt;&gt;&gt; drivers/gpu/drm/bridge/analogix_dp_reg.c=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 1294 ++++++++++++++++++<br>
&gt; &gt;&gt;&gt; .../exynos_dp_reg.h =3D&gt; bridge/analogix_dp_reg.h}=C2=
=A0 =C2=A0|=C2=A0 270 ++--<br>
&gt; &gt;&gt;&gt; drivers/gpu/drm/exynos/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 5 +-<br>
&gt; &gt;&gt;&gt; drivers/gpu/drm/exynos/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +-<br>
&gt; &gt;&gt;&gt; drivers/gpu/drm/exynos/analogix_dp-exynos.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 347 +++++<br>
&gt; &gt;&gt; Would you change this file name to &quot;exynos_dp.c&quot;?<b=
r>
&gt; &gt;<br>
&gt; &gt; Sorry, I don&#39;t think so=C2=A0 ;(<br>
&gt; &gt;<br>
&gt; &gt; I think IP_name+Soc_name would be better in this re-use case.<br>
&gt;<br>
&gt; So? Is there the naming rule such as &quot;IP_name+SoC_name&quot;?<br>
&gt;<br>
&gt; &gt; Beside I see<br>
&gt; &gt; there are lots of driver named with this format in kernel, such a=
s dw_hdmi &amp; dw_mmc<br>
&gt;<br>
&gt; Please look at other dw cases.<br>
&gt; For example, look at dw_pcie.<br>
&gt;<br>
&gt; drivers/pci/host/<br>
&gt; pcie-designware.c<br>
&gt; pci-spear13xx.c<br>
&gt; pci-exynos.c<br>
&gt;<br>
&gt; In this case, pci-spear13xx.c and pci-exynos.c do not use &quot;IP_nam=
e+SoC_name&quot;, even though these are dw IPs.<br>
&gt;<br>
&gt; Also, naming consistency is more important.<br>
&gt; Now, Exynos DRM files are using &quot;exynos_drm_&quot; prefix.<br>
&gt;<br>
&gt; drivers/gpu/drm/exynos/<br>
&gt; exynos_drm_buf.c<br>
&gt; exynos_drm_core.c<br>
&gt; ....<br>
&gt;<br>
&gt; However, &quot;analogix_dp-exynos.c&quot; looks very inconsistent.<br>
&gt;<br>
&gt; If there is no strict naming rule, please use &quot;exynos_dp.c&quot;<=
br>
&gt; or &quot;exynos_drm_dp.c&quot;.<br>
<br>
</div></div>Exynos DRM maintainers get to pick their filenames, so Yakir, p=
lease<br>
rename as Jingoo suggested.<br>
<br>
Even if you didn&#39;t the first thing that would go into the Exynos DRM<br=
>
driver tree after this is merged is a rename patch anyway.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br></font></span></blockquo=
te><div><br></div><div><div style=3D"font-size:14px">Okay, thanks for your =
remind ;)</div><div style=3D"font-size:14px"><br></div><div style=3D"font-s=
ize:14px">- Yakir</div></div><div style=3D"font-size:14px"><br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><span class=3D"HOEnZb"><font col=
or=3D"#888888">
Thierry<br>
</font></span><br>_______________________________________________<br>
Linux-rockchip mailing list<br>
<a href=3D"mailto:Linux-rockchip@lists.infradead.org">Linux-rockchip@lists.=
infradead.org</a><br>
<a href=3D"http://lists.infradead.org/mailman/listinfo/linux-rockchip" rel=
=3D"noreferrer" target=3D"_blank">http://lists.infradead.org/mailman/listin=
fo/linux-rockchip</a><br>
<br></blockquote></div><br></div></div>

--001a1140a10cf9cf7d051de3a2a5--

--===============0731619836==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0731619836==--
