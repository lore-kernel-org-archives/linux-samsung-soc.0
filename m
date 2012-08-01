From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: Re: [PATCH] ARM: EXYNOS: Add I2S SFR base addresses
Date: Wed, 01 Aug 2012 12:04:14 +0900
Message-ID: <030801cd6f92$55370570$ffa51050$%kim@samsung.com>
References: <0M7R00MY1GHTPK20@ms14.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:36728 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753914Ab2HADEQ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Jul 2012 23:04:16 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M82005O636O3WJ0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Aug 2012 12:04:15 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M820000Z372SN70@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Aug 2012 12:04:15 +0900 (KST)
In-reply-to: <0M7R00MY1GHTPK20@ms14.samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: padma.v@samsung.com, 'Sachin Kamat' <sachin.kamat@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'CHANDRASEKAR RAMAKRISHNAN' <rcsekar@samsung.com>, 'Sangbeom Kim' <sbkim73@samsung.com>, 'SangSu Park' <sangsu4u.park@samsung.com>, ben-linux@fluff.org, olofj@google.com, thutt@chromium.org, 'SUNIL JOSHI' <joshi@samsung.com>

PADMAVATHI VENNA wrote:

Padma, don't post with html styled :(

And you need to check the regarding addresses as per Sachin commented.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

------- Original Message -------
Sender : Sachin Kamat<sachin.kamat@linaro.org>
Date : Jul 26, 2012 13:41 (GMT+09:00)
Title : Re: [PATCH] ARM: EXYNOS: Add I2S SFR base addresses
=A0
On 25 July 2012 17:35, Padmavathi Venna wrote:
> The base address of I2S 0 controller is similar in exynos4 and exynos=
5
> platforms. So this patch defines a common macro for the I2S controlle=
r
> 0 base address in both the platforms and use the same macro.
>
> This patch also defines the I2S controller 1,2 base addresses in exyn=
os5
> and correct the I2S controller 1 base address in exynos4
>
> Signed-off-by: Padmavathi Venna=20
> ---
>=A0=A0arch/arm/mach-exynos/dev-audio.c=A0=A0=A0=A0=A0=A0=A0=A0|=A0=A0=A0=
=A02 +-
>=A0=A0arch/arm/mach-exynos/include/mach/map.h |=A0=A0=A0=A06 ++++--
>=A0=A02 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/dev-audio.c
b/arch/arm/mach-exynos/dev-audio.c
> index b33a5b6..5dbc9a2 100644
> --- a/arch/arm/mach-exynos/dev-audio.c
> +++ b/arch/arm/mach-exynos/dev-audio.c
> @@ -62,7 +62,7 @@ static struct s3c_audio_pdata i2sv5_pdata =3D {
>=A0=A0};
>
>=A0=A0static struct resource exynos4_i2s0_resource[] =3D {
> -=A0=A0=A0=A0=A0=A0 [0] =3D DEFINE_RES_MEM(EXYNOS4_PA_I2S0, SZ_256),
> +=A0=A0=A0=A0=A0=A0 [0] =3D DEFINE_RES_MEM(EXYNOS_PA_I2S0, SZ_256),
>=A0=A0=A0=A0=A0=A0=A0=A0 [1] =3D DEFINE_RES_DMA(DMACH_I2S0_TX),
>=A0=A0=A0=A0=A0=A0=A0=A0 [2] =3D DEFINE_RES_DMA(DMACH_I2S0_RX),
>=A0=A0=A0=A0=A0=A0=A0=A0 [3] =3D DEFINE_RES_DMA(DMACH_I2S0S_TX),
> diff --git a/arch/arm/mach-exynos/include/mach/map.h
b/arch/arm/mach-exynos/include/mach/map.h
> index c72b675..5cf7d91 100644
> --- a/arch/arm/mach-exynos/include/mach/map.h
> +++ b/arch/arm/mach-exynos/include/mach/map.h
> @@ -39,9 +39,11 @@
>
>=A0=A0#define EXYNOS4_PA_G2D=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 0x12800000
>
> -#define EXYNOS4_PA_I2S0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A00x03830000
> -#define EXYNOS4_PA_I2S1=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A00xE3100000
> +#define EXYNOS_PA_I2S0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 0x03830000
> +#define EXYNOS4_PA_I2S1=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A00xE2100000
>=A0=A0#define EXYNOS4_PA_I2S2=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A00xE2A00000

As per the TRM, these addresses (I2S1 and I2S2) are 0x13960000 and
0x13970000 respectively on Exynos4412 SoC.
Please verify.
I didn't verify Exynos4412 before. I will send a new patch for this.


> +#define EXYNOS5_PA_I2S1=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A00x12D60000
> +#define EXYNOS5_PA_I2S2=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A00x12D70000
>
>=A0=A0#define EXYNOS4_PA_PCM0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A00x03840000
>=A0=A0#define EXYNOS4_PA_PCM1=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A00x13980000
> --
> 1.7.4.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe
linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at=A0=A0http://vger.kernel.org/majordomo-info.htm=
l
