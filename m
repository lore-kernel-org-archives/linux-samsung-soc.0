From: Yakir Yang <yakir.yang.rk@gmail.com>
Subject: Re: [PATCH v3 0/14] Add Analogix Core Display Port Driver
Date: Sat, 22 Aug 2015 05:42:53 -0400
Message-ID: <CADTe4T5PnyDJ_MCP21Cv6v_Y=0DqfMzB8xK+Bz4y4Pf+LCei7A@mail.gmail.com>
References: <1439995728-18046-1-git-send-email-ykk@rock-chips.com>
 <105A0032-83A0-4B75-AE94-258F12451670@gmail.com>
 <55D6F6F8.70504@rock-chips.com>
 <8384E112-E1F4-4CD3-85BF-A2A25989783F@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0971767239=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <8384E112-E1F4-4CD3-85BF-A2A25989783F@gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jingoo Han <jingoohan1@gmail.com>
Cc: "seanpaul@google.com" <seanpaul@google.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Yakir Yang <ykk@rock-chips.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Vincent Palatin <vpalatin@chromium.org>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, Kishon Vijay Abraham I <kishon@ti.com>, Russell King <rmk+kernel@arm.linux.org.uk>, Thierry Reding <treding@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "dianders@google.com" <dianders@google.com>, "joe@perches.com" <joe@perches.com>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Fab
List-Id: linux-samsung-soc@vger.kernel.org

--===============0971767239==
Content-Type: multipart/alternative; boundary=047d7bea35c06196f9051de335bb

--047d7bea35c06196f9051de335bb
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Jingoo,


2015-08-21 7:24 GMT-04:00 Jingoo Han <jingoohan1@gmail.com>:

> On 2015. 8. 21., at PM 7:01, Yakir Yang <ykk@rock-chips.com> wrote:
>
> Hi Jingoo,
>
> =E5=9C=A8 2015/8/21 16:20, Jingoo Han =E5=86=99=E9=81=93:
>
> On 2015. 8. 19., at PM 11:48, Yakir Yang <ykk@rock-chips.com> <ykk@rock-c=
hips.com> wrote:
>
> .....
>
>
> .../bindings/video/analogix_dp-rockchip.txt        |   83 ++
> .../devicetree/bindings/video/exynos_dp.txt        |   51 +-
> arch/arm/boot/dts/exynos5250-arndale.dts           |   10 +-
> arch/arm/boot/dts/exynos5250-smdk5250.dts          |   10 +-
> arch/arm/boot/dts/exynos5250-snow.dts              |   12 +-
> arch/arm/boot/dts/exynos5250-spring.dts            |   12 +-
> arch/arm/boot/dts/exynos5420-peach-pit.dts         |   12 +-
> arch/arm/boot/dts/exynos5420-smdk5420.dts          |   10 +-
> arch/arm/boot/dts/exynos5800-peach-pi.dts          |   12 +-
> drivers/gpu/drm/bridge/Kconfig                     |    5 +
> drivers/gpu/drm/bridge/Makefile                    |    1 +
> drivers/gpu/drm/bridge/analogix_dp_core.c          | 1382 +++++++++++++++=
++++
> drivers/gpu/drm/bridge/analogix_dp_core.h          |  286 ++++
> drivers/gpu/drm/bridge/analogix_dp_reg.c           | 1294 +++++++++++++++=
+++
> .../exynos_dp_reg.h =3D> bridge/analogix_dp_reg.h}   |  270 ++--
> drivers/gpu/drm/exynos/Kconfig                     |    5 +-
> drivers/gpu/drm/exynos/Makefile                    |    2 +-
> drivers/gpu/drm/exynos/analogix_dp-exynos.c        |  347 +++++
>
> Would you change this file name to "exynos_dp.c"?
>
>
> Sorry, I don't think so  ;(
>
> I think IP_name+Soc_name would be better in this re-use case.
>
>
> So? Is there the naming rule such as "IP_name+SoC_name"?
>
> Beside I see
> there are lots of driver named with this format in kernel, such as dw_hdm=
i
> & dw_mmc
>
>
> Please look at other dw cases.
> For example, look at dw_pcie.
>
> drivers/pci/host/
> pcie-designware.c
> pci-spear13xx.c
> pci-exynos.c
>
> In this case, pci-spear13xx.c and pci-exynos.c do not use
> "IP_name+SoC_name", even though these are dw IPs.
>
> Also, naming consistency is more important.
> Now, Exynos DRM files are using "exynos_drm_" prefix.
>
> drivers/gpu/drm/exynos/
> exynos_drm_buf.c
> exynos_drm_core.c
> ....
>
> However, "analogix_dp-exynos.c" looks very inconsistent.
>
> If there is no strict naming rule, please use "exynos_dp.c"
> or "exynos_drm_dp.c".
>
>
Sorry for the delay :-)

Okay, it is little bit inconsistent, but I just want to make the IP name
more clearly.

Anyway I should follow your suggest with =E2=80=9Cexynos_*=E2=80=9D style f=
or now, so done,
I would change the filename to "exynos_dp.c"  ;)

Thanks,
- Yakir


> Best regards,
> Jingoo Han
>
>
>  (cr) (chromeos-3.14) yakir@server ~/trunk/src/third_party/kernel/v3.14 $
> ls drivers/gpu/drm/imx/
> dw_hdmi-imx.c   imx-drm.h  imx-tve.c     ipuv3-plane.c  Kconfig
> parallel-display.c
>
> (cr) (chromeos-3.14) yakir@server ~/trunk/src/third_party/kernel/v3.14 $
> ls drivers/mmc/host/dw_mmc*
> drivers/mmc/host/dw_mmc.c         drivers/mmc/host/dw_mmc.h
> drivers/mmc/host/dw_mmc-pci.c    drivers/mmc/host/dw_mmc-pltfm.h
> drivers/mmc/host/dw_mmc-exynos.c  drivers/mmc/host/dw_mmc-k3.c
> drivers/mmc/host/dw_mmc-pltfm.c  drivers/mmc/host/dw_mmc-rockchip.c
>
> Thanks,
> - Yakir
>
>
> Best regards,
> Jingoo Han
>
>
> drivers/gpu/drm/exynos/exynos_dp_core.c            | 1416 ---------------=
-----
> drivers/gpu/drm/exynos/exynos_dp_core.h            |  282 ----
> drivers/gpu/drm/exynos/exynos_dp_reg.c             | 1263 ---------------=
--
> drivers/gpu/drm/rockchip/Kconfig                   |    9 +
> drivers/gpu/drm/rockchip/Makefile                  |    1 +
> drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |  390 ++++++
> drivers/phy/Kconfig                                |    7 +
> drivers/phy/Makefile                               |    1 +
> drivers/phy/phy-rockchip-dp.c                      |  185 +++
> include/drm/bridge/analogix_dp.h                   |   40 +
> 30 files changed, 4325 insertions(+), 3172 deletions(-)
> create mode 100644 Documentation/devicetree/bindings/drm/bridge/analogix_=
dp.txt
> create mode 100644 Documentation/devicetree/bindings/phy/rockchip-dp-phy.=
txt
> create mode 100644 Documentation/devicetree/bindings/video/analogix_dp-ro=
ckchip.txt
> create mode 100644 drivers/gpu/drm/bridge/analogix_dp_core.c
> create mode 100644 drivers/gpu/drm/bridge/analogix_dp_core.h
> create mode 100644 drivers/gpu/drm/bridge/analogix_dp_reg.c
> rename drivers/gpu/drm/{exynos/exynos_dp_reg.h =3D> bridge/analogix_dp_re=
g.h} (62%)
> create mode 100644 drivers/gpu/drm/exynos/analogix_dp-exynos.c
> delete mode 100644 drivers/gpu/drm/exynos/exynos_dp_core.c
> delete mode 100644 drivers/gpu/drm/exynos/exynos_dp_core.h
> delete mode 100644 drivers/gpu/drm/exynos/exynos_dp_reg.c
> create mode 100644 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> create mode 100644 drivers/phy/phy-rockchip-dp.c
> create mode 100644 include/drm/bridge/analogix_dp.h
>
> --
> 1.9.1
>
>
>
>
>

--047d7bea35c06196f9051de335bb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jingoo,<div><br><div class=3D"gmail_extra"><br><div cla=
ss=3D"gmail_quote">2015-08-21 7:24 GMT-04:00 Jingoo Han <span dir=3D"ltr">&=
lt;<a href=3D"mailto:jingoohan1@gmail.com" target=3D"_blank">jingoohan1@gma=
il.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto">=
<div>On 2015. 8. 21., at PM 7:01, Yakir Yang &lt;<a href=3D"mailto:ykk@rock=
-chips.com" target=3D"_blank">ykk@rock-chips.com</a>&gt; wrote:</div><div><=
br></div><blockquote type=3D"cite"><div>
 =20
   =20
 =20
 =20
    Hi Jingoo,<span class=3D""><br>
    <br>
    <div>=E5=9C=A8 2015/8/21 16:20, Jingoo Han =E5=86=99=E9=81=93:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>On 2015. 8. 19., at PM 11:48, Yakir Yang <a href=3D"mailto:ykk@r=
ock-chips.com" target=3D"_blank">&lt;ykk@rock-chips.com&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre></pre>
      </blockquote>
      <pre>.....

</pre>
      <blockquote type=3D"cite">
        <pre>.../bindings/video/analogix_dp-rockchip.txt        |   83 ++
.../devicetree/bindings/video/exynos_dp.txt        |   51 +-
arch/arm/boot/dts/exynos5250-arndale.dts           |   10 +-
arch/arm/boot/dts/exynos5250-smdk5250.dts          |   10 +-
arch/arm/boot/dts/exynos5250-snow.dts              |   12 +-
arch/arm/boot/dts/exynos5250-spring.dts            |   12 +-
arch/arm/boot/dts/exynos5420-peach-pit.dts         |   12 +-
arch/arm/boot/dts/exynos5420-smdk5420.dts          |   10 +-
arch/arm/boot/dts/exynos5800-peach-pi.dts          |   12 +-
drivers/gpu/drm/bridge/Kconfig                     |    5 +
drivers/gpu/drm/bridge/Makefile                    |    1 +
drivers/gpu/drm/bridge/analogix_dp_core.c          | 1382 +++++++++++++++++=
++
drivers/gpu/drm/bridge/analogix_dp_core.h          |  286 ++++
drivers/gpu/drm/bridge/analogix_dp_reg.c           | 1294 +++++++++++++++++=
+
.../exynos_dp_reg.h =3D&gt; bridge/analogix_dp_reg.h}   |  270 ++--
drivers/gpu/drm/exynos/Kconfig                     |    5 +-
drivers/gpu/drm/exynos/Makefile                    |    2 +-
drivers/gpu/drm/exynos/analogix_dp-exynos.c        |  347 +++++
</pre>
      </blockquote>
      <pre>Would you change this file name to &quot;exynos_dp.c&quot;?
</pre>
    </blockquote>
    <br></span>
    Sorry, I don&#39;t think so=C2=A0 ;(<br>
    <br>
    I think IP_name+Soc_name would be better in this re-use case.</div></bl=
ockquote><div><br></div><div>So? Is there the naming rule such as &quot;IP_=
name+SoC_name&quot;?</div><br><blockquote type=3D"cite"><div> Beside
    I see<br>
    there are lots of driver named with this format in kernel, such as
    dw_hdmi &amp; dw_mmc<br></div></blockquote><div><br></div><div>Please l=
ook at other dw cases.</div><div>For example, look at dw_pcie.</div><div><b=
r></div><div>drivers/pci/host/</div><div>pcie-designware.c</div><div>pci-sp=
ear13xx.c</div><div>pci-exynos.c</div><div><br></div><div>In this case, pci=
-spear13xx.c and pci-exynos.c do not use &quot;IP_name+SoC_name&quot;, even=
 though these are dw IPs.</div><div><br></div><div>Also, naming consistency=
 is more important.</div><div>Now, Exynos DRM files are using &quot;exynos_=
drm_&quot; prefix.</div><div><br></div><div>drivers/gpu/drm/exynos/</div><d=
iv>exynos_drm_buf.c</div><div>exynos_drm_core.c</div><div>....</div><div><b=
r></div><div>However, &quot;analogix_dp-exynos.c&quot; looks very inconsist=
ent.</div><div><br></div><div>If there is no strict naming rule, please use=
 &quot;exynos_dp.c&quot;</div><div>or &quot;exynos_drm_dp.c&quot;.=C2=A0</d=
iv><div><br></div></div></blockquote><div><br></div><div>Sorry for the dela=
y :-)</div><div><br></div><div>Okay, it is little bit inconsistent, but I j=
ust want to make the IP name more clearly.</div><div><br></div><div>Anyway =
I should follow your suggest with =E2=80=9Cexynos_*=E2=80=9D style for now,=
 so done,=C2=A0</div><div>I would change the filename to &quot;exynos_dp.c&=
quot; =C2=A0;)</div><div><br></div><div>Thanks,</div><div>- Yakir</div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto"><div></div><d=
iv>Best regards,</div><div>Jingoo Han</div><div><br></div><blockquote type=
=3D"cite"><div>
    <br>
    =C2=A0(cr) (chromeos-3.14) yakir@server
    ~/trunk/src/third_party/kernel/v3.14 $<font color=3D"#000099"> ls
      drivers/gpu/drm/imx/</font><br>
    <font color=3D"#990000">dw_hdmi-imx.c</font>=C2=A0=C2=A0 imx-drm.h=C2=
=A0
    imx-tve.c=C2=A0=C2=A0=C2=A0=C2=A0 ipuv3-plane.c=C2=A0 Kconfig=C2=A0=C2=
=A0 parallel-display.c<br>
    <br>
    (cr) (chromeos-3.14) yakir@server
    ~/trunk/src/third_party/kernel/v3.14 $<font color=3D"#000099"> ls
      drivers/mmc/host/dw_mmc*</font><br>
    drivers/mmc/host/dw_mmc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 drivers/mmc/host/dw_mmc.h=C2=A0=C2=A0=C2=A0=C2=A0
    drivers/mmc/host/dw_mmc-pci.c=C2=A0=C2=A0=C2=A0 drivers/mmc/host/dw_mmc=
-pltfm.h<br>
    <font color=3D"#cc0000">drivers/mmc/host/dw_mmc-exynos.c</font>=C2=A0 <=
font color=3D"#cc0000">drivers/mmc/host/dw_mmc-k3.c=C2=A0</font>
    drivers/mmc/host/dw_mmc-pltfm.c=C2=A0 <font color=3D"#cc0000">drivers/m=
mc/host/dw_mmc-rockchip.c</font><br>
    <br>
    Thanks,<br>
    - Yakir<div><div class=3D"h5"><br>
    <br>
    <blockquote type=3D"cite">
      <pre>Best regards,
Jingoo Han

</pre>
      <blockquote type=3D"cite">
        <pre>drivers/gpu/drm/exynos/exynos_dp_core.c            | 1416 ----=
----------------
drivers/gpu/drm/exynos/exynos_dp_core.h            |  282 ----
drivers/gpu/drm/exynos/exynos_dp_reg.c             | 1263 -----------------
drivers/gpu/drm/rockchip/Kconfig                   |    9 +
drivers/gpu/drm/rockchip/Makefile                  |    1 +
drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |  390 ++++++
drivers/phy/Kconfig                                |    7 +
drivers/phy/Makefile                               |    1 +
drivers/phy/phy-rockchip-dp.c                      |  185 +++
include/drm/bridge/analogix_dp.h                   |   40 +
30 files changed, 4325 insertions(+), 3172 deletions(-)
create mode 100644 Documentation/devicetree/bindings/drm/bridge/analogix_dp=
.txt
create mode 100644 Documentation/devicetree/bindings/phy/rockchip-dp-phy.tx=
t
create mode 100644 Documentation/devicetree/bindings/video/analogix_dp-rock=
chip.txt
create mode 100644 drivers/gpu/drm/bridge/analogix_dp_core.c
create mode 100644 drivers/gpu/drm/bridge/analogix_dp_core.h
create mode 100644 drivers/gpu/drm/bridge/analogix_dp_reg.c
rename drivers/gpu/drm/{exynos/exynos_dp_reg.h =3D&gt; bridge/analogix_dp_r=
eg.h} (62%)
create mode 100644 drivers/gpu/drm/exynos/analogix_dp-exynos.c
delete mode 100644 drivers/gpu/drm/exynos/exynos_dp_core.c
delete mode 100644 drivers/gpu/drm/exynos/exynos_dp_core.h
delete mode 100644 drivers/gpu/drm/exynos/exynos_dp_reg.c
create mode 100644 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
create mode 100644 drivers/phy/phy-rockchip-dp.c
create mode 100644 include/drm/bridge/analogix_dp.h

--=20
1.9.1


</pre>
      </blockquote>
      <pre></pre>
    </blockquote>
    <br>
 =20

</div></div></div></blockquote></div></blockquote></div><br></div></div></d=
iv>

--047d7bea35c06196f9051de335bb--

--===============0971767239==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0971767239==--
