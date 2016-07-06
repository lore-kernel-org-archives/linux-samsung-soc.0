From: Yakir Yang <ykk@rock-chips.com>
Subject: [GIT PULL] drm/bridge: analogix-dp: misc fixes & add RK3399 eDP
 support
Date: Wed, 6 Jul 2016 08:49:40 +0800
Message-ID: <577C55A4.10001@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0491893687=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: David Airlie <airlied@linux.ie>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Jingoo Han <jingoohan1@gmail.com>, Doug Anderson <dianders@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>, Tomasz Figa <tfiga@chromium.org>, Javier Martinez Canillas <javier@osg.samsung.com>, =?UTF-8?Q?St=c3=a9phane_Marchesin?= <marcheu@chromium.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

This is a multi-part message in MIME format.
--===============0491893687==
Content-Type: multipart/alternative;
 boundary="------------010708020803000909070909"

This is a multi-part message in MIME format.
--------------010708020803000909070909
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Please consider merging this tag, which contains the v4 misc fixes and=20
add RK3399 eDP support patches[0] I sent on 2016-06-29, rebased onto=20
v4.7-rc5.

This tag have been reviewed by :
- Tomasz Figa <tomasz.figa@chromium.org>
- Sean Paul <seanpaul@chromium.org>
- Douglas Anderson <dianders@chromium.org>
- St=C3=A9phane Marchesin <marcheu@chromium.org>

And acked by :
- Mark Yao <mark.yao@rock-chips.com>

Also tested on Exynos platform successfully by :
Javier Martinez Canillas <javier@osg.samsung.com>

Besides I also have set up a tree[1] to verify the eDP function on=20
RK3399 EVB board. That tree is based on v4.7-rc5, but need to apply some=20
patches to make things work on RK3399 board, like:
- Apply Mark Yao's RK3399 VOP thread
- Apply ShunQian Zheng's RK3399 IOMMU thread
- Directly update the i2c & rk808 driver to our develop branch
- Directly update the dtsi to our develop branch


[0]: https://lkml.org/lkml/2016/6/29/186
[1]: https://github.com/yakir-Yang/linux/tree/test/analogix-dp-20160705

Thanks,
- Yakir


The following changes since commit=20
d9c900b0270a18101403cf5e95c1639fccd43a9f:

   drm/rockchip: analogix_dp: split the lcdc select setting into device=20
data (2016-07-05 09:16:33 +0800)

are available in the git repository at:

git@github.com:yakir-Yang/linux.git upstream/analogix-dp-20160705

for you to fetch changes up to 4787b4343fef2e3227b0a69934a8f89e53091fb9:

   dt-bindings: analogix_dp: rockchip: correct the wrong compatible name=20
(2016-07-05 09:18:32 +0800)

----------------------------------------------------------------
Yakir Yang (10):
       drm/bridge: analogix_dp: correct the register bit define error in=20
ANALOGIX_DP_PLL_REG_1
       drm/bridge: analogix_dp: some rockchip chips need to flip REF_CLK=20
bit setting
       drm/rockchip: analogix_dp: add rk3399 eDP support
       drm/rockchip: analogix_dp: make panel detect to an optional action
       drm/bridge: analogix_dp: passing the connector as an argument in=20
.get_modes()
       drm/rockchip: analogix_dp: correct the connector display color=20
format and bpc
       drm/rockchip: analogix_dp: update the comments about why need to=20
hardcode VOP output mode
       drm/bridge: analogix_dp: fix no drm hpd event when panel plug in
       drm/rockchip: analogix_dp: introduce the pclk for grf
       dt-bindings: analogix_dp: rockchip: correct the wrong compatible=20
name

  Documentation/devicetree/bindings/display/bridge/analogix_dp.txt |   1 =
+
  Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip=
.txt |   9 +++++-
  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |   2 +-
  drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |   8 ++---
  drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c |  12 ++++---
  drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h |   5 +--
  drivers/gpu/drm/exynos/exynos_dp.c |   4 +--
  drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 127=20
+++++++++++++++++++++++++++++++++++++++++++++++++++----------------------=
--
  include/drm/bridge/analogix_dp.h |   9 +++++-
  9 files changed, 122 insertions(+), 55 deletions(-)


--------------010708020803000909070909
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>

    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3Dutf=
-8">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    <div class=3D"moz-text-flowed" style=3D"font-family: -moz-fixed;
      font-size: 12px;" lang=3D"x-unicode">Hi Dave,
      <br>
      <br>
      Please consider merging this tag, which contains the v4 misc fixes
      and add RK3399 eDP support patches[0] I sent on 2016-06-29,
      rebased onto v4.7-rc5.
      <br>
      <br>
      This tag have been reviewed by :
      <br>
      - Tomasz Figa <a class=3D"moz-txt-link-rfc2396E"
        href=3D"mailto:tomasz.figa@chromium.org">&lt;tomasz.figa@chromium=
.org&gt;</a>
      <br>
      - Sean Paul <a class=3D"moz-txt-link-rfc2396E"
        href=3D"mailto:seanpaul@chromium.org">&lt;seanpaul@chromium.org&g=
t;</a>
      <br>
      - Douglas Anderson <a class=3D"moz-txt-link-rfc2396E"
        href=3D"mailto:dianders@chromium.org">&lt;dianders@chromium.org&g=
t;</a>
      <br>
      - St=C3=A9phane Marchesin <a class=3D"moz-txt-link-rfc2396E"
        href=3D"mailto:marcheu@chromium.org">&lt;marcheu@chromium.org&gt;=
</a>
      <br>
      <br>
      And acked by :
      <br>
      - Mark Yao <a class=3D"moz-txt-link-rfc2396E"
        href=3D"mailto:mark.yao@rock-chips.com">&lt;mark.yao@rock-chips.c=
om&gt;</a>
      <br>
      <br>
      Also tested on Exynos platform successfully by :
      <br>
      Javier Martinez Canillas <a class=3D"moz-txt-link-rfc2396E"
        href=3D"mailto:javier@osg.samsung.com">&lt;javier@osg.samsung.com=
&gt;</a>
      <br>
      <br>
      Besides I also have set up a tree[1] to verify the eDP function on
      RK3399 EVB board. That tree is based on v4.7-rc5, but need to
      apply some patches to make things work on RK3399 board, like:
      <br>
      - Apply Mark Yao's RK3399 VOP thread
      <br>
      - Apply ShunQian Zheng's RK3399 IOMMU thread
      <br>
      - Directly update the i2c &amp; rk808 driver to our develop branch
      <br>
      - Directly update the dtsi to our develop branch
      <br>
      <br>
      <br>
      [0]: <a href=3D"https://lkml.org/lkml/2016/6/29/186">https://lkml.o=
rg/lkml/2016/6/29/186</a><br>
      [1]: <a class=3D"moz-txt-link-freetext"
href=3D"https://github.com/yakir-Yang/linux/tree/test/analogix-dp-2016070=
5">https://github.com/yakir-Yang/linux/tree/test/analogix-dp-20160705</a>
      <br>
      <br>
      Thanks,
      <br>
      - Yakir
      <br>
      <br>
      <br>
      The following changes since commit
      d9c900b0270a18101403cf5e95c1639fccd43a9f:
      <br>
      <br>
      =C2=A0 drm/rockchip: analogix_dp: split the lcdc select setting int=
o
      device data (2016-07-05 09:16:33 +0800)
      <br>
      <br>
      are available in the git repository at:
      <br>
      <br>
      =C2=A0 <a class=3D"moz-txt-link-abbreviated"
        href=3D"mailto:git@github.com:yakir-Yang/linux.git">git@github.co=
m:yakir-Yang/linux.git</a>
      upstream/analogix-dp-20160705
      <br>
      <br>
      for you to fetch changes up to
      4787b4343fef2e3227b0a69934a8f89e53091fb9:
      <br>
      <br>
      =C2=A0 dt-bindings: analogix_dp: rockchip: correct the wrong compat=
ible
      name (2016-07-05 09:18:32 +0800)
      <br>
      <br>
      ----------------------------------------------------------------
      <br>
      Yakir Yang (10):
      <br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/bridge: analogix_dp: correct the=
 register bit define
      error in ANALOGIX_DP_PLL_REG_1
      <br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/bridge: analogix_dp: some rockch=
ip chips need to flip
      REF_CLK bit setting
      <br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/rockchip: analogix_dp: add rk339=
9 eDP support
      <br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/rockchip: analogix_dp: make pane=
l detect to an optional
      action
      <br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/bridge: analogix_dp: passing the=
 connector as an
      argument in .get_modes()
      <br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/rockchip: analogix_dp: correct t=
he connector display
      color format and bpc
      <br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/rockchip: analogix_dp: update th=
e comments about why
      need to hardcode VOP output mode
      <br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/bridge: analogix_dp: fix no drm =
hpd event when panel
      plug in
      <br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/rockchip: analogix_dp: introduce=
 the pclk for grf
      <br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dt-bindings: analogix_dp: rockchip: =
correct the wrong
      compatible name
      <br>
      <br>
      =C2=A0Documentation/devicetree/bindings/display/bridge/analogix_dp.=
txt
      |=C2=A0=C2=A0 1 +
      <br>
      =C2=A0Documentation/devicetree/bindings/display/rockchip/analogix_d=
p-rockchip.txt
      |=C2=A0=C2=A0 9 +++++-
      <br>
      =C2=A0drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |=C2=A0=C2=
=A0 2 +-
      <br>
      =C2=A0drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |=C2=A0=C2=
=A0 8 ++---
      <br>
      =C2=A0drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c |=C2=A0 12 =
++++---
      <br>
      =C2=A0drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h |=C2=A0=C2=A0=
 5 +--
      <br>
      =C2=A0drivers/gpu/drm/exynos/exynos_dp.c |=C2=A0=C2=A0 4 +--
      <br>
      =C2=A0drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 127
+++++++++++++++++++++++++++++++++++++++++++++++++++----------------------=
--<br>
      =C2=A0include/drm/bridge/analogix_dp.h |=C2=A0=C2=A0 9 +++++-
      <br>
      =C2=A09 files changed, 122 insertions(+), 55 deletions(-)
      <br>
      <br>
    </div>
  </body>
</html>

--------------010708020803000909070909--


--===============0491893687==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0491893687==--
