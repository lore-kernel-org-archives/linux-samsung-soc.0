From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v4 00/14] drm/exynos: support LCD I80 interface display
Date: Thu, 05 Jun 2014 17:14:45 +0900
Message-ID: <539026F5.2010005@samsung.com>
References: <1401949194-20092-1-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:56534 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751125AbaFEIO4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Jun 2014 04:14:56 -0400
In-reply-to: <1401949194-20092-1-git-send-email-yj44.cho@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: YoungJun Cho <yj44.cho@samsung.com>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, thierry.reding@gmail.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, a.hajda@samsung.com


Hi all,


Is there anyone who are reviewing this patch series? If there is no any
comment, I'd like to pick them up after test.

Thanks,
Inki Dae

On 2014=EB=85=84 06=EC=9B=94 05=EC=9D=BC 15:19, YoungJun Cho wrote:
> Hi,
>=20
> This series adds LCD I80 interface display support for Exynos DRM dri=
ver.
> The FIMD(display controller) specification describes it as "LCD I80 i=
nterface"
> and the DSI specification describes it as "Command mode interface".
>=20
> This is based on exynos-drm-next branch.
>=20
> The previous patches,
> RFC: http://www.spinics.net/lists/dri-devel/msg58898.html
> V1: http://www.spinics.net/lists/dri-devel/msg59291.html
> V2: http://www.spinics.net/lists/dri-devel/msg59867.html
> V3: http://www.spinics.net/lists/dri-devel/msg60708.html
>=20
> Changelog v2:
> - Fixes typo and removes unnecessary error log (commented by Andrzej =
Hazda)
> - Adds missed pendlig_flip flag clear points (commented by Daniel Kur=
tz)
>=20
> Changelog v3:
> - Removes generic command mode and command mode display timing interf=
ace.
> - Moves I80 interface timings from panel DT to the FIMD(display contr=
oller) DT.
>=20
> Changelog v4:
> - Removes exynos5 sysreg(syscon) DT bindings and node from dtsi becau=
se
>   it was already updated by linux-samsung-soc (commented by Vivek Gau=
tam)
>=20
> Patches 1 and 2 fix trivial bugs.
>=20
> Patches 3, 4, 5 and 6 implement FIMD(display controller) I80 interfac=
e.
> The MIPI DSI command mode based panel generates Tearing Effect synchr=
onization
> signal between MCU and FB to display video image, and FIMD should tri=
gger to
> transfer video image at this signal.
> So the panel should receive the TE IRQ and call TE handler chains to =
notify
> it to the FIMD.
>=20
> Patches 7 and 8 implement to use Exynos5420 SoC DSI driver which is d=
ifferent
> from previous Exynos4 SoCs for some registers control.
>=20
> Patches 9 and 10 introduce MIPI DSI command mode based Samsung S6E3FA=
0 AMOLED
> 5.7" LCD drm panel driver.
>=20
> The ohters add DT property nodes to support MIPI DSI command mode.
>=20
> I welcome any comments.
>=20
> Thank you.
> Best regards YJ
>=20
> YoungJun Cho (14):
>   drm/exynos: dsi: move the EoT packets configuration point
>   drm/exynos: use wait_event_timeout() for safety usage
>   ARM: dts: samsung-fimd: add LCD I80 interface specific properties
>   drm/exynos: add TE handler to support LCD I80 interface
>   drm/exynos: dsi: add TE handler to support LCD I80 interface
>   drm/exynos: fimd: support LCD I80 interface
>   ARM: dts: exynos_dsim: add exynos5420 compatible to DT bindings
>   drm/exynos: dsi: add driver data to support Exynos5420
>   ARM: dts: s6e3fa0: add DT bindings
>   drm/panel: add S6E3FA0 driver
>   ARM: dts: exynos4: add system register property
>   ARM: dts: exynos5: add system register property
>   ARM: dts: exynos5420: add mipi-phy node
>   ARM: dts: exynos5420: add dsi node
>=20
>  .../devicetree/bindings/panel/samsung,s6e3fa0.txt  |   46 ++
>  .../devicetree/bindings/video/exynos_dsim.txt      |    4 +-
>  .../devicetree/bindings/video/samsung-fimd.txt     |   28 +
>  arch/arm/boot/dts/exynos4.dtsi                     |    1 +
>  arch/arm/boot/dts/exynos5.dtsi                     |    1 +
>  arch/arm/boot/dts/exynos5420.dtsi                  |   20 +
>  drivers/gpu/drm/exynos/Kconfig                     |    1 +
>  drivers/gpu/drm/exynos/exynos_drm_crtc.c           |   18 +-
>  drivers/gpu/drm/exynos/exynos_drm_crtc.h           |    7 +
>  drivers/gpu/drm/exynos/exynos_drm_drv.h            |    3 +
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c            |  175 +++++-
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c           |  287 ++++++++--
>  drivers/gpu/drm/panel/Kconfig                      |    7 +
>  drivers/gpu/drm/panel/Makefile                     |    1 +
>  drivers/gpu/drm/panel/panel-s6e3fa0.c              |  568 ++++++++++=
++++++++++
>  include/drm/drm_mipi_dsi.h                         |    8 +
>  include/video/samsung_fimd.h                       |    3 +-
>  17 files changed, 1107 insertions(+), 71 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/panel/samsung,s=
6e3fa0.txt
>  create mode 100644 drivers/gpu/drm/panel/panel-s6e3fa0.c
>=20
