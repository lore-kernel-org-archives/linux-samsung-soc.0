From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH V2 2/2] ARM: SAMSUNG: Cleanup resources by using macro
Date: Mon, 3 Oct 2011 12:53:44 +0900
Message-ID: <CAH9JG2Wc4M2dVFOfNE5jgsygvigE8RbPH_yLcMqarr64LfbENw@mail.gmail.com>
References: <005901cc817e$51a56d00$f4f04700$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:63110 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751630Ab1JCDxq convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 2 Oct 2011 23:53:46 -0400
Received: by qadb15 with SMTP id b15so1215511qad.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 02 Oct 2011 20:53:45 -0700 (PDT)
In-Reply-To: <005901cc817e$51a56d00$f4f04700$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>

On Mon, Oct 3, 2011 at 12:41 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> This patch adds macro SAMSUNG_RES_MEM, SAMSUNG_RES_IRQ
> and so on to cleanup regarding 'struct resource' by using
> defined helpers at <linux/ioport.h>.
>
> Cc: Ben Dooks <ben-linux@fluff.org>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> Changes since v1:
> - Address comments from Russell King
> =A0Using defined helpers to define resource
>
> =A0arch/arm/mach-s3c2410/include/mach/map.h =A0| =A0 =A01 +
> =A0arch/arm/plat-samsung/devs.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0697 +=
++++------------------------
> =A0arch/arm/plat-samsung/include/plat/devs.h | =A0 11 +
> =A03 files changed, 129 insertions(+), 580 deletions(-)
>
> diff --git a/arch/arm/mach-s3c2410/include/mach/map.h b/arch/arm/mach=
-s3c2410/include/mach/map.h
> index 4cf495f..78ae807 100644
> --- a/arch/arm/mach-s3c2410/include/mach/map.h
> +++ b/arch/arm/mach-s3c2410/include/mach/map.h
> @@ -149,6 +149,7 @@
> =A0#define S3C24XX_PA_RTC =A0 =A0 =A0S3C2410_PA_RTC
> =A0#define S3C24XX_PA_ADC =A0 =A0 =A0S3C2410_PA_ADC
> =A0#define S3C24XX_PA_SPI =A0 =A0 =A0S3C2410_PA_SPI
> +#define S3C24XX_PA_SPI1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(S3C2410_PA_S=
PI + S3C2410_SPI1)
> =A0#define S3C24XX_PA_SDI =A0 =A0 =A0S3C2410_PA_SDI
> =A0#define S3C24XX_PA_NAND =A0 =A0 =A0 =A0 =A0 =A0S3C2410_PA_NAND
>
> diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/dev=
s.c
> index a2112aa..ec14e36 100644
> --- a/arch/arm/plat-samsung/devs.c
> +++ b/arch/arm/plat-samsung/devs.c
> @@ -67,34 +67,11 @@ static u64 samsung_device_dma_mask =3D DMA_BIT_MA=
SK(32);
> =A0/* AC97 */
> =A0#ifdef CONFIG_CPU_S3C2440
> =A0static struct resource s3c_ac97_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S3C2440_PA_AC97,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S3C2440_PA_AC97 + S3C24=
40_SZ_AC97 - 1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_S3C244x_AC97,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_S3C244x_AC97,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [2] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =3D "PCM out",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D DMACH_PCM_OUT,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D DMACH_PCM_OUT,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_DMA,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [3] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =3D "PCM in",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D DMACH_PCM_IN,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D DMACH_PCM_IN,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_DMA,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [4] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =3D "Mic in",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D DMACH_MIC_IN,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D DMACH_MIC_IN,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_DMA,
> - =A0 =A0 =A0 },
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S3C2440, AC97, S3C2440_SZ_AC97)=
,
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(S3C244x_AC97),
> + =A0 =A0 =A0 [2] =3D SAMSUNG_RES_DMA_NAMED(PCM_OUT, "PCM out"),
> + =A0 =A0 =A0 [3] =3D SAMSUNG_RES_DMA_NAMED(PCM_IN, "PCM in"),
> + =A0 =A0 =A0 [4] =3D SAMSUNG_RES_DMA_NAMED(MIC_IN, "Mic in"),
> =A0};
>
> =A0struct platform_device s3c_device_ac97 =3D {
> @@ -113,21 +90,9 @@ struct platform_device s3c_device_ac97 =3D {
>
> =A0#ifdef CONFIG_PLAT_S3C24XX
> =A0static struct resource s3c_adc_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S3C24XX_PA_ADC,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S3C24XX_PA_ADC + S3C24X=
X_SZ_ADC - 1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_TC,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_TC,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [2] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_ADC,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_ADC,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 }
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S3C24XX, ADC, S3C24XX_SZ_ADC),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(TC),
> + =A0 =A0 =A0 [2] =3D SAMSUNG_RES_IRQ(ADC),
> =A0};
>
> =A0struct platform_device s3c_device_adc =3D {
> @@ -140,21 +105,9 @@ struct platform_device s3c_device_adc =3D {
>
> =A0#if defined(CONFIG_SAMSUNG_DEV_ADC)
> =A0static struct resource s3c_adc_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D SAMSUNG_PA_ADC,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D SAMSUNG_PA_ADC + SZ_256=
 - 1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_TC,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_TC,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [2] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_ADC,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_ADC,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 },
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(SAMSUNG, ADC, SZ_256),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(TC),
> + =A0 =A0 =A0 [2] =3D SAMSUNG_RES_IRQ(ADC),
> =A0};
>
> =A0struct platform_device s3c_device_adc =3D {
> @@ -169,16 +122,8 @@ struct platform_device s3c_device_adc =3D {
>
> =A0#ifdef CONFIG_CPU_S3C2440
> =A0static struct resource s3c_camif_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S3C2440_PA_CAMIF,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S3C2440_PA_CAMIF + S3C2=
440_SZ_CAMIF - 1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_CAM,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_CAM,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 }
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S3C2440, CAMIF, S3C2440_SZ_CAMI=
=46),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(CAM),
> =A0};
>
> =A0struct platform_device s3c_device_camif =3D {
> @@ -217,26 +162,10 @@ struct platform_device samsung_asoc_idma =3D {
>
> =A0#ifdef CONFIG_S3C_DEV_FB
> =A0static struct resource s3c_fb_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S3C_PA_FB,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S3C_PA_FB + SZ_16K - 1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_LCD_VSYNC,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_LCD_VSYNC,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [2] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_LCD_FIFO,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_LCD_FIFO,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [3] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_LCD_SYSTEM,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_LCD_SYSTEM,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 },
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S3C, FB, SZ_16K),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(LCD_VSYNC),
> + =A0 =A0 =A0 [2] =3D SAMSUNG_RES_IRQ(LCD_FIFO),
> + =A0 =A0 =A0 [3] =3D SAMSUNG_RES_IRQ(LCD_SYSTEM),
> =A0};
>
> =A0struct platform_device s3c_device_fb =3D {
> @@ -261,16 +190,8 @@ void __init s3c_fb_set_platdata(struct s3c_fb_pl=
atdata *pd)
>
> =A0#ifdef CONFIG_S5P_DEV_FIMC0
> =A0static struct resource s5p_fimc0_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S5P_PA_FIMC0,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S5P_PA_FIMC0 + SZ_4K - =
1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_FIMC0,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_FIMC0,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 },
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S5P, FIMC0, SZ_4K),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(FIMC0),
> =A0};
>
> =A0struct platform_device s5p_device_fimc0 =3D {
> @@ -287,16 +208,8 @@ struct platform_device s5p_device_fimc0 =3D {
>
> =A0#ifdef CONFIG_S5P_DEV_FIMC1
> =A0static struct resource s5p_fimc1_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S5P_PA_FIMC1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S5P_PA_FIMC1 + SZ_4K - =
1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_FIMC1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_FIMC1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 },
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S5P, FIMC1, SZ_4K),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(FIMC1),
> =A0};
>
> =A0struct platform_device s5p_device_fimc1 =3D {
> @@ -313,16 +226,8 @@ struct platform_device s5p_device_fimc1 =3D {
>
> =A0#ifdef CONFIG_S5P_DEV_FIMC2
> =A0static struct resource s5p_fimc2_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S5P_PA_FIMC2,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S5P_PA_FIMC2 + SZ_4K - =
1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_FIMC2,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_FIMC2,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 },
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S5P, FIMC2, SZ_4K),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(FIMC2),
> =A0};
>
> =A0struct platform_device s5p_device_fimc2 =3D {
> @@ -339,16 +244,8 @@ struct platform_device s5p_device_fimc2 =3D {
>
> =A0#ifdef CONFIG_S5P_DEV_FIMC3
> =A0static struct resource s5p_fimc3_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S5P_PA_FIMC3,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S5P_PA_FIMC3 + SZ_4K - =
1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_FIMC3,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_FIMC3,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 },
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S5P, FIMC3, SZ_4K),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(FIMC3),
> =A0};
>
> =A0struct platform_device s5p_device_fimc3 =3D {
> @@ -367,26 +264,10 @@ struct platform_device s5p_device_fimc3 =3D {
>
> =A0#ifdef CONFIG_S5P_DEV_FIMD0
> =A0static struct resource s5p_fimd0_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S5P_PA_FIMD0,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S5P_PA_FIMD0 + SZ_32K -=
 1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_FIMD0_VSYNC,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_FIMD0_VSYNC,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [2] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_FIMD0_FIFO,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_FIMD0_FIFO,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [3] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_FIMD0_SYSTEM,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_FIMD0_SYSTEM,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 },
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S5P, FIMD0, SZ_32K),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(FIMD0_VSYNC),
> + =A0 =A0 =A0 [2] =3D SAMSUNG_RES_IRQ(FIMD0_FIFO),
> + =A0 =A0 =A0 [3] =3D SAMSUNG_RES_IRQ(FIMD0_SYSTEM),
> =A0};
>
> =A0struct platform_device s5p_device_fimd0 =3D {
> @@ -425,20 +306,10 @@ void __init s3c_hwmon_set_platdata(struct s3c_h=
wmon_pdata *pd)
>
> =A0/* HSMMC */
>
> -#define S3C_SZ_HSMMC =A0 0x1000
> -
> =A0#ifdef CONFIG_S3C_DEV_HSMMC
> =A0static struct resource s3c_hsmmc_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S3C_PA_HSMMC0,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S3C_PA_HSMMC0 + S3C_SZ_=
HSMMC - 1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_HSMMC0,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_HSMMC0,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 }
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S3C, HSMMC0, SZ_4K),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(HSMMC0),
> =A0};
>
> =A0struct s3c_sdhci_platdata s3c_hsmmc0_def_platdata =3D {
> @@ -468,16 +339,8 @@ void s3c_sdhci0_set_platdata(struct s3c_sdhci_pl=
atdata *pd)
>
> =A0#ifdef CONFIG_S3C_DEV_HSMMC1
> =A0static struct resource s3c_hsmmc1_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S3C_PA_HSMMC1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S3C_PA_HSMMC1 + S3C_SZ_=
HSMMC - 1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_HSMMC1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_HSMMC1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 }
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S3C, HSMMC1, SZ_4K),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(HSMMC1),
> =A0};
>
> =A0struct s3c_sdhci_platdata s3c_hsmmc1_def_platdata =3D {
> @@ -509,16 +372,8 @@ void s3c_sdhci1_set_platdata(struct s3c_sdhci_pl=
atdata *pd)
>
> =A0#ifdef CONFIG_S3C_DEV_HSMMC2
> =A0static struct resource s3c_hsmmc2_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S3C_PA_HSMMC2,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S3C_PA_HSMMC2 + S3C_SZ_=
HSMMC - 1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_HSMMC2,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_HSMMC2,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 }
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S3C, HSMMC2, SZ_4K),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(HSMMC2),
> =A0};
>
> =A0struct s3c_sdhci_platdata s3c_hsmmc2_def_platdata =3D {
> @@ -548,16 +403,8 @@ void s3c_sdhci2_set_platdata(struct s3c_sdhci_pl=
atdata *pd)
>
> =A0#ifdef CONFIG_S3C_DEV_HSMMC3
> =A0static struct resource s3c_hsmmc3_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S3C_PA_HSMMC3,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S3C_PA_HSMMC3 + S3C_SZ_=
HSMMC - 1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_HSMMC3,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_HSMMC3,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 }
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S3C, HSMMC3, SZ_4K),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(HSMMC3),
> =A0};
>
> =A0struct s3c_sdhci_platdata s3c_hsmmc3_def_platdata =3D {
> @@ -588,16 +435,8 @@ void s3c_sdhci3_set_platdata(struct s3c_sdhci_pl=
atdata *pd)
> =A0/* I2C */
>
> =A0static struct resource s3c_i2c0_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S3C_PA_IIC,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S3C_PA_IIC + SZ_4K - 1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_IIC,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_IIC,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 },
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S3C, IIC, SZ_4K),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(IIC),
> =A0};
>
> =A0struct platform_device s3c_device_i2c0 =3D {
> @@ -634,16 +473,8 @@ void __init s3c_i2c0_set_platdata(struct s3c2410=
_platform_i2c *pd)
>
> =A0#ifdef CONFIG_S3C_DEV_I2C1
> =A0static struct resource s3c_i2c1_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S3C_PA_IIC1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S3C_PA_IIC1 + SZ_4K - 1=
,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_IIC1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_IIC1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 },
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S3C, IIC1, SZ_4K),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(IIC1),
> =A0};
>
> =A0struct platform_device s3c_device_i2c1 =3D {
> @@ -672,16 +503,8 @@ void __init s3c_i2c1_set_platdata(struct s3c2410=
_platform_i2c *pd)
>
> =A0#ifdef CONFIG_S3C_DEV_I2C2
> =A0static struct resource s3c_i2c2_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S3C_PA_IIC2,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S3C_PA_IIC2 + SZ_4K - 1=
,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_IIC2,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_IIC2,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 },
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S3C, IIC2, SZ_4K),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(IIC2),
> =A0};
>
> =A0struct platform_device s3c_device_i2c2 =3D {
> @@ -710,16 +533,8 @@ void __init s3c_i2c2_set_platdata(struct s3c2410=
_platform_i2c *pd)
>
> =A0#ifdef CONFIG_S3C_DEV_I2C3
> =A0static struct resource s3c_i2c3_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S3C_PA_IIC3,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S3C_PA_IIC3 + SZ_4K - 1=
,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_IIC3,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_IIC3,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 },
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S3C, IIC3, SZ_4K),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(IIC3),
> =A0};
>
> =A0struct platform_device s3c_device_i2c3 =3D {
> @@ -748,16 +563,8 @@ void __init s3c_i2c3_set_platdata(struct s3c2410=
_platform_i2c *pd)
>
> =A0#ifdef CONFIG_S3C_DEV_I2C4
> =A0static struct resource s3c_i2c4_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S3C_PA_IIC4,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S3C_PA_IIC4 + SZ_4K - 1=
,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_IIC4,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_IIC4,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 },
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S3C, IIC4, SZ_4K),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(IIC4),
> =A0};
>
> =A0struct platform_device s3c_device_i2c4 =3D {
> @@ -786,16 +593,8 @@ void __init s3c_i2c4_set_platdata(struct s3c2410=
_platform_i2c *pd)
>
> =A0#ifdef CONFIG_S3C_DEV_I2C5
> =A0static struct resource s3c_i2c5_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S3C_PA_IIC5,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S3C_PA_IIC5 + SZ_4K - 1=
,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_IIC5,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_IIC5,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 },
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S3C, IIC5, SZ_4K),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(IIC5),
> =A0};
>
> =A0struct platform_device s3c_device_i2c5 =3D {
> @@ -824,16 +623,8 @@ void __init s3c_i2c5_set_platdata(struct s3c2410=
_platform_i2c *pd)
>
> =A0#ifdef CONFIG_S3C_DEV_I2C6
> =A0static struct resource s3c_i2c6_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S3C_PA_IIC6,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S3C_PA_IIC6 + SZ_4K - 1=
,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_IIC6,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_IIC6,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 },
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S3C, IIC6, SZ_4K),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(IIC6),
> =A0};
>
> =A0struct platform_device s3c_device_i2c6 =3D {
> @@ -862,16 +653,8 @@ void __init s3c_i2c6_set_platdata(struct s3c2410=
_platform_i2c *pd)
>
> =A0#ifdef CONFIG_S3C_DEV_I2C7
> =A0static struct resource s3c_i2c7_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S3C_PA_IIC7,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S3C_PA_IIC7 + SZ_4K - 1=
,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_IIC7,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_IIC7,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 },
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S3C, IIC7, SZ_4K),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(IIC7),
> =A0};
>
> =A0struct platform_device s3c_device_i2c7 =3D {
> @@ -902,16 +685,8 @@ void __init s3c_i2c7_set_platdata(struct s3c2410=
_platform_i2c *pd)
>
> =A0#ifdef CONFIG_S5P_DEV_I2C_HDMIPHY
> =A0static struct resource s5p_i2c_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S5P_PA_IIC_HDMIPHY,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S5P_PA_IIC_HDMIPHY + SZ=
_4K - 1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_IIC_HDMIPHY,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_IIC_HDMIPHY,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 },
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S5P, IIC_HDMIPHY, SZ_4K),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(IIC_HDMIPHY),
> =A0};
>
> =A0struct platform_device s5p_device_i2c_hdmiphy =3D {
> @@ -945,11 +720,7 @@ void __init s5p_i2c_hdmiphy_set_platdata(struct =
s3c2410_platform_i2c *pd)
>
> =A0#ifdef CONFIG_PLAT_S3C24XX
> =A0static struct resource s3c_iis_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S3C24XX_PA_IIS,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S3C24XX_PA_IIS + S3C24X=
X_SZ_IIS - 1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 }
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S3C24XX, IIS, S3C24XX_SZ_IIS),
> =A0};
>
> =A0struct platform_device s3c_device_iis =3D {
> @@ -979,16 +750,8 @@ struct platform_device s3c2412_device_iis =3D {
>
> =A0#ifdef CONFIG_SAMSUNG_DEV_IDE
> =A0static struct resource s3c_cfcon_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D SAMSUNG_PA_CFCON,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D SAMSUNG_PA_CFCON + SZ_1=
6K - 1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_CFCON,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_CFCON,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 },
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(SAMSUNG, CFCON, SZ_16K),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(CFCON),
> =A0};
>
> =A0struct platform_device s3c_device_cfcon =3D {
> @@ -1008,16 +771,8 @@ void s3c_ide_set_platdata(struct s3c_ide_platda=
ta *pdata)
>
> =A0#ifdef CONFIG_SAMSUNG_DEV_KEYPAD
> =A0static struct resource samsung_keypad_resources[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D SAMSUNG_PA_KEYPAD,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D SAMSUNG_PA_KEYPAD + 0x2=
0 - 1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_KEYPAD,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_KEYPAD,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 },
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(SAMSUNG, KEYPAD, SZ_32),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(KEYPAD),
> =A0};
>
> =A0struct platform_device samsung_device_keypad =3D {
> @@ -1043,16 +798,8 @@ void __init samsung_keypad_set_platdata(struct =
samsung_keypad_platdata *pd)
>
> =A0#ifdef CONFIG_PLAT_S3C24XX
> =A0static struct resource s3c_lcd_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S3C24XX_PA_LCD,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S3C24XX_PA_LCD + S3C24X=
X_SZ_LCD - 1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_LCD,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_LCD,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 }
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S3C24XX, LCD, S3C24XX_SZ_LCD),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(LCD),
> =A0};
>
> =A0struct platform_device s3c_device_lcd =3D {
> @@ -1087,16 +834,8 @@ void __init s3c24xx_fb_set_platdata(struct s3c2=
410fb_mach_info *pd)
>
> =A0#ifdef CONFIG_S5P_DEV_MFC
> =A0static struct resource s5p_mfc_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S5P_PA_MFC,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S5P_PA_MFC + SZ_64K - 1=
,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_MFC,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_MFC,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 }
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S5P, MFC, SZ_64K),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(MFC),
> =A0};
>
> =A0struct platform_device s5p_device_mfc =3D {
> @@ -1139,16 +878,8 @@ struct platform_device s5p_device_mfc_r =3D {
>
> =A0#ifdef CONFIG_S5P_DEV_CSIS0
> =A0static struct resource s5p_mipi_csis0_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S5P_PA_MIPI_CSIS0,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S5P_PA_MIPI_CSIS0 + SZ_=
4K - 1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_MIPI_CSIS0,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_MIPI_CSIS0,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 }
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S5P, MIPI_CSIS0, SZ_4K),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(MIPI_CSIS0),
> =A0};
>
> =A0struct platform_device s5p_device_mipi_csis0 =3D {
> @@ -1161,16 +892,8 @@ struct platform_device s5p_device_mipi_csis0 =3D=
 {
>
> =A0#ifdef CONFIG_S5P_DEV_CSIS1
> =A0static struct resource s5p_mipi_csis1_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S5P_PA_MIPI_CSIS1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S5P_PA_MIPI_CSIS1 + SZ_=
4K - 1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_MIPI_CSIS1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_MIPI_CSIS1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 },
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S5P, MIPI_CSIS1, SZ_4K),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(MIPI_CSIS1),
> =A0};
>
> =A0struct platform_device s5p_device_mipi_csis1 =3D {
> @@ -1185,11 +908,7 @@ struct platform_device s5p_device_mipi_csis1 =3D=
 {
>
> =A0#ifdef CONFIG_S3C_DEV_NAND
> =A0static struct resource s3c_nand_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S3C_PA_NAND,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S3C_PA_NAND + SZ_1M,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 }
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S3C, NAND, SZ_1M),
> =A0};
>
> =A0struct platform_device s3c_device_nand =3D {
> @@ -1294,21 +1013,9 @@ void __init s3c_nand_set_platdata(struct s3c24=
10_platform_nand *nand)
>
> =A0#ifdef CONFIG_S3C_DEV_ONENAND
> =A0static struct resource s3c_onenand_resources[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S3C_PA_ONENAND,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S3C_PA_ONENAND + 0x400 =
- 1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S3C_PA_ONENAND_BUF,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S3C_PA_ONENAND_BUF + S3=
C_SZ_ONENAND_BUF - 1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [2] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_ONENAND,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_ONENAND,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 },
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S3C, ONENAND, SZ_1K),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_MEM(S3C, ONENAND_BUF, S3C_SZ_ONENAN=
D_BUF),
> + =A0 =A0 =A0 [2] =3D SAMSUNG_RES_IRQ(ONENAND),
> =A0};
>
> =A0struct platform_device s3c_device_onenand =3D {
> @@ -1321,21 +1028,9 @@ struct platform_device s3c_device_onenand =3D =
{
>
> =A0#ifdef CONFIG_S3C64XX_DEV_ONENAND1
> =A0static struct resource s3c64xx_onenand1_resources[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S3C64XX_PA_ONENAND1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S3C64XX_PA_ONENAND1 + 0=
x400 - 1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S3C64XX_PA_ONENAND1_BUF,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S3C64XX_PA_ONENAND1_BUF=
 + S3C64XX_SZ_ONENAND1_BUF - 1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [2] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_ONENAND1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_ONENAND1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 },
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S3C64XX, ONENAND1, SZ_1K),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_MEM(S3C64XX, ONENAND1_BUF, S3C64XX_=
SZ_ONENAND1_BUF),
> + =A0 =A0 =A0 [2] =3D SAMSUNG_RES_IRQ(ONENAND1),
> =A0};
>
> =A0struct platform_device s3c64xx_device_onenand1 =3D {
> @@ -1354,21 +1049,9 @@ void s3c64xx_onenand1_set_platdata(struct onen=
and_platform_data *pdata)
>
> =A0#ifdef CONFIG_S5P_DEV_ONENAND
> =A0static struct resource s5p_onenand_resources[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S5P_PA_ONENAND,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S5P_PA_ONENAND + SZ_128=
K - 1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S5P_PA_ONENAND_DMA,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S5P_PA_ONENAND_DMA + SZ=
_8K - 1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [2] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_ONENAND_AUDI,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_ONENAND_AUDI,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 },
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S5P, ONENAND, SZ_128K),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_MEM(S5P, ONENAND_DMA, SZ_8K),
> + =A0 =A0 =A0 [2] =3D SAMSUNG_RES_IRQ(ONENAND_AUDI),
> =A0};
>
> =A0struct platform_device s5p_device_onenand =3D {
> @@ -1382,17 +1065,15 @@ struct platform_device s5p_device_onenand =3D=
 {
> =A0/* PMU */
>
> =A0#ifdef CONFIG_PLAT_S5P
> -static struct resource s5p_pmu_resource =3D {
> - =A0 =A0 =A0 .start =A0=3D IRQ_PMU,
> - =A0 =A0 =A0 .end =A0 =A0=3D IRQ_PMU,
> - =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> +static struct resource s5p_pmu_resource[] =3D {
> + =A0 =A0 =A0 SAMSUNG_RES_IRQ(PMU)
> =A0};
>
> =A0struct platform_device s5p_device_pmu =3D {
> =A0 =A0 =A0 =A0.name =A0 =A0 =A0 =A0 =A0 =3D "arm-pmu",
> =A0 =A0 =A0 =A0.id =A0 =A0 =A0 =A0 =A0 =A0 =3D ARM_PMU_DEVICE_CPU,
> - =A0 =A0 =A0 .num_resources =A0=3D 1,
> - =A0 =A0 =A0 .resource =A0 =A0 =A0 =3D &s5p_pmu_resource,
> + =A0 =A0 =A0 .num_resources =A0=3D ARRAY_SIZE(s5p_pmu_resource),
> + =A0 =A0 =A0 .resource =A0 =A0 =A0 =3D s5p_pmu_resource,
> =A0};
>
> =A0static int __init s5p_pmu_init(void)
> @@ -1442,21 +1123,9 @@ struct platform_device s3c_device_timer[] =3D =
{
>
> =A0#ifdef CONFIG_PLAT_S3C24XX
> =A0static struct resource s3c_rtc_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S3C24XX_PA_RTC,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S3C24XX_PA_RTC + 0xff,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_RTC,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_RTC,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [2] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_TICK,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_TICK,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ
> - =A0 =A0 =A0 }
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S3C24XX, RTC, SZ_256),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(RTC),
> + =A0 =A0 =A0 [2] =3D SAMSUNG_RES_IRQ(TICK),
> =A0};
>
> =A0struct platform_device s3c_device_rtc =3D {
> @@ -1469,21 +1138,9 @@ struct platform_device s3c_device_rtc =3D {
>
> =A0#ifdef CONFIG_S3C_DEV_RTC
> =A0static struct resource s3c_rtc_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S3C_PA_RTC,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S3C_PA_RTC + 0xff,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_RTC_ALARM,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_RTC_ALARM,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [2] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_RTC_TIC,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_RTC_TIC,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ
> - =A0 =A0 =A0 }
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S3C, RTC, SZ_256),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(RTC_ALARM),
> + =A0 =A0 =A0 [2] =3D SAMSUNG_RES_IRQ(RTC_TIC),
> =A0};
>
> =A0struct platform_device s3c_device_rtc =3D {
> @@ -1498,16 +1155,8 @@ struct platform_device s3c_device_rtc =3D {
>
> =A0#ifdef CONFIG_PLAT_S3C24XX
> =A0static struct resource s3c_sdi_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S3C24XX_PA_SDI,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S3C24XX_PA_SDI + S3C24X=
X_SZ_SDI - 1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_SDI,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_SDI,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 }
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S3C24XX, SDI, S3C24XX_SZ_SDI),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(SDI),
> =A0};
>
> =A0struct platform_device s3c_device_sdi =3D {
> @@ -1528,16 +1177,8 @@ void __init s3c24xx_mci_set_platdata(struct s3=
c24xx_mci_pdata *pdata)
>
> =A0#ifdef CONFIG_PLAT_S3C24XX
> =A0static struct resource s3c_spi0_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S3C24XX_PA_SPI,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S3C24XX_PA_SPI + 0x1f,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_SPI0,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_SPI0,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 }
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S3C24XX, SPI, SZ_32),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(SPI0),
> =A0};
>
> =A0struct platform_device s3c_device_spi0 =3D {
> @@ -1552,16 +1193,8 @@ struct platform_device s3c_device_spi0 =3D {
> =A0};
>
> =A0static struct resource s3c_spi1_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S3C24XX_PA_SPI + S3C2410_=
SPI1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S3C24XX_PA_SPI + S3C241=
0_SPI1 + 0x1f,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_SPI1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_SPI1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 }
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S3C24XX, SPI1, SZ_32),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(SPI1),
> =A0};
>
> =A0struct platform_device s3c_device_spi1 =3D {
> @@ -1580,17 +1213,8 @@ struct platform_device s3c_device_spi1 =3D {
>
> =A0#ifdef CONFIG_PLAT_S3C24XX
> =A0static struct resource s3c_ts_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S3C24XX_PA_ADC,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S3C24XX_PA_ADC + S3C24X=
X_SZ_ADC - 1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_TC,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_TC,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 },
> -
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S3C24XX, ADC, S3C24XX_SZ_ADC),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(TC),
> =A0};
>
> =A0struct platform_device s3c_device_ts =3D {
> @@ -1610,16 +1234,8 @@ void __init s3c24xx_ts_set_platdata(struct s3c=
2410_ts_mach_info *hard_s3c2410ts_
>
> =A0#ifdef CONFIG_SAMSUNG_DEV_TS
> =A0static struct resource s3c_ts_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D SAMSUNG_PA_ADC,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D SAMSUNG_PA_ADC + SZ_256=
 - 1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_TC,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_TC,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 },
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(SAMSUNG, ADC, SZ_256),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(TC),
> =A0};
>
> =A0static struct s3c2410_ts_mach_info default_ts_data __initdata =3D =
{
> @@ -1650,16 +1266,8 @@ void __init s3c24xx_ts_set_platdata(struct s3c=
2410_ts_mach_info *pd)
> =A0#ifdef CONFIG_S5P_DEV_TV
>
> =A0static struct resource s5p_hdmi_resources[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S5P_PA_HDMI,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S5P_PA_HDMI + SZ_1M - 1=
,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_HDMI,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_HDMI,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 },
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S5P, HDMI, SZ_1M),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(HDMI),
> =A0};
>
> =A0struct platform_device s5p_device_hdmi =3D {
> @@ -1670,16 +1278,8 @@ struct platform_device s5p_device_hdmi =3D {
> =A0};
>
> =A0static struct resource s5p_sdo_resources[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S5P_PA_SDO,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S5P_PA_SDO + SZ_64K - 1=
,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_SDO,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_SDO,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 }
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S5P, SDO, SZ_64K),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(SDO),
> =A0};
>
> =A0struct platform_device s5p_device_sdo =3D {
> @@ -1690,24 +1290,9 @@ struct platform_device s5p_device_sdo =3D {
> =A0};
>
> =A0static struct resource s5p_mixer_resources[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S5P_PA_MIXER,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S5P_PA_MIXER + SZ_64K -=
 1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =3D "mxr"
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S5P_PA_VP,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S5P_PA_VP + SZ_64K - 1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =3D "vp"
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [2] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_MIXER,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_MIXER,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =3D "irq"
> - =A0 =A0 =A0 }
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM_NAMED(S5P, MIXER, SZ_64K, "mxr"=
),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_MEM_NAMED(S5P, VP, SZ_64K, "vp"),
> + =A0 =A0 =A0 [2] =3D SAMSUNG_RES_IRQ_NAMED(MIXER, "irq"),
> =A0};
>
> =A0struct platform_device s5p_device_mixer =3D {
> @@ -1726,16 +1311,8 @@ struct platform_device s5p_device_mixer =3D {
>
> =A0#ifdef CONFIG_S3C_DEV_USB_HOST
> =A0static struct resource s3c_usb_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S3C_PA_USBHOST,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S3C_PA_USBHOST + 0x100 =
- 1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_USBH,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_USBH,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 }
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S3C, USBHOST, SZ_256),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(USBH),
> =A0};
>
> =A0struct platform_device s3c_device_ohci =3D {
> @@ -1769,16 +1346,8 @@ void __init s3c_ohci_set_platdata(struct s3c24=
10_hcd_info *info)
>
> =A0#ifdef CONFIG_PLAT_S3C24XX
> =A0static struct resource s3c_usbgadget_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S3C24XX_PA_USBDEV,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S3C24XX_PA_USBDEV + S3C=
24XX_SZ_USBDEV - 1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_USBD,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_USBD,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 }
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S3C24XX, USBDEV, S3C24XX_SZ_USB=
DEV),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(USBD),
> =A0};
>
> =A0struct platform_device s3c_device_usbgadget =3D {
> @@ -1798,16 +1367,8 @@ void __init s3c24xx_udc_set_platdata(struct s3=
c2410_udc_mach_info *pd)
>
> =A0#ifdef CONFIG_S5P_DEV_USB_EHCI
> =A0static struct resource s5p_ehci_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S5P_PA_EHCI,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S5P_PA_EHCI + SZ_256 - =
1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_USB_HOST,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_USB_HOST,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 }
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S5P, EHCI, SZ_256),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(USB_HOST),
> =A0};
>
> =A0struct platform_device s5p_device_ehci =3D {
> @@ -1839,16 +1400,8 @@ void __init s5p_ehci_set_platdata(struct s5p_e=
hci_platdata *pd)
>
> =A0#ifdef CONFIG_S3C_DEV_USB_HSOTG
> =A0static struct resource s3c_usb_hsotg_resources[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S3C_PA_USB_HSOTG,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S3C_PA_USB_HSOTG + 0x10=
000 - 1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_OTG,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_OTG,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 },
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S3C, USB_HSOTG, SZ_16K),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(OTG),
> =A0};
>
> =A0struct platform_device s3c_device_usb_hsotg =3D {
> @@ -1867,16 +1420,8 @@ struct platform_device s3c_device_usb_hsotg =3D=
 {
>
> =A0#ifdef CONFIG_PLAT_S3C24XX
> =A0static struct resource s3c_hsudc_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S3C2416_PA_HSUDC,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S3C2416_PA_HSUDC + S3C2=
416_SZ_HSUDC - 1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_USBD,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_USBD,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 }
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S3C2416, HSUDC, S3C2416_SZ_HSUD=
C),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(USBD),
> =A0};
>
> =A0struct platform_device s3c_device_usb_hsudc =3D {
> @@ -1900,16 +1445,8 @@ void __init s3c24xx_hsudc_set_platdata(struct =
s3c24xx_hsudc_platdata *pd)
>
> =A0#ifdef CONFIG_S3C_DEV_WDT
> =A0static struct resource s3c_wdt_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S3C_PA_WDT,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S3C_PA_WDT + SZ_1K,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_WDT,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_WDT,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> - =A0 =A0 =A0 }
> + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S3C, WDT, SZ_1K),
> + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(WDT),
> =A0};
>
> =A0struct platform_device s3c_device_wdt =3D {
> diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/pla=
t-samsung/include/plat/devs.h
> index 8f19241..a506831 100644
> --- a/arch/arm/plat-samsung/include/plat/devs.h
> +++ b/arch/arm/plat-samsung/include/plat/devs.h
> @@ -18,6 +18,17 @@
>
> =A0#include <linux/platform_device.h>
>
> +#define SAMSUNG_RES_MEM(soc, ip, sz) =A0 DEFINE_RES_MEM(soc##_PA_##i=
p, sz)
> +#define SAMSUNG_RES_IRQ(ip) =A0 =A0 =A0 =A0 =A0 =A0DEFINE_RES_IRQ(IR=
Q_##ip)
> +
> +#define SAMSUNG_RES_MEM_NAMED(soc, ip, sz, name) =A0 =A0 =A0 \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DEFINE_=
RES_MEM_NAMED(soc##_PA_##ip, sz, name)
> +#define SAMSUNG_RES_IRQ_NAMED(ip, name) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0\
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DEFINE_=
RES_IRQ_NAMED(IRQ_##ip, name)
> +#define SAMSUNG_RES_DMA_NAMED(ch, name) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0\
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DEFINE_=
RES_DMA_NAMED(DMACH_##ch, name)

It's good for readability. but do you think that it's hard to find out
defined macros are used at real place?
e.g., Now I want to find out the S3C_PA_USB_HSOTG. it's difficult if
you use the SAMSUNG_RES_* series macro.
but if you use the DEFINED_RES_* series directly. it's easy to find
out at real codes.

Thank you,
Kyungmin Park
> +
> +
> =A0struct s3c24xx_uart_resources {
> =A0 =A0 =A0 =A0struct resource =A0 =A0 =A0 =A0 *resources;
> =A0 =A0 =A0 =A0unsigned long =A0 =A0 =A0 =A0 =A0 =A0nr_resources;
> --
> 1.7.1
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
