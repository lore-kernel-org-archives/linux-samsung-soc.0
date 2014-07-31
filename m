From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] ARM: exynos_defconfig: Enable PL330 DMA
Date: Thu, 31 Jul 2014 16:29:13 +0200
Message-ID: <11826036.v8B4Gvn5AK@amdc1032>
References: <1406785359-21669-1-git-send-email-tushar.b@samsung.com>
 <53D9DDAD.7040602@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:20692 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751008AbaGaO3S convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jul 2014 10:29:18 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N9K00JIHYWSHP50@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 31 Jul 2014 23:29:16 +0900 (KST)
In-reply-to: <53D9DDAD.7040602@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: Tushar Behera <tushar.b@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, olof@lixom.net, khilman@linaro.org, trblinux@gmail.com


Hi,

On Thursday, July 31, 2014 08:09:49 AM Andreas F=E4rber wrote:
> Hi Tushar,
>=20
> Am 31.07.2014 07:42, schrieb Tushar Behera:
> > We are getting a system hang on Arndale-Octa board if PL330_DMA is =
not
> > enabled. The issue is related to [1].
> >=20
> > AUDSS block provides the clock for audio DMA controller. Any operat=
ion
> > on this clock requires that the clock to AUDSS block be enabled. In
> > current configuration, the clock is gated during late boot process =
when
> > all unused clocks are disabled.
> >=20
> > When PL330_DMA is enabled, the 'apb_pclk' is enabled/disabled durin=
g
> > amba_probe(). Otherwise, this clock is also disabled during late bo=
ot.
> > If the AUDSS block clock is disabled by then, we get a system hang.

Could you please explain this more?

I don't get it how apb_pclk is related to AUDSS block clock and why
enabling PL330_DMA fixes the issue (I suspect that enabling PL330_DMA
enables PL330 DMA AMBA device so the amba_probe() keeps apb_pclk clock
enabled but what is its relation to AUDSS block clock?).

> > [1] https://lkml.org/lkml/2014/6/11/32
> >=20
> > Signed-off-by: Tushar Behera <tushar.b@samsung.com>
> > ---
> >  arch/arm/configs/exynos_defconfig |    2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/e=
xynos_defconfig
> > index e07a227..c5888e8 100644
> > --- a/arch/arm/configs/exynos_defconfig
> > +++ b/arch/arm/configs/exynos_defconfig
> > @@ -109,6 +109,8 @@ CONFIG_MMC_DW_IDMAC=3Dy
> >  CONFIG_MMC_DW_EXYNOS=3Dy
> >  CONFIG_RTC_CLASS=3Dy
> >  CONFIG_RTC_DRV_S3C=3Dy
> > +CONFIG_DMADEVICES=3Dy
> > +CONFIG_PL330_DMA=3Dy
> >  CONFIG_COMMON_CLK_MAX77686=3Dy
> >  CONFIG_EXT2_FS=3Dy
> >  CONFIG_EXT3_FS=3Dy
>=20
> Reviewed-by: Andreas F=E4rber <afaerber@suse.de>
>=20
> Turns out I had those enabled in my local config when testing the mem=
ory
> patches on Arndale Octa.
>=20
> multi_v7_defconfig has them already.

I observe more and more discrepancies between exynos_defconfig and
multi_v7_defconfig when it comes to Exynos specific options.  I wanted
to avoid this by proposing exynos_defconfig removal when multiplatform
support was added to Exynos.  Unfortunately there was no agreement on
this at that time.  It would really be great if all Exynos users run on
a common configuration so the testing is done more efficiently.

> However, shouldn't Kconfig grow a dependency to enable those options
> automatically for whatever driver or SoC needs them?

Yes, moreover it is not clear yet that enabling PL330 DMA to resolve
the hang issue is the right approach (to be honest it looks like
a workaround for the lack of proper clock dependencies in a code).

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
