From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3] arm64: defconfig: Enable Panfrost and Lima drivers
Date: Sun, 23 Jun 2019 21:16:40 +0200
Message-ID: <CAJKOXPcFFY08R1H-DrrzX2BC3L8x4NPJTP7nDn9yixAvmaiF9Q@mail.gmail.com>
References: <20190621180208.25361-7-krzk@kernel.org> <20190622191838.29850-1-krzk@kernel.org>
 <CAGTfZH2g6E2pCEtqjfCd+PjEzjwc2AB75LXJfCeO+PcYLiLTUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGTfZH2g6E2pCEtqjfCd+PjEzjwc2AB75LXJfCeO+PcYLiLTUw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: cwchoi00@gmail.com
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Olof Johansson <olof@lixom.net>, Jagan Teki <jagan@amarulasolutions.com>, Simon Horman <horms+renesas@verge.net.au>, Leonard Crestez <leonard.crestez@nxp.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Dinh Nguyen <dinguyen@kernel.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, Vasily Khoruzhick <anarsoul@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Sun, 23 Jun 2019 at 06:31, Chanwoo Choi <cwchoi00@gmail.com> wrote:
>
> Hi Krzysztof,
>
> 2019=EB=85=84 6=EC=9B=94 23=EC=9D=BC (=EC=9D=BC) =EC=98=A4=EC=A0=84 4:20,=
 Krzysztof Kozlowski <krzk@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=
:
> >
> > Enable support for Mali GPU with Panfrost and Lima drivers for:
> > 1. Samsung Exynos5433 and Exynos7 (having Mali T760),
> > 2. Allwiner A64 and H5 (Mali 400/450).
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> >
> > ---
> >
> > Changes since v1:
> > 1. Enable Lima driver
> > ---
> >  arch/arm64/configs/defconfig | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfi=
g
> > index fbbc065415d4..3d31611368af 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -518,6 +518,8 @@ CONFIG_DRM_HISI_HIBMC=3Dm
> >  CONFIG_DRM_HISI_KIRIN=3Dm
> >  CONFIG_DRM_MESON=3Dm
> >  CONFIG_DRM_PL111=3Dm
> > +CONFIG_DRM_LIMA=3Dm
> > +CONFIG_DRM_PANFROST=3Dm
> >  CONFIG_FB=3Dy
> >  CONFIG_FB_MODE_HELPERS=3Dy
> >  CONFIG_BACKLIGHT_GENERIC=3Dm
> > @@ -718,7 +720,6 @@ CONFIG_ARCH_TEGRA_194_SOC=3Dy
> >  CONFIG_ARCH_K3_AM6_SOC=3Dy
> >  CONFIG_SOC_TI=3Dy
> >  CONFIG_TI_SCI_PM_DOMAINS=3Dy
> > -CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=3Dy
>
> Exynos5433-tm2 board support the exynos-bus device which
> used the simple_ondmenad governor of devfreq.
> Why do you remove this configuration from the defconfig?

It is selected by default by DRM_PANFROST. The difference is that
PANFROST selects it as module. The 'y' is chosen because of:
  SCSI_UFSHCD [=3Dy] && SCSI_LOWLEVEL [=3Dy] && SCSI [=3Dy] && SCSI_DMA [=
=3Dy]

Best regards,
Krzysztof
