From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] i2c: exynos5: add High Speed I2C controller driver
Date: Tue, 12 Mar 2013 05:53:03 -0700
Message-ID: <CAPnjgZ3y0-WHkm2FoOMMrTSN31yKe4PqzxEh9Jf0GyhCTJUfZQ@mail.gmail.com>
References: <1354021236-28596-2-git-send-email-ch.naveen@samsung.com>
 <1363062732-27869-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2231577975216106075=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1363062732-27869-1-git-send-email-ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
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
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Grundler <grundler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, lk <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, Naveen Krishna <naveen-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--===============2231577975216106075==
Content-Type: multipart/alternative; boundary=e89a8fb1fd74295f8b04d7b9c5b8

--e89a8fb1fd74295f8b04d7b9c5b8
Content-Type: text/plain; charset=ISO-8859-1

Hi Naveen,

On Mon, Mar 11, 2013 at 9:32 PM, Naveen Krishna Chatradhi <
ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:

> Adds support for High Speed I2C driver found in Exynos5 and later
> SoCs from Samsung. This driver currently supports Auto mode.
>
> Driver only supports Device Tree method.
> Note: Added debugfs support for registers view, not tested.
>
> Signed-off-by: Taekgyun Ko <taeggyun.ko-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: R. Chandrasekar <rcsekar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
> Changes since v3: http://lkml.org/lkml/2012/12/28/46
> 1. Added Documentation for DT bindings
> 2. Removed the bus_num, as Doug's pick id from DT is merged in i2c/for-next
> 3. Split the xfer function for better clarity.
> 4. Streamlined code flow in isr, handled trans_status register in xfer_msg
> call.
>
>  .../devicetree/bindings/i2c/i2c-exynos5.txt        |   50 ++
>  drivers/i2c/busses/Kconfig                         |    7 +
>  drivers/i2c/busses/Makefile                        |    1 +
>  drivers/i2c/busses/i2c-exynos5.c                   |  743
> ++++++++++++++++++++
>  4 files changed, 801 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
>  create mode 100644 drivers/i2c/busses/i2c-exynos5.c
>
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
> b/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
> new file mode 100644
> index 0000000..0bc9347
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
> @@ -0,0 +1,50 @@
> +* Samsung's High Speed I2C controller
> +
> +The Samsung's High Speed I2C controller is used to interface with I2C
> devices
> +at various speeds ranging from 100khz to 3.4Mhz.
> +
> +Required properties:
> +  - compatible: value should be.
> +      (a) "samsung,exynos5-hsi2c", for i2c compatible with exynos5 hsi2c.
> +  - reg: physical base address of the controller and length of memory
> mapped
> +    region.
> +  - interrupts: interrupt number to the cpu.
> +
> +  - Samsung GPIO variant (deprecated):
> +    - gpios: The order of the gpios should be the following: <SDA, SCL>.
> +      The gpio specifier depends on the gpio controller.
> +  - Pinctrl variant (preferred, if available):
> +    - pinctrl-0: Pin control group to be used for this controller.
> +    - pinctrl-names: Should contain only one value - "default".
> +
> +Optional properties:
> +  - samsung,hs-mode: Mode of operation, High speed or Fast speed mode. If
> not
> +    specified, default value is 0.
> +  - samsung,hs-clock-freq: Desired operating frequency in Hz of the bus.
> +    If not specified, the default value in Hz is 100000.
> +  - samsung,fs-clock-freq: Desired operarting frequency in Hz of the bus.
> +    If not specified, the default value in Hz is 100000.
> +
> +Example:
> +
> +       hsi2c@12ca0000 {
> +               compatible = "samsung,exynos5-hsi2c";
> +               reg = <0x12ca0000 0x100>;
> +               interrupts = <56>;
> +               samsung,fs-clock-freq = <100000>;
> +               /* Samsung GPIO variant begins here */
> +               gpios = <&gpd1 2 0 /* SDA */
> +                        &gpd1 3 0 /* SCL */>;
> +               /* Samsung GPIO variant ends here */
> +               /* Pinctrl variant begins here */
> +               pinctrl-0 = <&i2c4_bus>;
> +               pinctrl-names = "default";
> +               /* Pinctrl variant ends here */
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               s2mps11_pmic@66 {
> +                       compatible = "samsung,s2mps11-pmic";
> +                       reg = <0x66>;
> +               };
> +       };
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index a3725de..78b4936 100644
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
> +         Say Y here to include support for High-speed I2C controller in
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
> index 0000000..fe30b0b
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-exynos5.c
> @@ -0,0 +1,743 @@
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
> +#include <linux/debugfs.h>
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
> +#include <linux/of_gpio.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_i2c.h>
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
> +#define HSI2C_TXFIFO_TRIGGER_LEVEL             (0x20 << 16)
> +#define HSI2C_RXFIFO_TRIGGER_LEVEL             (0x20 << 4)
> +
> +/* I2C_TRAILING_CTL Register bits */
> +#define HSI2C_TRAILING_COUNT                   (0xf)
> +
> +/* I2C_INT_EN Register bits */
> +#define HSI2C_INT_TX_ALMOSTEMPTY_EN            (1u << 0)
> +#define HSI2C_INT_RX_ALMOSTFULL_EN             (1u << 1)
> +#define HSI2C_INT_TRAILING_EN                  (1u << 6)
> +#define HSI2C_INT_I2C_EN                       (1u << 9)
> +
> +/* I2C_FIFO_STAT Register bits */
> +#define HSI2C_RX_FIFO_EMPTY                    (1u << 24)
> +#define HSI2C_RX_FIFO_FULL                     (1u << 23)
> +#define HSI2C_TX_FIFO_EMPTY                    (1u << 8)
> +#define HSI2C_TX_FIFO_FULL                     (1u << 7)
> +
> +#define HSI2C_RX_FIFO_EMPTY                    (1u << 24)
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
> +#define HSI2C_NO_DEV                           (1u << 3)
> +#define HSI2C_NO_DEV_ACK                       (1u << 2)
> +#define HSI2C_TRANS_ABORT                      (1u << 1)
> +#define HSI2C_TRANS_DONE                       (1u << 0)
> +
> +/* I2C_ADDR register bits */
> +#define HSI2C_SLV_ADDR_SLV(x)                  ((x & 0x3ff) << 0)
> +#define HSI2C_SLV_ADDR_MAS(x)                  ((x & 0x3ff) << 10)
> +#define HSI2C_MASTER_ID(x)                     ((x & 0xff) << 24)
> +
> +/* Controller operating frequency, timing values for operation
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
> +
> +       unsigned int            irq;
> +
> +       void __iomem            *regs;
> +       struct clk              *clk;
> +       struct device           *dev;
> +
> +       /* GPIO lines for SDA/SCL*/
> +       int                     gpios[2];
> +
> +       /* Controller operating frequency */
> +       unsigned int            clock;
> +
> +       /* HSI2C Controller can operate in
> +        * 1. High speed upto 3.4Mbps
> +        * 2. Fast speed upto 1Mbps
> +        */
> +       int                     speed_mode;
> +};
> +
> +static const struct of_device_id exynos5_i2c_match[] = {
> +       { .compatible = "samsung,exynos5-hsi2c" },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, exynos5_i2c_match);
> +
> +static inline void exynos5_i2c_stop(struct exynos5_i2c *i2c)
> +{
> +       writel(0, i2c->regs + HSI2C_INT_ENABLE);
> +
> +       complete(&i2c->msg_complete);
> +}
> +
> +static void exynos5_i2c_en_timeout(struct exynos5_i2c *i2c)
> +{
> +       u32 i2c_timeout = readl(i2c->regs + HSI2C_TIMEOUT);
> +
> +       /* Clear to enable Timeout */
> +       i2c_timeout &= ~HSI2C_TIMEOUT_EN;
> +       writel(i2c_timeout, i2c->regs + HSI2C_TIMEOUT);
> +}
> +
> +static int exynos5_i2c_set_timing(struct exynos5_i2c *i2c)
> +{
> +       u32 i2c_timing_s1;
> +       u32 i2c_timing_s2;
> +       u32 i2c_timing_s3;
> +       u32 i2c_timing_sla;
> +       unsigned int op_clk = i2c->clock;
> +       unsigned int clkin = clk_get_rate(i2c->clk);
> +       unsigned int n_clkdiv;
> +       unsigned int t_start_su, t_start_hd;
> +       unsigned int t_stop_su;
> +       unsigned int t_data_su, t_data_hd;
> +       unsigned int t_scl_l, t_scl_h;
> +       unsigned int t_sr_release;
> +       unsigned int t_ftl_cycle;
> +       unsigned int i = 0, utemp0 = 0, utemp1 = 0, utemp2 = 0;
>

Can you think of a better name for utemp0 and utemp2? Is utemp2 a clock
divisor?


> +
> +       /* FPCLK / FI2C =
> +        * (CLK_DIV + 1) * (TSCLK_L + TSCLK_H + 2) + 8 + 2 * FLT_CYCLE
> +        * uTemp0 = (CLK_DIV + 1) * (TSCLK_L + TSCLK_H + 2)
> +        * uTemp1 = (TSCLK_L + TSCLK_H + 2)
> +        * uTemp2 = TSCLK_L + TSCLK_H
> +        */
> +       t_ftl_cycle = (readl(i2c->regs + HSI2C_CONF) >> 16) & 0x7;
> +       utemp0 = (clkin / op_clk) - 8 - 2 * t_ftl_cycle;
> +
> +       /* CLK_DIV max is 256 */
> +       for (i = 0; i < 256; i++) {
> +               utemp1 = utemp0 / (i + 1);
> +               /* SCLK_L/H max is 256 / 2 */
> +               if (utemp1 < 128) {
> +                       utemp2 = utemp1 - 2;
> +                       break;
> +               }
>

I suppose this loop can't exit until i is at least utemp / 128, so perhaps
could start the loop at that value? This code seems to be on the noirq
resume path, so should be fast if possible.

What happens if i gets to 256? Is that an error, since in that case utemp2
is not set?

Also could consider moving this loop into a function.


> +       }
>
+
> +       n_clkdiv = i;
> +       t_scl_l = utemp2 / 2;
> +       t_scl_h = utemp2 / 2;
> +       t_start_su = t_scl_l;
> +       t_start_hd = t_scl_l;
> +       t_stop_su = t_scl_l;
> +       t_data_su = t_scl_l / 2;
> +       t_data_hd = t_scl_l / 2;
> +       t_sr_release = utemp2;
> +
> +       i2c_timing_s1 = t_start_su << 24 | t_start_hd << 16 | t_stop_su <<
> 8;
> +       i2c_timing_s2 = t_data_su << 24 | t_scl_l << 8 | t_scl_h << 0;
> +       i2c_timing_s3 = n_clkdiv << 16 | t_sr_release << 0;
> +       i2c_timing_sla = t_data_hd << 0;
> +
> +       dev_dbg(i2c->dev, "tSTART_SU: %X, tSTART_HD: %X, tSTOP_SU: %X\n",
> +               t_start_su, t_start_hd, t_stop_su);
> +       dev_dbg(i2c->dev, "tDATA_SU: %X, tSCL_L: %X, tSCL_H: %X\n",
> +               t_data_su, t_scl_l, t_scl_h);
> +       dev_dbg(i2c->dev, "nClkDiv: %X, tSR_RELEASE: %X\n",
> +               n_clkdiv, t_sr_release);
> +       dev_dbg(i2c->dev, "tDATA_HD: %X\n", t_data_hd);
> +
> +       if (i2c->speed_mode == HSI2C_HIGH_SPD) {
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
> +static void exynos5_i2c_init(struct exynos5_i2c *i2c)
> +{
> +       u32 i2c_conf = readl(i2c->regs + HSI2C_CONF);
> +
> +       writel((HSI2C_FUNC_MODE_I2C | HSI2C_MASTER),
> +                                       i2c->regs + HSI2C_CTL);
> +       writel(HSI2C_TRAILING_COUNT, i2c->regs + HSI2C_TRAILIG_CTL);
> +
> +       exynos5_i2c_set_timing(i2c);
> +
> +       if (i2c->speed_mode == HSI2C_HIGH_SPD)
> +               i2c_conf |= HSI2C_HS_MODE;
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
> +       /* Initialize the configure registers */
> +       exynos5_i2c_init(i2c);
> +}
> +
> +static void exynos5_i2c_master_run(struct exynos5_i2c *i2c)
> +{
> +       /* Start data transfer in Master mode */
> +       u32 i2c_auto_conf = readl(i2c->regs + HSI2C_AUTO_CONF);
> +       i2c_auto_conf |= HSI2C_MASTER_RUN;
> +       writel(i2c_auto_conf, i2c->regs + HSI2C_AUTO_CONF);
> +}
> +
> +/**
> + * exynos5_i2c_irq: top level IRQ servicing routine
> +*/
> +static irqreturn_t exynos5_i2c_irq(int irqno, void *dev_id)
> +{
> +       struct exynos5_i2c *i2c = dev_id;
> +       unsigned char byte;
> +
>

Can other sorts of irqs happen? Errors?


> +       if (i2c->msg->flags & I2C_M_RD) {
> +               while (!(readl(i2c->regs + HSI2C_FIFO_STATUS) &
> +                                               HSI2C_RX_FIFO_EMPTY)) {
> +                       byte = (unsigned char)readl(i2c->regs +
> HSI2C_RX_DATA);
> +                       i2c->msg->buf[i2c->msg_ptr++] = byte;
> +               }
> +       } else {
> +               byte = i2c->msg->buf[i2c->msg_ptr++];
> +               writel(byte, i2c->regs + HSI2C_TX_DATA);
> +
>

Extra blank line. Here you only write one byte - is there a tx FIFO also,
so we can avoid doing one interrupt per transmit byte?


> +       }
> +
> +       if (i2c->msg_ptr >= i2c->msg->len)
> +               exynos5_i2c_stop(i2c);
> +
> +       /* Set these bits to clear them */
> +       writel(readl(i2c->regs + HSI2C_INT_STATUS),
> +                               i2c->regs + HSI2C_INT_STATUS);
> +
> +       return IRQ_HANDLED;
>

Are there any other interrupt types that can happen, like errors for
example?


> +}
> +
> +static void exynos5_i2c_message_start(struct exynos5_i2c *i2c, int stop)
>

Function comment would be useful - what is stop for?


> +{
> +       u32 i2c_ctl = readl(i2c->regs + HSI2C_CTL);
> +       u32 int_en = HSI2C_INT_I2C_EN;
> +       u32 i2c_auto_conf;
> +       u32 fifo_ctl;
> +
> +       exynos5_i2c_en_timeout(i2c);
> +
> +       fifo_ctl = HSI2C_RXFIFO_EN | HSI2C_TXFIFO_EN |
> +               HSI2C_TXFIFO_TRIGGER_LEVEL | HSI2C_RXFIFO_TRIGGER_LEVEL;
> +       writel(fifo_ctl, i2c->regs + HSI2C_FIFO_CTL);
> +
>

You could

               i2c_ctl &= ~(HSI2C_TXCHON | HSI2C_RXCHON)

here to simply code below.


> +       if (i2c->msg->flags & I2C_M_RD) {
> +               i2c_ctl &= ~HSI2C_TXCHON;
> +               i2c_ctl |= HSI2C_RXCHON;
> +
> +               i2c_auto_conf |= HSI2C_READ_WRITE;
> +
> +               int_en |= (HSI2C_INT_RX_ALMOSTFULL_EN |
> +                       HSI2C_INT_TRAILING_EN);
> +       } else {
> +               i2c_ctl &= ~HSI2C_RXCHON;
> +               i2c_ctl |= HSI2C_TXCHON;
> +
> +               int_en |= HSI2C_INT_TX_ALMOSTEMPTY_EN;
> +       }
> +
> +       if (stop == 1)
> +               i2c_auto_conf |= HSI2C_STOP_AFTER_TRANS;
> +
> +       writel(HSI2C_SLV_ADDR_MAS(i2c->msg->addr), i2c->regs + HSI2C_ADDR);
> +
> +       writel(i2c_ctl, i2c->regs + HSI2C_CTL);
> +
> +       /* In auto mode the length of xfer cannot be 0 */
>
+       if (i2c->msg->len <= 0)


What is auto mode? Perhaps a little comment at the top of the file about
the two modes? What does it mean when msg->len < 0?


> +               i2c_auto_conf |= 0x1;
> +       else
> +               i2c_auto_conf |= i2c->msg->len;
> +
> +       writel(i2c_auto_conf, i2c->regs + HSI2C_AUTO_CONF);
> +
> +       exynos5_i2c_master_run(i2c);
> +
> +       writel(int_en, i2c->regs + HSI2C_INT_ENABLE);
> +}
> +
> +static int exynos5_i2c_xfer_msg(struct exynos5_i2c *i2c,
> +                             struct i2c_msg *msgs, int stop)
> +{
> +       unsigned long timeout;
> +       u32 trans_status;
> +       u32 fifo_stat;
> +       int ret = -EAGAIN, val;
> +
> +       i2c->msg = msgs;
> +       i2c->msg_ptr = 0;
> +
> +       exynos5_i2c_message_start(i2c, stop);
> +
> +       val = wait_for_completion_interruptible_timeout
> +               (&i2c->msg_complete, EXYNOS5_I2C_TIMEOUT);
> +       if (val >= 0)
> +               timeout = val;
> +
> +       if (msgs->flags & I2C_M_RD) {
> +               if (timeout == 0) {
> +                       exynos5_i2c_reset(i2c);
> +                       dev_warn(i2c->dev, "rx timeout\n");
> +                       return ret;
> +               }
> +
> +               ret = 0;
> +       } else {
> +               if (timeout == 0) {
> +                       exynos5_i2c_reset(i2c);
> +                       dev_warn(i2c->dev, "tx timeout\n");
> +                       return ret;
> +               }
>

Could perhaps make the timeout check common (put above the if
(msgs->flags)).


> +
> +               timeout = jiffies + timeout;
> +
> +               while (time_before(jiffies, timeout)) {
> +                       fifo_stat = readl(i2c->regs + HSI2C_FIFO_STATUS);
> +                       trans_status = readl(i2c->regs +
> HSI2C_TRANS_STATUS);
> +                       if ((trans_status & HSI2C_NO_DEV) ||
> +                               (trans_status & HSI2C_NO_DEV_ACK &&
> +                               !(i2c->msg->flags & I2C_M_IGNORE_NAK))) {
> +                               exynos5_i2c_reset(i2c);
>

I think these continuation lines should be indented a little more.


> +                               return -ENXIO;
> +                       }
> +                       if ((fifo_stat == HSI2C_FIFO_EMPTY) &&
> +                               ((trans_status == 0) ||
> +                               ((stop == 0) &&
> +                               (trans_status == HSI2C_MASTER_BUSY)))) {
> +                               ret = 0;
> +                               break;
> +                       }
> +               }
>
+               if (ret == -EAGAIN) {
> +                       exynos5_i2c_reset(i2c);
> +                       dev_warn(i2c->dev, "xfer timeout\n");
> +                       return ret;
> +               }
> +       }
> +
> +       return ret;
> +}
> +
> +static int exynos5_i2c_xfer(struct i2c_adapter *adap,
> +                       struct i2c_msg *msgs, int num)
> +{
> +       struct exynos5_i2c *i2c = (struct exynos5_i2c *)adap->algo_data;
> +       int retry, i;
> +       int ret, ret_pm;
> +       int stop = 0;
> +       struct i2c_msg *msgs_ptr = msgs;
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
> +                       if (i == num - 1)
> +                               stop = 1;
>

Perhaps:

stop = (i == num - 1);

so you can avoid the other assignments to stop


> +                       ret = exynos5_i2c_xfer_msg(i2c, msgs_ptr, stop);
> +                       msgs_ptr++;
> +
> +                       if (ret == -EAGAIN) {
> +                               msgs_ptr = msgs;
> +                               stop = 0;
> +                               break;
> +                       } else if (ret == -ENXIO)
> +                               goto out;
>

{} around else part also I think


> +               }
> +               if (i == num) {
> +                       ret = num;
> +                       goto out;
> +               }
> +
> +               dev_dbg(i2c->dev, "retrying transfer (%d)\n", retry);
> +
> +               udelay(100);
> +       }
> +
> +       ret = -EREMOTEIO;
>

Perhaps a dev_warn() here?


> + out:
> +       clk_disable_unprepare(i2c->clk);
> +       pm_runtime_mark_last_busy(i2c->dev);
> +       pm_runtime_put_autosuspend(i2c->dev);
> +       return ret;
> +}
> +
> +static u32 exynos5_i2c_func(struct i2c_adapter *adap)
> +{
> +       return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
> +}
> +
> +static const struct i2c_algorithm exynos5_i2c_algorithm = {
> +       .master_xfer            = exynos5_i2c_xfer,
> +       .functionality          = exynos5_i2c_func,
> +};
> +
> +/**
> + * Parse a list of GPIOs from a node property and request each one
> + *
> + * @param i2c          i2c driver data
> + * @return 0 on success, -EINVAL on error, in which case no GPIOs
> requested
> +*/
> +static int exynos5_i2c_parse_dt_gpio(struct exynos5_i2c *i2c)
> +{
> +       int idx, gpio, ret;
> +
> +       for (idx = 0; idx < 2; idx++) {
> +               gpio = of_get_gpio(i2c->dev->of_node, idx);
> +               if (!gpio_is_valid(gpio)) {
> +                       dev_err(i2c->dev, "invalid gpio[%d]: %d\n", idx,
> gpio);
> +                       return -EINVAL;
> +               }
> +               i2c->gpios[idx] = gpio;
> +
> +               ret = devm_gpio_request(i2c->dev, gpio, "i2c-bus");
> +               if (ret) {
> +                       dev_err(i2c->dev, "gpio [%d] request failed\n",
> gpio);
> +                       return -EINVAL;
> +               }
> +       }
> +       return 0;
> +}
> +
> +#define HSI2C_REG(regname) {.name = #regname, .offset = regname}
> +static struct debugfs_reg32 exynos5_hsi2c_regs[] = {
> +       HSI2C_REG(HSI2C_CTL), HSI2C_REG(HSI2C_FIFO_CTL),
> +       HSI2C_REG(HSI2C_TRAILIG_CTL), HSI2C_REG(HSI2C_CLK_CTL),
> +       HSI2C_REG(HSI2C_CLK_SLOT), HSI2C_REG(HSI2C_INT_ENABLE),
> +       HSI2C_REG(HSI2C_INT_STATUS), HSI2C_REG(HSI2C_ERR_STATUS),
> +       HSI2C_REG(HSI2C_FIFO_STATUS), HSI2C_REG(HSI2C_TX_DATA),
> +       HSI2C_REG(HSI2C_RX_DATA), HSI2C_REG(HSI2C_CONF),
> +       HSI2C_REG(HSI2C_AUTO_CONF), HSI2C_REG(HSI2C_TIMEOUT),
> +       HSI2C_REG(HSI2C_MANUAL_CMD), HSI2C_REG(HSI2C_TRANS_STATUS),
> +       HSI2C_REG(HSI2C_TIMING_HS1), HSI2C_REG(HSI2C_TIMING_HS2),
> +       HSI2C_REG(HSI2C_TIMING_HS3), HSI2C_REG(HSI2C_TIMING_FS1),
> +       HSI2C_REG(HSI2C_TIMING_FS2), HSI2C_REG(HSI2C_TIMING_FS3),
> +       HSI2C_REG(HSI2C_TIMING_SLA), HSI2C_REG(HSI2C_ADDR),
> +};
> +
> +static struct debugfs_regset32 exynos5_hsi2c_regset = {
> +       .regs = exynos5_hsi2c_regs,
> +       .nregs = ARRAY_SIZE(exynos5_hsi2c_regs),
> +};
> +
> +static struct dentry *exynos5_hsi2c_reg_debugfs;
> +
> +static int exynos5_i2c_probe(struct platform_device *pdev)
> +{
> +       struct device_node *np = pdev->dev.of_node;
> +       struct exynos5_i2c *i2c;
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
> +               i2c->speed_mode = 1;
> +               if (of_property_read_u32(np, "samsung,hs-clock",
> &i2c->clock))
> +                       i2c->clock = HSI2C_HS_TX_CLOCK;
> +       } else {
> +               i2c->speed_mode = 0;
> +               if (of_property_read_u32(np, "samsung,fs-clock",
> &i2c->clock))
> +                       i2c->clock = HSI2C_FS_TX_CLOCK;
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
> +       i2c->regs = of_iomap(np, 0);
> +       if (!i2c->regs) {
> +               dev_err(&pdev->dev, "cannot map HS-I2C IO\n");
> +               ret = -EADDRNOTAVAIL;
> +               goto err_clk;
> +       }
> +
> +       i2c->adap.algo_data = i2c;
> +       i2c->adap.dev.parent = &pdev->dev;
> +
> +       /* parse device tree and inititalise the gpio */
> +       if (exynos5_i2c_parse_dt_gpio(i2c))
> +               return -EINVAL;
> +
> +       init_completion(&i2c->msg_complete);
> +
> +       i2c->irq = ret = irq_of_parse_and_map(np, 0);
> +       if (ret <= 0) {
> +               dev_err(&pdev->dev, "cannot find HS-I2C IRQ\n");
> +               goto err_iomap;
> +       }
> +
> +       ret = devm_request_irq(&pdev->dev, i2c->irq, exynos5_i2c_irq,
> +                               0, dev_name(&pdev->dev), i2c);
> +
> +       if (ret != 0) {
> +               dev_err(&pdev->dev, "cannot request HS-I2C IRQ %d\n",
> i2c->irq);
> +               goto err_iomap;
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
> +               goto err_iomap;
> +
> +       exynos5_i2c_init(i2c);
> +       i2c->adap.nr = -1;
> +       i2c->adap.dev.of_node = np;
> +
> +       ret = i2c_add_numbered_adapter(&i2c->adap);
> +       if (ret < 0) {
> +               dev_err(&pdev->dev, "failed to add bus to i2c core\n");
> +               goto err_pm;
> +       }
> +
> +       of_i2c_register_devices(&i2c->adap);
> +       platform_set_drvdata(pdev, i2c);
> +
> +       exynos5_hsi2c_reg_debugfs =
> debugfs_create_regset32("exynos5-hsi2c",
> +                                                 S_IFREG | S_IRUGO,
> +                                                 NULL,
> &exynos5_hsi2c_regset);
> +       clk_disable_unprepare(i2c->clk);
> +       pm_runtime_mark_last_busy(i2c->dev);
> +       pm_runtime_put_autosuspend(i2c->dev);
> +
> +       return 0;
> +
> + err_pm:
> +       pm_runtime_put(i2c->dev);
> +       pm_runtime_disable(&pdev->dev);
> + err_iomap:
> +       iounmap(i2c->regs);
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
> +       clk_disable_unprepare(i2c->clk);
> +       pm_runtime_put(&pdev->dev);
> +       pm_runtime_disable(&pdev->dev);
> +
> +       i2c_del_adapter(&i2c->adap);
> +
> +       iounmap(i2c->regs);
> +
> +       return 0;
> +}
> +
> +#ifdef CONFIG_PM
> +static int exynos5_i2c_suspend_noirq(struct device *dev)
>

Have you selected the noirq methods for a reason? I am just interested in
how you decided to use suspend_noirq() instead of suspend().


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
> +
> +       clk_prepare_enable(i2c->clk);
> +       exynos5_i2c_init(i2c);
> +       clk_disable_unprepare(i2c->clk);
> +       i2c->suspended = 0;
> +
> +       return 0;
> +}
> +
> +static const struct dev_pm_ops exynos5_i2c_dev_pm_ops = {
> +       .suspend_noirq  = exynos5_i2c_suspend_noirq,
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
> +               .of_match_table = of_match_ptr(exynos5_i2c_match),
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
> +MODULE_LICENSE("GPL");
> --
> 1.7.9.5
>
>
Regards,
Simon

--e89a8fb1fd74295f8b04d7b9c5b8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Naveen,<div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On Mon, Mar 11, 2013 at 9:32 PM, Naveen Krishna Chatradhi <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" target=3D"_blank">c=
h.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div class=3D"im">Adds support for High Speed I2C driver f=
ound in Exynos5 and later<br>

SoCs from Samsung. This driver currently supports Auto mode.<br>
<br>
Driver only supports Device Tree method.<br>
</div><div class=3D"im">Note: Added debugfs support for registers view, not=
 tested.<br>
<br>
</div><div class=3D"im">Signed-off-by: Taekgyun Ko &lt;<a href=3D"mailto:ta=
eggyun.ko-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org">taeggyun.ko-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org</a>&gt;<br>
Signed-off-by: Naveen Krishna Chatradhi &lt;<a href=3D"mailto:ch.naveen@sam=
sung.com">ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org</a>&gt;<br>
</div>Cc: R. Chandrasekar &lt;<a href=3D"mailto:rcsekar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org">rcseka=
r@samsung.com</a>&gt;<br>
---<br>
Changes since v3: <a href=3D"http://lkml.org/lkml/2012/12/28/46" target=3D"=
_blank">http://lkml.org/lkml/2012/12/28/46</a><br>
1. Added Documentation for DT bindings<br>
2. Removed the bus_num, as Doug&#39;s pick id from DT is merged in i2c/for-=
next<br>
3. Split the xfer function for better clarity.<br>
4. Streamlined code flow in isr, handled trans_status register in xfer_msg =
call.<br>
<br>
=A0.../devicetree/bindings/i2c/i2c-exynos5.txt =A0 =A0 =A0 =A0| =A0 50 ++<b=
r>
<div class=3D"im">=A0drivers/i2c/busses/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 | =A0 =A07 +<br>
=A0drivers/i2c/busses/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A01 +<br>
</div>=A0drivers/i2c/busses/i2c-exynos5.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0743 ++++++++++++++++++++<br>
=A04 files changed, 801 insertions(+)<br>
=A0create mode 100644 Documentation/devicetree/bindings/i2c/i2c-exynos5.txt=
<br>
=A0create mode 100644 drivers/i2c/busses/i2c-exynos5.c<br>
<br>
diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt b/Docume=
ntation/devicetree/bindings/i2c/i2c-exynos5.txt<br>
new file mode 100644<br>
index 0000000..0bc9347<br>
--- /dev/null<br>
+++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt<br>
@@ -0,0 +1,50 @@<br>
+* Samsung&#39;s High Speed I2C controller<br>
+<br>
+The Samsung&#39;s High Speed I2C controller is used to interface with I2C =
devices<br>
+at various speeds ranging from 100khz to 3.4Mhz.<br>
+<br>
+Required properties:<br>
+ =A0- compatible: value should be.<br>
+ =A0 =A0 =A0(a) &quot;samsung,exynos5-hsi2c&quot;, for i2c compatible with=
 exynos5 hsi2c.<br>
+ =A0- reg: physical base address of the controller and length of memory ma=
pped<br>
+ =A0 =A0region.<br>
+ =A0- interrupts: interrupt number to the cpu.<br>
+<br>
+ =A0- Samsung GPIO variant (deprecated):<br>
+ =A0 =A0- gpios: The order of the gpios should be the following: &lt;SDA, =
SCL&gt;.<br>
+ =A0 =A0 =A0The gpio specifier depends on the gpio controller.<br>
+ =A0- Pinctrl variant (preferred, if available):<br>
+ =A0 =A0- pinctrl-0: Pin control group to be used for this controller.<br>
+ =A0 =A0- pinctrl-names: Should contain only one value - &quot;default&quo=
t;.<br>
+<br>
+Optional properties:<br>
+ =A0- samsung,hs-mode: Mode of operation, High speed or Fast speed mode. I=
f not<br>
+ =A0 =A0specified, default value is 0.<br>
+ =A0- samsung,hs-clock-freq: Desired operating frequency in Hz of the bus.=
<br>
+ =A0 =A0If not specified, the default value in Hz is 100000.<br>
+ =A0- samsung,fs-clock-freq: Desired operarting frequency in Hz of the bus=
.<br>
+ =A0 =A0If not specified, the default value in Hz is 100000.<br>
+<br>
+Example:<br>
+<br>
+ =A0 =A0 =A0 hsi2c@12ca0000 {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D &quot;samsung,exynos5-hsi2c&qu=
ot;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D &lt;0x12ca0000 0x100&gt;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D &lt;56&gt;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 samsung,fs-clock-freq =3D &lt;100000&gt;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Samsung GPIO variant begins here */<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpios =3D &lt;&amp;gpd1 2 0 /* SDA */<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&amp;gpd1 3 0 /* SCL */&gt=
;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Samsung GPIO variant ends here */<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Pinctrl variant begins here */<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 pinctrl-0 =3D &lt;&amp;i2c4_bus&gt;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 pinctrl-names =3D &quot;default&quot;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Pinctrl variant ends here */<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D &lt;1&gt;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D &lt;0&gt;;<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 s2mps11_pmic@66 {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D &quot;samsung,=
s2mps11-pmic&quot;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D &lt;0x66&gt;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 };<br>
+ =A0 =A0 =A0 };<br>
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig<br>
index a3725de..78b4936 100644<br>
--- a/drivers/i2c/busses/Kconfig<br>
+++ b/drivers/i2c/busses/Kconfig<br>
@@ -434,6 +434,13 @@ config I2C_EG20T<br>
=A0 =A0 =A0 =A0 =A0 ML7213/ML7223/ML7831 is companion chip for Intel Atom E=
6xx series.<br>
=A0 =A0 =A0 =A0 =A0 ML7213/ML7223/ML7831 is completely compatible for Intel=
 EG20T PCH.<br>
<br>
+config I2C_EXYNOS5<br>
<div class=3D"im">+ =A0 =A0 =A0 tristate &quot;Exynos5 high-speed I2C drive=
r&quot;<br>
</div>+ =A0 =A0 =A0 depends on ARCH_EXYNOS5 &amp;&amp; OF<br>
+ =A0 =A0 =A0 help<br>
<div class=3D"im">+ =A0 =A0 =A0 =A0 Say Y here to include support for High-=
speed I2C controller in the<br>
+ =A0 =A0 =A0 =A0 Exynos5 based Samsung SoCs.<br>
+<br>
</div>=A0config I2C_GPIO<br>
=A0 =A0 =A0 =A0 tristate &quot;GPIO-based bitbanging I2C&quot;<br>
=A0 =A0 =A0 =A0 depends on GENERIC_GPIO<br>
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile<br>
index 8f4fc23..b19366c 100644<br>
--- a/drivers/i2c/busses/Makefile<br>
+++ b/drivers/i2c/busses/Makefile<br>
@@ -42,6 +42,7 @@ i2c-designware-platform-objs :=3D i2c-designware-platdrv.=
o<br>
=A0obj-$(CONFIG_I2C_DESIGNWARE_PCI) =A0 =A0 =A0 +=3D i2c-designware-pci.o<b=
r>
=A0i2c-designware-pci-objs :=3D i2c-designware-pcidrv.o<br>
=A0obj-$(CONFIG_I2C_EG20T) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D i2c-eg20t.o<=
br>
+obj-$(CONFIG_I2C_EXYNOS5) =A0 =A0 =A0+=3D i2c-exynos5.o<br>
=A0obj-$(CONFIG_I2C_GPIO) =A0 =A0 =A0 =A0 +=3D i2c-gpio.o<br>
=A0obj-$(CONFIG_I2C_HIGHLANDER) =A0 +=3D i2c-highlander.o<br>
=A0obj-$(CONFIG_I2C_IBM_IIC) =A0 =A0 =A0+=3D i2c-ibm_iic.o<br>
<div class=3D"im">diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i=
2c/busses/i2c-exynos5.c<br>
new file mode 100644<br>
</div>index 0000000..fe30b0b<br>
--- /dev/null<br>
+++ b/drivers/i2c/busses/i2c-exynos5.c<br>
@@ -0,0 +1,743 @@<br>
<div class=3D"im">+/**<br>
+ * i2c-exynos5.c - Samsung Exynos5 I2C Controller Driver<br>
</div>+ *<br>
+ * Copyright (C) 2013 Samsung Electronics Co., Ltd.<br>
+ *<br>
<div class=3D"im">+ * This program is free software; you can redistribute i=
t and/or modify<br>
+ * it under the terms of the GNU General Public License version 2 as<br>
+ * published by the Free Software Foundation.<br>
+*/<br>
+<br>
+#include &lt;linux/kernel.h&gt;<br>
+#include &lt;linux/module.h&gt;<br>
</div>+#include &lt;linux/debugfs.h&gt;<br>
<div class=3D"im">+<br>
+#include &lt;linux/i2c.h&gt;<br>
+#include &lt;linux/init.h&gt;<br>
+#include &lt;linux/time.h&gt;<br>
+#include &lt;linux/interrupt.h&gt;<br>
+#include &lt;linux/delay.h&gt;<br>
+#include &lt;linux/errno.h&gt;<br>
+#include &lt;linux/err.h&gt;<br>
+#include &lt;linux/platform_device.h&gt;<br>
</div>+#include &lt;linux/pm_runtime.h&gt;<br>
<div class=3D"im">+#include &lt;linux/clk.h&gt;<br>
+#include &lt;linux/slab.h&gt;<br>
+#include &lt;linux/io.h&gt;<br>
</div><div class=3D"im">+#include &lt;linux/of_address.h&gt;<br>
+#include &lt;linux/of_gpio.h&gt;<br>
+#include &lt;linux/of_irq.h&gt;<br>
+#include &lt;linux/of_i2c.h&gt;<br>
+<br>
</div>+/* Register Map */<br>
<div class=3D"im">+#define HSI2C_CTL =A0 =A0 =A0 =A0 =A0 =A0 =A00x00<br>
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
<div class=3D"im">+#define HSI2C_TIMEOUT =A0 =A0 =A0 =A0 =A00x48<br>
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
<div class=3D"im">+#define HSI2C_FUNC_MODE_I2C =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0(1u &lt;&lt; 0)<br>
+#define HSI2C_MASTER =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (=
1u &lt;&lt; 3)<br>
+#define HSI2C_RXCHON =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (=
1u &lt;&lt; 6)<br>
+#define HSI2C_TXCHON =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (=
1u &lt;&lt; 7)<br>
</div><div class=3D"im">+#define HSI2C_SW_RST =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 (1u &lt;&lt; 31)<br>
+<br>
</div>+/* I2C_FIFO_CTL Register bits */<br>
<div class=3D"im">+#define HSI2C_RXFIFO_EN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1u &lt;&lt; 0)<br>
+#define HSI2C_TXFIFO_EN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0(1u &lt;&lt; 1)<br>
+#define HSI2C_TXFIFO_TRIGGER_LEVEL =A0 =A0 =A0 =A0 =A0 =A0 (0x20 &lt;&lt; =
16)<br>
+#define HSI2C_RXFIFO_TRIGGER_LEVEL =A0 =A0 =A0 =A0 =A0 =A0 (0x20 &lt;&lt; =
4)<br>
+<br>
</div>+/* I2C_TRAILING_CTL Register bits */<br>
+#define HSI2C_TRAILING_COUNT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0xf)<br>
+<br>
+/* I2C_INT_EN Register bits */<br>
+#define HSI2C_INT_TX_ALMOSTEMPTY_EN =A0 =A0 =A0 =A0 =A0 =A0(1u &lt;&lt; 0)=
<br>
<div class=3D"im">+#define HSI2C_INT_RX_ALMOSTFULL_EN =A0 =A0 =A0 =A0 =A0 =
=A0 (1u &lt;&lt; 1)<br>
+#define HSI2C_INT_TRAILING_EN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1u &lt;&=
lt; 6)<br>
+#define HSI2C_INT_I2C_EN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1u &=
lt;&lt; 9)<br>
+<br>
+/* I2C_FIFO_STAT Register bits */<br>
</div>+#define HSI2C_RX_FIFO_EMPTY =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(=
1u &lt;&lt; 24)<br>
+#define HSI2C_RX_FIFO_FULL =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1u &lt=
;&lt; 23)<br>
<div class=3D"im">+#define HSI2C_TX_FIFO_EMPTY =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0(1u &lt;&lt; 8)<br>
+#define HSI2C_TX_FIFO_FULL =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1u &lt=
;&lt; 7)<br>
+<br>
</div>+#define HSI2C_RX_FIFO_EMPTY =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(=
1u &lt;&lt; 24)<br>
+#define HSI2C_FIFO_EMPTY =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (HSI2=
C_RX_FIFO_EMPTY | =A0\<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 HSI2C_TX_FIFO_EMPTY)<br>
+<br>
+/* I2C_CONF Register bits */<br>
<div class=3D"im">+#define HSI2C_AUTO_MODE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1u &lt;&lt; 31)<br>
+#define HSI2C_10BIT_ADDR_MODE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1u &lt;&=
lt; 30)<br>
+#define HSI2C_HS_MODE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(=
1u &lt;&lt; 29)<br>
+<br>
</div>+/* I2C_AUTO_CONF Register bits */<br>
<div class=3D"im">+#define HSI2C_READ_WRITE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 (1u &lt;&lt; 16)<br>
+#define HSI2C_STOP_AFTER_TRANS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1u &lt;&lt=
; 17)<br>
+#define HSI2C_MASTER_RUN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1u &=
lt;&lt; 31)<br>
+<br>
</div>+/* I2C_TIMEOUT Register bits */<br>
<div class=3D"im">+#define HSI2C_TIMEOUT_EN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 (1u &lt;&lt; 31)<br>
+<br>
</div><div class=3D"im">+/* I2C_TRANS_STATUS register bits */<br>
</div>+#define HSI2C_MASTER_BUSY =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0(1u &lt;&lt; 17)<br>
+#define HSI2C_SLAVE_BUSY =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1u &=
lt;&lt; 16)<br>
+#define HSI2C_NO_DEV =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (=
1u &lt;&lt; 3)<br>
+#define HSI2C_NO_DEV_ACK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1u &=
lt;&lt; 2)<br>
<div class=3D"im">+#define HSI2C_TRANS_ABORT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0(1u &lt;&lt; 1)<br>
+#define HSI2C_TRANS_DONE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1u &=
lt;&lt; 0)<br>
</div><div class=3D"im">+<br>
+/* I2C_ADDR register bits */<br>
+#define HSI2C_SLV_ADDR_SLV(x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0((x &amp;=
 0x3ff) &lt;&lt; 0)<br>
+#define HSI2C_SLV_ADDR_MAS(x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0((x &amp;=
 0x3ff) &lt;&lt; 10)<br>
+#define HSI2C_MASTER_ID(x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ((x &am=
p; 0xff) &lt;&lt; 24)<br>
+<br>
</div>+/* Controller operating frequency, timing values for operation<br>
+ * are calculated against this frequency<br>
+ */<br>
+#define HSI2C_HS_TX_CLOCK =A0 =A0 =A01000000<br>
+#define HSI2C_FS_TX_CLOCK =A0 =A0 =A01000000<br>
<div class=3D"im">+#define HSI2C_HIGH_SPD =A0 =A0 =A0 =A0 1<br>
+#define HSI2C_FAST_SPD =A0 =A0 =A0 =A0 0<br>
+<br>
+#define EXYNOS5_I2C_TIMEOUT (msecs_to_jiffies(1000))<br>
+<br>
+/* timeout for pm runtime autosuspend */<br>
+#define EXYNOS5_I2C_PM_TIMEOUT =A0 =A0 =A0 =A0 1000 =A0 =A0/* ms */<br>
+<br>
+struct exynos5_i2c {<br>
</div>+ =A0 =A0 =A0 struct i2c_adapter =A0 =A0 =A0adap;<br>
<div class=3D"im">+ =A0 =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0suspend=
ed:1;<br>
+<br>
+ =A0 =A0 =A0 struct i2c_msg =A0 =A0 =A0 =A0 =A0*msg;<br>
+ =A0 =A0 =A0 struct completion =A0 =A0 =A0 msg_complete;<br>
</div>+ =A0 =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0msg_ptr;<br>
<div class=3D"im">+<br>
+ =A0 =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0irq;<br>
+<br>
+ =A0 =A0 =A0 void __iomem =A0 =A0 =A0 =A0 =A0 =A0*regs;<br>
+ =A0 =A0 =A0 struct clk =A0 =A0 =A0 =A0 =A0 =A0 =A0*clk;<br>
+ =A0 =A0 =A0 struct device =A0 =A0 =A0 =A0 =A0 *dev;<br>
+<br>
</div>+ =A0 =A0 =A0 /* GPIO lines for SDA/SCL*/<br>
<div class=3D"im">+ =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 gpios[2];<br>
+<br>
</div>+ =A0 =A0 =A0 /* Controller operating frequency */<br>
<div class=3D"im">+ =A0 =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0clock;<=
br>
+<br>
</div>+ =A0 =A0 =A0 /* HSI2C Controller can operate in<br>
+ =A0 =A0 =A0 =A0* 1. High speed upto 3.4Mbps<br>
+ =A0 =A0 =A0 =A0* 2. Fast speed upto 1Mbps<br>
+ =A0 =A0 =A0 =A0*/<br>
+ =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 speed_mode;<br>
+};<br>
+<br>
<div class=3D"im">+static const struct of_device_id exynos5_i2c_match[] =3D=
 {<br>
</div>+ =A0 =A0 =A0 { .compatible =3D &quot;samsung,exynos5-hsi2c&quot; },<=
br>
<div class=3D"im">+ =A0 =A0 =A0 {},<br>
+};<br>
+MODULE_DEVICE_TABLE(of, exynos5_i2c_match);<br>
</div><div class=3D"im">+<br>
+static inline void exynos5_i2c_stop(struct exynos5_i2c *i2c)<br>
+{<br>
+ =A0 =A0 =A0 writel(0, i2c-&gt;regs + HSI2C_INT_ENABLE);<br>
+<br>
+ =A0 =A0 =A0 complete(&amp;i2c-&gt;msg_complete);<br>
+}<br>
+<br>
</div><div class=3D"im">+static void exynos5_i2c_en_timeout(struct exynos5_=
i2c *i2c)<br>
+{<br>
</div>+ =A0 =A0 =A0 u32 i2c_timeout =3D readl(i2c-&gt;regs + HSI2C_TIMEOUT)=
;<br>
<div class=3D"im">+<br>
+ =A0 =A0 =A0 /* Clear to enable Timeout */<br>
+ =A0 =A0 =A0 i2c_timeout &amp;=3D ~HSI2C_TIMEOUT_EN;<br>
+ =A0 =A0 =A0 writel(i2c_timeout, i2c-&gt;regs + HSI2C_TIMEOUT);<br>
+}<br>
+<br>
</div><div class=3D"im">+static int exynos5_i2c_set_timing(struct exynos5_i=
2c *i2c)<br>
+{<br>
</div>+ =A0 =A0 =A0 u32 i2c_timing_s1;<br>
+ =A0 =A0 =A0 u32 i2c_timing_s2;<br>
+ =A0 =A0 =A0 u32 i2c_timing_s3;<br>
+ =A0 =A0 =A0 u32 i2c_timing_sla;<br>
+ =A0 =A0 =A0 unsigned int op_clk =3D i2c-&gt;clock;<br>
<div class=3D"im">+ =A0 =A0 =A0 unsigned int clkin =3D clk_get_rate(i2c-&gt=
;clk);<br>
+ =A0 =A0 =A0 unsigned int n_clkdiv;<br>
+ =A0 =A0 =A0 unsigned int t_start_su, t_start_hd;<br>
+ =A0 =A0 =A0 unsigned int t_stop_su;<br>
+ =A0 =A0 =A0 unsigned int t_data_su, t_data_hd;<br>
+ =A0 =A0 =A0 unsigned int t_scl_l, t_scl_h;<br>
+ =A0 =A0 =A0 unsigned int t_sr_release;<br>
+ =A0 =A0 =A0 unsigned int t_ftl_cycle;<br>
+ =A0 =A0 =A0 unsigned int i =3D 0, utemp0 =3D 0, utemp1 =3D 0, utemp2 =3D =
0;<br></div></blockquote><div><br></div><div style>Can you think of a bette=
r name for utemp0 and utemp2? Is utemp2 a clock divisor?</div><div>=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;=
padding-left:1ex">
<div class=3D"im">
+<br>
</div><div><div class=3D"h5">+ =A0 =A0 =A0 /* FPCLK / FI2C =3D<br>
+ =A0 =A0 =A0 =A0* (CLK_DIV + 1) * (TSCLK_L + TSCLK_H + 2) + 8 + 2 * FLT_CY=
CLE<br>
+ =A0 =A0 =A0 =A0* uTemp0 =3D (CLK_DIV + 1) * (TSCLK_L + TSCLK_H + 2)<br>
+ =A0 =A0 =A0 =A0* uTemp1 =3D (TSCLK_L + TSCLK_H + 2)<br>
+ =A0 =A0 =A0 =A0* uTemp2 =3D TSCLK_L + TSCLK_H<br>
+ =A0 =A0 =A0 =A0*/<br>
+ =A0 =A0 =A0 t_ftl_cycle =3D (readl(i2c-&gt;regs + HSI2C_CONF) &gt;&gt; 16=
) &amp; 0x7;<br>
+ =A0 =A0 =A0 utemp0 =3D (clkin / op_clk) - 8 - 2 * t_ftl_cycle;<br>
+<br>
+ =A0 =A0 =A0 /* CLK_DIV max is 256 */<br>
+ =A0 =A0 =A0 for (i =3D 0; i &lt; 256; i++) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 utemp1 =3D utemp0 / (i + 1);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* SCLK_L/H max is 256 / 2 */<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (utemp1 &lt; 128) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 utemp2 =3D utemp1 - 2;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br></div></div></blockquote><div><br></div>=
<div style>I suppose this loop can&#39;t exit until i is at least utemp / 1=
28, so perhaps could start the loop at that value? This code seems to be on=
 the noirq resume path, so should be fast if possible.</div>
<div style><br></div><div style>What happens if i gets to 256? Is that an e=
rror, since in that case utemp2 is not set?</div><div style><br></div><div =
style>Also could consider moving this loop into a function.</div><div style=
>
=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-=
style:solid;padding-left:1ex"><div><div class=3D"h5">
+ =A0 =A0 =A0 }<span style=3D"color:rgb(34,34,34)">=A0</span></div></div></=
blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-st=
yle:solid;padding-left:1ex">
<div><div class=3D"h5">
+<br>
+ =A0 =A0 =A0 n_clkdiv =3D i;<br>
+ =A0 =A0 =A0 t_scl_l =3D utemp2 / 2;<br>
+ =A0 =A0 =A0 t_scl_h =3D utemp2 / 2;<br>
+ =A0 =A0 =A0 t_start_su =3D t_scl_l;<br>
+ =A0 =A0 =A0 t_start_hd =3D t_scl_l;<br>
+ =A0 =A0 =A0 t_stop_su =3D t_scl_l;<br>
+ =A0 =A0 =A0 t_data_su =3D t_scl_l / 2;<br>
+ =A0 =A0 =A0 t_data_hd =3D t_scl_l / 2;<br>
+ =A0 =A0 =A0 t_sr_release =3D utemp2;<br>
+<br>
+ =A0 =A0 =A0 i2c_timing_s1 =3D t_start_su &lt;&lt; 24 | t_start_hd &lt;&lt=
; 16 | t_stop_su &lt;&lt; 8;<br>
+ =A0 =A0 =A0 i2c_timing_s2 =3D t_data_su &lt;&lt; 24 | t_scl_l &lt;&lt; 8 =
| t_scl_h &lt;&lt; 0;<br>
+ =A0 =A0 =A0 i2c_timing_s3 =3D n_clkdiv &lt;&lt; 16 | t_sr_release &lt;&lt=
; 0;<br>
+ =A0 =A0 =A0 i2c_timing_sla =3D t_data_hd &lt;&lt; 0;<br>
+<br>
+ =A0 =A0 =A0 dev_dbg(i2c-&gt;dev, &quot;tSTART_SU: %X, tSTART_HD: %X, tSTO=
P_SU: %X\n&quot;,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 t_start_su, t_start_hd, t_stop_su);<br>
+ =A0 =A0 =A0 dev_dbg(i2c-&gt;dev, &quot;tDATA_SU: %X, tSCL_L: %X, tSCL_H: =
%X\n&quot;,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 t_data_su, t_scl_l, t_scl_h);<br>
+ =A0 =A0 =A0 dev_dbg(i2c-&gt;dev, &quot;nClkDiv: %X, tSR_RELEASE: %X\n&quo=
t;,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 n_clkdiv, t_sr_release);<br>
+ =A0 =A0 =A0 dev_dbg(i2c-&gt;dev, &quot;tDATA_HD: %X\n&quot;, t_data_hd);<=
br>
+<br>
+ =A0 =A0 =A0 if (i2c-&gt;speed_mode =3D=3D HSI2C_HIGH_SPD) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(i2c_timing_s1, i2c-&gt;regs + HSI2C_TI=
MING_HS1);<br>
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
</div></div>+static void exynos5_i2c_init(struct exynos5_i2c *i2c)<br>
+{<br>
+ =A0 =A0 =A0 u32 i2c_conf =3D readl(i2c-&gt;regs + HSI2C_CONF);<br>
+<br>
+ =A0 =A0 =A0 writel((HSI2C_FUNC_MODE_I2C | HSI2C_MASTER),<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 i2c-&gt;regs + HSI2C_CTL);<br>
+ =A0 =A0 =A0 writel(HSI2C_TRAILING_COUNT, i2c-&gt;regs + HSI2C_TRAILIG_CTL=
);<br>
<div class=3D"im">+<br>
+ =A0 =A0 =A0 exynos5_i2c_set_timing(i2c);<br>
+<br>
+ =A0 =A0 =A0 if (i2c-&gt;speed_mode =3D=3D HSI2C_HIGH_SPD)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c_conf |=3D HSI2C_HS_MODE;<br>
+<br>
</div>+ =A0 =A0 =A0 writel(i2c_conf | HSI2C_AUTO_MODE, i2c-&gt;regs + HSI2C=
_CONF);<br>
+}<br>
+<br>
+static void exynos5_i2c_reset(struct exynos5_i2c *i2c)<br>
+{<br>
+ =A0 =A0 =A0 u32 i2c_ctl;<br>
+<br>
+ =A0 =A0 =A0 /* Set and clear the bit for reset */<br>
+ =A0 =A0 =A0 i2c_ctl =3D readl(i2c-&gt;regs + HSI2C_CTL);<br>
+ =A0 =A0 =A0 i2c_ctl |=3D HSI2C_SW_RST;<br>
+ =A0 =A0 =A0 writel(i2c_ctl, i2c-&gt;regs + HSI2C_CTL);<br>
+<br>
+ =A0 =A0 =A0 i2c_ctl =3D readl(i2c-&gt;regs + HSI2C_CTL);<br>
+ =A0 =A0 =A0 i2c_ctl &amp;=3D ~HSI2C_SW_RST;<br>
+ =A0 =A0 =A0 writel(i2c_ctl, i2c-&gt;regs + HSI2C_CTL);<br>
+<br>
+ =A0 =A0 =A0 /* Initialize the configure registers */<br>
+ =A0 =A0 =A0 exynos5_i2c_init(i2c);<br>
+}<br>
+<br>
+static void exynos5_i2c_master_run(struct exynos5_i2c *i2c)<br>
<div class=3D"im">+{<br>
+ =A0 =A0 =A0 /* Start data transfer in Master mode */<br>
</div>+ =A0 =A0 =A0 u32 i2c_auto_conf =3D readl(i2c-&gt;regs + HSI2C_AUTO_C=
ONF);<br>
+ =A0 =A0 =A0 i2c_auto_conf |=3D HSI2C_MASTER_RUN;<br>
<div class=3D"im">+ =A0 =A0 =A0 writel(i2c_auto_conf, i2c-&gt;regs + HSI2C_=
AUTO_CONF);<br>
+}<br>
+<br>
+/**<br>
+ * exynos5_i2c_irq: top level IRQ servicing routine<br>
+*/<br>
</div><div class=3D"im">+static irqreturn_t exynos5_i2c_irq(int irqno, void=
 *dev_id)<br>
+{<br>
+ =A0 =A0 =A0 struct exynos5_i2c *i2c =3D dev_id;<br>
+ =A0 =A0 =A0 unsigned char byte;<br>
+<br></div></blockquote><div><br></div><div style>Can other sorts of irqs h=
appen? Errors?</div><div style>=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rg=
b(204,204,204);border-left-style:solid;padding-left:1ex">
<div class=3D"im">
+ =A0 =A0 =A0 if (i2c-&gt;msg-&gt;flags &amp; I2C_M_RD) {<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 while (!(readl(i2c-&gt;regs + HSI2C_FIF=
O_STATUS) &amp;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 HSI2C_RX_FIFO_EMPTY)) {<br>
<div class=3D"im">+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 byte =3D (u=
nsigned char)readl(i2c-&gt;regs + HSI2C_RX_DATA);<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c-&gt;msg-&gt;buf[i2c=
-&gt;msg_ptr++] =3D byte;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
+ =A0 =A0 =A0 } else {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 byte =3D i2c-&gt;msg-&gt;buf[i2c-&gt;msg_ptr+=
+];<br>
<div class=3D"im">+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(byte, i2c-&gt;regs +=
 HSI2C_TX_DATA);<br>
+<br></div></blockquote><div><br></div><div style>Extra blank line. Here yo=
u only write one byte - is there a tx FIFO also, so we can avoid doing one =
interrupt per transmit byte?</div><div style>=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border=
-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
<div class=3D"im">
+ =A0 =A0 =A0 }<br>
</div>+<br>
+ =A0 =A0 =A0 if (i2c-&gt;msg_ptr &gt;=3D i2c-&gt;msg-&gt;len)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 exynos5_i2c_stop(i2c);<br>
+<br>
<div class=3D"im">+ =A0 =A0 =A0 /* Set these bits to clear them */<br>
+ =A0 =A0 =A0 writel(readl(i2c-&gt;regs + HSI2C_INT_STATUS),<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c-&gt=
;regs + HSI2C_INT_STATUS);<br>
+<br>
<div class=3D"im">+ =A0 =A0 =A0 return IRQ_HANDLED;<br></div></blockquote><=
div><br></div><div style>Are there any other interrupt types that can happe=
n, like errors for example?</div><div>=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-c=
olor:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
<div class=3D"im">
+}<br>
+<br>
</div>+static void exynos5_i2c_message_start(struct exynos5_i2c *i2c, int s=
top)<br></blockquote><div><br></div><div style>Function comment would be us=
eful - what is stop for?</div><div style>=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-lef=
t-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">

+{<br>
+ =A0 =A0 =A0 u32 i2c_ctl =3D readl(i2c-&gt;regs + HSI2C_CTL);<br>
+ =A0 =A0 =A0 u32 int_en =3D HSI2C_INT_I2C_EN;<br>
+ =A0 =A0 =A0 u32 i2c_auto_conf;<br>
+ =A0 =A0 =A0 u32 fifo_ctl;<br>
+<br>
+ =A0 =A0 =A0 exynos5_i2c_en_timeout(i2c);<br>
+<br>
+ =A0 =A0 =A0 fifo_ctl =3D HSI2C_RXFIFO_EN | HSI2C_TXFIFO_EN |<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 HSI2C_TXFIFO_TRIGGER_LEVEL | HSI2C_RXFIFO_TRI=
GGER_LEVEL;<br>
+ =A0 =A0 =A0 writel(fifo_ctl, i2c-&gt;regs + HSI2C_FIFO_CTL);<br>
+<br></blockquote><div style><br></div><div style>You could</div><div style=
><br></div><div style>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0i2c_ctl &amp;=3D ~(HSI=
2C_TXCHON | HSI2C_RXCHON)<br></div><div style><br></div><div style>here to =
simply code below.</div>
<div style>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);borde=
r-left-style:solid;padding-left:1ex">
<div class=3D"im">+ =A0 =A0 =A0 if (i2c-&gt;msg-&gt;flags &amp; I2C_M_RD) {=
<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c_ctl &amp;=3D ~HSI2C_TXCHON;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c_ctl |=3D HSI2C_RXCHON;<br>
<div class=3D"im">+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c_auto_conf |=3D HSI2C_READ_WRITE;<br>
+<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 int_en |=3D (HSI2C_INT_RX_ALMOSTFULL_EN=
 |<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 HSI2C_INT_TRAILING_EN);<br>
+ =A0 =A0 =A0 } else {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c_ctl &amp;=3D ~HSI2C_RXCHON;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c_ctl |=3D HSI2C_TXCHON;<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 int_en |=3D HSI2C_INT_TX_ALMOSTEMPTY_EN;<br>
<div class=3D"im">+ =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 if (stop =3D=3D 1)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c_auto_conf |=3D HSI2C_STOP_AFTER_TRANS;<br=
>
+<br>
</div>+ =A0 =A0 =A0 writel(HSI2C_SLV_ADDR_MAS(i2c-&gt;msg-&gt;addr), i2c-&g=
t;regs + HSI2C_ADDR);<br>
+<br>
+ =A0 =A0 =A0 writel(i2c_ctl, i2c-&gt;regs + HSI2C_CTL);<br>
+<br>
+ =A0 =A0 =A0 /* In auto mode the length of xfer cannot be 0 */<br></blockq=
uote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:so=
lid;padding-left:1ex">
+ =A0 =A0 =A0 if (i2c-&gt;msg-&gt;len &lt;=3D 0)=A0</blockquote><div><br cl=
ass=3D"">What is auto mode? Perhaps a little comment at the top of the file=
 about the two modes? What does it mean when msg-&gt;len &lt; 0?</div><div>=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-styl=
e:solid;padding-left:1ex">
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c_auto_conf |=3D 0x1;<br>
+ =A0 =A0 =A0 else<br>
<div class=3D"im">+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c_auto_conf |=3D i2c-&gt;=
msg-&gt;len;<br>
+<br>
</div><div class=3D"im">+ =A0 =A0 =A0 writel(i2c_auto_conf, i2c-&gt;regs + =
HSI2C_AUTO_CONF);<br>
+<br>
+ =A0 =A0 =A0 exynos5_i2c_master_run(i2c);<br>
+<br>
</div>+ =A0 =A0 =A0 writel(int_en, i2c-&gt;regs + HSI2C_INT_ENABLE);<br>
+}<br>
+<br>
<div class=3D"im">+static int exynos5_i2c_xfer_msg(struct exynos5_i2c *i2c,=
<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct i2c_=
msg *msgs, int stop)<br>
<div class=3D"im">+{<br>
+ =A0 =A0 =A0 unsigned long timeout;<br>
</div>+ =A0 =A0 =A0 u32 trans_status;<br>
+ =A0 =A0 =A0 u32 fifo_stat;<br>
+ =A0 =A0 =A0 int ret =3D -EAGAIN, val;<br>
<div class=3D"im">+<br>
+ =A0 =A0 =A0 i2c-&gt;msg =3D msgs;<br>
</div><div class=3D"im">+ =A0 =A0 =A0 i2c-&gt;msg_ptr =3D 0;<br>
+<br>
</div>+ =A0 =A0 =A0 exynos5_i2c_message_start(i2c, stop);<br>
+<br>
+ =A0 =A0 =A0 val =3D wait_for_completion_interruptible_timeout<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 (&amp;i2c-&gt;msg_complete, EXYNOS5_I2C_TIMEO=
UT);<br>
+ =A0 =A0 =A0 if (val &gt;=3D 0)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 timeout =3D val;<br>
<div class=3D"im">+<br>
+ =A0 =A0 =A0 if (msgs-&gt;flags &amp; I2C_M_RD) {<br>
</div><div class=3D"im">+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (timeout =3D=3D 0)=
 {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 exynos5_i2c_reset(i2c);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_warn(i2c-&gt;dev, &quot;r=
x timeout\n&quot;);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D 0;<br>
</div>+ =A0 =A0 =A0 } else {<br>
<div class=3D"im">+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (timeout =3D=3D 0) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 exynos5_i2c_reset(i2c);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_warn(i2c-&gt;dev, &quot;t=
x timeout\n&quot;);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br></div></blockquote><div><br></div><div s=
tyle>Could perhaps make the timeout check common (put above the if (msgs-&g=
t;flags)).</div><div style>=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(20=
4,204,204);border-left-style:solid;padding-left:1ex">
<div class=3D"im">
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 timeout =3D jiffies + timeout;<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 while (time_before(jiffies, timeout)) {<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fifo_stat =3D readl(i2c=
-&gt;regs + HSI2C_FIFO_STATUS);<br>
<div class=3D"im">+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 trans_statu=
s =3D readl(i2c-&gt;regs + HSI2C_TRANS_STATUS);<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((trans_status &amp;=
 HSI2C_NO_DEV) ||<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (trans_status=
 &amp; HSI2C_NO_DEV_ACK &amp;&amp;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 !(i2c-&gt;msg=
-&gt;flags &amp; I2C_M_IGNORE_NAK))) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 exynos5_i2c_r=
eset(i2c);<br></blockquote><div><br></div><div style>I think these continua=
tion lines should be indented a little more.</div><div style>=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-=
width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;paddin=
g-left:1ex">

+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENXIO=
;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((fifo_stat =3D=3D HSI2C_F=
IFO_EMPTY) &amp;&amp;<br>
<div class=3D"im">+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 ((trans_status =3D=3D 0) ||<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ((stop =3D=3D=
 0) &amp;&amp;<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (trans_=
status =3D=3D HSI2C_MASTER_BUSY)))) {<br>
<div class=3D"im">+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 ret =3D 0;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br></div></blockquote><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border=
-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div=
 class=3D"im">+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret =3D=3D -EAGAIN) {<br>

+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 exynos5_i2c_reset(i2c);<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_warn(i2c-&gt;dev, &=
quot;xfer timeout\n&quot;);<br>
<div class=3D"im">+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;=
<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
+ =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 return ret;<br>
+}<br>
+<br>
+static int exynos5_i2c_xfer(struct i2c_adapter *adap,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct i2c_msg *msgs, int num=
)<br>
+{<br>
+ =A0 =A0 =A0 struct exynos5_i2c *i2c =3D (struct exynos5_i2c *)adap-&gt;al=
go_data;<br>
+ =A0 =A0 =A0 int retry, i;<br>
</div>+ =A0 =A0 =A0 int ret, ret_pm;<br>
<div class=3D"im">+ =A0 =A0 =A0 int stop =3D 0;<br>
+ =A0 =A0 =A0 struct i2c_msg *msgs_ptr =3D msgs;<br>
+<br>
+ =A0 =A0 =A0 if (i2c-&gt;suspended) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(i2c-&gt;dev, &quot;HS-I2C is not init=
ialzed.\n&quot;);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EIO;<br>
+ =A0 =A0 =A0 }<br>
+<br>
</div>+ =A0 =A0 =A0 ret_pm =3D pm_runtime_get_sync(i2c-&gt;dev);<br>
+ =A0 =A0 =A0 if (IS_ERR_VALUE(ret_pm)) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EIO;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;<br>
<div class=3D"im">+ =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 clk_prepare_enable(i2c-&gt;clk);<br>
+<br>
+ =A0 =A0 =A0 for (retry =3D 0; retry &lt; adap-&gt;retries; retry++) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (i =3D 0; i &lt; num; i++) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (i =3D=3D num - 1)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 stop =3D 1;<b=
r></div></blockquote><div><br></div><div style>Perhaps:</div><div style><br=
></div><div style>stop =3D (i =3D=3D num - 1);</div><div style><br></div><d=
iv style>so you can avoid the other assignments to stop</div>
<div style>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);borde=
r-left-style:solid;padding-left:1ex"><div class=3D"im">
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D exynos5_i2c_xfe=
r_msg(i2c, msgs_ptr, stop);<br>
<div class=3D"im">+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 msgs_ptr++;=
<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret =3D=3D -EAGAIN) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 msgs_ptr =3D =
msgs;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 stop =3D 0;<b=
r>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else if (ret =3D=3D -=
ENXIO)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;<br>=
</blockquote><div><br></div><div style>{} around else part also I think</di=
v><div style>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bor=
der-left-style:solid;padding-left:1ex">

<div class=3D"im">+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (i =3D=3D num) {<br>
</div><div class=3D"im">+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =
=3D num;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;<br>
</div><div class=3D"im">+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_dbg(i2c-&gt;dev, &quot;retrying transfer =
(%d)\n&quot;, retry);<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 udelay(100);<br>
+ =A0 =A0 =A0 }<br>
+<br>
</div><div class=3D"im">+ =A0 =A0 =A0 ret =3D -EREMOTEIO;<br></div></blockq=
uote><div><br></div><div style>Perhaps a dev_warn() here?</div><div style>=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-styl=
e:solid;padding-left:1ex">
<div class=3D"im">
+ out:<br>
+ =A0 =A0 =A0 clk_disable_unprepare(i2c-&gt;clk);<br>
+ =A0 =A0 =A0 pm_runtime_mark_last_busy(i2c-&gt;dev);<br>
+ =A0 =A0 =A0 pm_runtime_put_autosuspend(i2c-&gt;dev);<br>
</div><div class=3D"im">+ =A0 =A0 =A0 return ret;<br>
+}<br>
+<br>
</div><div class=3D"im">+static u32 exynos5_i2c_func(struct i2c_adapter *ad=
ap)<br>
+{<br>
</div>+ =A0 =A0 =A0 return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;<br>
<div class=3D"im">+}<br>
+<br>
+static const struct i2c_algorithm exynos5_i2c_algorithm =3D {<br>
+ =A0 =A0 =A0 .master_xfer =A0 =A0 =A0 =A0 =A0 =A0=3D exynos5_i2c_xfer,<br>
+ =A0 =A0 =A0 .functionality =A0 =A0 =A0 =A0 =A0=3D exynos5_i2c_func,<br>
+};<br>
+<br>
</div><div class=3D"im">+/**<br>
+ * Parse a list of GPIOs from a node property and request each one<br>
+ *<br>
+ * @param i2c =A0 =A0 =A0 =A0 =A0i2c driver data<br>
+ * @return 0 on success, -EINVAL on error, in which case no GPIOs requeste=
d<br>
+*/<br>
</div><div class=3D"im">+static int exynos5_i2c_parse_dt_gpio(struct exynos=
5_i2c *i2c)<br>
+{<br>
+ =A0 =A0 =A0 int idx, gpio, ret;<br>
+<br>
+ =A0 =A0 =A0 for (idx =3D 0; idx &lt; 2; idx++) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio =3D of_get_gpio(i2c-&gt;dev-&gt;of_node,=
 idx);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!gpio_is_valid(gpio)) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(i2c-&gt;dev, &quot;in=
valid gpio[%d]: %d\n&quot;, idx, gpio);<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;<br>
<div class=3D"im">+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c-&gt;gpios[idx] =3D gpio;<br>
+<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D devm_gpio_request(i2c-&gt;dev, =
gpio, &quot;i2c-bus&quot;);<br>
<div class=3D"im">+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(i2c-&gt;dev, &quot;gp=
io [%d] request failed\n&quot;, gpio);<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;<br>
<div class=3D"im">+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
+ =A0 =A0 =A0 }<br>
+ =A0 =A0 =A0 return 0;<br>
+}<br>
+<br>
</div><div class=3D"im">+#define HSI2C_REG(regname) {.name =3D #regname, .o=
ffset =3D regname}<br>
+static struct debugfs_reg32 exynos5_hsi2c_regs[] =3D {<br>
+ =A0 =A0 =A0 HSI2C_REG(HSI2C_CTL), HSI2C_REG(HSI2C_FIFO_CTL),<br>
+ =A0 =A0 =A0 HSI2C_REG(HSI2C_TRAILIG_CTL), HSI2C_REG(HSI2C_CLK_CTL),<br>
+ =A0 =A0 =A0 HSI2C_REG(HSI2C_CLK_SLOT), HSI2C_REG(HSI2C_INT_ENABLE),<br>
+ =A0 =A0 =A0 HSI2C_REG(HSI2C_INT_STATUS), HSI2C_REG(HSI2C_ERR_STATUS),<br>
+ =A0 =A0 =A0 HSI2C_REG(HSI2C_FIFO_STATUS), HSI2C_REG(HSI2C_TX_DATA),<br>
+ =A0 =A0 =A0 HSI2C_REG(HSI2C_RX_DATA), HSI2C_REG(HSI2C_CONF),<br>
+ =A0 =A0 =A0 HSI2C_REG(HSI2C_AUTO_CONF), HSI2C_REG(HSI2C_TIMEOUT),<br>
+ =A0 =A0 =A0 HSI2C_REG(HSI2C_MANUAL_CMD), HSI2C_REG(HSI2C_TRANS_STATUS),<b=
r>
+ =A0 =A0 =A0 HSI2C_REG(HSI2C_TIMING_HS1), HSI2C_REG(HSI2C_TIMING_HS2),<br>
+ =A0 =A0 =A0 HSI2C_REG(HSI2C_TIMING_HS3), HSI2C_REG(HSI2C_TIMING_FS1),<br>
+ =A0 =A0 =A0 HSI2C_REG(HSI2C_TIMING_FS2), HSI2C_REG(HSI2C_TIMING_FS3),<br>
+ =A0 =A0 =A0 HSI2C_REG(HSI2C_TIMING_SLA), HSI2C_REG(HSI2C_ADDR),<br>
+};<br>
+<br>
+static struct debugfs_regset32 exynos5_hsi2c_regset =3D {<br>
+ =A0 =A0 =A0 .regs =3D exynos5_hsi2c_regs,<br>
+ =A0 =A0 =A0 .nregs =3D ARRAY_SIZE(exynos5_hsi2c_regs),<br>
+};<br>
+<br>
+static struct dentry *exynos5_hsi2c_reg_debugfs;<br>
</div><div class=3D"im">+<br>
+static int exynos5_i2c_probe(struct platform_device *pdev)<br>
+{<br>
</div><div class=3D"im">+ =A0 =A0 =A0 struct device_node *np =3D pdev-&gt;d=
ev.of_node;<br>
</div>+ =A0 =A0 =A0 struct exynos5_i2c *i2c;<br>
<div class=3D"im">+ =A0 =A0 =A0 int ret;<br>
+<br>
+ =A0 =A0 =A0 if (!np) {<br>
</div><div class=3D"im">+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&amp;pdev-&gt=
;dev, &quot;no device node\n&quot;);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOENT;<br>
+ =A0 =A0 =A0 }<br>
+<br>
</div><div class=3D"im">+ =A0 =A0 =A0 i2c =3D devm_kzalloc(&amp;pdev-&gt;de=
v, sizeof(struct exynos5_i2c), GFP_KERNEL);<br>
+ =A0 =A0 =A0 if (!i2c) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&amp;pdev-&gt;dev, &quot;no memory fo=
r state\n&quot;);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;<br>
+ =A0 =A0 =A0 }<br>
+<br>
</div><div class=3D"im">+ =A0 =A0 =A0 /* Mode of operation High/Fast Speed =
mode */<br>
</div>+ =A0 =A0 =A0 if (of_get_property(np, &quot;samsung,hs-mode&quot;, NU=
LL)) {<br>
<div class=3D"im">+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c-&gt;speed_mode =3D 1;<b=
r>
</div><div class=3D"im">+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (of_property_read_=
u32(np, &quot;samsung,hs-clock&quot;, &amp;i2c-&gt;clock))<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c-&gt;clock =3D HSI2C_HS_TX=
_CLOCK;<br>
+ =A0 =A0 =A0 } else {<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c-&gt;speed_mode =3D 0;<br>
<div class=3D"im">+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (of_property_read_u32(np=
, &quot;samsung,fs-clock&quot;, &amp;i2c-&gt;clock))<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c-&gt;clock =3D HSI2C_FS_TX=
_CLOCK;<br>
</div>+ =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 strlcpy(i2c-&gt;<a href=3D"http://adap.name" target=3D"_blank=
">adap.name</a>, &quot;exynos5-i2c&quot;, sizeof(i2c-&gt;<a href=3D"http://=
adap.name" target=3D"_blank">adap.name</a>));<br>
<div class=3D"im">+ =A0 =A0 =A0 i2c-&gt;adap.owner =A0 =3D THIS_MODULE;<br>
+ =A0 =A0 =A0 i2c-&gt;adap.algo =A0 =A0=3D &amp;exynos5_i2c_algorithm;<br>
+ =A0 =A0 =A0 i2c-&gt;adap.retries =3D 2;<br>
+ =A0 =A0 =A0 i2c-&gt;adap.class =A0 =3D I2C_CLASS_HWMON | I2C_CLASS_SPD;<b=
r>
+<br>
+ =A0 =A0 =A0 i2c-&gt;dev =3D &amp;pdev-&gt;dev;<br>
</div>+ =A0 =A0 =A0 i2c-&gt;clk =3D devm_clk_get(&amp;pdev-&gt;dev, &quot;h=
si2c&quot;);<br>
<div class=3D"im">+ =A0 =A0 =A0 if (IS_ERR(i2c-&gt;clk)) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&amp;pdev-&gt;dev, &quot;cannot get c=
lock\n&quot;);<br>
</div><div class=3D"im">+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOENT;<br>
+ =A0 =A0 =A0 }<br>
+<br>
</div>+ =A0 =A0 =A0 clk_prepare_enable(i2c-&gt;clk);<br>
+<br>
<div class=3D"im">+ =A0 =A0 =A0 i2c-&gt;regs =3D of_iomap(np, 0);<br>
+ =A0 =A0 =A0 if (!i2c-&gt;regs) {<br>
</div><div class=3D"im">+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&amp;pdev-&gt=
;dev, &quot;cannot map HS-I2C IO\n&quot;);<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EADDRNOTAVAIL;<br>
<div class=3D"im">+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_clk;<br>
+ =A0 =A0 =A0 }<br>
+<br>
</div><div class=3D"im">+ =A0 =A0 =A0 i2c-&gt;adap.algo_data =3D i2c;<br>
+ =A0 =A0 =A0 i2c-&gt;adap.dev.parent =3D &amp;pdev-&gt;dev;<br>
+<br>
</div><div class=3D"im">+ =A0 =A0 =A0 /* parse device tree and inititalise =
the gpio */<br>
</div><div class=3D"im">+ =A0 =A0 =A0 if (exynos5_i2c_parse_dt_gpio(i2c))<b=
r>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;<br>
+<br>
</div>+ =A0 =A0 =A0 init_completion(&amp;i2c-&gt;msg_complete);<br>
+<br>
+ =A0 =A0 =A0 i2c-&gt;irq =3D ret =3D irq_of_parse_and_map(np, 0);<br>
<div class=3D"im">+ =A0 =A0 =A0 if (ret &lt;=3D 0) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&amp;pdev-&gt;dev, &quot;cannot find =
HS-I2C IRQ\n&quot;);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_iomap;<br>
+ =A0 =A0 =A0 }<br>
+<br>
</div><div class=3D"im">+ =A0 =A0 =A0 ret =3D devm_request_irq(&amp;pdev-&g=
t;dev, i2c-&gt;irq, exynos5_i2c_irq,<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0, dev_=
name(&amp;pdev-&gt;dev), i2c);<br>
<div class=3D"im">+<br>
+ =A0 =A0 =A0 if (ret !=3D 0) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&amp;pdev-&gt;dev, &quot;cannot reque=
st HS-I2C IRQ %d\n&quot;, i2c-&gt;irq);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_iomap;<br>
+ =A0 =A0 =A0 }<br>
+<br>
</div><div class=3D"im">+ =A0 =A0 =A0 /*<br>
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
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_iomap;<br>
+<br>
+ =A0 =A0 =A0 exynos5_i2c_init(i2c);<br>
+ =A0 =A0 =A0 i2c-&gt;<a href=3D"http://adap.nr" target=3D"_blank">adap.nr<=
/a> =3D -1;<br>
<div class=3D"im">+ =A0 =A0 =A0 i2c-&gt;adap.dev.of_node =3D np;<br>
</div><div class=3D"im">+<br>
+ =A0 =A0 =A0 ret =3D i2c_add_numbered_adapter(&amp;i2c-&gt;adap);<br>
+ =A0 =A0 =A0 if (ret &lt; 0) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&amp;pdev-&gt;dev, &quot;failed to ad=
d bus to i2c core\n&quot;);<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_pm;<br>
<div class=3D"im">+ =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 of_i2c_register_devices(&amp;i2c-&gt;adap);<br>
+ =A0 =A0 =A0 platform_set_drvdata(pdev, i2c);<br>
+<br>
</div><div class=3D"im">+ =A0 =A0 =A0 exynos5_hsi2c_reg_debugfs =3D debugfs=
_create_regset32(&quot;exynos5-hsi2c&quot;,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 S_IFREG | S_IRUGO,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 NULL, &amp;exynos5_hsi2c_regset);<br>
+ =A0 =A0 =A0 clk_disable_unprepare(i2c-&gt;clk);<br>
+ =A0 =A0 =A0 pm_runtime_mark_last_busy(i2c-&gt;dev);<br>
+ =A0 =A0 =A0 pm_runtime_put_autosuspend(i2c-&gt;dev);<br>
</div><div class=3D"im">+<br>
+ =A0 =A0 =A0 return 0;<br>
+<br>
</div><div class=3D"im">+ err_pm:<br>
+ =A0 =A0 =A0 pm_runtime_put(i2c-&gt;dev);<br>
+ =A0 =A0 =A0 pm_runtime_disable(&amp;pdev-&gt;dev);<br>
</div><div class=3D"im">+ err_iomap:<br>
+ =A0 =A0 =A0 iounmap(i2c-&gt;regs);<br>
</div><div class=3D"im">+ err_clk:<br>
+ =A0 =A0 =A0 clk_disable_unprepare(i2c-&gt;clk);<br>
</div><div class=3D"im">+ =A0 =A0 =A0 return ret;<br>
+}<br>
+<br>
+static int exynos5_i2c_remove(struct platform_device *pdev)<br>
+{<br>
+ =A0 =A0 =A0 struct exynos5_i2c *i2c =3D platform_get_drvdata(pdev);<br>
</div><div class=3D"im">+ =A0 =A0 =A0 int ret;<br>
+<br>
+ =A0 =A0 =A0 ret =3D pm_runtime_get_sync(&amp;pdev-&gt;dev);<br>
+ =A0 =A0 =A0 if (IS_ERR_VALUE(ret))<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;<br>
+<br>
<div class=3D"im">+ =A0 =A0 =A0 clk_disable_unprepare(i2c-&gt;clk);<br>
+ =A0 =A0 =A0 pm_runtime_put(&amp;pdev-&gt;dev);<br>
+ =A0 =A0 =A0 pm_runtime_disable(&amp;pdev-&gt;dev);<br>
</div><div class=3D"im">+<br>
+ =A0 =A0 =A0 i2c_del_adapter(&amp;i2c-&gt;adap);<br>
+<br>
</div>+ =A0 =A0 =A0 iounmap(i2c-&gt;regs);<br>
+<br>
<div class=3D"im">+ =A0 =A0 =A0 return 0;<br>
+}<br>
+<br>
+#ifdef CONFIG_PM<br>
+static int exynos5_i2c_suspend_noirq(struct device *dev)<br></div></blockq=
uote><div><br></div><div style>Have you selected the noirq methods for a re=
ason? I am just interested in how you decided to use suspend_noirq() instea=
d of suspend().</div>
<div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex"><div class=3D"im">
+{<br>
+ =A0 =A0 =A0 struct platform_device *pdev =3D to_platform_device(dev);<br>
+ =A0 =A0 =A0 struct exynos5_i2c *i2c =3D platform_get_drvdata(pdev);<br>
+<br>
</div><div class=3D"im">+ =A0 =A0 =A0 i2c-&gt;suspended =3D 1;<br>
+<br>
</div><div class=3D"im">+ =A0 =A0 =A0 return 0;<br>
+}<br>
+<br>
</div>+static int exynos5_i2c_resume_noirq(struct device *dev)<br>
<div class=3D"im">+{<br>
+ =A0 =A0 =A0 struct platform_device *pdev =3D to_platform_device(dev);<br>
+ =A0 =A0 =A0 struct exynos5_i2c *i2c =3D platform_get_drvdata(pdev);<br>
+<br>
</div><div class=3D"im">+ =A0 =A0 =A0 clk_prepare_enable(i2c-&gt;clk);<br>
+ =A0 =A0 =A0 exynos5_i2c_init(i2c);<br>
+ =A0 =A0 =A0 clk_disable_unprepare(i2c-&gt;clk);<br>
+ =A0 =A0 =A0 i2c-&gt;suspended =3D 0;<br>
+<br>
</div><div class=3D"im">+ =A0 =A0 =A0 return 0;<br>
+}<br>
+<br>
+static const struct dev_pm_ops exynos5_i2c_dev_pm_ops =3D {<br>
+ =A0 =A0 =A0 .suspend_noirq =A0=3D exynos5_i2c_suspend_noirq,<br>
</div>+ =A0 =A0 =A0 .resume_noirq =A0 =3D exynos5_i2c_resume_noirq,<br>
<div class=3D"im">+};<br>
+<br>
+#define EXYNOS5_DEV_PM_OPS (&amp;exynos5_i2c_dev_pm_ops)<br>
+#else<br>
+#define EXYNOS5_DEV_PM_OPS NULL<br>
+#endif<br>
+<br>
+static struct platform_driver exynos5_i2c_driver =3D {<br>
+ =A0 =A0 =A0 .probe =A0 =A0 =A0 =A0 =A0=3D exynos5_i2c_probe,<br>
+ =A0 =A0 =A0 .remove =A0 =A0 =A0 =A0 =3D exynos5_i2c_remove,<br>
</div><div class=3D"im">+ =A0 =A0 =A0 .driver =A0 =A0 =A0 =A0 =3D {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .owner =A0=3D THIS_MODULE,<br>
</div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =3D &quot;exynos5-hsi2c&quot;=
,<br>
<div class=3D"im">+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pm =A0 =A0 =3D EXYNOS5_DEV=
_PM_OPS,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .of_match_table =3D of_match_ptr(exynos5_i2c_=
match),<br>
+ =A0 =A0 =A0 },<br>
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
ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org">ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org</a>&gt;&quot;);<br>
<div class=3D""><div class=3D"h5">+MODULE_AUTHOR(&quot;Taekgyun Ko, &lt;<a =
href=3D"mailto:taeggyun.ko-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org">taeggyun.ko-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org</a>&gt;&quo=
t;);<br>
+MODULE_LICENSE(&quot;GPL&quot;);<br>
</div></div><span class=3D""><font color=3D"#888888">--<br>
1.7.9.5<br>
<br></font></span></blockquote><div><br></div><div style>Regards,</div><div=
 style>Simon</div><div style>=A0</div></div><br></div></div>

--e89a8fb1fd74295f8b04d7b9c5b8--

--===============2231577975216106075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============2231577975216106075==--
