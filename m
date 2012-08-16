From: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: EXYNOS: Add MFC device tree support
Date: Thu, 16 Aug 2012 17:12:37 +0530
Message-ID: <CAJuYYwRG5SsPHsF5BA5ix7_kBh_Wvn_b9HvjyKP77g5omY1r=g@mail.gmail.com>
References: <1345120273-22913-1-git-send-email-arun.kk@samsung.com>
 <1345120273-22913-2-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1345120273-22913-2-git-send-email-arun.kk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Arun Kumar K <arun.kk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jtp.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 16 August 2012 18:01, Arun Kumar K <arun.kk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> From: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>
> This patch adds device tree entry for MFC in the Exynos
> machines. Exynos4 SoCs support MFC v5 version and Exynos5 has
> MFC v6.x version. So making the required changes in the clock
> files and adds MFC to the DT device list.
>
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Arun Kumar K <arun.kk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  .../devicetree/bindings/media/s5p-mfc.txt          |   24 ++++++++++++++++++++
>  arch/arm/boot/dts/exynos4210.dtsi                  |   10 ++++++++
>  arch/arm/boot/dts/exynos5250.dtsi                  |   10 ++++++++
>  arch/arm/mach-exynos/clock-exynos5.c               |    2 +-
>  arch/arm/mach-exynos/mach-exynos4-dt.c             |   22 ++++++++++++++++++
>  arch/arm/mach-exynos/mach-exynos5-dt.c             |   22 ++++++++++++++++++
>  6 files changed, 89 insertions(+), 1 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/s5p-mfc.txt
>
> diff --git a/Documentation/devicetree/bindings/media/s5p-mfc.txt b/Documentation/devicetree/bindings/media/s5p-mfc.txt
> new file mode 100644
> index 0000000..b9bd266
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/s5p-mfc.txt
> @@ -0,0 +1,24 @@
> +* Samsung Multi Format Codec (MFC)
> +
> +Mult Format Codec (MFC) is the IP present in Samsung SoCs which
> +supports high resolution decoding and encoding functionalities.

In addition to this, specifying that mfc is used for video
encode/decode would be informative.

> +
> +Required properties:
> +  - compatible : value should be either one among the following
> +       (a) "samsung,s5p-mfc-v5" for MFC v5 present in Exynos4 SoCs
> +       (b) "samsung,s5p-mfc-v6" for MFC v6.x present in Exynos5 SoCs

"s5p" should be dropped from the compatible values. For example, it
should be "samsung,mfc-v5", which is sufficient to identify the
version of the mfc controller.

> +
> +  - reg : Physical base address of the IP registers and length of memory
> +         mapped region.
> +
> +  - interrupts : MFC interupt number to the CPU.
> +
> +  - samsung,mfc-r : Base address of the first memory bank used by MFC
> +                   for DMA contiguous memory allocation.
> +
> +  - samsung,mfc-r-size : Size of the first memory bank.

It is not allowed to pass buffer base address and size from device
tree. Device tree node should describe only the MFC controller
hardware. Any memory management related information should be handled
outside of device tree. This helps the bindings to be reusable across
multiple operating systems.

> +
> +  - samsung,mfc-l : Base address of the second memory bank used by MFC
> +                   for DMA contiguous memory allocation.
> +
> +  - samsung,mfc-l-size : Size of the second memory bank.

Same comment as above. And the bindings documentation is usually
included in the same patch that adds device tree support for the
driver.

> diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
> index 02891fe..b5ee43d 100644
> --- a/arch/arm/boot/dts/exynos4210.dtsi
> +++ b/arch/arm/boot/dts/exynos4210.dtsi
> @@ -56,6 +56,16 @@
>                 interrupts = <0 43 0>;
>         };
>
> +       mfc {
> +               compatible = "samsung,s5p-mfc";
> +               reg = <0x13400000 0x10000>;
> +               interrupts = <0 94 0>;
> +               samsung,mfc-r = <0x43000000>;
> +               samsung,mfc-r-size = <8388608>;
> +               samsung,mfc-l = <0x51000000>;
> +               samsung,mfc-l-size = <8388608>;
> +       };
> +
>         rtc@10070000 {
>                 compatible = "samsung,s3c6410-rtc";
>                 reg = <0x10070000 0x100>;
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index 004aaa8..3c762a4 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -58,6 +58,16 @@
>                 interrupts = <0 42 0>;
>         };
>
> +       mfc {
> +               compatible = "samsung,s5p-mfc-v6";
> +               reg = <0x11000000 0x10000>;
> +               interrupts = <0 96 0>;
> +               samsung,mfc-r = <0x43000000>;
> +               samsung,mfc-r-size = <8388608>;
> +               samsung,mfc-l = <0x51000000>;
> +               samsung,mfc-l-size = <8388608>;
> +       };
> +
>         rtc {
>                 compatible = "samsung,s3c6410-rtc";
>                 reg = <0x101E0000 0x100>;
> diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
> index 3b00e29..c85e7b2 100644
> --- a/arch/arm/mach-exynos/clock-exynos5.c
> +++ b/arch/arm/mach-exynos/clock-exynos5.c
> @@ -607,7 +607,7 @@ static struct clk exynos5_init_clocks_off[] = {
>                 .ctrlbit        = (1 << 25),
>         }, {
>                 .name           = "mfc",
> -               .devname        = "s5p-mfc",
> +               .devname        = "s5p-mfc-v6",
>                 .enable         = exynos5_clk_ip_mfc_ctrl,
>                 .ctrlbit        = (1 << 0),
>         }, {
> diff --git a/arch/arm/mach-exynos/mach-exynos4-dt.c b/arch/arm/mach-exynos/mach-exynos4-dt.c
> index b2b5d5f..c4a0e16 100644
> --- a/arch/arm/mach-exynos/mach-exynos4-dt.c
> +++ b/arch/arm/mach-exynos/mach-exynos4-dt.c
> @@ -13,6 +13,7 @@
>
>  #include <linux/of_platform.h>
>  #include <linux/serial_core.h>
> +#include <linux/memblock.h>
>
>  #include <asm/mach/arch.h>
>  #include <asm/hardware/gic.h>
> @@ -63,6 +64,7 @@ static const struct of_dev_auxdata exynos4210_auxdata_lookup[] __initconst = {
>                                 "exynos4210-spi.2", NULL),
>         OF_DEV_AUXDATA("arm,pl330", EXYNOS4_PA_PDMA0, "dma-pl330.0", NULL),
>         OF_DEV_AUXDATA("arm,pl330", EXYNOS4_PA_PDMA1, "dma-pl330.1", NULL),
> +       OF_DEV_AUXDATA("samsung,s5p-mfc", 0x13400000, "s5p-mfc", NULL),
>         {},
>  };
>
> @@ -83,6 +85,25 @@ static char const *exynos4210_dt_compat[] __initdata = {
>         NULL
>  };
>
> +static void s5p_mfc_reserve_mem(phys_addr_t rbase, unsigned int rsize,
> +               phys_addr_t lbase, unsigned int lsize) {
> +
> +       if (memblock_remove(lbase, lsize)) {
> +               pr_err("Failed to reserve bank1 memory for MFC device\n");
> +               WARN_ON(1);
> +       }
> +
> +       if (memblock_remove(rbase, rsize)) {
> +               pr_err("Failed to reserve bank2 memory for MFC device\n");
> +               WARN_ON(1);
> +       }
> +}

It would be better to split the device tree related changes and the
driver buffer management related changes in separate patches.

> +
> +static void __init exynos4_reserve(void)
> +{
> +       s5p_mfc_reserve_mem(0x43000000, 8 << 20, 0x51000000, 8 << 20);
> +}
> +
>  DT_MACHINE_START(EXYNOS4210_DT, "Samsung Exynos4 (Flattened Device Tree)")
>         /* Maintainer: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> */
>         .init_irq       = exynos4_init_irq,
> @@ -93,4 +114,5 @@ DT_MACHINE_START(EXYNOS4210_DT, "Samsung Exynos4 (Flattened Device Tree)")
>         .timer          = &exynos4_timer,
>         .dt_compat      = exynos4210_dt_compat,
>         .restart        = exynos4_restart,
> +       .reserve        = exynos4_reserve,
>  MACHINE_END
> diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
> index ef770bc..898d2de 100644
> --- a/arch/arm/mach-exynos/mach-exynos5-dt.c
> +++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
> @@ -11,6 +11,7 @@
>
>  #include <linux/of_platform.h>
>  #include <linux/serial_core.h>
> +#include <linux/memblock.h>
>
>  #include <asm/mach/arch.h>
>  #include <asm/hardware/gic.h>
> @@ -56,6 +57,7 @@ static const struct of_dev_auxdata exynos5250_auxdata_lookup[] __initconst = {
>         OF_DEV_AUXDATA("arm,pl330", EXYNOS5_PA_PDMA0, "dma-pl330.0", NULL),
>         OF_DEV_AUXDATA("arm,pl330", EXYNOS5_PA_PDMA1, "dma-pl330.1", NULL),
>         OF_DEV_AUXDATA("arm,pl330", EXYNOS5_PA_MDMA1, "dma-pl330.2", NULL),
> +       OF_DEV_AUXDATA("samsung,s5p-mfc-v6", 0x11000000, "s5p-mfc-v6", NULL),
>         {},
>  };
>
> @@ -76,6 +78,25 @@ static char const *exynos5250_dt_compat[] __initdata = {
>         NULL
>  };
>
> +static void s5p_mfc_reserve_mem(phys_addr_t rbase, unsigned int rsize,
> +               phys_addr_t lbase, unsigned int lsize) {
> +
> +       if (memblock_remove(lbase, lsize)) {
> +               pr_err("Failed to reserve bank1 memory for MFC device\n");
> +               WARN_ON(1);
> +       }
> +
> +       if (memblock_remove(rbase, rsize)) {
> +               pr_err("Failed to reserve bank2 memory for MFC device\n");
> +               WARN_ON(1);
> +       }
> +}
> +
> +static void __init exynos5_reserve(void)
> +{
> +       s5p_mfc_reserve_mem(0x43000000, 8 << 20, 0x51000000, 8 << 20);
> +}
> +
>  DT_MACHINE_START(EXYNOS5_DT, "SAMSUNG EXYNOS5 (Flattened Device Tree)")
>         /* Maintainer: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> */
>         .init_irq       = exynos5_init_irq,
> @@ -86,4 +107,5 @@ DT_MACHINE_START(EXYNOS5_DT, "SAMSUNG EXYNOS5 (Flattened Device Tree)")
>         .timer          = &exynos4_timer,
>         .dt_compat      = exynos5250_dt_compat,
>         .restart        = exynos5_restart,
> +       .reserve        = exynos5_reserve,
>  MACHINE_END
> --
> 1.7.0.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
