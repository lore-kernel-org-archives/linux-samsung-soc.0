From: Tushar Behera <trblinux@gmail.com>
Subject: Re: [PATCH] ARM: exynos_defconfig: Enable PL330 DMA
Date: Fri, 1 Aug 2014 07:54:35 +0530
Message-ID: <CAC5m3BwDtu+=QZGDsvT2LHju5Qg6wi7xcmR+csF7-7sET8GynA@mail.gmail.com>
References: <1406785359-21669-1-git-send-email-tushar.b@samsung.com>
	<53D9DDAD.7040602@suse.de>
	<11826036.v8B4Gvn5AK@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f51.google.com ([209.85.192.51]:58000 "EHLO
	mail-qg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751072AbaHACYg convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jul 2014 22:24:36 -0400
Received: by mail-qg0-f51.google.com with SMTP id a108so4915601qge.38
        for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Jul 2014 19:24:35 -0700 (PDT)
In-Reply-To: <11826036.v8B4Gvn5AK@amdc1032>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, ML Arch-Arm <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>

On Thu, Jul 31, 2014 at 7:59 PM, Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:
>
> Hi,
>
> On Thursday, July 31, 2014 08:09:49 AM Andreas F=C3=A4rber wrote:
>> Hi Tushar,
>>
>> Am 31.07.2014 07:42, schrieb Tushar Behera:
>> > We are getting a system hang on Arndale-Octa board if PL330_DMA is=
 not
>> > enabled. The issue is related to [1].
>> >
>> > AUDSS block provides the clock for audio DMA controller. Any opera=
tion
>> > on this clock requires that the clock to AUDSS block be enabled. I=
n
>> > current configuration, the clock is gated during late boot process=
 when
>> > all unused clocks are disabled.
>> >
>> > When PL330_DMA is enabled, the 'apb_pclk' is enabled/disabled duri=
ng
>> > amba_probe(). Otherwise, this clock is also disabled during late b=
oot.
>> > If the AUDSS block clock is disabled by then, we get a system hang=
=2E
>
> Could you please explain this more?
>
> I don't get it how apb_pclk is related to AUDSS block clock and why

apb_pclk for ADMA is provided by AUDSS block on Exynos5420. Access to
the control register for this clock cause the system hang when the
clock to the AUDSS block is gated.

> enabling PL330_DMA fixes the issue (I suspect that enabling PL330_DMA
> enables PL330 DMA AMBA device so the amba_probe() keeps apb_pclk cloc=
k
> enabled but what is its relation to AUDSS block clock?).
>
>> > [1] https://lkml.org/lkml/2014/6/11/32
>> >
>> > Signed-off-by: Tushar Behera <tushar.b@samsung.com>
>> > ---
>> >  arch/arm/configs/exynos_defconfig |    2 ++
>> >  1 file changed, 2 insertions(+)
>> >
>> > diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/=
exynos_defconfig
>> > index e07a227..c5888e8 100644
>> > --- a/arch/arm/configs/exynos_defconfig
>> > +++ b/arch/arm/configs/exynos_defconfig
>> > @@ -109,6 +109,8 @@ CONFIG_MMC_DW_IDMAC=3Dy
>> >  CONFIG_MMC_DW_EXYNOS=3Dy
>> >  CONFIG_RTC_CLASS=3Dy
>> >  CONFIG_RTC_DRV_S3C=3Dy
>> > +CONFIG_DMADEVICES=3Dy
>> > +CONFIG_PL330_DMA=3Dy
>> >  CONFIG_COMMON_CLK_MAX77686=3Dy
>> >  CONFIG_EXT2_FS=3Dy
>> >  CONFIG_EXT3_FS=3Dy
>>
>> Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
>>
>> Turns out I had those enabled in my local config when testing the me=
mory
>> patches on Arndale Octa.
>>
>> multi_v7_defconfig has them already.
>
> I observe more and more discrepancies between exynos_defconfig and
> multi_v7_defconfig when it comes to Exynos specific options.  I wante=
d
> to avoid this by proposing exynos_defconfig removal when multiplatfor=
m
> support was added to Exynos.  Unfortunately there was no agreement on
> this at that time.  It would really be great if all Exynos users run =
on
> a common configuration so the testing is done more efficiently.
>
>> However, shouldn't Kconfig grow a dependency to enable those options
>> automatically for whatever driver or SoC needs them?
>
> Yes, moreover it is not clear yet that enabling PL330 DMA to resolve
> the hang issue is the right approach (to be honest it looks like
> a workaround for the lack of proper clock dependencies in a code).
>

This, for sure, is only a temporary fix. The real fix lies in patch
[1] (mentioned in the original patch comment) which needs a bit of
redesign. I am not able to work on that because of lack of time.

> Best regards,
> --
> Bartlomiej Zolnierkiewicz
> Samsung R&D Institute Poland
> Samsung Electronics
>



--=20
Tushar Behera
