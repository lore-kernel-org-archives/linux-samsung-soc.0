From: Naveen Krishna Ch <naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v9] i2c: exynos5: add High Speed I2C controller driver
Date: Mon, 10 Jun 2013 13:37:16 +0530
Message-ID: <CAHfPSqBh-buTipwp8iq_pY9iqy3Pw_yQR+OjtMemCzirVLHXrg@mail.gmail.com>
References: <1354021236-28596-2-git-send-email-ch.naveen@samsung.com>
 <1368785452-15140-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6734359794796292348=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1368785452-15140-1-git-send-email-ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
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
To: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

--===============6734359794796292348==
Content-Type: multipart/alternative; boundary=001a113329e810040c04dec846fc

--001a113329e810040c04dec846fc
Content-Type: text/plain; charset=ISO-8859-1

On 17 May 2013 15:40, Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>wrote:

> Adds support for High Speed I2C driver found in Exynos5 and
> later SoCs from Samsung.
>
> Driver only supports Device Tree method.
>
> Changes since v1:
> 1. Added FIFO functionality
> 2. Added High speed mode functionality
> 3. Remove SMBUS_QUICK
> 4. Remove the debugfs functionality
> 5. Use devm_* functions where ever possible
> 6. Driver is free from GPIO configs (only supports pinctrl method)
> 7. Use OF data string "clock-frequency" to get the bus operating
> frequencies
> 8. Split the clock divisor calculation function
> 9. Add resets for the failed transacton cases
> 10. few other bug fixes and cosmetic changes
>
> Signed-off-by: Taekgyun Ko <taeggyun.ko-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Reviewed-by: Simon Glass <sjg-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> Tested-by: Andrew Bresticker <abrestic-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Yuvaraj Kumar C D <yuvaraj.cd-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Andrew Bresticker <abrestic-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
>

Hello Wolfram,

This driver was submitted, reviewed several times.
and been improved as we were using it.

I did not see any review comments on this driver.
Can we get this merged or Should we wait for few more reviews ?

Thanks & Regards,
Naveen Krishna

>  ---
>
> Changes since v8
> 1. improved the device tree bindings description page for i2c-exynos5
> 2. fixed the return value check for devm_ioremap_resource
>
>  .../devicetree/bindings/i2c/i2c-exynos5.txt        |   45 +
>  drivers/i2c/busses/Kconfig                         |    7 +
>  drivers/i2c/busses/Makefile                        |    1 +
>  drivers/i2c/busses/i2c-exynos5.c                   |  888
> ++++++++++++++++++++
>  4 files changed, 941 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
>  create mode 100644 drivers/i2c/busses/i2c-exynos5.c
>
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
> b/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
> new file mode 100644
> index 0000000..29c01c0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
> @@ -0,0 +1,45 @@
> +* Samsung's High Speed I2C controller
> +
> +The Samsung's High Speed I2C controller is used to interface with I2C
> devices
> +at various speeds ranging from 100khz to 3.4Mhz.
> +
> +Required properties:
> +  - compatible: value should be.
> +      -> "samsung,exynos5-hsi2c", for i2c compatible with exynos5 hsi2c.
> +  - reg: physical base address of the controller and length of memory
> mapped
> +    region.
> +  - interrupts: interrupt number to the cpu.
> +  - #address-cells: always 1 (for i2c addresses)
> +  - #size-cells: always 0
> +
> +  - Pinctrl:
> +    - pinctrl-0: Pin control group to be used for this controller.
> +    - pinctrl-names: Should contain only one value - "default".
> +
> +Optional properties:
> +  - samsung,hs-mode: Mode of operation, High speed or Fast speed mode. If
> not
> +    specified, default value is 0.
> +  - clock-frequency: Desired operating frequency in Hz of the bus.
> +    If not specified, the default value in Hz is 100000.
> +
> +Example:
> +
> +hsi2c@12ca0000 {
> +       compatible = "samsung,exynos5-hsi2c";
> +       reg = <0x12ca0000 0x100>;
> +       interrupts = <56>;
> +       clock-frequency = <100000>;
> +
> +       /* Pinctrl variant begins here */
> +       pinctrl-0 = <&i2c4_bus>;
> +       pinctrl-names = "default";
> +       /* Pinctrl variant ends here */
> +
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +
> +       s2mps11_pmic@66 {
> +               compatible = "samsung,s2mps11-pmic";
> +               reg = <0x66>;
> +       };
> +};
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index adfee98..49a665f 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -434,6 +434,13 @@ config I2C_EG20T
>           ML7213/ML7223/ML7831 is companion chip for Intel Atom E6xx
> series.
>           ML7213/ML7223/ML7831 is completely compatible for Intel EG20T
> PCH.
>
> +config I2C_EXYNOS5
> +       tristate "Exynos5 high-speed I2C driver"
> +       depends on ARCH_EXYNOS5 && OF
> +       help
> +         Say Y here to include support for high-speed I2C controller in
> the
> +         Exynos5 based Samsung SoCs.
> +
>  config I2C_GPIO
>         tristate "GPIO-based bitbanging I2C"
>         depends on GENERIC_GPIO
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index 8f4fc23..b19366c 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -42,6 +42,7 @@ i2c-designware-platform-objs := i2c-designware-platdrv.o
>  obj-$(CONFIG_I2C_DESIGNWARE_PCI)       += i2c-designware-pci.o
>  i2c-designware-pci-objs := i2c-designware-pcidrv.o
>  obj-$(CONFIG_I2C_EG20T)                += i2c-eg20t.o
> +obj-$(CONFIG_I2C_EXYNOS5)      += i2c-exynos5.o
>  obj-$(CONFIG_I2C_GPIO)         += i2c-gpio.o
>  obj-$(CONFIG_I2C_HIGHLANDER)   += i2c-highlander.o
>  obj-$(CONFIG_I2C_IBM_IIC)      += i2c-ibm_iic.o
> diff --git a/drivers/i2c/busses/i2c-exynos5.c
> b/drivers/i2c/busses/i2c-exynos5.c
> new file mode 100644
> index 0000000..33c481d
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-exynos5.c
> @@ -0,0 +1,888 @@
> +/**
> + * i2c-exynos5.c - Samsung Exynos5 I2C Controller Driver
> + *
> + * Copyright (C) 2013 Samsung Electronics Co., Ltd.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/time.h>
> +#include <linux/interrupt.h>
> +#include <linux/delay.h>
> +#include <linux/errno.h>
> +#include <linux/err.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/clk.h>
> +#include <linux/slab.h>
> +#include <linux/io.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_i2c.h>
> +
> +/*
> + * HSI2C controller from Samsung supports 2 modes of operation
> + * 1. Auto mode: Where in master automatically controls the whole
> transaction
> + * 2. Manual mode: Software controls the transaction by issuing commands
> + *    START, READ, WRITE, STOP, RESTART in I2C_MANUAL_CMD register.
> + *
> + * Operation mode can be selected by setting AUTO_MODE bit in I2C_CONF
> register
> + *
> + * Special bits are available for both modes of operation to set commands
> + * and for checking transfer status
> + */
> +
> +/* Register Map */
> +#define HSI2C_CTL              0x00
> +#define HSI2C_FIFO_CTL         0x04
> +#define HSI2C_TRAILIG_CTL      0x08
> +#define HSI2C_CLK_CTL          0x0C
> +#define HSI2C_CLK_SLOT         0x10
> +#define HSI2C_INT_ENABLE       0x20
> +#define HSI2C_INT_STATUS       0x24
> +#define HSI2C_ERR_STATUS       0x2C
> +#define HSI2C_FIFO_STATUS      0x30
> +#define HSI2C_TX_DATA          0x34
> +#define HSI2C_RX_DATA          0x38
> +#define HSI2C_CONF             0x40
> +#define HSI2C_AUTO_CONF                0x44
> +#define HSI2C_TIMEOUT          0x48
> +#define HSI2C_MANUAL_CMD       0x4C
> +#define HSI2C_TRANS_STATUS     0x50
> +#define HSI2C_TIMING_HS1       0x54
> +#define HSI2C_TIMING_HS2       0x58
> +#define HSI2C_TIMING_HS3       0x5C
> +#define HSI2C_TIMING_FS1       0x60
> +#define HSI2C_TIMING_FS2       0x64
> +#define HSI2C_TIMING_FS3       0x68
> +#define HSI2C_TIMING_SLA       0x6C
> +#define HSI2C_ADDR             0x70
> +
> +/* I2C_CTL Register bits */
> +#define HSI2C_FUNC_MODE_I2C                    (1u << 0)
> +#define HSI2C_MASTER                           (1u << 3)
> +#define HSI2C_RXCHON                           (1u << 6)
> +#define HSI2C_TXCHON                           (1u << 7)
> +#define HSI2C_SW_RST                           (1u << 31)
> +
> +/* I2C_FIFO_CTL Register bits */
> +#define HSI2C_RXFIFO_EN                                (1u << 0)
> +#define HSI2C_TXFIFO_EN                                (1u << 1)
> +#define HSI2C_FIFO_MAX                         (0x40)
> +#define HSI2C_RXFIFO_TRIGGER_LEVEL(x)          ((x) << 4)
> +#define HSI2C_TXFIFO_TRIGGER_LEVEL(x)          ((x) << 16)
> +/* I2C_TRAILING_CTL Register bits */
> +#define HSI2C_TRAILING_COUNT                   (0xf)
> +
> +/* I2C_INT_EN Register bits */
> +#define HSI2C_INT_TX_ALMOSTEMPTY_EN            (1u << 0)
> +#define HSI2C_INT_RX_ALMOSTFULL_EN             (1u << 1)
> +#define HSI2C_INT_TRAILING_EN                  (1u << 6)
> +#define HSI2C_INT_I2C_EN                       (1u << 9)
> +
> +/* I2C_INT_STAT Register bits */
> +#define HSI2C_INT_TX_ALMOSTEMPTY               (1u << 0)
> +#define HSI2C_INT_RX_ALMOSTFULL                        (1u << 1)
> +#define HSI2C_INT_TX_UNDERRUN                  (1u << 2)
> +#define HSI2C_INT_TX_OVERRUN                   (1u << 3)
> +#define HSI2C_INT_RX_UNDERRUN                  (1u << 4)
> +#define HSI2C_INT_RX_OVERRUN                   (1u << 5)
> +#define HSI2C_INT_TRAILING                     (1u << 6)
> +#define HSI2C_INT_I2C                          (1u << 9)
> +#define HSI2C_RX_INT                           (HSI2C_INT_RX_ALMOSTFULL |
> \
> +                                                HSI2C_INT_RX_UNDERRUN | \
> +                                                HSI2C_INT_RX_OVERRUN | \
> +                                                HSI2C_INT_TRAILING)
> +
> +/* I2C_FIFO_STAT Register bits */
> +#define HSI2C_RX_FIFO_EMPTY                    (1u << 24)
> +#define HSI2C_RX_FIFO_FULL                     (1u << 23)
> +#define HSI2C_RX_FIFO_LVL(x)                   ((x >> 16) & 0x7f)
> +#define HSI2C_TX_FIFO_EMPTY                    (1u << 8)
> +#define HSI2C_TX_FIFO_FULL                     (1u << 7)
> +#define HSI2C_TX_FIFO_LVL(x)                   ((x >> 0) & 0x7f)
> +#define HSI2C_FIFO_EMPTY                       (HSI2C_RX_FIFO_EMPTY |  \
> +                                               HSI2C_TX_FIFO_EMPTY)
> +
> +/* I2C_CONF Register bits */
> +#define HSI2C_AUTO_MODE                                (1u << 31)
> +#define HSI2C_10BIT_ADDR_MODE                  (1u << 30)
> +#define HSI2C_HS_MODE                          (1u << 29)
> +
> +/* I2C_AUTO_CONF Register bits */
> +#define HSI2C_READ_WRITE                       (1u << 16)
> +#define HSI2C_STOP_AFTER_TRANS                 (1u << 17)
> +#define HSI2C_MASTER_RUN                       (1u << 31)
> +
> +/* I2C_TIMEOUT Register bits */
> +#define HSI2C_TIMEOUT_EN                       (1u << 31)
> +
> +/* I2C_TRANS_STATUS register bits */
> +#define HSI2C_MASTER_BUSY                      (1u << 17)
> +#define HSI2C_SLAVE_BUSY                       (1u << 16)
> +#define HSI2C_TIMEOUT_AUTO                     (1u << 4)
> +#define HSI2C_NO_DEV                           (1u << 3)
> +#define HSI2C_NO_DEV_ACK                       (1u << 2)
> +#define HSI2C_TRANS_ABORT                      (1u << 1)
> +#define HSI2C_TRANS_DONE                       (1u << 0)
> +
> +/* I2C_ADDR register bits */
> +#define HSI2C_SLV_ADDR_SLV(x)                  ((x & 0x3ff) << 0)
> +#define HSI2C_SLV_ADDR_MAS(x)                  ((x & 0x3ff) << 10)
> +#define HSI2C_MASTER_ID(x)                     ((x & 0xff) << 24)
> +#define MASTER_ID(x)                           ((x & 0x7) + 0x08)
> +
> +/*
> + * Controller operating frequency, timing values for operation
> + * are calculated against this frequency
> + */
> +#define HSI2C_HS_TX_CLOCK      1000000
> +#define HSI2C_FS_TX_CLOCK      1000000
> +#define HSI2C_HIGH_SPD         1
> +#define HSI2C_FAST_SPD         0
> +
> +#define EXYNOS5_I2C_TIMEOUT (msecs_to_jiffies(1000))
> +
> +/* timeout for pm runtime autosuspend */
> +#define EXYNOS5_I2C_PM_TIMEOUT         1000    /* ms */
> +
> +struct exynos5_i2c {
> +       struct i2c_adapter      adap;
> +       unsigned int            suspended:1;
> +
> +       struct i2c_msg          *msg;
> +       struct completion       msg_complete;
> +       unsigned int            msg_ptr;
> +       unsigned int            msg_len;
> +
> +       unsigned int            irq;
> +
> +       void __iomem            *regs;
> +       struct clk              *clk;
> +       struct device           *dev;
> +       int                     state;
> +
> +       /*
> +        * Since the TRANS_DONE bit is cleared on read, and we may read it
> +        * either during an IRQ or after a transaction, keep track of its
> +        * state here.
> +        */
> +       int                     trans_done;
> +
> +       /* Controller operating frequency */
> +       unsigned int            fs_clock;
> +       unsigned int            hs_clock;
> +
> +       /*
> +        * HSI2C Controller can operate in
> +        * 1. High speed upto 3.4Mbps
> +        * 2. Fast speed upto 1Mbps
> +        */
> +       int                     speed_mode;
> +       int                     bus_id;
> +};
> +
> +static const struct of_device_id exynos5_i2c_match[] = {
> +       { .compatible = "samsung,exynos5-hsi2c" },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, exynos5_i2c_match);
> +
> +static void exynos5_i2c_clr_pend_irq(struct exynos5_i2c *i2c)
> +{
> +       writel(readl(i2c->regs + HSI2C_INT_STATUS),
> +                               i2c->regs + HSI2C_INT_STATUS);
> +}
> +
> +/*
> + * exynos5_i2c_set_timing: updates the registers with appropriate
> + * timing values calculated
> + *
> + * Returns 0 on success, -EINVAL if the cycle length cannot
> + * be calculated.
> + */
> +static int exynos5_i2c_set_timing(struct exynos5_i2c *i2c, int mode)
> +{
> +       u32 i2c_timing_s1;
> +       u32 i2c_timing_s2;
> +       u32 i2c_timing_s3;
> +       u32 i2c_timing_sla;
> +       unsigned int t_start_su, t_start_hd;
> +       unsigned int t_stop_su;
> +       unsigned int t_data_su, t_data_hd;
> +       unsigned int t_scl_l, t_scl_h;
> +       unsigned int t_sr_release;
> +       unsigned int t_ftl_cycle;
> +       unsigned int clkin = clk_get_rate(i2c->clk);
> +       unsigned int div, utemp0 = 0, utemp1 = 0, clk_cycle;
> +       unsigned int op_clk = (mode == HSI2C_HIGH_SPD) ?
> +                               i2c->hs_clock : i2c->fs_clock;
> +
> +       /*
> +        * FPCLK / FI2C =
> +        * (CLK_DIV + 1) * (TSCLK_L + TSCLK_H + 2) + 8 + 2 * FLT_CYCLE
> +        * utemp0 = (CLK_DIV + 1) * (TSCLK_L + TSCLK_H + 2)
> +        * utemp1 = (TSCLK_L + TSCLK_H + 2)
> +        */
> +       t_ftl_cycle = (readl(i2c->regs + HSI2C_CONF) >> 16) & 0x7;
> +       utemp0 = (clkin / op_clk) - 8 - 2 * t_ftl_cycle;
> +
> +       /* CLK_DIV max is 256 */
> +       for (div = 0; div < 256; div++) {
> +               utemp1 = utemp0 / (div + 1);
> +
> +               /*
> +                * SCL_L and SCL_H each has max value of 255
> +                * Hence, For the clk_cycle to the have right value
> +                * utemp1 has to be less then 512 and more than 4.
> +                */
> +               if ((utemp1 < 512) && (utemp1 > 4)) {
> +                       clk_cycle = utemp1 - 2;
> +                       break;
> +               } else if (div == 255) {
> +                       dev_warn(i2c->dev, "Failed to calculate divisor");
> +                       return -EINVAL;
> +               }
> +       }
> +
> +       t_scl_l = clk_cycle / 2;
> +       t_scl_h = clk_cycle / 2;
> +       t_start_su = t_scl_l;
> +       t_start_hd = t_scl_l;
> +       t_stop_su = t_scl_l;
> +       t_data_su = t_scl_l / 2;
> +       t_data_hd = t_scl_l / 2;
> +       t_sr_release = clk_cycle;
> +
> +       i2c_timing_s1 = t_start_su << 24 | t_start_hd << 16 | t_stop_su <<
> 8;
> +       i2c_timing_s2 = t_data_su << 24 | t_scl_l << 8 | t_scl_h << 0;
> +       i2c_timing_s3 = div << 16 | t_sr_release << 0;
> +       i2c_timing_sla = t_data_hd << 0;
> +
> +       dev_dbg(i2c->dev, "tSTART_SU: %X, tSTART_HD: %X, tSTOP_SU: %X\n",
> +               t_start_su, t_start_hd, t_stop_su);
> +       dev_dbg(i2c->dev, "tDATA_SU: %X, tSCL_L: %X, tSCL_H: %X\n",
> +               t_data_su, t_scl_l, t_scl_h);
> +       dev_dbg(i2c->dev, "nClkDiv: %X, tSR_RELEASE: %X\n",
> +               div, t_sr_release);
> +       dev_dbg(i2c->dev, "tDATA_HD: %X\n", t_data_hd);
> +
> +       if (mode == HSI2C_HIGH_SPD) {
> +               writel(i2c_timing_s1, i2c->regs + HSI2C_TIMING_HS1);
> +               writel(i2c_timing_s2, i2c->regs + HSI2C_TIMING_HS2);
> +               writel(i2c_timing_s3, i2c->regs + HSI2C_TIMING_HS3);
> +       } else {
> +               writel(i2c_timing_s1, i2c->regs + HSI2C_TIMING_FS1);
> +               writel(i2c_timing_s2, i2c->regs + HSI2C_TIMING_FS2);
> +               writel(i2c_timing_s3, i2c->regs + HSI2C_TIMING_FS3);
> +       }
> +       writel(i2c_timing_sla, i2c->regs + HSI2C_TIMING_SLA);
> +
> +       return 0;
> +}
> +
> +static int exynos5_hsi2c_clock_setup(struct exynos5_i2c *i2c)
> +{
> +       /*
> +        * Configure the Fast speed timing values
> +        * Even the High Speed mode initially starts with Fast mode
> +        */
> +       if (exynos5_i2c_set_timing(i2c, HSI2C_FAST_SPD)) {
> +               dev_err(i2c->dev, "HSI2C FS Clock set up failed\n");
> +               return -EINVAL;
> +       }
> +
> +       /* configure the High speed timing values */
> +       if (i2c->speed_mode == HSI2C_HIGH_SPD) {
> +               if (exynos5_i2c_set_timing(i2c, HSI2C_HIGH_SPD)) {
> +                       dev_err(i2c->dev, "HSI2C HS Clock set up
> failed\n");
> +                       return -EINVAL;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +/*
> + * exynos5_i2c_init: configures the controller for I2C functionality
> + * Programs I2C controller for Master mode operation
> + */
> +static void exynos5_i2c_init(struct exynos5_i2c *i2c)
> +{
> +       u32 i2c_conf = readl(i2c->regs + HSI2C_CONF);
> +
> +       writel((HSI2C_FUNC_MODE_I2C | HSI2C_MASTER),
> +                                       i2c->regs + HSI2C_CTL);
> +       writel(HSI2C_TRAILING_COUNT, i2c->regs + HSI2C_TRAILIG_CTL);
> +
> +       if (i2c->speed_mode == HSI2C_HIGH_SPD) {
> +               writel(HSI2C_MASTER_ID(MASTER_ID(i2c->bus_id)),
> +                                       i2c->regs + HSI2C_ADDR);
> +               i2c_conf |= HSI2C_HS_MODE;
> +       }
> +
> +       writel(i2c_conf | HSI2C_AUTO_MODE, i2c->regs + HSI2C_CONF);
> +}
> +
> +static void exynos5_i2c_reset(struct exynos5_i2c *i2c)
> +{
> +       u32 i2c_ctl;
> +
> +       /* Set and clear the bit for reset */
> +       i2c_ctl = readl(i2c->regs + HSI2C_CTL);
> +       i2c_ctl |= HSI2C_SW_RST;
> +       writel(i2c_ctl, i2c->regs + HSI2C_CTL);
> +
> +       i2c_ctl = readl(i2c->regs + HSI2C_CTL);
> +       i2c_ctl &= ~HSI2C_SW_RST;
> +       writel(i2c_ctl, i2c->regs + HSI2C_CTL);
> +
> +       /* We don't expect calculations to fail during the run */
> +       exynos5_hsi2c_clock_setup(i2c);
> +       /* Initialize the configure registers */
> +       exynos5_i2c_init(i2c);
> +}
> +
> +/*
> + * exynos5_i2c_irq: top level IRQ servicing routine
> + *
> + * INT_STATUS registers gives the interrupt details. Further,
> + * FIFO_STATUS or TRANS_STATUS registers are to be check for detailed
> + * state of the bus.
> + */
> +static irqreturn_t exynos5_i2c_irq(int irqno, void *dev_id)
> +{
> +       struct exynos5_i2c *i2c = dev_id;
> +       u32 fifo_level, int_status, fifo_status, trans_status;
> +       unsigned char byte;
> +       int len = 0;
> +
> +       i2c->state = -EINVAL;
> +
> +       int_status = readl(i2c->regs + HSI2C_INT_STATUS);
> +       fifo_status = readl(i2c->regs + HSI2C_FIFO_STATUS);
> +
> +       if (int_status & HSI2C_INT_I2C) {
> +               trans_status = readl(i2c->regs + HSI2C_TRANS_STATUS);
> +               if (trans_status & HSI2C_NO_DEV_ACK) {
> +                       dev_dbg(i2c->dev, "No ACK from device\n");
> +                       i2c->state = -ENXIO;
> +               } else if (trans_status & HSI2C_NO_DEV) {
> +                       dev_dbg(i2c->dev, "No device\n");
> +                       i2c->state = -ENXIO;
> +               } else if (trans_status & HSI2C_TRANS_ABORT) {
> +                       dev_dbg(i2c->dev, "Deal with arbitration lose\n");
> +                       i2c->state = -EAGAIN;
> +               } else if (trans_status & HSI2C_TIMEOUT_AUTO) {
> +                       dev_dbg(i2c->dev, "Accessing device timed out\n");
> +                       i2c->state = -EAGAIN;
> +               } else if (trans_status & HSI2C_TRANS_DONE) {
> +                       i2c->trans_done = 1;
> +                       i2c->state = 0;
> +               }
> +       }
> +       /* TX_ALMOSTEMPTY can happen along with HSI2C_INT_I2C */
> +       else if (int_status &
> +                       (HSI2C_INT_TX_UNDERRUN |
> HSI2C_INT_TX_ALMOSTEMPTY)) {
> +               fifo_level = HSI2C_TX_FIFO_LVL(fifo_status);
> +
> +               /* To support probing the devices for detection */
> +               if (i2c->msg->len == 0) {
> +                       i2c->state = -ENXIO;
> +                       goto stop;
> +               }
> +
> +               len = HSI2C_FIFO_MAX - fifo_level;
> +               if (len > i2c->msg->len)
> +                       len = i2c->msg->len;
> +
> +               i2c->msg_len += len;
> +               while (len > 0) {
> +                       byte = i2c->msg->buf[i2c->msg_ptr++];
> +                       writel(byte, i2c->regs + HSI2C_TX_DATA);
> +                       len--;
> +               }
> +               i2c->state = 0;
> +               goto stop;
> +       }
> +       /* If TX FIFO is full (give chance to clear) */
> +       else if (int_status & HSI2C_INT_TX_OVERRUN)
> +               i2c->state = 0;
> +
> +       if (int_status & (HSI2C_INT_RX_OVERRUN | HSI2C_INT_TRAILING |
> +               HSI2C_INT_RX_UNDERRUN | HSI2C_INT_RX_ALMOSTFULL)) {
> +               fifo_level = HSI2C_RX_FIFO_LVL(fifo_status);
> +
> +               if (fifo_level >= i2c->msg->len)
> +                       len = i2c->msg->len;
> +               else
> +                       len = fifo_level;
> +
> +               i2c->msg_len += len;
> +               while (len > 0) {
> +                       byte = (unsigned char)
> +                               readl(i2c->regs + HSI2C_RX_DATA);
> +                       i2c->msg->buf[i2c->msg_ptr++] = byte;
> +                       len--;
> +               }
> +               i2c->state = 0;
> +       }
> +
> +
> + stop:
> +       if ((i2c->msg_len == i2c->msg->len) || (i2c->state < 0)) {
> +               writel(0, i2c->regs + HSI2C_INT_ENABLE);
> +               complete(&i2c->msg_complete);
> +       }
> +
> +       exynos5_i2c_clr_pend_irq(i2c);
> +
> +       return IRQ_HANDLED;
> +}
> +
> +/*
> + * exynos5_i2c_wait_bus_idle
> + *
> + * Wait for the transaction to complete (indicated by the TRANS_DONE bit
> + * being set), and, if this is the last message in a transfer, wait for
> the
> + * MASTER_BUSY bit to be cleared.
> + *
> + * Returns -EBUSY if the bus cannot be bought to idle
> + */
> +static int exynos5_i2c_wait_bus_idle(struct exynos5_i2c *i2c, int stop)
> +{
> +       unsigned long stop_time;
> +       u32 trans_status;
> +
> +       /* wait for 100 milli seconds for the bus to be idle */
> +       stop_time = jiffies + msecs_to_jiffies(100) + 1;
> +       do {
> +               trans_status = readl(i2c->regs + HSI2C_TRANS_STATUS);
> +               if (trans_status & HSI2C_TRANS_DONE)
> +                       i2c->trans_done = 1;
> +               /*
> +                * Only wait for MASTER_BUSY to be cleared if this is the
> last
> +                * message.
> +                */
> +               if ((!stop || !(trans_status & HSI2C_MASTER_BUSY)) &&
> +                   i2c->trans_done)
> +                       return 0;
> +
> +               usleep_range(50, 200);
> +       } while (time_before(jiffies, stop_time));
> +
> +       return -EBUSY;
> +}
> +
> +/*
> + * exynos5_i2c_message_start: Configures the bus and starts the xfer
> + * i2c: struct exynos5_i2c pointer for the current bus
> + * stop: Enables stop after transfer if set. Set for last transfer of
> + *       in the list of messages.
> + *
> + * Configures the bus for read/write function
> + * Sets chip address to talk to, message length to be sent.
> + * Enables appropriate interrupts and sends start xfer command.
> + */
> +static void exynos5_i2c_message_start(struct exynos5_i2c *i2c, int stop)
> +{
> +       u32 i2c_ctl;
> +       u32 int_en = HSI2C_INT_I2C_EN;
> +       u32 i2c_auto_conf = 0;
> +       u32 fifo_ctl;
> +       u32 i2c_timeout;
> +
> +       /*
> +        * When the message length is > FIFO depth, set the FIFO trigger
> +        * at FIFO_MAX - 4. Just for ease of handling.
> +        */
> +       unsigned short len = (i2c->msg->len > HSI2C_FIFO_MAX) ?
> +                                       (HSI2C_FIFO_MAX - 4) :
> i2c->msg->len;
> +
> +       /* Clear to enable Timeout */
> +       i2c_timeout = readl(i2c->regs + HSI2C_TIMEOUT);
> +       i2c_timeout &= ~HSI2C_TIMEOUT_EN;
> +       writel(i2c_timeout, i2c->regs + HSI2C_TIMEOUT);
> +
> +       fifo_ctl = HSI2C_RXFIFO_EN | HSI2C_TXFIFO_EN;
> +       writel(fifo_ctl, i2c->regs + HSI2C_FIFO_CTL);
> +
> +       i2c_ctl = readl(i2c->regs + HSI2C_CTL);
> +       i2c_ctl &= ~(HSI2C_TXCHON | HSI2C_RXCHON);
> +       if (i2c->msg->flags & I2C_M_RD) {
> +               i2c_ctl |= HSI2C_RXCHON;
> +
> +               i2c_auto_conf |= HSI2C_READ_WRITE;
> +
> +               fifo_ctl |= HSI2C_RXFIFO_TRIGGER_LEVEL(len);
> +               int_en |= (HSI2C_INT_RX_ALMOSTFULL_EN |
> +                       HSI2C_INT_TRAILING_EN);
> +       } else {
> +               i2c_ctl |= HSI2C_TXCHON;
> +
> +               fifo_ctl |= HSI2C_TXFIFO_TRIGGER_LEVEL(len);
> +               int_en |= HSI2C_INT_TX_ALMOSTEMPTY_EN;
> +       }
> +
> +       if (stop == 1)
> +               i2c_auto_conf |= HSI2C_STOP_AFTER_TRANS;
> +
> +       writel(HSI2C_SLV_ADDR_MAS(i2c->msg->addr), i2c->regs + HSI2C_ADDR);
> +
> +       writel(fifo_ctl, i2c->regs + HSI2C_FIFO_CTL);
> +       writel(i2c_ctl, i2c->regs + HSI2C_CTL);
> +
> +       /* In auto mode the length of xfer cannot be 0 */
> +       if (i2c->msg->len == 0)
> +               i2c_auto_conf |= 0x1;
> +       else
> +               i2c_auto_conf |= i2c->msg->len;
> +
> +       writel(i2c_auto_conf, i2c->regs + HSI2C_AUTO_CONF);
> +
> +       /* Start data transfer in Master mode */
> +       i2c_auto_conf = readl(i2c->regs + HSI2C_AUTO_CONF);
> +       i2c_auto_conf |= HSI2C_MASTER_RUN;
> +       writel(i2c_auto_conf, i2c->regs + HSI2C_AUTO_CONF);
> +
> +       writel(int_en, i2c->regs + HSI2C_INT_ENABLE);
> +}
> +
> +static int exynos5_i2c_xfer_msg(struct exynos5_i2c *i2c,
> +                             struct i2c_msg *msgs, int stop)
> +{
> +       unsigned long timeout;
> +       int ret;
> +
> +       i2c->msg = msgs;
> +       i2c->msg_ptr = 0;
> +       i2c->msg_len = 0;
> +       i2c->trans_done = 0;
> +
> +       INIT_COMPLETION(i2c->msg_complete);
> +
> +       exynos5_i2c_message_start(i2c, stop);
> +
> +       ret = wait_for_completion_interruptible_timeout
> +               (&i2c->msg_complete, EXYNOS5_I2C_TIMEOUT);
> +       if (ret >= 0)
> +               timeout = ret;
> +       else
> +               return ret;
> +
> +       ret = i2c->state;
> +
> +       if ((timeout == 0) || (ret < 0)) {
> +               exynos5_i2c_reset(i2c);
> +               if (timeout == 0) {
> +                       dev_warn(i2c->dev, "%s timeout\n",
> +                                (msgs->flags & I2C_M_RD) ? "rx" : "tx");
> +                       return ret;
> +               } else if (ret == -EAGAIN) {
> +                       return ret;
> +               }
> +       }
> +
> +       /*
> +        * If this is the last message to be transfered (stop == 1)
> +        * Then check if the bus can be brought back to idle.
> +        *
> +        * Return -EBUSY if the bus still busy.
> +        */
> +       if (exynos5_i2c_wait_bus_idle(i2c, stop))
> +               return -EBUSY;
> +
> +       /* Return the state as in interrupt routine */
> +       return ret;
> +}
> +
> +static int exynos5_i2c_xfer(struct i2c_adapter *adap,
> +                       struct i2c_msg *msgs, int num)
> +{
> +       struct exynos5_i2c *i2c = (struct exynos5_i2c *)adap->algo_data;
> +       struct i2c_msg *msgs_ptr = msgs;
> +       int retry, i = 0;
> +       int ret = 0, ret_pm;
> +       int stop = 0;
> +
> +       if (i2c->suspended) {
> +               dev_err(i2c->dev, "HS-I2C is not initialzed.\n");
> +               return -EIO;
> +       }
> +
> +       ret_pm = pm_runtime_get_sync(i2c->dev);
> +       if (IS_ERR_VALUE(ret_pm)) {
> +               ret = -EIO;
> +               goto out;
> +       }
> +
> +       clk_prepare_enable(i2c->clk);
> +
> +       for (retry = 0; retry < adap->retries; retry++) {
> +               for (i = 0; i < num; i++) {
> +                       stop = (i == num - 1);
> +
> +                       ret = exynos5_i2c_xfer_msg(i2c, msgs_ptr, stop);
> +                       msgs_ptr++;
> +
> +                       if (ret == -EAGAIN) {
> +                               msgs_ptr = msgs;
> +                               break;
> +                       } else if (ret < 0) {
> +                               goto out;
> +                       }
> +               }
> +
> +               if ((i == num) && (ret != -EAGAIN))
> +                       break;
> +
> +               dev_dbg(i2c->dev, "retrying transfer (%d)\n", retry);
> +
> +               udelay(100);
> +       }
> +
> +       if (i == num) {
> +               ret = num;
> +       } else {
> +               /* Only one message, cannot access the device */
> +               if (i == 1)
> +                       ret = -EREMOTEIO;
> +               else
> +                       ret = i;
> +
> +               dev_warn(i2c->dev, "xfer message failed\n");
> +       }
> +
> + out:
> +       clk_disable_unprepare(i2c->clk);
> +       pm_runtime_mark_last_busy(i2c->dev);
> +       pm_runtime_put_autosuspend(i2c->dev);
> +       return ret;
> +}
> +
> +static u32 exynos5_i2c_func(struct i2c_adapter *adap)
> +{
> +       return I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL &
> ~I2C_FUNC_SMBUS_QUICK);
> +}
> +
> +static const struct i2c_algorithm exynos5_i2c_algorithm = {
> +       .master_xfer            = exynos5_i2c_xfer,
> +       .functionality          = exynos5_i2c_func,
> +};
> +
> +static int exynos5_i2c_probe(struct platform_device *pdev)
> +{
> +       struct device_node *np = pdev->dev.of_node;
> +       struct exynos5_i2c *i2c;
> +       struct resource *mem;
> +       int ret;
> +
> +       if (!np) {
> +               dev_err(&pdev->dev, "no device node\n");
> +               return -ENOENT;
> +       }
> +
> +       i2c = devm_kzalloc(&pdev->dev, sizeof(struct exynos5_i2c),
> GFP_KERNEL);
> +       if (!i2c) {
> +               dev_err(&pdev->dev, "no memory for state\n");
> +               return -ENOMEM;
> +       }
> +
> +       /* Mode of operation High/Fast Speed mode */
> +       if (of_get_property(np, "samsung,hs-mode", NULL)) {
> +               i2c->speed_mode = HSI2C_HIGH_SPD;
> +               i2c->fs_clock = HSI2C_FS_TX_CLOCK;
> +               if (of_property_read_u32(np, "clock-frequency",
> &i2c->hs_clock))
> +                       i2c->hs_clock = HSI2C_HS_TX_CLOCK;
> +       } else {
> +               i2c->speed_mode = HSI2C_FAST_SPD;
> +               if (of_property_read_u32(np, "clock-frequency",
> &i2c->fs_clock))
> +                       i2c->fs_clock = HSI2C_FS_TX_CLOCK;
> +       }
> +
> +       strlcpy(i2c->adap.name, "exynos5-i2c", sizeof(i2c->adap.name));
> +       i2c->adap.owner   = THIS_MODULE;
> +       i2c->adap.algo    = &exynos5_i2c_algorithm;
> +       i2c->adap.retries = 2;
> +       i2c->adap.class   = I2C_CLASS_HWMON | I2C_CLASS_SPD;
> +
> +       i2c->dev = &pdev->dev;
> +       i2c->clk = devm_clk_get(&pdev->dev, "hsi2c");
> +       if (IS_ERR(i2c->clk)) {
> +               dev_err(&pdev->dev, "cannot get clock\n");
> +               return -ENOENT;
> +       }
> +
> +       clk_prepare_enable(i2c->clk);
> +
> +       mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       i2c->regs = devm_ioremap_resource(&pdev->dev, mem);
> +       if (IS_ERR(i2c->regs)) {
> +               dev_err(&pdev->dev, "cannot map HS-I2C IO\n");
> +               ret = PTR_ERR(i2c->regs);
> +               goto err_clk;
> +       }
> +
> +       i2c->adap.dev.of_node = np;
> +       i2c->adap.algo_data = i2c;
> +       i2c->adap.dev.parent = &pdev->dev;
> +
> +       /* Clear pending interrupts from u-boot or misc causes */
> +       exynos5_i2c_clr_pend_irq(i2c);
> +
> +       init_completion(&i2c->msg_complete);
> +
> +       i2c->irq = ret = irq_of_parse_and_map(np, 0);
> +       if (ret <= 0) {
> +               dev_err(&pdev->dev, "cannot find HS-I2C IRQ\n");
> +               ret = -EINVAL;
> +               goto err_clk;
> +       }
> +
> +       ret = devm_request_irq(&pdev->dev, i2c->irq, exynos5_i2c_irq,
> +                               0, dev_name(&pdev->dev), i2c);
> +
> +       if (ret != 0) {
> +               dev_err(&pdev->dev, "cannot request HS-I2C IRQ %d\n",
> i2c->irq);
> +               goto err_clk;
> +       }
> +
> +       /*
> +        * TODO: Use private lock to avoid race conditions as
> +        * mentioned in pm_runtime.txt
> +        */
> +       pm_runtime_enable(i2c->dev);
> +       pm_runtime_set_autosuspend_delay(i2c->dev, EXYNOS5_I2C_PM_TIMEOUT);
> +       pm_runtime_use_autosuspend(i2c->dev);
> +
> +       ret = pm_runtime_get_sync(i2c->dev);
> +       if (IS_ERR_VALUE(ret))
> +               goto err_clk;
> +
> +       ret = exynos5_hsi2c_clock_setup(i2c);
> +       if (ret)
> +               goto err_pm;
> +
> +       i2c->bus_id = of_alias_get_id(i2c->adap.dev.of_node, "hsi2c");
> +
> +       exynos5_i2c_init(i2c);
> +
> +       i2c->adap.nr = -1;
> +       ret = i2c_add_numbered_adapter(&i2c->adap);
> +       if (ret < 0) {
> +               dev_err(&pdev->dev, "failed to add bus to i2c core\n");
> +               goto err_pm;
> +       }
> +
> +       of_i2c_register_devices(&i2c->adap);
> +       platform_set_drvdata(pdev, i2c);
> +
> +       clk_disable_unprepare(i2c->clk);
> +       pm_runtime_mark_last_busy(i2c->dev);
> +       pm_runtime_put_autosuspend(i2c->dev);
> +
> +       return 0;
> +
> + err_pm:
> +       pm_runtime_put(i2c->dev);
> +       pm_runtime_disable(&pdev->dev);
> + err_clk:
> +       clk_disable_unprepare(i2c->clk);
> +       return ret;
> +}
> +
> +static int exynos5_i2c_remove(struct platform_device *pdev)
> +{
> +       struct exynos5_i2c *i2c = platform_get_drvdata(pdev);
> +       int ret;
> +
> +       ret = pm_runtime_get_sync(&pdev->dev);
> +       if (IS_ERR_VALUE(ret))
> +               return ret;
> +
> +       i2c_del_adapter(&i2c->adap);
> +
> +       pm_runtime_put(&pdev->dev);
> +       pm_runtime_disable(&pdev->dev);
> +
> +       clk_disable_unprepare(i2c->clk);
> +
> +       return 0;
> +}
> +
> +#ifdef CONFIG_PM
> +static int exynos5_i2c_suspend_noirq(struct device *dev)
> +{
> +       struct platform_device *pdev = to_platform_device(dev);
> +       struct exynos5_i2c *i2c = platform_get_drvdata(pdev);
> +
> +       i2c->suspended = 1;
> +
> +       return 0;
> +}
> +
> +static int exynos5_i2c_resume_noirq(struct device *dev)
> +{
> +       struct platform_device *pdev = to_platform_device(dev);
> +       struct exynos5_i2c *i2c = platform_get_drvdata(pdev);
> +       int ret = 0;
> +
> +       clk_prepare_enable(i2c->clk);
> +
> +       ret = exynos5_hsi2c_clock_setup(i2c);
> +       if (ret) {
> +               clk_disable_unprepare(i2c->clk);
> +               return ret;
> +       }
> +
> +       exynos5_i2c_init(i2c);
> +       clk_disable_unprepare(i2c->clk);
> +       i2c->suspended = 0;
> +
> +       return 0;
> +}
> +
> +static const struct dev_pm_ops exynos5_i2c_dev_pm_ops = {
> +       .suspend_noirq = exynos5_i2c_suspend_noirq,
> +       .resume_noirq   = exynos5_i2c_resume_noirq,
> +};
> +
> +#define EXYNOS5_DEV_PM_OPS (&exynos5_i2c_dev_pm_ops)
> +#else
> +#define EXYNOS5_DEV_PM_OPS NULL
> +#endif
> +
> +static struct platform_driver exynos5_i2c_driver = {
> +       .probe          = exynos5_i2c_probe,
> +       .remove         = exynos5_i2c_remove,
> +       .driver         = {
> +               .owner  = THIS_MODULE,
> +               .name   = "exynos5-hsi2c",
> +               .pm     = EXYNOS5_DEV_PM_OPS,
> +               .of_match_table = exynos5_i2c_match,
> +       },
> +};
> +
> +static int __init i2c_adap_exynos5_init(void)
> +{
> +       return platform_driver_register(&exynos5_i2c_driver);
> +}
> +subsys_initcall(i2c_adap_exynos5_init);
> +
> +static void __exit i2c_adap_exynos5_exit(void)
> +{
> +       platform_driver_unregister(&exynos5_i2c_driver);
> +}
> +module_exit(i2c_adap_exynos5_exit);
> +
> +MODULE_DESCRIPTION("Exynos5 HS-I2C Bus driver");
> +MODULE_AUTHOR("Naveen Krishna Chatradhi, <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>");
> +MODULE_AUTHOR("Taekgyun Ko, <taeggyun.ko-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>");
> +MODULE_LICENSE("GPL v2");
> --
> 1.7.9.5
>
>


-- 
Shine bright,
(: Nav :)

--001a113329e810040c04dec846fc
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<font color=3D"#663366"><font><font face=3D"verdana,sans-serif"><br></font>=
</font></font><div class=3D"gmail_quote">On 17 May 2013 15:40, Naveen Krish=
na Chatradhi <span dir=3D"ltr">&lt;<a href=3D"mailto:ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org"=
 target=3D"_blank">ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<div>Adds support for High Speed I2C driver found in Exynos5 and<br>
later SoCs from Samsung.<br>
<br>
</div><div>Driver only supports Device Tree method.<br>
<br>
</div><div>Changes since v1:<br>
1. Added FIFO functionality<br>
2. Added High speed mode functionality<br>
3. Remove SMBUS_QUICK<br>
4. Remove the debugfs functionality<br>
5. Use devm_* functions where ever possible<br>
</div>6. Driver is free from GPIO configs (only supports pinctrl method)<br=
>
<div>7. Use OF data string &quot;clock-frequency&quot; to get the bus opera=
ting frequencies<br>
8. Split the clock divisor calculation function<br>
9. Add resets for the failed transacton cases<br>
10. few other bug fixes and cosmetic changes<br>
<br>
</div><div>Signed-off-by: Taekgyun Ko &lt;<a href=3D"mailto:taeggyun.ko@sam=
sung.com" target=3D"_blank">taeggyun.ko-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org</a>&gt;<br>
Signed-off-by: Naveen Krishna Chatradhi &lt;<a href=3D"mailto:ch.naveen@sam=
sung.com" target=3D"_blank">ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org</a>&gt;<br>
</div><div>Reviewed-by: Simon Glass &lt;<a href=3D"mailto:sjg-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" t=
arget=3D"_blank">sjg-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org</a>&gt;<br>
Tested-by: Andrew Bresticker &lt;<a href=3D"mailto:abrestic-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" tar=
get=3D"_blank">abrestic-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org</a>&gt;<br>
Signed-off-by: Yuvaraj Kumar C D &lt;<a href=3D"mailto:yuvaraj.cd@samsung.c=
om" target=3D"_blank">yuvaraj.cd-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org</a>&gt;<br>
Signed-off-by: Andrew Bresticker &lt;<a href=3D"mailto:abrestic-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org"=
 target=3D"_blank">abrestic-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org</a>&gt;<br></div></blockquote><div><=
br></div><div>Hello Wolfram,</div><div><br></div><div>This driver was submi=
tted, reviewed several times.</div>


<div>and been improved as we were using it.</div><div><br></div><div>I did =
not see any review comments on this driver.</div><div>Can we get this merge=
d or Should we wait for few more reviews ?</div><div><br></div><div>Thanks =
&amp; Regards,</div>

<div>Naveen Krishna</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div>
---<br>
<br>
</div>Changes since v8<br>
1. improved the device tree bindings description page for i2c-exynos5<br>
2. fixed the return value check for devm_ioremap_resource<br>
<br>
=A0.../devicetree/bindings/i2c/i2c-exynos5.txt =A0 =A0 =A0 =A0| =A0 45 +<br=
>
<div>=A0drivers/i2c/busses/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 | =A0 =A07 +<br>
=A0drivers/i2c/busses/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A01 +<br>
</div>=A0drivers/i2c/busses/i2c-exynos5.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0888 ++++++++++++++++++++<br>
=A04 files changed, 941 insertions(+)<br>
<div>=A0create mode 100644 Documentation/devicetree/bindings/i2c/i2c-exynos=
5.txt<br>
=A0create mode 100644 drivers/i2c/busses/i2c-exynos5.c<br>
<br>
diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt b/Docume=
ntation/devicetree/bindings/i2c/i2c-exynos5.txt<br>
</div>new file mode 100644<br>
index 0000000..29c01c0<br>
--- /dev/null<br>
+++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt<br>
@@ -0,0 +1,45 @@<br>
<div>+* Samsung&#39;s High Speed I2C controller<br>
+<br>
+The Samsung&#39;s High Speed I2C controller is used to interface with I2C =
devices<br>
+at various speeds ranging from 100khz to 3.4Mhz.<br>
+<br>
+Required properties:<br>
+ =A0- compatible: value should be.<br>
</div>+ =A0 =A0 =A0-&gt; &quot;samsung,exynos5-hsi2c&quot;, for i2c compati=
ble with exynos5 hsi2c.<br>
<div>+ =A0- reg: physical base address of the controller and length of memo=
ry mapped<br>
+ =A0 =A0region.<br>
+ =A0- interrupts: interrupt number to the cpu.<br>
</div>+ =A0- #address-cells: always 1 (for i2c addresses)<br>
+ =A0- #size-cells: always 0<br>
+<br>
+ =A0- Pinctrl:<br>
<div>+ =A0 =A0- pinctrl-0: Pin control group to be used for this controller=
.<br>
+ =A0 =A0- pinctrl-names: Should contain only one value - &quot;default&quo=
t;.<br>
</div><div><div>+<br>
+Optional properties:<br>
+ =A0- samsung,hs-mode: Mode of operation, High speed or Fast speed mode. I=
f not<br>
+ =A0 =A0specified, default value is 0.<br>
+ =A0- clock-frequency: Desired operating frequency in Hz of the bus.<br>
+ =A0 =A0If not specified, the default value in Hz is 100000.<br>
+<br>
+Example:<br>
+<br>
+hsi2c@12ca0000 {<br>
+ =A0 =A0 =A0 compatible =3D &quot;samsung,exynos5-hsi2c&quot;;<br>
+ =A0 =A0 =A0 reg =3D &lt;0x12ca0000 0x100&gt;;<br>
+ =A0 =A0 =A0 interrupts =3D &lt;56&gt;;<br>
+ =A0 =A0 =A0 clock-frequency =3D &lt;100000&gt;;<br>
+<br>
+ =A0 =A0 =A0 /* Pinctrl variant begins here */<br>
+ =A0 =A0 =A0 pinctrl-0 =3D &lt;&amp;i2c4_bus&gt;;<br>
+ =A0 =A0 =A0 pinctrl-names =3D &quot;default&quot;;<br>
+ =A0 =A0 =A0 /* Pinctrl variant ends here */<br>
+<br>
+ =A0 =A0 =A0 #address-cells =3D &lt;1&gt;;<br>
+ =A0 =A0 =A0 #size-cells =3D &lt;0&gt;;<br>
+<br>
+ =A0 =A0 =A0 s2mps11_pmic@66 {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D &quot;samsung,s2mps11-pmic&quo=
t;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D &lt;0x66&gt;;<br>
+ =A0 =A0 =A0 };<br>
+};<br>
</div></div>diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kc=
onfig<br>
index adfee98..49a665f 100644<br>
--- a/drivers/i2c/busses/Kconfig<br>
+++ b/drivers/i2c/busses/Kconfig<br>
<div>@@ -434,6 +434,13 @@ config I2C_EG20T<br>
=A0 =A0 =A0 =A0 =A0 ML7213/ML7223/ML7831 is companion chip for Intel Atom E=
6xx series.<br>
=A0 =A0 =A0 =A0 =A0 ML7213/ML7223/ML7831 is completely compatible for Intel=
 EG20T PCH.<br>
<br>
</div>+config I2C_EXYNOS5<br>
<div>+ =A0 =A0 =A0 tristate &quot;Exynos5 high-speed I2C driver&quot;<br>
+ =A0 =A0 =A0 depends on ARCH_EXYNOS5 &amp;&amp; OF<br>
</div>+ =A0 =A0 =A0 help<br>
<div>+ =A0 =A0 =A0 =A0 Say Y here to include support for high-speed I2C con=
troller in the<br>
+ =A0 =A0 =A0 =A0 Exynos5 based Samsung SoCs.<br>
+<br>
=A0config I2C_GPIO<br>
=A0 =A0 =A0 =A0 tristate &quot;GPIO-based bitbanging I2C&quot;<br>
=A0 =A0 =A0 =A0 depends on GENERIC_GPIO<br>
</div>diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefil=
e<br>
index 8f4fc23..b19366c 100644<br>
--- a/drivers/i2c/busses/Makefile<br>
+++ b/drivers/i2c/busses/Makefile<br>
<div>@@ -42,6 +42,7 @@ i2c-designware-platform-objs :=3D i2c-designware-pla=
tdrv.o<br>
=A0obj-$(CONFIG_I2C_DESIGNWARE_PCI) =A0 =A0 =A0 +=3D i2c-designware-pci.o<b=
r>
=A0i2c-designware-pci-objs :=3D i2c-designware-pcidrv.o<br>
=A0obj-$(CONFIG_I2C_EG20T) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D i2c-eg20t.o<=
br>
+obj-$(CONFIG_I2C_EXYNOS5) =A0 =A0 =A0+=3D i2c-exynos5.o<br>
=A0obj-$(CONFIG_I2C_GPIO) =A0 =A0 =A0 =A0 +=3D i2c-gpio.o<br>
=A0obj-$(CONFIG_I2C_HIGHLANDER) =A0 +=3D i2c-highlander.o<br>
=A0obj-$(CONFIG_I2C_IBM_IIC) =A0 =A0 =A0+=3D i2c-ibm_iic.o<br>
</div><div>diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/buss=
es/i2c-exynos5.c<br>
new file mode 100644<br>
</div>index 0000000..33c481d<br>
--- /dev/null<br>
+++ b/drivers/i2c/busses/i2c-exynos5.c<br>
<div>@@ -0,0 +1,888 @@<br>
+/**<br>
+ * i2c-exynos5.c - Samsung Exynos5 I2C Controller Driver<br>
</div>+ *<br>
+ * Copyright (C) 2013 Samsung Electronics Co., Ltd.<br>
+ *<br>
<div>+ * This program is free software; you can redistribute it and/or modi=
fy<br>
+ * it under the terms of the GNU General Public License version 2 as<br>
+ * published by the Free Software Foundation.<br>
+*/<br>
+<br>
+#include &lt;linux/kernel.h&gt;<br>
+#include &lt;linux/module.h&gt;<br>
+<br>
+#include &lt;linux/i2c.h&gt;<br>
+#include &lt;linux/init.h&gt;<br>
+#include &lt;linux/time.h&gt;<br>
+#include &lt;linux/interrupt.h&gt;<br>
+#include &lt;linux/delay.h&gt;<br>
+#include &lt;linux/errno.h&gt;<br>
+#include &lt;linux/err.h&gt;<br>
+#include &lt;linux/platform_device.h&gt;<br>
</div>+#include &lt;linux/pm_runtime.h&gt;<br>
<div>+#include &lt;linux/clk.h&gt;<br>
+#include &lt;linux/slab.h&gt;<br>
+#include &lt;linux/io.h&gt;<br>
</div><div>+#include &lt;linux/of_address.h&gt;<br>
+#include &lt;linux/of_irq.h&gt;<br>
+#include &lt;linux/of_i2c.h&gt;<br>
+<br>
+/*<br>
+ * HSI2C controller from Samsung supports 2 modes of operation<br>
+ * 1. Auto mode: Where in master automatically controls the whole transact=
ion<br>
+ * 2. Manual mode: Software controls the transaction by issuing commands<b=
r>
+ * =A0 =A0START, READ, WRITE, STOP, RESTART in I2C_MANUAL_CMD register.<br=
>
+ *<br>
+ * Operation mode can be selected by setting AUTO_MODE bit in I2C_CONF reg=
ister<br>
+ *<br>
+ * Special bits are available for both modes of operation to set commands<=
br>
+ * and for checking transfer status<br>
+ */<br>
+<br>
</div>+/* Register Map */<br>
<div>+#define HSI2C_CTL =A0 =A0 =A0 =A0 =A0 =A0 =A00x00<br>
+#define HSI2C_FIFO_CTL =A0 =A0 =A0 =A0 0x04<br>
+#define HSI2C_TRAILIG_CTL =A0 =A0 =A00x08<br>
+#define HSI2C_CLK_CTL =A0 =A0 =A0 =A0 =A00x0C<br>
+#define HSI2C_CLK_SLOT =A0 =A0 =A0 =A0 0x10<br>
+#define HSI2C_INT_ENABLE =A0 =A0 =A0 0x20<br>
+#define HSI2C_INT_STATUS =A0 =A0 =A0 0x24<br>
+#define HSI2C_ERR_STATUS =A0 =A0 =A0 0x2C<br>
+#define HSI2C_FIFO_STATUS =A0 =A0 =A00x30<br>
+#define HSI2C_TX_DATA =A0 =A0 =A0 =A0 =A00x34<br>
+#define HSI2C_RX_DATA =A0 =A0 =A0 =A0 =A00x38<br>
+#define HSI2C_CONF =A0 =A0 =A0 =A0 =A0 =A0 0x40<br>
</div>+#define HSI2C_AUTO_CONF =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00x44<br>
<div>+#define HSI2C_TIMEOUT =A0 =A0 =A0 =A0 =A00x48<br>
+#define HSI2C_MANUAL_CMD =A0 =A0 =A0 0x4C<br>
+#define HSI2C_TRANS_STATUS =A0 =A0 0x50<br>
+#define HSI2C_TIMING_HS1 =A0 =A0 =A0 0x54<br>
+#define HSI2C_TIMING_HS2 =A0 =A0 =A0 0x58<br>
+#define HSI2C_TIMING_HS3 =A0 =A0 =A0 0x5C<br>
+#define HSI2C_TIMING_FS1 =A0 =A0 =A0 0x60<br>
+#define HSI2C_TIMING_FS2 =A0 =A0 =A0 0x64<br>
+#define HSI2C_TIMING_FS3 =A0 =A0 =A0 0x68<br>
+#define HSI2C_TIMING_SLA =A0 =A0 =A0 0x6C<br>
+#define HSI2C_ADDR =A0 =A0 =A0 =A0 =A0 =A0 0x70<br>
+<br>
</div>+/* I2C_CTL Register bits */<br>
<div>+#define HSI2C_FUNC_MODE_I2C =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1=
u &lt;&lt; 0)<br>
+#define HSI2C_MASTER =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (=
1u &lt;&lt; 3)<br>
+#define HSI2C_RXCHON =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (=
1u &lt;&lt; 6)<br>
+#define HSI2C_TXCHON =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (=
1u &lt;&lt; 7)<br>
</div><div>+#define HSI2C_SW_RST =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 (1u &lt;&lt; 31)<br>
+<br>
</div>+/* I2C_FIFO_CTL Register bits */<br>
<div>+#define HSI2C_RXFIFO_EN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0(1u &lt;&lt; 0)<br>
+#define HSI2C_TXFIFO_EN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0(1u &lt;&lt; 1)<br>
</div><div>+#define HSI2C_FIFO_MAX =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 (0x40)<br>
+#define HSI2C_RXFIFO_TRIGGER_LEVEL(x) =A0 =A0 =A0 =A0 =A0((x) &lt;&lt; 4)<=
br>
+#define HSI2C_TXFIFO_TRIGGER_LEVEL(x) =A0 =A0 =A0 =A0 =A0((x) &lt;&lt; 16)=
<br>
</div>+/* I2C_TRAILING_CTL Register bits */<br>
+#define HSI2C_TRAILING_COUNT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0xf)<br>
+<br>
+/* I2C_INT_EN Register bits */<br>
+#define HSI2C_INT_TX_ALMOSTEMPTY_EN =A0 =A0 =A0 =A0 =A0 =A0(1u &lt;&lt; 0)=
<br>
<div><div>+#define HSI2C_INT_RX_ALMOSTFULL_EN =A0 =A0 =A0 =A0 =A0 =A0 (1u &=
lt;&lt; 1)<br>
+#define HSI2C_INT_TRAILING_EN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1u &lt;&=
lt; 6)<br>
+#define HSI2C_INT_I2C_EN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1u &=
lt;&lt; 9)<br>
+<br>
+/* I2C_INT_STAT Register bits */<br>
+#define HSI2C_INT_TX_ALMOSTEMPTY =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1u &lt;&lt; =
0)<br>
+#define HSI2C_INT_RX_ALMOSTFULL =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0(1u &lt;&lt; 1)<br>
+#define HSI2C_INT_TX_UNDERRUN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1u &lt;&=
lt; 2)<br>
+#define HSI2C_INT_TX_OVERRUN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1u &lt;&=
lt; 3)<br>
+#define HSI2C_INT_RX_UNDERRUN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1u &lt;&=
lt; 4)<br>
+#define HSI2C_INT_RX_OVERRUN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1u &lt;&=
lt; 5)<br>
+#define HSI2C_INT_TRAILING =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1u &lt=
;&lt; 6)<br>
+#define HSI2C_INT_I2C =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(=
1u &lt;&lt; 9)<br>
+#define HSI2C_RX_INT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (=
HSI2C_INT_RX_ALMOSTFULL | \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0HSI2C_INT_RX_UNDERRUN | \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0HSI2C_INT_RX_OVERRUN | \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0HSI2C_INT_TRAILING)<br>
+<br>
+/* I2C_FIFO_STAT Register bits */<br>
+#define HSI2C_RX_FIFO_EMPTY =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1u &lt=
;&lt; 24)<br>
+#define HSI2C_RX_FIFO_FULL =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1u &lt=
;&lt; 23)<br>
+#define HSI2C_RX_FIFO_LVL(x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ((x &gt;&=
gt; 16) &amp; 0x7f)<br>
+#define HSI2C_TX_FIFO_EMPTY =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1u &lt=
;&lt; 8)<br>
+#define HSI2C_TX_FIFO_FULL =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1u &lt=
;&lt; 7)<br>
+#define HSI2C_TX_FIFO_LVL(x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ((x &gt;&=
gt; 0) &amp; 0x7f)<br>
+#define HSI2C_FIFO_EMPTY =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (HSI2=
C_RX_FIFO_EMPTY | =A0\<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 HSI2C_TX_FIFO_EMPTY)<br>
+<br>
</div></div>+/* I2C_CONF Register bits */<br>
<div>+#define HSI2C_AUTO_MODE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0(1u &lt;&lt; 31)<br>
+#define HSI2C_10BIT_ADDR_MODE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1u &lt;&=
lt; 30)<br>
+#define HSI2C_HS_MODE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(=
1u &lt;&lt; 29)<br>
+<br>
</div>+/* I2C_AUTO_CONF Register bits */<br>
<div>+#define HSI2C_READ_WRITE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
(1u &lt;&lt; 16)<br>
+#define HSI2C_STOP_AFTER_TRANS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1u &lt;&lt=
; 17)<br>
+#define HSI2C_MASTER_RUN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1u &=
lt;&lt; 31)<br>
+<br>
</div>+/* I2C_TIMEOUT Register bits */<br>
<div>+#define HSI2C_TIMEOUT_EN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
(1u &lt;&lt; 31)<br>
+<br>
</div><div><div>+/* I2C_TRANS_STATUS register bits */<br>
+#define HSI2C_MASTER_BUSY =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1u &=
lt;&lt; 17)<br>
+#define HSI2C_SLAVE_BUSY =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1u &=
lt;&lt; 16)<br>
+#define HSI2C_TIMEOUT_AUTO =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1u &lt=
;&lt; 4)<br>
+#define HSI2C_NO_DEV =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (=
1u &lt;&lt; 3)<br>
+#define HSI2C_NO_DEV_ACK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1u &=
lt;&lt; 2)<br>
+#define HSI2C_TRANS_ABORT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1u &=
lt;&lt; 1)<br>
+#define HSI2C_TRANS_DONE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1u &=
lt;&lt; 0)<br>
+<br>
+/* I2C_ADDR register bits */<br>
+#define HSI2C_SLV_ADDR_SLV(x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0((x &amp;=
 0x3ff) &lt;&lt; 0)<br>
+#define HSI2C_SLV_ADDR_MAS(x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0((x &amp;=
 0x3ff) &lt;&lt; 10)<br>
+#define HSI2C_MASTER_ID(x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ((x &am=
p; 0xff) &lt;&lt; 24)<br>
+#define MASTER_ID(x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (=
(x &amp; 0x7) + 0x08)<br>
+<br>
+/*<br>
+ * Controller operating frequency, timing values for operation<br>
+ * are calculated against this frequency<br>
+ */<br>
+#define HSI2C_HS_TX_CLOCK =A0 =A0 =A01000000<br>
+#define HSI2C_FS_TX_CLOCK =A0 =A0 =A01000000<br>
+#define HSI2C_HIGH_SPD =A0 =A0 =A0 =A0 1<br>
+#define HSI2C_FAST_SPD =A0 =A0 =A0 =A0 0<br>
+<br>
+#define EXYNOS5_I2C_TIMEOUT (msecs_to_jiffies(1000))<br>
+<br>
+/* timeout for pm runtime autosuspend */<br>
+#define EXYNOS5_I2C_PM_TIMEOUT =A0 =A0 =A0 =A0 1000 =A0 =A0/* ms */<br>
+<br>
+struct exynos5_i2c {<br>
</div></div>+ =A0 =A0 =A0 struct i2c_adapter =A0 =A0 =A0adap;<br>
<div>+ =A0 =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0suspended:1;<br>
+<br>
+ =A0 =A0 =A0 struct i2c_msg =A0 =A0 =A0 =A0 =A0*msg;<br>
+ =A0 =A0 =A0 struct completion =A0 =A0 =A0 msg_complete;<br>
</div><div>+ =A0 =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0msg_ptr;<br>
+ =A0 =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0msg_len;<br>
</div><div>+<br>
+ =A0 =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0irq;<br>
+<br>
+ =A0 =A0 =A0 void __iomem =A0 =A0 =A0 =A0 =A0 =A0*regs;<br>
+ =A0 =A0 =A0 struct clk =A0 =A0 =A0 =A0 =A0 =A0 =A0*clk;<br>
+ =A0 =A0 =A0 struct device =A0 =A0 =A0 =A0 =A0 *dev;<br>
</div><div>+ =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 state;=
<br>
+<br>
+ =A0 =A0 =A0 /*<br>
+ =A0 =A0 =A0 =A0* Since the TRANS_DONE bit is cleared on read, and we may =
read it<br>
+ =A0 =A0 =A0 =A0* either during an IRQ or after a transaction, keep track =
of its<br>
+ =A0 =A0 =A0 =A0* state here.<br>
+ =A0 =A0 =A0 =A0*/<br>
+ =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 trans_done;<br>
+<br>
+ =A0 =A0 =A0 /* Controller operating frequency */<br>
+ =A0 =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0fs_clock;<br>
+ =A0 =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0hs_clock;<br>
+<br>
+ =A0 =A0 =A0 /*<br>
+ =A0 =A0 =A0 =A0* HSI2C Controller can operate in<br>
+ =A0 =A0 =A0 =A0* 1. High speed upto 3.4Mbps<br>
+ =A0 =A0 =A0 =A0* 2. Fast speed upto 1Mbps<br>
+ =A0 =A0 =A0 =A0*/<br>
+ =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 speed_mode;<br>
+ =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bus_id;<br>
</div>+};<br>
+<br>
<div>+static const struct of_device_id exynos5_i2c_match[] =3D {<br>
</div>+ =A0 =A0 =A0 { .compatible =3D &quot;samsung,exynos5-hsi2c&quot; },<=
br>
<div>+ =A0 =A0 =A0 {},<br>
+};<br>
+MODULE_DEVICE_TABLE(of, exynos5_i2c_match);<br>
</div><div>+<br>
+static void exynos5_i2c_clr_pend_irq(struct exynos5_i2c *i2c)<br>
+{<br>
+ =A0 =A0 =A0 writel(readl(i2c-&gt;regs + HSI2C_INT_STATUS),<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c-&gt=
;regs + HSI2C_INT_STATUS);<br>
+}<br>
+<br>
<div>+/*<br>
+ * exynos5_i2c_set_timing: updates the registers with appropriate<br>
+ * timing values calculated<br>
+ *<br>
+ * Returns 0 on success, -EINVAL if the cycle length cannot<br>
+ * be calculated.<br>
+ */<br>
+static int exynos5_i2c_set_timing(struct exynos5_i2c *i2c, int mode)<br>
+{<br>
+ =A0 =A0 =A0 u32 i2c_timing_s1;<br>
+ =A0 =A0 =A0 u32 i2c_timing_s2;<br>
+ =A0 =A0 =A0 u32 i2c_timing_s3;<br>
+ =A0 =A0 =A0 u32 i2c_timing_sla;<br>
</div><div>+ =A0 =A0 =A0 unsigned int t_start_su, t_start_hd;<br>
+ =A0 =A0 =A0 unsigned int t_stop_su;<br>
+ =A0 =A0 =A0 unsigned int t_data_su, t_data_hd;<br>
+ =A0 =A0 =A0 unsigned int t_scl_l, t_scl_h;<br>
+ =A0 =A0 =A0 unsigned int t_sr_release;<br>
+ =A0 =A0 =A0 unsigned int t_ftl_cycle;<br>
</div><div>+ =A0 =A0 =A0 unsigned int clkin =3D clk_get_rate(i2c-&gt;clk);<=
br>
</div><div>+ =A0 =A0 =A0 unsigned int div, utemp0 =3D 0, utemp1 =3D 0, clk_=
cycle;<br>
+ =A0 =A0 =A0 unsigned int op_clk =3D (mode =3D=3D HSI2C_HIGH_SPD) ?<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c-&gt;hs_cl=
ock : i2c-&gt;fs_clock;<br>
+<br>
+ =A0 =A0 =A0 /*<br>
</div>+ =A0 =A0 =A0 =A0* FPCLK / FI2C =3D<br>
<div>+ =A0 =A0 =A0 =A0* (CLK_DIV + 1) * (TSCLK_L + TSCLK_H + 2) + 8 + 2 * F=
LT_CYCLE<br>
</div>+ =A0 =A0 =A0 =A0* utemp0 =3D (CLK_DIV + 1) * (TSCLK_L + TSCLK_H + 2)=
<br>
+ =A0 =A0 =A0 =A0* utemp1 =3D (TSCLK_L + TSCLK_H + 2)<br>
<div>+ =A0 =A0 =A0 =A0*/<br>
+ =A0 =A0 =A0 t_ftl_cycle =3D (readl(i2c-&gt;regs + HSI2C_CONF) &gt;&gt; 16=
) &amp; 0x7;<br>
+ =A0 =A0 =A0 utemp0 =3D (clkin / op_clk) - 8 - 2 * t_ftl_cycle;<br>
+<br>
+ =A0 =A0 =A0 /* CLK_DIV max is 256 */<br>
</div><div>+ =A0 =A0 =A0 for (div =3D 0; div &lt; 256; div++) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 utemp1 =3D utemp0 / (div + 1);<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* SCL_L and SCL_H each has max value of 25=
5<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* Hence, For the clk_cycle to the have rig=
ht value<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* utemp1 has to be less then 512 and more =
than 4.<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((utemp1 &lt; 512) &amp;&amp; (utemp1 &gt;=
 4)) {<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clk_cycle =3D utemp1 - =
2;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;<br>
<div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else if (div =3D=3D 255) {<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_warn(i2c-&gt;dev, &=
quot;Failed to calculate divisor&quot;);<br>
<div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
+ =A0 =A0 =A0 }<br>
</div>+<br>
+ =A0 =A0 =A0 t_scl_l =3D clk_cycle / 2;<br>
+ =A0 =A0 =A0 t_scl_h =3D clk_cycle / 2;<br>
<div>+ =A0 =A0 =A0 t_start_su =3D t_scl_l;<br>
+ =A0 =A0 =A0 t_start_hd =3D t_scl_l;<br>
+ =A0 =A0 =A0 t_stop_su =3D t_scl_l;<br>
+ =A0 =A0 =A0 t_data_su =3D t_scl_l / 2;<br>
+ =A0 =A0 =A0 t_data_hd =3D t_scl_l / 2;<br>
</div>+ =A0 =A0 =A0 t_sr_release =3D clk_cycle;<br>
<div>+<br>
+ =A0 =A0 =A0 i2c_timing_s1 =3D t_start_su &lt;&lt; 24 | t_start_hd &lt;&lt=
; 16 | t_stop_su &lt;&lt; 8;<br>
+ =A0 =A0 =A0 i2c_timing_s2 =3D t_data_su &lt;&lt; 24 | t_scl_l &lt;&lt; 8 =
| t_scl_h &lt;&lt; 0;<br>
</div>+ =A0 =A0 =A0 i2c_timing_s3 =3D div &lt;&lt; 16 | t_sr_release &lt;&l=
t; 0;<br>
<div>+ =A0 =A0 =A0 i2c_timing_sla =3D t_data_hd &lt;&lt; 0;<br>
+<br>
+ =A0 =A0 =A0 dev_dbg(i2c-&gt;dev, &quot;tSTART_SU: %X, tSTART_HD: %X, tSTO=
P_SU: %X\n&quot;,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 t_start_su, t_start_hd, t_stop_su);<br>
+ =A0 =A0 =A0 dev_dbg(i2c-&gt;dev, &quot;tDATA_SU: %X, tSCL_L: %X, tSCL_H: =
%X\n&quot;,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 t_data_su, t_scl_l, t_scl_h);<br>
+ =A0 =A0 =A0 dev_dbg(i2c-&gt;dev, &quot;nClkDiv: %X, tSR_RELEASE: %X\n&quo=
t;,<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 div, t_sr_release);<br>
<div>+ =A0 =A0 =A0 dev_dbg(i2c-&gt;dev, &quot;tDATA_HD: %X\n&quot;, t_data_=
hd);<br>
+<br>
</div>+ =A0 =A0 =A0 if (mode =3D=3D HSI2C_HIGH_SPD) {<br>
<div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(i2c_timing_s1, i2c-&gt;regs + HSI=
2C_TIMING_HS1);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(i2c_timing_s2, i2c-&gt;regs + HSI2C_TI=
MING_HS2);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(i2c_timing_s3, i2c-&gt;regs + HSI2C_TI=
MING_HS3);<br>
+ =A0 =A0 =A0 } else {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(i2c_timing_s1, i2c-&gt;regs + HSI2C_TI=
MING_FS1);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(i2c_timing_s2, i2c-&gt;regs + HSI2C_TI=
MING_FS2);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(i2c_timing_s3, i2c-&gt;regs + HSI2C_TI=
MING_FS3);<br>
+ =A0 =A0 =A0 }<br>
+ =A0 =A0 =A0 writel(i2c_timing_sla, i2c-&gt;regs + HSI2C_TIMING_SLA);<br>
+<br>
+ =A0 =A0 =A0 return 0;<br>
+}<br>
+<br>
</div><div>+static int exynos5_hsi2c_clock_setup(struct exynos5_i2c *i2c)<b=
r>
+{<br>
+ =A0 =A0 =A0 /*<br>
+ =A0 =A0 =A0 =A0* Configure the Fast speed timing values<br>
+ =A0 =A0 =A0 =A0* Even the High Speed mode initially starts with Fast mode=
<br>
+ =A0 =A0 =A0 =A0*/<br>
+ =A0 =A0 =A0 if (exynos5_i2c_set_timing(i2c, HSI2C_FAST_SPD)) {<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(i2c-&gt;dev, &quot;HSI2C FS Clo=
ck set up failed\n&quot;);<br>
<div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;<br>
+ =A0 =A0 =A0 }<br>
+<br>
</div>+ =A0 =A0 =A0 /* configure the High speed timing values */<br>
<div>+ =A0 =A0 =A0 if (i2c-&gt;speed_mode =3D=3D HSI2C_HIGH_SPD) {<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (exynos5_i2c_set_timing(i2c, HSI2C_H=
IGH_SPD)) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(i2c-&gt;dev, &quot;HS=
I2C HS Clock set up failed\n&quot;);<br>
<div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
+ =A0 =A0 =A0 }<br>
</div><div>+<br>
+ =A0 =A0 =A0 return 0;<br>
+}<br>
+<br>
</div><div>+/*<br>
+ * exynos5_i2c_init: configures the controller for I2C functionality<br>
+ * Programs I2C controller for Master mode operation<br>
+ */<br>
</div>+static void exynos5_i2c_init(struct exynos5_i2c *i2c)<br>
+{<br>
+ =A0 =A0 =A0 u32 i2c_conf =3D readl(i2c-&gt;regs + HSI2C_CONF);<br>
+<br>
+ =A0 =A0 =A0 writel((HSI2C_FUNC_MODE_I2C | HSI2C_MASTER),<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 i2c-&gt;regs + HSI2C_CTL);<br>
+ =A0 =A0 =A0 writel(HSI2C_TRAILING_COUNT, i2c-&gt;regs + HSI2C_TRAILIG_CTL=
);<br>
+<br>
<div>+ =A0 =A0 =A0 if (i2c-&gt;speed_mode =3D=3D HSI2C_HIGH_SPD) {<br>
</div><div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(HSI2C_MASTER_ID(MASTER_ID(i=
2c-&gt;bus_id)),<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 i2c-&gt;regs + HSI2C_ADDR);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c_conf |=3D HSI2C_HS_MODE;<br>
+ =A0 =A0 =A0 }<br>
+<br>
</div>+ =A0 =A0 =A0 writel(i2c_conf | HSI2C_AUTO_MODE, i2c-&gt;regs + HSI2C=
_CONF);<br>
+}<br>
+<br>
+static void exynos5_i2c_reset(struct exynos5_i2c *i2c)<br>
+{<br>
<div>+ =A0 =A0 =A0 u32 i2c_ctl;<br>
+<br>
+ =A0 =A0 =A0 /* Set and clear the bit for reset */<br>
+ =A0 =A0 =A0 i2c_ctl =3D readl(i2c-&gt;regs + HSI2C_CTL);<br>
+ =A0 =A0 =A0 i2c_ctl |=3D HSI2C_SW_RST;<br>
</div>+ =A0 =A0 =A0 writel(i2c_ctl, i2c-&gt;regs + HSI2C_CTL);<br>
+<br>
<div>+ =A0 =A0 =A0 i2c_ctl =3D readl(i2c-&gt;regs + HSI2C_CTL);<br>
+ =A0 =A0 =A0 i2c_ctl &amp;=3D ~HSI2C_SW_RST;<br>
</div>+ =A0 =A0 =A0 writel(i2c_ctl, i2c-&gt;regs + HSI2C_CTL);<br>
+<br>
<div>+ =A0 =A0 =A0 /* We don&#39;t expect calculations to fail during the r=
un */<br>
+ =A0 =A0 =A0 exynos5_hsi2c_clock_setup(i2c);<br>
+ =A0 =A0 =A0 /* Initialize the configure registers */<br>
+ =A0 =A0 =A0 exynos5_i2c_init(i2c);<br>
+}<br>
+<br>
+/*<br>
+ * exynos5_i2c_irq: top level IRQ servicing routine<br>
+ *<br>
+ * INT_STATUS registers gives the interrupt details. Further,<br>
+ * FIFO_STATUS or TRANS_STATUS registers are to be check for detailed<br>
+ * state of the bus.<br>
+ */<br>
</div><div>+static irqreturn_t exynos5_i2c_irq(int irqno, void *dev_id)<br>
+{<br>
+ =A0 =A0 =A0 struct exynos5_i2c *i2c =3D dev_id;<br>
</div><div>+ =A0 =A0 =A0 u32 fifo_level, int_status, fifo_status, trans_sta=
tus;<br>
</div>+ =A0 =A0 =A0 unsigned char byte;<br>
<div>+ =A0 =A0 =A0 int len =3D 0;<br>
+<br>
+ =A0 =A0 =A0 i2c-&gt;state =3D -EINVAL;<br>
+<br>
</div>+ =A0 =A0 =A0 int_status =3D readl(i2c-&gt;regs + HSI2C_INT_STATUS);<=
br>
+ =A0 =A0 =A0 fifo_status =3D readl(i2c-&gt;regs + HSI2C_FIFO_STATUS);<br>
+<br>
<div>+ =A0 =A0 =A0 if (int_status &amp; HSI2C_INT_I2C) {<br>
</div><div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 trans_status =3D readl(i2c-&gt;reg=
s + HSI2C_TRANS_STATUS);<br>
</div><div><div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (trans_status &amp; HSI2C_=
NO_DEV_ACK) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_dbg(i2c-&gt;dev, &quot;No=
 ACK from device\n&quot;);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c-&gt;state =3D -ENXIO;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else if (trans_status &amp; HSI2C_NO_DEV) {=
<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_dbg(i2c-&gt;dev, &quot;No=
 device\n&quot;);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c-&gt;state =3D -ENXIO;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else if (trans_status &amp; HSI2C_TRANS_ABO=
RT) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_dbg(i2c-&gt;dev, &quot;De=
al with arbitration lose\n&quot;);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c-&gt;state =3D -EAGAIN;<br=
>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else if (trans_status &amp; HSI2C_TIMEOUT_A=
UTO) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_dbg(i2c-&gt;dev, &quot;Ac=
cessing device timed out\n&quot;);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c-&gt;state =3D -EAGAIN;<br=
>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else if (trans_status &amp; HSI2C_TRANS_DON=
E) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c-&gt;trans_done =3D 1;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c-&gt;state =3D 0;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
+ =A0 =A0 =A0 }<br>
+ =A0 =A0 =A0 /* TX_ALMOSTEMPTY can happen along with HSI2C_INT_I2C */<br>
+ =A0 =A0 =A0 else if (int_status &amp;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (HSI2C_INT_TX_UNDERRUN | HSI2=
C_INT_TX_ALMOSTEMPTY)) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 fifo_level =3D HSI2C_TX_FIFO_LVL(fifo_status)=
;<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* To support probing the devices for detecti=
on */<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (i2c-&gt;msg-&gt;len =3D=3D 0) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c-&gt;state =3D -ENXIO;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto stop;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 len =3D HSI2C_FIFO_MAX - fifo_level;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (len &gt; i2c-&gt;msg-&gt;len)<br>
</div></div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 len =3D i2c-&gt;m=
sg-&gt;len;<br>
+<br>
<div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c-&gt;msg_len +=3D len;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 while (len &gt; 0) {<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 byte =3D i2c-&gt;msg-&g=
t;buf[i2c-&gt;msg_ptr++];<br>
<div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(byte, i2c-&gt;reg=
s + HSI2C_TX_DATA);<br>
</div><div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 len--;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c-&gt;state =3D 0;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto stop;<br>
+ =A0 =A0 =A0 }<br>
+ =A0 =A0 =A0 /* If TX FIFO is full (give chance to clear) */<br>
+ =A0 =A0 =A0 else if (int_status &amp; HSI2C_INT_TX_OVERRUN)<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c-&gt;state =3D 0;<br>
+<br>
<div>+ =A0 =A0 =A0 if (int_status &amp; (HSI2C_INT_RX_OVERRUN | HSI2C_INT_T=
RAILING |<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 HSI2C_INT_RX_UNDERRUN | HSI2C_INT_RX_ALMOSTFU=
LL)) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 fifo_level =3D HSI2C_RX_FIFO_LVL(fifo_status)=
;<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (fifo_level &gt;=3D i2c-&gt;msg-&gt;len)<b=
r>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 len =3D i2c-&gt;msg-&gt;len;<=
br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 else<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 len =3D fifo_level;<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c-&gt;msg_len +=3D len;<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 while (len &gt; 0) {<br>
<div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 byte =3D (unsigned char)=
<br>
</div><div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 re=
adl(i2c-&gt;regs + HSI2C_RX_DATA);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c-&gt;msg-&gt;buf[i2c-&gt;m=
sg_ptr++] =3D byte;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 len--;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c-&gt;state =3D 0;<br>
+ =A0 =A0 =A0 }<br>
+<br>
+<br>
+ stop:<br>
+ =A0 =A0 =A0 if ((i2c-&gt;msg_len =3D=3D i2c-&gt;msg-&gt;len) || (i2c-&gt;=
state &lt; 0)) {<br>
</div><div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(0, i2c-&gt;regs + HSI2C_INT=
_ENABLE);<br>
</div><div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 complete(&amp;i2c-&gt;msg_complete=
);<br>
+ =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 exynos5_i2c_clr_pend_irq(i2c);<br>
</div><div>+<br>
+ =A0 =A0 =A0 return IRQ_HANDLED;<br>
+}<br>
+<br>
</div><div>+/*<br>
+ * exynos5_i2c_wait_bus_idle<br>
+ *<br>
+ * Wait for the transaction to complete (indicated by the TRANS_DONE bit<b=
r>
+ * being set), and, if this is the last message in a transfer, wait for th=
e<br>
+ * MASTER_BUSY bit to be cleared.<br>
+ *<br>
+ * Returns -EBUSY if the bus cannot be bought to idle<br>
+ */<br>
</div>+static int exynos5_i2c_wait_bus_idle(struct exynos5_i2c *i2c, int st=
op)<br>
+{<br>
<div>+ =A0 =A0 =A0 unsigned long stop_time;<br>
+ =A0 =A0 =A0 u32 trans_status;<br>
+<br>
+ =A0 =A0 =A0 /* wait for 100 milli seconds for the bus to be idle */<br>
+ =A0 =A0 =A0 stop_time =3D jiffies + msecs_to_jiffies(100) + 1;<br>
+ =A0 =A0 =A0 do {<br>
</div><div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 trans_status =3D readl(i2c-&gt;reg=
s + HSI2C_TRANS_STATUS);<br>
</div><div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (trans_status &amp; HSI2C_TRANS=
_DONE)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c-&gt;trans_done =3D 1;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* Only wait for MASTER_BUSY to be cleared =
if this is the last<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* message.<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((!stop || !(trans_status &amp; HSI2C_MAST=
ER_BUSY)) &amp;&amp;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c-&gt;trans_done)<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;<br>
+<br>
<div><div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 usleep_range(50, 200);<br>
+ =A0 =A0 =A0 } while (time_before(jiffies, stop_time));<br>
+<br>
+ =A0 =A0 =A0 return -EBUSY;<br>
+}<br>
+<br>
+/*<br>
+ * exynos5_i2c_message_start: Configures the bus and starts the xfer<br>
+ * i2c: struct exynos5_i2c pointer for the current bus<br>
+ * stop: Enables stop after transfer if set. Set for last transfer of<br>
+ * =A0 =A0 =A0 in the list of messages.<br>
+ *<br>
+ * Configures the bus for read/write function<br>
+ * Sets chip address to talk to, message length to be sent.<br>
+ * Enables appropriate interrupts and sends start xfer command.<br>
+ */<br>
+static void exynos5_i2c_message_start(struct exynos5_i2c *i2c, int stop)<b=
r>
+{<br>
+ =A0 =A0 =A0 u32 i2c_ctl;<br>
+ =A0 =A0 =A0 u32 int_en =3D HSI2C_INT_I2C_EN;<br>
+ =A0 =A0 =A0 u32 i2c_auto_conf =3D 0;<br>
+ =A0 =A0 =A0 u32 fifo_ctl;<br>
+ =A0 =A0 =A0 u32 i2c_timeout;<br>
+<br>
+ =A0 =A0 =A0 /*<br>
+ =A0 =A0 =A0 =A0* When the message length is &gt; FIFO depth, set the FIFO=
 trigger<br>
+ =A0 =A0 =A0 =A0* at FIFO_MAX - 4. Just for ease of handling.<br>
+ =A0 =A0 =A0 =A0*/<br>
+ =A0 =A0 =A0 unsigned short len =3D (i2c-&gt;msg-&gt;len &gt; HSI2C_FIFO_M=
AX) ?<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 (HSI2C_FIFO_MAX - 4) : i2c-&gt;msg-&gt;len;<br>
</div></div><div>+<br>
+ =A0 =A0 =A0 /* Clear to enable Timeout */<br>
</div>+ =A0 =A0 =A0 i2c_timeout =3D readl(i2c-&gt;regs + HSI2C_TIMEOUT);<br=
>
<div>+ =A0 =A0 =A0 i2c_timeout &amp;=3D ~HSI2C_TIMEOUT_EN;<br>
+ =A0 =A0 =A0 writel(i2c_timeout, i2c-&gt;regs + HSI2C_TIMEOUT);<br>
+<br>
</div><div>+ =A0 =A0 =A0 fifo_ctl =3D HSI2C_RXFIFO_EN | HSI2C_TXFIFO_EN;<br=
>
</div>+ =A0 =A0 =A0 writel(fifo_ctl, i2c-&gt;regs + HSI2C_FIFO_CTL);<br>
+<br>
+ =A0 =A0 =A0 i2c_ctl =3D readl(i2c-&gt;regs + HSI2C_CTL);<br>
+ =A0 =A0 =A0 i2c_ctl &amp;=3D ~(HSI2C_TXCHON | HSI2C_RXCHON);<br>
<div>+ =A0 =A0 =A0 if (i2c-&gt;msg-&gt;flags &amp; I2C_M_RD) {<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c_ctl |=3D HSI2C_RXCHON;<br>
<div>+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c_auto_conf |=3D HSI2C_READ_WRITE;<br>
+<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 fifo_ctl |=3D HSI2C_RXFIFO_TRIGGER_LEVE=
L(len);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 int_en |=3D (HSI2C_INT_RX_ALMOSTFULL_EN |<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 HSI2C_INT_TRAILING_EN);<br>
+ =A0 =A0 =A0 } else {<br>
<div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c_ctl |=3D HSI2C_TXCHON;<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 fifo_ctl |=3D HSI2C_TXFIFO_TRIGGER_LEVEL(len)=
;<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 int_en |=3D HSI2C_INT_TX_ALMOSTEMPTY_EN=
;<br>
<div>+ =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 if (stop =3D=3D 1)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c_auto_conf |=3D HSI2C_STOP_AFTER_TRANS;<br=
>
+<br>
</div>+ =A0 =A0 =A0 writel(HSI2C_SLV_ADDR_MAS(i2c-&gt;msg-&gt;addr), i2c-&g=
t;regs + HSI2C_ADDR);<br>
+<br>
+ =A0 =A0 =A0 writel(fifo_ctl, i2c-&gt;regs + HSI2C_FIFO_CTL);<br>
+ =A0 =A0 =A0 writel(i2c_ctl, i2c-&gt;regs + HSI2C_CTL);<br>
+<br>
<div>+ =A0 =A0 =A0 /* In auto mode the length of xfer cannot be 0 */<br>
+ =A0 =A0 =A0 if (i2c-&gt;msg-&gt;len =3D=3D 0)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c_auto_conf |=3D 0x1;<br>
+ =A0 =A0 =A0 else<br>
</div><div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c_auto_conf |=3D i2c-&gt;msg-&gt=
;len;<br>
+<br>
</div>+ =A0 =A0 =A0 writel(i2c_auto_conf, i2c-&gt;regs + HSI2C_AUTO_CONF);<=
br>
<div>+<br>
+ =A0 =A0 =A0 /* Start data transfer in Master mode */<br>
</div>+ =A0 =A0 =A0 i2c_auto_conf =3D readl(i2c-&gt;regs + HSI2C_AUTO_CONF)=
;<br>
+ =A0 =A0 =A0 i2c_auto_conf |=3D HSI2C_MASTER_RUN;<br>
+ =A0 =A0 =A0 writel(i2c_auto_conf, i2c-&gt;regs + HSI2C_AUTO_CONF);<br>
+<br>
+ =A0 =A0 =A0 writel(int_en, i2c-&gt;regs + HSI2C_INT_ENABLE);<br>
+}<br>
+<br>
<div>+static int exynos5_i2c_xfer_msg(struct exynos5_i2c *i2c,<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct i2c_=
msg *msgs, int stop)<br>
<div>+{<br>
+ =A0 =A0 =A0 unsigned long timeout;<br>
</div>+ =A0 =A0 =A0 int ret;<br>
<div>+<br>
+ =A0 =A0 =A0 i2c-&gt;msg =3D msgs;<br>
</div><div>+ =A0 =A0 =A0 i2c-&gt;msg_ptr =3D 0;<br>
+ =A0 =A0 =A0 i2c-&gt;msg_len =3D 0;<br>
+ =A0 =A0 =A0 i2c-&gt;trans_done =3D 0;<br>
+<br>
+ =A0 =A0 =A0 INIT_COMPLETION(i2c-&gt;msg_complete);<br>
+<br>
+ =A0 =A0 =A0 exynos5_i2c_message_start(i2c, stop);<br>
+<br>
</div>+ =A0 =A0 =A0 ret =3D wait_for_completion_interruptible_timeout<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 (&amp;i2c-&gt;msg_complete, EXYNOS5_I2C_TIMEO=
UT);<br>
<div>+ =A0 =A0 =A0 if (ret &gt;=3D 0)<br>
</div><div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 timeout =3D ret;<br>
+ =A0 =A0 =A0 else<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;<br>
+<br>
<div>+ =A0 =A0 =A0 ret =3D i2c-&gt;state;<br>
+<br>
+ =A0 =A0 =A0 if ((timeout =3D=3D 0) || (ret &lt; 0)) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 exynos5_i2c_reset(i2c);<br>
</div><div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (timeout =3D=3D 0) {<br>
</div><div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_warn(i2c-&gt;d=
ev, &quot;%s timeout\n&quot;,<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(msg=
s-&gt;flags &amp; I2C_M_RD) ? &quot;rx&quot; : &quot;tx&quot;);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else if (ret =3D=3D -EAGAIN) {<br>
<div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
+ =A0 =A0 =A0 }<br>
+<br>
</div><div>+ =A0 =A0 =A0 /*<br>
+ =A0 =A0 =A0 =A0* If this is the last message to be transfered (stop =3D=
=3D 1)<br>
+ =A0 =A0 =A0 =A0* Then check if the bus can be brought back to idle.<br>
+ =A0 =A0 =A0 =A0*<br>
+ =A0 =A0 =A0 =A0* Return -EBUSY if the bus still busy.<br>
+ =A0 =A0 =A0 =A0*/<br>
+ =A0 =A0 =A0 if (exynos5_i2c_wait_bus_idle(i2c, stop))<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EBUSY;<br>
+<br>
+ =A0 =A0 =A0 /* Return the state as in interrupt routine */<br>
</div><div>+ =A0 =A0 =A0 return ret;<br>
+}<br>
+<br>
+static int exynos5_i2c_xfer(struct i2c_adapter *adap,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct i2c_msg *msgs, int num=
)<br>
+{<br>
+ =A0 =A0 =A0 struct exynos5_i2c *i2c =3D (struct exynos5_i2c *)adap-&gt;al=
go_data;<br>
</div><div>+ =A0 =A0 =A0 struct i2c_msg *msgs_ptr =3D msgs;<br>
</div><div>+ =A0 =A0 =A0 int retry, i =3D 0;<br>
+ =A0 =A0 =A0 int ret =3D 0, ret_pm;<br>
</div><div>+ =A0 =A0 =A0 int stop =3D 0;<br>
+<br>
</div><div>+ =A0 =A0 =A0 if (i2c-&gt;suspended) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(i2c-&gt;dev, &quot;HS-I2C is not init=
ialzed.\n&quot;);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EIO;<br>
+ =A0 =A0 =A0 }<br>
+<br>
</div><div>+ =A0 =A0 =A0 ret_pm =3D pm_runtime_get_sync(i2c-&gt;dev);<br>
+ =A0 =A0 =A0 if (IS_ERR_VALUE(ret_pm)) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EIO;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;<br>
</div><div>+ =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 clk_prepare_enable(i2c-&gt;clk);<br>
+<br>
+ =A0 =A0 =A0 for (retry =3D 0; retry &lt; adap-&gt;retries; retry++) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (i =3D 0; i &lt; num; i++) {<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 stop =3D (i =3D=3D num =
- 1);<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D exynos5_i2c_xfer_msg(=
i2c, msgs_ptr, stop);<br>
<div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 msgs_ptr++;<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret =3D=3D -EAGAIN) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 msgs_ptr =3D =
msgs;<br>
</div><div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 br=
eak;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else if (ret &lt; 0) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
+<br>
<div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((i =3D=3D num) &amp;&amp; (ret !=3D =
-EAGAIN))<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;<br>
</div><div>+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_dbg(i2c-&gt;dev, &quot;retrying transfer =
(%d)\n&quot;, retry);<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 udelay(100);<br>
+ =A0 =A0 =A0 }<br>
+<br>
</div><div>+ =A0 =A0 =A0 if (i =3D=3D num) {<br>
</div><div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D num;<br>
+ =A0 =A0 =A0 } else {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Only one message, cannot access the device=
 */<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (i =3D=3D 1)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EREMOTEIO;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 else<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D i;<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_warn(i2c-&gt;dev, &quot;xfer message fail=
ed\n&quot;);<br>
+ =A0 =A0 =A0 }<br>
+<br>
+ out:<br>
+ =A0 =A0 =A0 clk_disable_unprepare(i2c-&gt;clk);<br>
+ =A0 =A0 =A0 pm_runtime_mark_last_busy(i2c-&gt;dev);<br>
+ =A0 =A0 =A0 pm_runtime_put_autosuspend(i2c-&gt;dev);<br>
</div><div>+ =A0 =A0 =A0 return ret;<br>
+}<br>
+<br>
</div><div>+static u32 exynos5_i2c_func(struct i2c_adapter *adap)<br>
+{<br>
</div>+ =A0 =A0 =A0 return I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL &amp; ~I2C_F=
UNC_SMBUS_QUICK);<br>
<div>+}<br>
+<br>
+static const struct i2c_algorithm exynos5_i2c_algorithm =3D {<br>
+ =A0 =A0 =A0 .master_xfer =A0 =A0 =A0 =A0 =A0 =A0=3D exynos5_i2c_xfer,<br>
+ =A0 =A0 =A0 .functionality =A0 =A0 =A0 =A0 =A0=3D exynos5_i2c_func,<br>
+};<br>
+<br>
</div><div>+static int exynos5_i2c_probe(struct platform_device *pdev)<br>
+{<br>
</div>+ =A0 =A0 =A0 struct device_node *np =3D pdev-&gt;dev.of_node;<br>
+ =A0 =A0 =A0 struct exynos5_i2c *i2c;<br>
+ =A0 =A0 =A0 struct resource *mem;<br>
+ =A0 =A0 =A0 int ret;<br>
+<br>
+ =A0 =A0 =A0 if (!np) {<br>
<div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&amp;pdev-&gt;dev, &quot;no devi=
ce node\n&quot;);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOENT;<br>
+ =A0 =A0 =A0 }<br>
+<br>
</div><div>+ =A0 =A0 =A0 i2c =3D devm_kzalloc(&amp;pdev-&gt;dev, sizeof(str=
uct exynos5_i2c), GFP_KERNEL);<br>
+ =A0 =A0 =A0 if (!i2c) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&amp;pdev-&gt;dev, &quot;no memory fo=
r state\n&quot;);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;<br>
+ =A0 =A0 =A0 }<br>
+<br>
</div>+ =A0 =A0 =A0 /* Mode of operation High/Fast Speed mode */<br>
<div>+ =A0 =A0 =A0 if (of_get_property(np, &quot;samsung,hs-mode&quot;, NUL=
L)) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c-&gt;speed_mode =3D HSI2C_HIGH_SPD;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c-&gt;fs_clock =3D HSI2C_FS_TX_CLOCK;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (of_property_read_u32(np, &quot;clock-freq=
uency&quot;, &amp;i2c-&gt;hs_clock))<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c-&gt;hs_clock =3D HSI2C_HS=
_TX_CLOCK;<br>
+ =A0 =A0 =A0 } else {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c-&gt;speed_mode =3D HSI2C_FAST_SPD;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (of_property_read_u32(np, &quot;clock-freq=
uency&quot;, &amp;i2c-&gt;fs_clock))<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c-&gt;fs_clock =3D HSI2C_FS=
_TX_CLOCK;<br>
</div>+ =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 strlcpy(i2c-&gt;<a href=3D"http://adap.name" target=3D"_blank=
">adap.name</a>, &quot;exynos5-i2c&quot;, sizeof(i2c-&gt;<a href=3D"http://=
adap.name" target=3D"_blank">adap.name</a>));<br>
<div>+ =A0 =A0 =A0 i2c-&gt;adap.owner =A0 =3D THIS_MODULE;<br>
+ =A0 =A0 =A0 i2c-&gt;adap.algo =A0 =A0=3D &amp;exynos5_i2c_algorithm;<br>
+ =A0 =A0 =A0 i2c-&gt;adap.retries =3D 2;<br>
+ =A0 =A0 =A0 i2c-&gt;adap.class =A0 =3D I2C_CLASS_HWMON | I2C_CLASS_SPD;<b=
r>
+<br>
+ =A0 =A0 =A0 i2c-&gt;dev =3D &amp;pdev-&gt;dev;<br>
</div>+ =A0 =A0 =A0 i2c-&gt;clk =3D devm_clk_get(&amp;pdev-&gt;dev, &quot;h=
si2c&quot;);<br>
<div>+ =A0 =A0 =A0 if (IS_ERR(i2c-&gt;clk)) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&amp;pdev-&gt;dev, &quot;cannot get c=
lock\n&quot;);<br>
</div><div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOENT;<br>
+ =A0 =A0 =A0 }<br>
+<br>
</div>+ =A0 =A0 =A0 clk_prepare_enable(i2c-&gt;clk);<br>
+<br>
+ =A0 =A0 =A0 mem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);<br>
+ =A0 =A0 =A0 i2c-&gt;regs =3D devm_ioremap_resource(&amp;pdev-&gt;dev, mem=
);<br>
+ =A0 =A0 =A0 if (IS_ERR(i2c-&gt;regs)) {<br>
<div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&amp;pdev-&gt;dev, &quot;cannot =
map HS-I2C IO\n&quot;);<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D PTR_ERR(i2c-&gt;regs);<br>
<div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_clk;<br>
+ =A0 =A0 =A0 }<br>
+<br>
</div>+ =A0 =A0 =A0 i2c-&gt;adap.dev.of_node =3D np;<br>
<div>+ =A0 =A0 =A0 i2c-&gt;adap.algo_data =3D i2c;<br>
+ =A0 =A0 =A0 i2c-&gt;adap.dev.parent =3D &amp;pdev-&gt;dev;<br>
+<br>
</div><div>+ =A0 =A0 =A0 /* Clear pending interrupts from u-boot or misc ca=
uses */<br>
+ =A0 =A0 =A0 exynos5_i2c_clr_pend_irq(i2c);<br>
</div><div>+<br>
+ =A0 =A0 =A0 init_completion(&amp;i2c-&gt;msg_complete);<br>
+<br>
</div>+ =A0 =A0 =A0 i2c-&gt;irq =3D ret =3D irq_of_parse_and_map(np, 0);<br=
>
<div>+ =A0 =A0 =A0 if (ret &lt;=3D 0) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&amp;pdev-&gt;dev, &quot;cannot find =
HS-I2C IRQ\n&quot;);<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;<br>
<div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_clk;<br>
+ =A0 =A0 =A0 }<br>
+<br>
</div><div>+ =A0 =A0 =A0 ret =3D devm_request_irq(&amp;pdev-&gt;dev, i2c-&g=
t;irq, exynos5_i2c_irq,<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0, dev_=
name(&amp;pdev-&gt;dev), i2c);<br>
<div>+<br>
+ =A0 =A0 =A0 if (ret !=3D 0) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&amp;pdev-&gt;dev, &quot;cannot reque=
st HS-I2C IRQ %d\n&quot;, i2c-&gt;irq);<br>
</div><div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_clk;<br>
+ =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 /*<br>
+ =A0 =A0 =A0 =A0* TODO: Use private lock to avoid race conditions as<br>
+ =A0 =A0 =A0 =A0* mentioned in pm_runtime.txt<br>
+ =A0 =A0 =A0 =A0*/<br>
+ =A0 =A0 =A0 pm_runtime_enable(i2c-&gt;dev);<br>
+ =A0 =A0 =A0 pm_runtime_set_autosuspend_delay(i2c-&gt;dev, EXYNOS5_I2C_PM_=
TIMEOUT);<br>
+ =A0 =A0 =A0 pm_runtime_use_autosuspend(i2c-&gt;dev);<br>
+<br>
+ =A0 =A0 =A0 ret =3D pm_runtime_get_sync(i2c-&gt;dev);<br>
+ =A0 =A0 =A0 if (IS_ERR_VALUE(ret))<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_clk;<br>
+<br>
<div>+ =A0 =A0 =A0 ret =3D exynos5_hsi2c_clock_setup(i2c);<br>
+ =A0 =A0 =A0 if (ret)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_pm;<br>
+<br>
+ =A0 =A0 =A0 i2c-&gt;bus_id =3D of_alias_get_id(i2c-&gt;adap.dev.of_node, =
&quot;hsi2c&quot;);<br>
+<br>
+ =A0 =A0 =A0 exynos5_i2c_init(i2c);<br>
</div>+<br>
+ =A0 =A0 =A0 i2c-&gt;<a href=3D"http://adap.nr" target=3D"_blank">adap.nr<=
/a> =3D -1;<br>
<div>+ =A0 =A0 =A0 ret =3D i2c_add_numbered_adapter(&amp;i2c-&gt;adap);<br>
+ =A0 =A0 =A0 if (ret &lt; 0) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&amp;pdev-&gt;dev, &quot;failed to ad=
d bus to i2c core\n&quot;);<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_pm;<br>
<div>+ =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 of_i2c_register_devices(&amp;i2c-&gt;adap);<br>
+ =A0 =A0 =A0 platform_set_drvdata(pdev, i2c);<br>
+<br>
</div><div>+ =A0 =A0 =A0 clk_disable_unprepare(i2c-&gt;clk);<br>
+ =A0 =A0 =A0 pm_runtime_mark_last_busy(i2c-&gt;dev);<br>
+ =A0 =A0 =A0 pm_runtime_put_autosuspend(i2c-&gt;dev);<br>
</div><div>+<br>
+ =A0 =A0 =A0 return 0;<br>
+<br>
</div><div>+ err_pm:<br>
+ =A0 =A0 =A0 pm_runtime_put(i2c-&gt;dev);<br>
+ =A0 =A0 =A0 pm_runtime_disable(&amp;pdev-&gt;dev);<br>
</div><div>+ err_clk:<br>
+ =A0 =A0 =A0 clk_disable_unprepare(i2c-&gt;clk);<br>
</div><div>+ =A0 =A0 =A0 return ret;<br>
+}<br>
+<br>
+static int exynos5_i2c_remove(struct platform_device *pdev)<br>
+{<br>
+ =A0 =A0 =A0 struct exynos5_i2c *i2c =3D platform_get_drvdata(pdev);<br>
</div><div>+ =A0 =A0 =A0 int ret;<br>
+<br>
+ =A0 =A0 =A0 ret =3D pm_runtime_get_sync(&amp;pdev-&gt;dev);<br>
+ =A0 =A0 =A0 if (IS_ERR_VALUE(ret))<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;<br>
+<br>
<div>+ =A0 =A0 =A0 i2c_del_adapter(&amp;i2c-&gt;adap);<br>
+<br>
+ =A0 =A0 =A0 pm_runtime_put(&amp;pdev-&gt;dev);<br>
+ =A0 =A0 =A0 pm_runtime_disable(&amp;pdev-&gt;dev);<br>
</div><div>+<br>
+ =A0 =A0 =A0 clk_disable_unprepare(i2c-&gt;clk);<br>
+<br>
</div><div>+ =A0 =A0 =A0 return 0;<br>
+}<br>
+<br>
+#ifdef CONFIG_PM<br>
+static int exynos5_i2c_suspend_noirq(struct device *dev)<br>
+{<br>
+ =A0 =A0 =A0 struct platform_device *pdev =3D to_platform_device(dev);<br>
+ =A0 =A0 =A0 struct exynos5_i2c *i2c =3D platform_get_drvdata(pdev);<br>
+<br>
</div><div>+ =A0 =A0 =A0 i2c-&gt;suspended =3D 1;<br>
+<br>
</div><div>+ =A0 =A0 =A0 return 0;<br>
+}<br>
+<br>
</div>+static int exynos5_i2c_resume_noirq(struct device *dev)<br>
<div>+{<br>
+ =A0 =A0 =A0 struct platform_device *pdev =3D to_platform_device(dev);<br>
+ =A0 =A0 =A0 struct exynos5_i2c *i2c =3D platform_get_drvdata(pdev);<br>
</div><div>+ =A0 =A0 =A0 int ret =3D 0;<br>
+<br>
</div>+ =A0 =A0 =A0 clk_prepare_enable(i2c-&gt;clk);<br>
+<br>
+ =A0 =A0 =A0 ret =3D exynos5_hsi2c_clock_setup(i2c);<br>
+ =A0 =A0 =A0 if (ret) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 clk_disable_unprepare(i2c-&gt;clk);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;<br>
+ =A0 =A0 =A0 }<br>
<div>+<br>
+ =A0 =A0 =A0 exynos5_i2c_init(i2c);<br>
+ =A0 =A0 =A0 clk_disable_unprepare(i2c-&gt;clk);<br>
+ =A0 =A0 =A0 i2c-&gt;suspended =3D 0;<br>
+<br>
</div><div>+ =A0 =A0 =A0 return 0;<br>
+}<br>
+<br>
+static const struct dev_pm_ops exynos5_i2c_dev_pm_ops =3D {<br>
+ =A0 =A0 =A0 .suspend_noirq =3D exynos5_i2c_suspend_noirq,<br>
</div>+ =A0 =A0 =A0 .resume_noirq =A0 =3D exynos5_i2c_resume_noirq,<br>
<div>+};<br>
+<br>
+#define EXYNOS5_DEV_PM_OPS (&amp;exynos5_i2c_dev_pm_ops)<br>
+#else<br>
+#define EXYNOS5_DEV_PM_OPS NULL<br>
+#endif<br>
+<br>
+static struct platform_driver exynos5_i2c_driver =3D {<br>
+ =A0 =A0 =A0 .probe =A0 =A0 =A0 =A0 =A0=3D exynos5_i2c_probe,<br>
+ =A0 =A0 =A0 .remove =A0 =A0 =A0 =A0 =3D exynos5_i2c_remove,<br>
</div><div>+ =A0 =A0 =A0 .driver =A0 =A0 =A0 =A0 =3D {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .owner =A0=3D THIS_MODULE,<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =3D &quot;exynos5-hsi2c&quot;=
,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pm =A0 =A0 =3D EXYNOS5_DEV_PM_OPS,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .of_match_table =3D exynos5_i2c_match,<br>
<div>+ =A0 =A0 =A0 },<br>
+};<br>
+<br>
+static int __init i2c_adap_exynos5_init(void)<br>
+{<br>
+ =A0 =A0 =A0 return platform_driver_register(&amp;exynos5_i2c_driver);<br>
+}<br>
+subsys_initcall(i2c_adap_exynos5_init);<br>
+<br>
+static void __exit i2c_adap_exynos5_exit(void)<br>
+{<br>
+ =A0 =A0 =A0 platform_driver_unregister(&amp;exynos5_i2c_driver);<br>
+}<br>
+module_exit(i2c_adap_exynos5_exit);<br>
+<br>
+MODULE_DESCRIPTION(&quot;Exynos5 HS-I2C Bus driver&quot;);<br>
</div>+MODULE_AUTHOR(&quot;Naveen Krishna Chatradhi, &lt;<a href=3D"mailto:=
ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" target=3D"_blank">ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org</a>&gt;&quot=
;);<br>
<div>+MODULE_AUTHOR(&quot;Taekgyun Ko, &lt;<a href=3D"mailto:taeggyun.ko@sa=
msung.com" target=3D"_blank">taeggyun.ko-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org</a>&gt;&quot;);<br>
</div>+MODULE_LICENSE(&quot;GPL v2&quot;);<br>
<span><font color=3D"#888888">--<br>
1.7.9.5<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r>Shine bright,<br>(: Nav :)

--001a113329e810040c04dec846fc--

--===============6734359794796292348==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============6734359794796292348==--
