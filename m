From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 07/15] ARM: EXYNOS4: Use generic DMA PL330 driver
Date: Mon, 15 Aug 2011 15:06:50 +0530
Message-ID: <CAJuYYwT9k2+D-VrrdeF2qW1f7CV9wvq3vgPYobNmP680Jnr3yQ@mail.gmail.com>
References: <1311744697-10264-1-git-send-email-boojin.kim@samsung.com>
	<1311744697-10264-8-git-send-email-boojin.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:60460 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752729Ab1HOJgv convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Aug 2011 05:36:51 -0400
Received: by ywf7 with SMTP id 7so3032142ywf.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Aug 2011 02:36:51 -0700 (PDT)
In-Reply-To: <1311744697-10264-8-git-send-email-boojin.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Boojin Kim <boojin.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Jassi Brar <jassisinghbrar@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Grant Likely <grant.likely@secretlab.ca>, Russell King <linux@arm.linux.org.uk>

Hi Boojin,

On 27 July 2011 11:01, Boojin Kim <boojin.kim@samsung.com> wrote:
> This patch makes Samsung EXYNOS4 to use DMA PL330 driver
> on DMADEVICE. The EXYNOS4 uses DMA generic APIs instead of
> SAMSUNG specific S3C-PL330 APIs.
>
> Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =A0arch/arm/mach-exynos4/Kconfig | =A0 =A02 +-
> =A0arch/arm/mach-exynos4/clock.c | =A0 16 ++-
> =A0arch/arm/mach-exynos4/dma.c =A0 | =A0299 +++++++++++++++++++++++++=
+---------------
> =A03 files changed, 198 insertions(+), 119 deletions(-)
>

[...]

> diff --git a/arch/arm/mach-exynos4/dma.c b/arch/arm/mach-exynos4/dma.=
c
> index 564bb53..d57d662 100644

[...]

> +struct amba_device exynos4_device_pdma0 =3D {
> + =A0 =A0 =A0 .dev =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .init_name =3D "dma-pl330.0",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.dma_mask =3D &dma_dmamask,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.coherent_dma_mask =3D DMA_BIT_MASK(32=
),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.platform_data =3D &exynos4_pdma0_pdat=
a,
> =A0 =A0 =A0 =A0},
> + =A0 =A0 =A0 .res =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =3D EXYNOS4_PA_PDMA0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =3D EXYNOS4_PA_PDMA0 + SZ_4K,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =3D IORESOURCE_MEM,
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 .irq =3D {IRQ_PDMA0, NO_IRQ},
> + =A0 =A0 =A0 .periphid =3D 0x00041330,
> =A0};
>

[...]

> +struct amba_device exynos4_device_pdma1 =3D {
> + =A0 =A0 =A0 .dev =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .init_name =3D "dma-pl330.1",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.dma_mask =3D &dma_dmamask,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.coherent_dma_mask =3D DMA_BIT_MASK(32=
),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.platform_data =3D &exynos4_pdma1_pdat=
a,
> =A0 =A0 =A0 =A0},
> -};
> -
> -static struct platform_device *exynos4_dmacs[] __initdata =3D {
> - =A0 =A0 =A0 &exynos4_device_pdma0,
> - =A0 =A0 =A0 &exynos4_device_pdma1,
> + =A0 =A0 =A0 .res =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =3D EXYNOS4_PA_PDMA1,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =3D EXYNOS4_PA_PDMA1 + SZ_4K,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =3D IORESOURCE_MEM,
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 .irq =3D {IRQ_PDMA1, NO_IRQ},
> + =A0 =A0 =A0 .periphid =3D 0x00041330,
> =A0};
>
> =A0static int __init exynos4_dma_init(void)
> =A0{
> - =A0 =A0 =A0 platform_add_devices(exynos4_dmacs, ARRAY_SIZE(exynos4_=
dmacs));
> + =A0 =A0 =A0 amba_device_register(&exynos4_device_pdma0, &iomem_reso=
urce);

How would the 'exynos4_device_pdma1' instance get registered? Should
there be a amba_device_register call for 'exynos4_device_pdma1'
instance as well?

Thanks,
Thomas.
