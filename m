From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v3 0/14] Add Analogix Core Display Port Driver
Date: Fri, 21 Aug 2015 18:01:28 +0800
Message-ID: <55D6F6F8.70504@rock-chips.com>
References: <1439995728-18046-1-git-send-email-ykk@rock-chips.com>
 <105A0032-83A0-4B75-AE94-258F12451670@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2092021974=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <105A0032-83A0-4B75-AE94-258F12451670@gmail.com>
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
Cc: "seanpaul@google.com" <seanpaul@google.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Vincent Palatin <vpalatin@chromium.org>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, Kishon Vijay Abraham I <kishon@ti.com>, Russell King <rmk+kernel@arm.linux.org.uk>, Thierry Reding <treding@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "dianders@google.com" <dianders@google.com>, "joe@perches.com" <joe@perches.com>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Fabio Estevam <fabio.estevam@freesca>
List-Id: linux-samsung-soc@vger.kernel.org

This is a multi-part message in MIME format.
--===============2092021974==
Content-Type: multipart/alternative;
 boundary="------------020202080308070208040405"

This is a multi-part message in MIME format.
--------------020202080308070208040405
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Jingoo,

=E5=9C=A8 2015/8/21 16:20, Jingoo Han =E5=86=99=E9=81=93:
> On 2015. 8. 19., at PM 11:48, Yakir Yang <ykk@rock-chips.com> wrote:
>>
> .....
>
>> .../bindings/video/analogix_dp-rockchip.txt        |   83 ++
>> .../devicetree/bindings/video/exynos_dp.txt        |   51 +-
>> arch/arm/boot/dts/exynos5250-arndale.dts           |   10 +-
>> arch/arm/boot/dts/exynos5250-smdk5250.dts          |   10 +-
>> arch/arm/boot/dts/exynos5250-snow.dts              |   12 +-
>> arch/arm/boot/dts/exynos5250-spring.dts            |   12 +-
>> arch/arm/boot/dts/exynos5420-peach-pit.dts         |   12 +-
>> arch/arm/boot/dts/exynos5420-smdk5420.dts          |   10 +-
>> arch/arm/boot/dts/exynos5800-peach-pi.dts          |   12 +-
>> drivers/gpu/drm/bridge/Kconfig                     |    5 +
>> drivers/gpu/drm/bridge/Makefile                    |    1 +
>> drivers/gpu/drm/bridge/analogix_dp_core.c          | 1382 ++++++++++++=
+++++++
>> drivers/gpu/drm/bridge/analogix_dp_core.h          |  286 ++++
>> drivers/gpu/drm/bridge/analogix_dp_reg.c           | 1294 ++++++++++++=
++++++
>> .../exynos_dp_reg.h =3D> bridge/analogix_dp_reg.h}   |  270 ++--
>> drivers/gpu/drm/exynos/Kconfig                     |    5 +-
>> drivers/gpu/drm/exynos/Makefile                    |    2 +-
>> drivers/gpu/drm/exynos/analogix_dp-exynos.c        |  347 +++++
> Would you change this file name to "exynos_dp.c"?

Sorry, I don't think so  ;(

I think IP_name+Soc_name would be better in this re-use case. Beside I se=
e
there are lots of driver named with this format in kernel, such as=20
dw_hdmi & dw_mmc

  (cr) (chromeos-3.14) yakir@server ~/trunk/src/third_party/kernel/v3.14=20
$ls drivers/gpu/drm/imx/
dw_hdmi-imx.c   imx-drm.h imx-tve.c     ipuv3-plane.c  Kconfig  =20
parallel-display.c

(cr) (chromeos-3.14) yakir@server ~/trunk/src/third_party/kernel/v3.14=20
$ls drivers/mmc/host/dw_mmc*
drivers/mmc/host/dw_mmc.c         drivers/mmc/host/dw_mmc.h=20
drivers/mmc/host/dw_mmc-pci.c    drivers/mmc/host/dw_mmc-pltfm.h
drivers/mmc/host/dw_mmc-exynos.c drivers/mmc/host/dw_mmc-k3.c=20
drivers/mmc/host/dw_mmc-pltfm.c drivers/mmc/host/dw_mmc-rockchip.c

Thanks,
- Yakir

> Best regards,
> Jingoo Han
>
>> drivers/gpu/drm/exynos/exynos_dp_core.c            | 1416 ------------=
--------
>> drivers/gpu/drm/exynos/exynos_dp_core.h            |  282 ----
>> drivers/gpu/drm/exynos/exynos_dp_reg.c             | 1263 ------------=
-----
>> drivers/gpu/drm/rockchip/Kconfig                   |    9 +
>> drivers/gpu/drm/rockchip/Makefile                  |    1 +
>> drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |  390 ++++++
>> drivers/phy/Kconfig                                |    7 +
>> drivers/phy/Makefile                               |    1 +
>> drivers/phy/phy-rockchip-dp.c                      |  185 +++
>> include/drm/bridge/analogix_dp.h                   |   40 +
>> 30 files changed, 4325 insertions(+), 3172 deletions(-)
>> create mode 100644 Documentation/devicetree/bindings/drm/bridge/analog=
ix_dp.txt
>> create mode 100644 Documentation/devicetree/bindings/phy/rockchip-dp-p=
hy.txt
>> create mode 100644 Documentation/devicetree/bindings/video/analogix_dp=
-rockchip.txt
>> create mode 100644 drivers/gpu/drm/bridge/analogix_dp_core.c
>> create mode 100644 drivers/gpu/drm/bridge/analogix_dp_core.h
>> create mode 100644 drivers/gpu/drm/bridge/analogix_dp_reg.c
>> rename drivers/gpu/drm/{exynos/exynos_dp_reg.h =3D> bridge/analogix_dp=
_reg.h} (62%)
>> create mode 100644 drivers/gpu/drm/exynos/analogix_dp-exynos.c
>> delete mode 100644 drivers/gpu/drm/exynos/exynos_dp_core.c
>> delete mode 100644 drivers/gpu/drm/exynos/exynos_dp_core.h
>> delete mode 100644 drivers/gpu/drm/exynos/exynos_dp_reg.c
>> create mode 100644 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> create mode 100644 drivers/phy/phy-rockchip-dp.c
>> create mode 100644 include/drm/bridge/analogix_dp.h
>>
>> --=20
>> 1.9.1
>>
>>
>
>


--------------020202080308070208040405
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta content=3D"text/html; charset=3DUTF-8" http-equiv=3D"Content-Ty=
pe">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    Hi Jingoo,<br>
    <br>
    <div class=3D"moz-cite-prefix">=E5=9C=A8 2015/8/21 16:20, Jingoo Han =
=E5=86=99=E9=81=93:<br>
    </div>
    <blockquote
      cite=3D"mid:105A0032-83A0-4B75-AE94-258F12451670@gmail.com"
      type=3D"cite">
      <pre wrap=3D"">On 2015. 8. 19., at PM 11:48, Yakir Yang <a class=3D=
"moz-txt-link-rfc2396E" href=3D"mailto:ykk@rock-chips.com">&lt;ykk@rock-c=
hips.com&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">

</pre>
      </blockquote>
      <pre wrap=3D"">
.....

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">.../bindings/video/analogix_dp-rockchip.txt       =
 |   83 ++
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
drivers/gpu/drm/bridge/analogix_dp_core.c          | 1382 +++++++++++++++=
++++
drivers/gpu/drm/bridge/analogix_dp_core.h          |  286 ++++
drivers/gpu/drm/bridge/analogix_dp_reg.c           | 1294 +++++++++++++++=
+++
.../exynos_dp_reg.h =3D&gt; bridge/analogix_dp_reg.h}   |  270 ++--
drivers/gpu/drm/exynos/Kconfig                     |    5 +-
drivers/gpu/drm/exynos/Makefile                    |    2 +-
drivers/gpu/drm/exynos/analogix_dp-exynos.c        |  347 +++++
</pre>
      </blockquote>
      <pre wrap=3D"">
Would you change this file name to "exynos_dp.c"?
</pre>
    </blockquote>
    <br>
    Sorry, I don't think so=C2=A0 ;(<br>
    <br>
    I think IP_name+Soc_name would be better in this re-use case. Beside
    I see<br>
    there are lots of driver named with this format in kernel, such as
    dw_hdmi &amp; dw_mmc<br>
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
    drivers/mmc/host/dw_mmc-pci.c=C2=A0=C2=A0=C2=A0 drivers/mmc/host/dw_m=
mc-pltfm.h<br>
    <font color=3D"#cc0000">drivers/mmc/host/dw_mmc-exynos.c</font>=C2=A0=
 <font
      color=3D"#cc0000">drivers/mmc/host/dw_mmc-k3.c=C2=A0</font>
    drivers/mmc/host/dw_mmc-pltfm.c=C2=A0 <font color=3D"#cc0000">drivers=
/mmc/host/dw_mmc-rockchip.c</font><br>
    <br>
    Thanks,<br>
    - Yakir<br>
    <br>
    <blockquote
      cite=3D"mid:105A0032-83A0-4B75-AE94-258F12451670@gmail.com"
      type=3D"cite">
      <pre wrap=3D"">
Best regards,
Jingoo Han

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">drivers/gpu/drm/exynos/exynos_dp_core.c           =
 | 1416 --------------------
drivers/gpu/drm/exynos/exynos_dp_core.h            |  282 ----
drivers/gpu/drm/exynos/exynos_dp_reg.c             | 1263 ---------------=
--
drivers/gpu/drm/rockchip/Kconfig                   |    9 +
drivers/gpu/drm/rockchip/Makefile                  |    1 +
drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |  390 ++++++
drivers/phy/Kconfig                                |    7 +
drivers/phy/Makefile                               |    1 +
drivers/phy/phy-rockchip-dp.c                      |  185 +++
include/drm/bridge/analogix_dp.h                   |   40 +
30 files changed, 4325 insertions(+), 3172 deletions(-)
create mode 100644 Documentation/devicetree/bindings/drm/bridge/analogix_=
dp.txt
create mode 100644 Documentation/devicetree/bindings/phy/rockchip-dp-phy.=
txt
create mode 100644 Documentation/devicetree/bindings/video/analogix_dp-ro=
ckchip.txt
create mode 100644 drivers/gpu/drm/bridge/analogix_dp_core.c
create mode 100644 drivers/gpu/drm/bridge/analogix_dp_core.h
create mode 100644 drivers/gpu/drm/bridge/analogix_dp_reg.c
rename drivers/gpu/drm/{exynos/exynos_dp_reg.h =3D&gt; bridge/analogix_dp=
_reg.h} (62%)
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
  </body>
</html>

--------------020202080308070208040405--


--===============2092021974==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============2092021974==--
