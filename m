From: Alim Akhtar <alim.akhtar@gmail.com>
Subject: Re: [PATCH 5/7] ARM: EXYNOS4: Use generic DMA PL330 driver
Date: Tue, 5 Jul 2011 11:37:00 +0530
Message-ID: <CAGOxZ50-L9X-aGwdi7XyGpJhS-GENmk6Q7XwyD85=OJzs7Juqg@mail.gmail.com>
References: <1309781915-31549-1-git-send-email-kgene.kim@samsung.com> <1309781915-31549-6-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:51193 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753669Ab1GEGHl convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Jul 2011 02:07:41 -0400
Received: by wyg8 with SMTP id 8so3757562wyg.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Jul 2011 23:07:40 -0700 (PDT)
In-Reply-To: <1309781915-31549-6-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Grant Likely <grant.likely@secretlab.ca>, Jassi Brar <jassisinghbrar@gmail.com>, Liam Girdwood <lrg@ti.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Boojin Kim <boojin.kim@samsung.com>

On Mon, Jul 4, 2011 at 5:48 PM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
>
> From: Boojin Kim <boojin.kim@samsung.com>
>
> This patch makes EXYNOS4 use DMA PL330 driver on DMADEVICE.
> EXYNOS4 uses DMA generic API instead of SAMSUNG specific S3C-PL330 AP=
I.
>
> Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =A0arch/arm/mach-exynos4/Kconfig | =A0 =A02 +-
> =A0arch/arm/mach-exynos4/clock.c | =A0 16 +-
> =A0arch/arm/mach-exynos4/dma.c =A0 | =A0323 +++++++++++++++++++++++++=
++--------------
> =A03 files changed, 221 insertions(+), 120 deletions(-)
>
> diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kc=
onfig
> index 1435fc3..5cc9b7a 100644
> --- a/arch/arm/mach-exynos4/Kconfig
> +++ b/arch/arm/mach-exynos4/Kconfig
> @@ -11,7 +11,7 @@ if ARCH_EXYNOS4
>
> =A0config CPU_EXYNOS4210
> =A0 =A0 =A0 =A0bool
> - =A0 =A0 =A0 select S3C_PL330_DMA
> + =A0 =A0 =A0 select DMADEV_PL330
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Enable EXYNOS4210 CPU support
>
> diff --git a/arch/arm/mach-exynos4/clock.c b/arch/arm/mach-exynos4/cl=
ock.c
> index 871f9d5..1b2e78c 100644
> --- a/arch/arm/mach-exynos4/clock.c
> +++ b/arch/arm/mach-exynos4/clock.c
> @@ -47,6 +47,11 @@ static struct clk clk_sclk_usbphy1 =3D {
> =A0 =A0 =A0 =A0.id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
> =A0};
>
> +static struct clk dummy_apb_pclk =3D {
> + =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "apb_pclk",
> + =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
> +};
> +
What is the need to=A0creating "dummy_apb_pclk"=A0?
>
> =A0static int exynos4_clksrc_mask_top_ctrl(struct clk *clk, int enabl=
e)
> =A0{
> =A0 =A0 =A0 =A0return s5p_gatectrl(S5P_CLKSRC_MASK_TOP, clk, enable);
> @@ -485,16 +490,11 @@ static struct clk init_clocks_off[] =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.enable =A0 =A0 =A0 =A0 =3D exynos4_cl=
k_ip_fsys_ctrl,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ctrlbit =A0 =A0 =A0 =A0=3D (1 << 10),
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "pdma",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "dma",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,

Cannot this "dma" clock be used as apb_pclk clock?
Why not use the _clkdev_, that will resolve the issues dealing with 2
instances of DMA driver (pdma0 and pdma1)?
That will be needed once you register the exynos4_device_pdma1 as amba_=
device.
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.enable =A0 =A0 =A0 =A0 =3D exynos4_cl=
k_ip_fsys_ctrl,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ctrlbit =A0 =A0 =A0 =A0=3D (1 << 0),
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "pdma",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D 1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D exynos4_clk=
_ip_fsys_ctrl,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1 << 1),
> - =A0 =A0 =A0 }, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =A0 =A0 =A0 =A0 =3D "adc",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.enable =A0 =A0 =A0 =A0 =3D exynos4_cl=
k_ip_peril_ctrl,
> @@ -1212,5 +1212,7 @@ void __init exynos4_register_clocks(void)
> =A0 =A0 =A0 =A0s3c_register_clocks(init_clocks_off, ARRAY_SIZE(init_c=
locks_off));
> =A0 =A0 =A0 =A0s3c_disable_clocks(init_clocks_off, ARRAY_SIZE(init_cl=
ocks_off));
>
> + =A0 =A0 =A0 s3c24xx_register_clock(&dummy_apb_pclk);
> +
> =A0 =A0 =A0 =A0s3c_pwmclk_init();
> =A0}
> diff --git a/arch/arm/mach-exynos4/dma.c b/arch/arm/mach-exynos4/dma.=
c
> index 564bb53..f81c6f1 100644
> --- a/arch/arm/mach-exynos4/dma.c
> +++ b/arch/arm/mach-exynos4/dma.c
> @@ -21,151 +21,250 @@
> =A0* Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
> =A0*/
>
> -#include <linux/platform_device.h>
> =A0#include <linux/dma-mapping.h>
>
> +#include <linux/amba/bus.h>
> +#include <linux/amba/pl330.h>
> +#include <asm/irq.h>
> =A0#include <plat/devs.h>
> =A0#include <plat/irqs.h>
>
> =A0#include <mach/map.h>
> =A0#include <mach/irqs.h>
> -
> -#include <plat/s3c-pl330-pdata.h>
> +#include <mach/dma.h>
>
> =A0static u64 dma_dmamask =3D DMA_BIT_MASK(32);
>
> -static struct resource exynos4_pdma0_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D EXYNOS4_PA_PDMA0,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D EXYNOS4_PA_PDMA0 + SZ_4=
K,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_PDMA0,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_PDMA0,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> +struct dma_pl330_peri pdma0_peri[32] =3D {
> + =A0 =A0 =A0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_PCM0_RX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_PCM0_TX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_PCM2_RX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_PCM2_TX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .burst_sz =3D 4,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_MSM_REQ0,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_MSM_REQ2,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_SPI0_RX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .burst_sz =3D 1,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_SPI0_TX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .burst_sz =3D 1,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_SPI2_RX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .burst_sz =3D 1,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_SPI2_TX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .burst_sz =3D 1,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_I2S0S_TX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_I2S0_RX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_I2S0_TX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_UART0_RX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .burst_sz =3D 4,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_UART0_TX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .burst_sz =3D 4,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_UART2_RX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .burst_sz =3D 4,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_UART2_TX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .burst_sz =3D 4,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_UART4_RX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .burst_sz =3D 4,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_UART4_TX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .burst_sz =3D 4,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_SLIMBUS0_RX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_SLIMBUS0_TX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_SLIMBUS2_RX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_SLIMBUS2_TX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_SLIMBUS4_RX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_SLIMBUS4_TX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_AC97_MICIN,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .burst_sz =3D 4,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_AC97_PCMIN,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .burst_sz =3D 4,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_AC97_PCMOUT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .burst_sz =3D 4,
> =A0 =A0 =A0 =A0},
> =A0};
>
> -static struct s3c_pl330_platdata exynos4_pdma0_pdata =3D {
> - =A0 =A0 =A0 .peri =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [0] =3D DMACH_PCM0_RX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [1] =3D DMACH_PCM0_TX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [2] =3D DMACH_PCM2_RX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [3] =3D DMACH_PCM2_TX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [4] =3D DMACH_MSM_REQ0,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [5] =3D DMACH_MSM_REQ2,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [6] =3D DMACH_SPI0_RX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [7] =3D DMACH_SPI0_TX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [8] =3D DMACH_SPI2_RX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [9] =3D DMACH_SPI2_TX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [10] =3D DMACH_I2S0S_TX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [11] =3D DMACH_I2S0_RX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [12] =3D DMACH_I2S0_TX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [13] =3D DMACH_I2S2_RX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [14] =3D DMACH_I2S2_TX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [15] =3D DMACH_UART0_RX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [16] =3D DMACH_UART0_TX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [17] =3D DMACH_UART2_RX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [18] =3D DMACH_UART2_TX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [19] =3D DMACH_UART4_RX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [20] =3D DMACH_UART4_TX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [21] =3D DMACH_SLIMBUS0_RX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [22] =3D DMACH_SLIMBUS0_TX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [23] =3D DMACH_SLIMBUS2_RX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [24] =3D DMACH_SLIMBUS2_TX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [25] =3D DMACH_SLIMBUS4_RX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [26] =3D DMACH_SLIMBUS4_TX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [27] =3D DMACH_AC97_MICIN,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [28] =3D DMACH_AC97_PCMIN,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [29] =3D DMACH_AC97_PCMOUT,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [30] =3D DMACH_MAX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [31] =3D DMACH_MAX,
> - =A0 =A0 =A0 },
> +struct dma_pl330_platdata exynos4_pdma0_pdata =3D {
> + =A0 =A0 =A0 .nr_valid_peri =3D 32,
> + =A0 =A0 =A0 .peri =3D pdma0_peri,
> =A0};
>
> -static struct platform_device exynos4_device_pdma0 =3D {
> - =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "s3c-pl330",
> - =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D 0,
> - =A0 =A0 =A0 .num_resources =A0=3D ARRAY_SIZE(exynos4_pdma0_resource=
),
> - =A0 =A0 =A0 .resource =A0 =A0 =A0 =3D exynos4_pdma0_resource,
> - =A0 =A0 =A0 .dev =A0 =A0 =A0 =A0 =A0 =A0=3D {
> +struct amba_device exynos4_device_pdma0 =3D {
> + =A0 =A0 =A0 .dev =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .init_name =3D "dma-pl330",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.dma_mask =3D &dma_dmamask,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.coherent_dma_mask =3D DMA_BIT_MASK(32=
),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.platform_data =3D &exynos4_pdma0_pdat=
a,
> - =A0 =A0 =A0 },
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 .res =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =3D EXYNOS4_PA_PDMA0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =3D EXYNOS4_PA_PDMA0 + SZ_4K,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =3D IORESOURCE_MEM,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 .irq =3D {IRQ_PDMA0, NO_IRQ},
> + =A0 =A0 =A0 .periphid =3D 0x00041330,
> =A0};
>
> -static struct resource exynos4_pdma1_resource[] =3D {
> - =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D EXYNOS4_PA_PDMA1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D EXYNOS4_PA_PDMA1 + SZ_4=
K,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_PDMA1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_PDMA1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> +struct dma_pl330_peri pdma1_peri[32] =3D {
> + =A0 =A0 =A0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_PCM0_RX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_PCM0_TX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_PCM1_RX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_PCM1_TX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_MSM_REQ1,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_MSM_REQ3,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_SPI1_RX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .burst_sz =3D 1,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_SPI1_TX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .burst_sz =3D 1,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_I2S0S_TX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_I2S0_RX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_I2S0_TX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_I2S1_RX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_I2S1_TX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_UART0_RX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .burst_sz =3D 4,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_UART0_TX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .burst_sz =3D 4,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_UART1_RX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .burst_sz =3D 4,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_UART1_TX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .burst_sz =3D 4,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_UART3_RX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .burst_sz =3D 4,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_UART3_TX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .burst_sz =3D 4,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_SLIMBUS1_RX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_SLIMBUS1_TX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_SLIMBUS3_RX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_SLIMBUS3_TX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_SLIMBUS5_RX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_SLIMBUS5_TX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
> =A0 =A0 =A0 =A0},
> =A0};
>
> -static struct s3c_pl330_platdata exynos4_pdma1_pdata =3D {
> - =A0 =A0 =A0 .peri =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [0] =3D DMACH_PCM0_RX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [1] =3D DMACH_PCM0_TX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [2] =3D DMACH_PCM1_RX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [3] =3D DMACH_PCM1_TX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [4] =3D DMACH_MSM_REQ1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [5] =3D DMACH_MSM_REQ3,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [6] =3D DMACH_SPI1_RX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [7] =3D DMACH_SPI1_TX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [8] =3D DMACH_I2S0S_TX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [9] =3D DMACH_I2S0_RX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [10] =3D DMACH_I2S0_TX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [11] =3D DMACH_I2S1_RX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [12] =3D DMACH_I2S1_TX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [13] =3D DMACH_UART0_RX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [14] =3D DMACH_UART0_TX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [15] =3D DMACH_UART1_RX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [16] =3D DMACH_UART1_TX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [17] =3D DMACH_UART3_RX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [18] =3D DMACH_UART3_TX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [19] =3D DMACH_SLIMBUS1_RX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [20] =3D DMACH_SLIMBUS1_TX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [21] =3D DMACH_SLIMBUS3_RX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [22] =3D DMACH_SLIMBUS3_TX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [23] =3D DMACH_SLIMBUS5_RX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [24] =3D DMACH_SLIMBUS5_TX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [25] =3D DMACH_SLIMBUS0AUX_RX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [26] =3D DMACH_SLIMBUS0AUX_TX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [27] =3D DMACH_SPDIF,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [28] =3D DMACH_MAX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [29] =3D DMACH_MAX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [30] =3D DMACH_MAX,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [31] =3D DMACH_MAX,
> - =A0 =A0 =A0 },
> +struct dma_pl330_platdata exynos4_pdma1_pdata =3D {
> + =A0 =A0 =A0 .nr_valid_peri =3D 32,
> + =A0 =A0 =A0 .peri =3D pdma1_peri,
> =A0};
>
> -static struct platform_device exynos4_device_pdma1 =3D {
> - =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "s3c-pl330",
> - =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D 1,
> - =A0 =A0 =A0 .num_resources =A0=3D ARRAY_SIZE(exynos4_pdma1_resource=
),
> - =A0 =A0 =A0 .resource =A0 =A0 =A0 =3D exynos4_pdma1_resource,
> - =A0 =A0 =A0 .dev =A0 =A0 =A0 =A0 =A0 =A0=3D {
> +struct amba_device exynos4_device_pdma1 =3D {
 "exynos4_device_pdma1" is not being used anywhere in this patch, i
think pdma1 is for the second instance of DMA.
> + =A0 =A0 =A0 .dev =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .init_name =3D "dma-pl330",
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
=46or some reason you are not registering exynos4_device_pdma1, though
you have provided the platdata.
>
> =A0 =A0 =A0 =A0return 0;
> =A0}
> --
> 1.7.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
