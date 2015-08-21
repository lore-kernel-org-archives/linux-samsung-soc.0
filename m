From: Jingoo Han <jingoohan1@gmail.com>
Subject: Re: [PATCH v3 0/14] Add Analogix Core Display Port Driver
Date: Fri, 21 Aug 2015 20:24:16 +0900
Message-ID: <8384E112-E1F4-4CD3-85BF-A2A25989783F@gmail.com>
References: <1439995728-18046-1-git-send-email-ykk@rock-chips.com>
 <105A0032-83A0-4B75-AE94-258F12451670@gmail.com>
 <55D6F6F8.70504@rock-chips.com>
Mime-Version: 1.0 (1.0)
Content-Type: multipart/mixed; boundary="===============1696209144=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <55D6F6F8.70504@rock-chips.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Yakir Yang <ykk@rock-chips.com>
Cc: "seanpaul@google.com" <seanpaul@google.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Vincent Palatin <vpalatin@chromium.org>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, Kishon Vijay Abraham I <kishon@ti.com>, Russell King <rmk+kernel@arm.linux.org.uk>, Thierry Reding <treding@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "dianders@google.com" <dianders@google.com>, "joe@perches.com" <joe@perches.com>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Fabio Estevam <fabio.estevam@freesca>
List-Id: linux-samsung-soc@vger.kernel.org


--===============1696209144==
Content-Type: multipart/alternative;
	boundary=Apple-Mail-CDD072AD-28EC-4D9E-82CF-6B542E7D0D9F
Content-Transfer-Encoding: 7bit


--Apple-Mail-CDD072AD-28EC-4D9E-82CF-6B542E7D0D9F
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2015. 8. 21., at PM 7:01, Yakir Yang <ykk@rock-chips.com> wrote:
>=20
> Hi Jingoo,
>=20
>> =E5=9C=A8 2015/8/21 16:20, Jingoo Han =E5=86=99=E9=81=93:
>>> On 2015. 8. 19., at PM 11:48, Yakir Yang <ykk@rock-chips.com> wrote:
>>=20
>> .....
>>=20
>>> .../bindings/video/analogix_dp-rockchip.txt        |   83 ++
>>> .../devicetree/bindings/video/exynos_dp.txt        |   51 +-
>>> arch/arm/boot/dts/exynos5250-arndale.dts           |   10 +-
>>> arch/arm/boot/dts/exynos5250-smdk5250.dts          |   10 +-
>>> arch/arm/boot/dts/exynos5250-snow.dts              |   12 +-
>>> arch/arm/boot/dts/exynos5250-spring.dts            |   12 +-
>>> arch/arm/boot/dts/exynos5420-peach-pit.dts         |   12 +-
>>> arch/arm/boot/dts/exynos5420-smdk5420.dts          |   10 +-
>>> arch/arm/boot/dts/exynos5800-peach-pi.dts          |   12 +-
>>> drivers/gpu/drm/bridge/Kconfig                     |    5 +
>>> drivers/gpu/drm/bridge/Makefile                    |    1 +
>>> drivers/gpu/drm/bridge/analogix_dp_core.c          | 1382 ++++++++++++++=
+++++
>>> drivers/gpu/drm/bridge/analogix_dp_core.h          |  286 ++++
>>> drivers/gpu/drm/bridge/analogix_dp_reg.c           | 1294 ++++++++++++++=
++++
>>> .../exynos_dp_reg.h =3D> bridge/analogix_dp_reg.h}   |  270 ++--
>>> drivers/gpu/drm/exynos/Kconfig                     |    5 +-
>>> drivers/gpu/drm/exynos/Makefile                    |    2 +-
>>> drivers/gpu/drm/exynos/analogix_dp-exynos.c        |  347 +++++
>> Would you change this file name to "exynos_dp.c"?
>=20
> Sorry, I don't think so  ;(
>=20
> I think IP_name+Soc_name would be better in this re-use case.

So? Is there the naming rule such as "IP_name+SoC_name"?

> Beside I see
> there are lots of driver named with this format in kernel, such as dw_hdmi=
 & dw_mmc

Please look at other dw cases.
For example, look at dw_pcie.

drivers/pci/host/
pcie-designware.c
pci-spear13xx.c
pci-exynos.c

In this case, pci-spear13xx.c and pci-exynos.c do not use "IP_name+SoC_name"=
, even though these are dw IPs.

Also, naming consistency is more important.
Now, Exynos DRM files are using "exynos_drm_" prefix.

drivers/gpu/drm/exynos/
exynos_drm_buf.c
exynos_drm_core.c
....

However, "analogix_dp-exynos.c" looks very inconsistent.

If there is no strict naming rule, please use "exynos_dp.c"
or "exynos_drm_dp.c".=20

Best regards,
Jingoo Han

>=20
>  (cr) (chromeos-3.14) yakir@server ~/trunk/src/third_party/kernel/v3.14 $ l=
s drivers/gpu/drm/imx/
> dw_hdmi-imx.c   imx-drm.h  imx-tve.c     ipuv3-plane.c  Kconfig   parallel=
-display.c
>=20
> (cr) (chromeos-3.14) yakir@server ~/trunk/src/third_party/kernel/v3.14 $ l=
s drivers/mmc/host/dw_mmc*
> drivers/mmc/host/dw_mmc.c         drivers/mmc/host/dw_mmc.h     drivers/mm=
c/host/dw_mmc-pci.c    drivers/mmc/host/dw_mmc-pltfm.h
> drivers/mmc/host/dw_mmc-exynos.c  drivers/mmc/host/dw_mmc-k3.c  drivers/mm=
c/host/dw_mmc-pltfm.c  drivers/mmc/host/dw_mmc-rockchip.c
>=20
> Thanks,
> - Yakir
>=20
>> Best regards,
>> Jingoo Han
>>=20
>>> drivers/gpu/drm/exynos/exynos_dp_core.c            | 1416 --------------=
------
>>> drivers/gpu/drm/exynos/exynos_dp_core.h            |  282 ----
>>> drivers/gpu/drm/exynos/exynos_dp_reg.c             | 1263 --------------=
---
>>> drivers/gpu/drm/rockchip/Kconfig                   |    9 +
>>> drivers/gpu/drm/rockchip/Makefile                  |    1 +
>>> drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |  390 ++++++
>>> drivers/phy/Kconfig                                |    7 +
>>> drivers/phy/Makefile                               |    1 +
>>> drivers/phy/phy-rockchip-dp.c                      |  185 +++
>>> include/drm/bridge/analogix_dp.h                   |   40 +
>>> 30 files changed, 4325 insertions(+), 3172 deletions(-)
>>> create mode 100644 Documentation/devicetree/bindings/drm/bridge/analogix=
_dp.txt
>>> create mode 100644 Documentation/devicetree/bindings/phy/rockchip-dp-phy=
.txt
>>> create mode 100644 Documentation/devicetree/bindings/video/analogix_dp-r=
ockchip.txt
>>> create mode 100644 drivers/gpu/drm/bridge/analogix_dp_core.c
>>> create mode 100644 drivers/gpu/drm/bridge/analogix_dp_core.h
>>> create mode 100644 drivers/gpu/drm/bridge/analogix_dp_reg.c
>>> rename drivers/gpu/drm/{exynos/exynos_dp_reg.h =3D> bridge/analogix_dp_r=
eg.h} (62%)
>>> create mode 100644 drivers/gpu/drm/exynos/analogix_dp-exynos.c
>>> delete mode 100644 drivers/gpu/drm/exynos/exynos_dp_core.c
>>> delete mode 100644 drivers/gpu/drm/exynos/exynos_dp_core.h
>>> delete mode 100644 drivers/gpu/drm/exynos/exynos_dp_reg.c
>>> create mode 100644 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>>> create mode 100644 drivers/phy/phy-rockchip-dp.c
>>> create mode 100644 include/drm/bridge/analogix_dp.h
>>>=20
>>> --=20
>>> 1.9.1
>>>=20
>>>=20
>=20

--Apple-Mail-CDD072AD-28EC-4D9E-82CF-6B542E7D0D9F
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div>On 2015. 8. 21., at PM 7:01, Yakir Yan=
g &lt;<a href=3D"mailto:ykk@rock-chips.com">ykk@rock-chips.com</a>&gt; wrote=
:</div><div><br></div><blockquote type=3D"cite"><div>
 =20
    <meta content=3D"text/html; charset=3DUTF-8" http-equiv=3D"Content-Type"=
>
 =20
 =20
    Hi Jingoo,<br>
    <br>
    <div class=3D"moz-cite-prefix">=E5=9C=A8 2015/8/21 16:20, Jingoo Han =E5=
=86=99=E9=81=93:<br>
    </div>
    <blockquote cite=3D"mid:105A0032-83A0-4B75-AE94-258F12451670@gmail.com" t=
ype=3D"cite">
      <pre wrap=3D"">On 2015. 8. 19., at PM 11:48, Yakir Yang <a class=3D"mo=
z-txt-link-rfc2396E" href=3D"mailto:ykk@rock-chips.com">&lt;ykk@rock-chips.c=
om&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">
</pre>
      </blockquote>
      <pre wrap=3D"">.....

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">.../bindings/video/analogix_dp-rockchip.txt        | =
  83 ++
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
drivers/gpu/drm/bridge/analogix_dp_core.c          | 1382 ++++++++++++++++++=
+
drivers/gpu/drm/bridge/analogix_dp_core.h          |  286 ++++
drivers/gpu/drm/bridge/analogix_dp_reg.c           | 1294 ++++++++++++++++++=

.../exynos_dp_reg.h =3D&gt; bridge/analogix_dp_reg.h}   |  270 ++--
drivers/gpu/drm/exynos/Kconfig                     |    5 +-
drivers/gpu/drm/exynos/Makefile                    |    2 +-
drivers/gpu/drm/exynos/analogix_dp-exynos.c        |  347 +++++
</pre>
      </blockquote>
      <pre wrap=3D"">Would you change this file name to "exynos_dp.c"?
</pre>
    </blockquote>
    <br>
    Sorry, I don't think so&nbsp; ;(<br>
    <br>
    I think IP_name+Soc_name would be better in this re-use case.</div></blo=
ckquote><div><br></div><div>So? Is there the naming rule such as "IP_name+So=
C_name"?</div><br><blockquote type=3D"cite"><div> Beside
    I see<br>
    there are lots of driver named with this format in kernel, such as
    dw_hdmi &amp; dw_mmc<br></div></blockquote><div><br></div><div>Please lo=
ok at other dw cases.</div><div>For example, look at dw_pcie.</div><div><br>=
</div><div>drivers/pci/host/</div><div>pcie-designware.c</div><div>pci-spear=
13xx.c</div><div>pci-exynos.c</div><div><br></div><div>In this case, pci-spe=
ar13xx.c and pci-exynos.c do not use "IP_name+SoC_name", even though these a=
re dw IPs.</div><div><br></div><div>Also, naming consistency is more importa=
nt.</div><div>Now, Exynos DRM files are using "exynos_drm_" prefix.</div><di=
v><br></div><div>drivers/gpu/drm/exynos/</div><div>exynos_drm_buf.c</div><di=
v>exynos_drm_core.c</div><div>....</div><div><br></div><div>However, "analog=
ix_dp-exynos.c" looks very inconsistent.</div><div><br></div><div>If there i=
s no strict naming rule, please use "exynos_dp.c"</div><div>or "exynos_drm_d=
p.c".&nbsp;</div><div><br></div><div>Best regards,</div><div>Jingoo Han</div=
><div><br></div><blockquote type=3D"cite"><div>
    <br>
    &nbsp;(cr) (chromeos-3.14) yakir@server
    ~/trunk/src/third_party/kernel/v3.14 $<font color=3D"#000099"> ls
      drivers/gpu/drm/imx/</font><br>
    <font color=3D"#990000">dw_hdmi-imx.c</font>&nbsp;&nbsp; imx-drm.h&nbsp;=

    imx-tve.c&nbsp;&nbsp;&nbsp;&nbsp; ipuv3-plane.c&nbsp; Kconfig&nbsp;&nbsp=
; parallel-display.c<br>
    <br>
    (cr) (chromeos-3.14) yakir@server
    ~/trunk/src/third_party/kernel/v3.14 $<font color=3D"#000099"> ls
      drivers/mmc/host/dw_mmc*</font><br>
    drivers/mmc/host/dw_mmc.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; drivers/mmc/host/dw_mmc.h&nbsp;&nbsp;&nbsp;&nbsp;
    drivers/mmc/host/dw_mmc-pci.c&nbsp;&nbsp;&nbsp; drivers/mmc/host/dw_mmc-=
pltfm.h<br>
    <font color=3D"#cc0000">drivers/mmc/host/dw_mmc-exynos.c</font>&nbsp; <f=
ont color=3D"#cc0000">drivers/mmc/host/dw_mmc-k3.c&nbsp;</font>
    drivers/mmc/host/dw_mmc-pltfm.c&nbsp; <font color=3D"#cc0000">drivers/mm=
c/host/dw_mmc-rockchip.c</font><br>
    <br>
    Thanks,<br>
    - Yakir<br>
    <br>
    <blockquote cite=3D"mid:105A0032-83A0-4B75-AE94-258F12451670@gmail.com" t=
ype=3D"cite">
      <pre wrap=3D"">Best regards,
Jingoo Han

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">drivers/gpu/drm/exynos/exynos_dp_core.c            | 1=
416 --------------------
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
create mode 100644 Documentation/devicetree/bindings/drm/bridge/analogix_dp.=
txt
create mode 100644 Documentation/devicetree/bindings/phy/rockchip-dp-phy.txt=

create mode 100644 Documentation/devicetree/bindings/video/analogix_dp-rockc=
hip.txt
create mode 100644 drivers/gpu/drm/bridge/analogix_dp_core.c
create mode 100644 drivers/gpu/drm/bridge/analogix_dp_core.h
create mode 100644 drivers/gpu/drm/bridge/analogix_dp_reg.c
rename drivers/gpu/drm/{exynos/exynos_dp_reg.h =3D&gt; bridge/analogix_dp_re=
g.h} (62%)
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
      <pre wrap=3D"">

</pre>
    </blockquote>
    <br>
 =20

</div></blockquote></body></html>=

--Apple-Mail-CDD072AD-28EC-4D9E-82CF-6B542E7D0D9F--

--===============1696209144==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1696209144==--
