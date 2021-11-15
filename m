Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1142C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 16 Nov 2021 00:29:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C9E0F6115B
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 16 Nov 2021 00:29:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241844AbhKPAbz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 15 Nov 2021 19:31:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345563AbhKOT2m (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 15 Nov 2021 14:28:42 -0500
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com [IPv6:2607:f8b0:4864:20::a30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48B37C0AFD67
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Nov 2021 10:55:25 -0800 (PST)
Received: by mail-vk1-xa30.google.com with SMTP id m19so4940227vko.12
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Nov 2021 10:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ujrej7d92V5EhRlK+3EewLoVi5xc/mqOkrT4CjFGGaA=;
        b=qbGgWimd/zl8hR/d1wmjGsswVAvWWq9T4xBmZ9kPnF4Nv+5BtR9ht22tPbnnSvA2tE
         ShK6TOhU84TjH36sYEwUf9k6PIFUUnieQbViM66S9ExZyDaWO2HslaQ4UQFh5U0oyFWH
         epdh6MIzOhRl52VFImL1gDnfW8sx+fwanyzgjZGcri1L6WDipX62Fo8Y98lsR0oo6JH3
         nHseHSisL/i5WuFVRZcE9fAy3Hl+p8A6TxJtd0r0D5N4dPQ9N1m6iCb2hrp8Yr0B3kdx
         zKV2EjNUTyxPBJW7UxaixBe0S9DoBbIoK9xgtdWOG0Bg890DJoy6pBMl/bCMHH9ynJHc
         +AKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ujrej7d92V5EhRlK+3EewLoVi5xc/mqOkrT4CjFGGaA=;
        b=nUdmMlTRD2qmpfnhhOV23xda8wvmyNXKA9LO8Xq/xKCh/IBy7988yymCS1ruODJxyA
         J5fX4exQL2LVUo9vIZsTVxLkilQX/9whPhUxDcw3LsV622FFp0vxO7FMnrJRYFYStOCA
         Vq4xl8LXmm3+gGQ7Jn+obolqLfy/oejLezwt+h4VTMdYdximdwLxNtzp5nMjvCvfUZ5F
         K0hMHzhZQJbnjhenCQY5HWw9k0wtQPDtxPXGdYQ+AYnquXhVC9rskve91bqUjj/9/o2b
         k9E3zomEb5nebEAPx/0Wz6TbkARpWOnyI4WdcHh8in9bGHaLHKl8uHTj7qYYDv7MCFRk
         /q6g==
X-Gm-Message-State: AOAM533Psfm1U38fnWBzuMAWWEMNWg3YelbzN7yPll014ryL+ezkux+r
        dA0U/lxwLbycL6rQphyf6sN9aCt+v25Cxmr4y3YjdQ==
X-Google-Smtp-Source: ABdhPJxZm2/GaNIBlVhWXnnB0thxte8AwzYEv7aIlNKGaRcmHgT3jVH/s7XhMAN2Cnq4/4V7hsOTQwR2hfLp5T4xgRI=
X-Received: by 2002:a05:6122:d08:: with SMTP id az8mr63057762vkb.15.1637002524288;
 Mon, 15 Nov 2021 10:55:24 -0800 (PST)
MIME-Version: 1.0
References: <CGME20211112010603epcas2p339d1a6ef3df7cdbe61c87c8afa541fd0@epcas2p3.samsung.com>
 <20211112010137.149174-1-jaewon02.kim@samsung.com> <20211112010137.149174-3-jaewon02.kim@samsung.com>
In-Reply-To: <20211112010137.149174-3-jaewon02.kim@samsung.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Mon, 15 Nov 2021 20:55:12 +0200
Message-ID: <CAPLW+4==X+irRBKHiDfgJeAb0oDKkzbcWERFs7Y3=PSOg0+qAw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] i2c: exynos5: add support for ExynosAutov9 SoC
To:     Jaewon Kim <jaewon02.kim@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        chanho61.park@samsung.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 12 Nov 2021 at 03:06, Jaewon Kim <jaewon02.kim@samsung.com> wrote:
>
> Serial IPs(UART, I2C, SPI) are integrated into New IP-Core
> called USI(Universal Serial Interface).
>
> As it is integrated into USI, there are additinal HW changes.
> Registers to control USI and sysreg to set serial IPs have been added.
> Also, some timing registres have been changed.
>
> Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Tested-by: Sam Protsenko <semen.protsenko@linaro.org>

With this patch the Exynos850 HSI2C becomes functional. The only
nit-pick from my side (just a food for thought): do we want to
configure USI related config inside of particular drivers (SPI, I2C,
UART)? Or it would be better design to implement some platform driver
for that, so we can choose USI configuration (SPI/I2C/UART) in device
tree? I think this series is good to be merged as is, but we should
probably consider all upsides and downsides of each option, for the
future work.

Thanks!

>  drivers/i2c/busses/i2c-exynos5.c | 135 ++++++++++++++++++++++++++++---
>  1 file changed, 125 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
> index 97d4f3ac0abd..6ce94795a618 100644
> --- a/drivers/i2c/busses/i2c-exynos5.c
> +++ b/drivers/i2c/busses/i2c-exynos5.c
> @@ -22,6 +22,8 @@
>  #include <linux/of_device.h>
>  #include <linux/of_irq.h>
>  #include <linux/spinlock.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/regmap.h>
>
>  /*
>   * HSI2C controller from Samsung supports 2 modes of operation
> @@ -166,9 +168,21 @@
>
>  #define EXYNOS5_I2C_TIMEOUT (msecs_to_jiffies(100))
>
> +/* USI(Universal Serial Interface) Register map */
> +#define USI_CON                                        0xc4
> +#define USI_OPTION                             0xc8
> +
> +/* USI(Universal Serial Interface) Register bits */
> +#define USI_CON_RESET                          BIT(0)
> +
> +/* SYSREG Register bit */
> +#define SYSREG_USI_SW_CONF_MASK                        (0x7 << 0)
> +#define SYSREG_I2C_SW_CONF                     BIT(2)
> +
>  enum i2c_type_exynos {
>         I2C_TYPE_EXYNOS5,
>         I2C_TYPE_EXYNOS7,
> +       I2C_TYPE_EXYNOSAUTOV9,
>  };
>
>  struct exynos5_i2c {
> @@ -199,6 +213,10 @@ struct exynos5_i2c {
>
>         /* Version of HS-I2C Hardware */
>         const struct exynos_hsi2c_variant *variant;
> +
> +       /* USI sysreg info */
> +       struct regmap           *usi_sysreg;
> +       unsigned int            usi_offset;
>  };
>
>  /**
> @@ -213,21 +231,31 @@ struct exynos5_i2c {
>  struct exynos_hsi2c_variant {
>         unsigned int            fifo_depth;
>         enum i2c_type_exynos    hw;
> +       bool                    has_usi;
>  };
>
>  static const struct exynos_hsi2c_variant exynos5250_hsi2c_data = {
>         .fifo_depth     = 64,
>         .hw             = I2C_TYPE_EXYNOS5,
> +       .has_usi        = false,
>  };
>
>  static const struct exynos_hsi2c_variant exynos5260_hsi2c_data = {
>         .fifo_depth     = 16,
>         .hw             = I2C_TYPE_EXYNOS5,
> +       .has_usi        = false,
>  };
>
>  static const struct exynos_hsi2c_variant exynos7_hsi2c_data = {
>         .fifo_depth     = 16,
>         .hw             = I2C_TYPE_EXYNOS7,
> +       .has_usi        = false,
> +};
> +
> +static const struct exynos_hsi2c_variant exynosautov9_hsi2c_data = {
> +       .fifo_depth     = 64,
> +       .hw             = I2C_TYPE_EXYNOSAUTOV9,
> +       .has_usi        = true,
>  };
>
>  static const struct of_device_id exynos5_i2c_match[] = {
> @@ -243,6 +271,9 @@ static const struct of_device_id exynos5_i2c_match[] = {
>         }, {
>                 .compatible = "samsung,exynos7-hsi2c",
>                 .data = &exynos7_hsi2c_data
> +       }, {
> +               .compatible = "samsung,exynosautov9-hsi2c",
> +               .data = &exynosautov9_hsi2c_data
>         }, {},
>  };
>  MODULE_DEVICE_TABLE(of, exynos5_i2c_match);
> @@ -281,6 +312,32 @@ static int exynos5_i2c_set_timing(struct exynos5_i2c *i2c, bool hs_timings)
>                 i2c->op_clock;
>         int div, clk_cycle, temp;
>
> +       /*
> +        * In case of HSI2C controllers in EXYNOSAUTOV9
> +        * timing control formula changed.
> +        *
> +        * FSCL = IPCLK / ((CLK_DIV + 1) * 16)
> +        * T_SCL_LOW = IPCLK * (CLK_DIV + 1) * (N + M)
> +        *  [N : number of 0's in the TSCL_H_HS]
> +        *  [M : number of 0's in the TSCL_L_HS]
> +        * T_SCL_HIGH = IPCLK * (CLK_DIV + 1) * (N + M)
> +        *  [N : number of 1's in the TSCL_H_HS]
> +        *  [M : number of 1's in the TSCL_L_HS]
> +        *
> +        *  result of (N + M) is always 8.
> +        *  In general use case, we don't need to control timing_s1, timing_s2.
> +        */
> +       if (i2c->variant->hw == I2C_TYPE_EXYNOSAUTOV9) {
> +               div = ((clkin / (16 * i2c->op_clock)) - 1);
> +               i2c_timing_s3 = div << 16;
> +               if (hs_timings)
> +                       writel(i2c_timing_s3, i2c->regs + HSI2C_TIMING_HS3);
> +               else
> +                       writel(i2c_timing_s3, i2c->regs + HSI2C_TIMING_FS3);
> +
> +               return 0;
> +       }
> +
>         /*
>          * In case of HSI2C controller in Exynos5 series
>          * FPCLK / FI2C =
> @@ -355,6 +412,20 @@ static int exynos5_hsi2c_clock_setup(struct exynos5_i2c *i2c)
>         return exynos5_i2c_set_timing(i2c, true);
>  }
>
> +static void exynos_usi_reset(struct exynos5_i2c *i2c)
> +{
> +       u32 val;
> +
> +       val = readl(i2c->regs + USI_CON);
> +       val |= USI_CON_RESET;
> +       writel(val, i2c->regs + USI_CON);
> +       udelay(1);
> +
> +       val = readl(i2c->regs + USI_CON);
> +       val &= ~USI_CON_RESET;
> +       writel(val, i2c->regs + USI_CON);
> +}
> +
>  /*
>   * exynos5_i2c_init: configures the controller for I2C functionality
>   * Programs I2C controller for Master mode operation
> @@ -385,6 +456,9 @@ static void exynos5_i2c_reset(struct exynos5_i2c *i2c)
>  {
>         u32 i2c_ctl;
>
> +       if (i2c->variant->hw == I2C_TYPE_EXYNOSAUTOV9)
> +               exynos_usi_reset(i2c);
> +
>         /* Set and clear the bit for reset */
>         i2c_ctl = readl(i2c->regs + HSI2C_CTL);
>         i2c_ctl |= HSI2C_SW_RST;
> @@ -422,7 +496,8 @@ static irqreturn_t exynos5_i2c_irq(int irqno, void *dev_id)
>         writel(int_status, i2c->regs + HSI2C_INT_STATUS);
>
>         /* handle interrupt related to the transfer status */
> -       if (i2c->variant->hw == I2C_TYPE_EXYNOS7) {
> +       if (i2c->variant->hw == I2C_TYPE_EXYNOS7 ||
> +                       i2c->variant->hw == I2C_TYPE_EXYNOSAUTOV9) {
>                 if (int_status & HSI2C_INT_TRANS_DONE) {
>                         i2c->trans_done = 1;
>                         i2c->state = 0;
> @@ -569,13 +644,13 @@ static void exynos5_i2c_bus_check(struct exynos5_i2c *i2c)
>  {
>         unsigned long timeout;
>
> -       if (i2c->variant->hw != I2C_TYPE_EXYNOS7)
> +       if (i2c->variant->hw == I2C_TYPE_EXYNOS5)
>                 return;
>
>         /*
> -        * HSI2C_MASTER_ST_LOSE state in EXYNOS7 variant before transaction
> -        * indicates that bus is stuck (SDA is low). In such case bus recovery
> -        * can be performed.
> +        * HSI2C_MASTER_ST_LOSE state in EXYNOS7 or EXYNOSAUTOV9 variant before
> +        * transaction indicates that bus is stuck (SDA is low).
> +        * In such case bus recovery can be performed.
>          */
>         timeout = jiffies + msecs_to_jiffies(100);
>         for (;;) {
> @@ -611,10 +686,10 @@ static void exynos5_i2c_message_start(struct exynos5_i2c *i2c, int stop)
>         unsigned long flags;
>         unsigned short trig_lvl;
>
> -       if (i2c->variant->hw == I2C_TYPE_EXYNOS7)
> -               int_en |= HSI2C_INT_I2C_TRANS;
> -       else
> +       if (i2c->variant->hw == I2C_TYPE_EXYNOS5)
>                 int_en |= HSI2C_INT_I2C;
> +       else
> +               int_en |= HSI2C_INT_I2C_TRANS;
>
>         i2c_ctl = readl(i2c->regs + HSI2C_CTL);
>         i2c_ctl &= ~(HSI2C_TXCHON | HSI2C_RXCHON);
> @@ -738,6 +813,42 @@ static const struct i2c_algorithm exynos5_i2c_algorithm = {
>         .functionality          = exynos5_i2c_func,
>  };
>
> +static int exynos_usi_init(struct exynos5_i2c *i2c)
> +{
> +       struct device *dev = i2c->dev;
> +       int ret;
> +
> +       if (!i2c->variant->has_usi)
> +               return 0;
> +
> +       /*
> +        * System Register has a field that can select the serial IP
> +        * provided by USI. We need to set it to I2C to use I2C.
> +        */
> +       i2c->usi_sysreg = syscon_regmap_lookup_by_phandle(dev->of_node,
> +                                                         "samsung,sysreg");
> +       if (IS_ERR(i2c->usi_sysreg)) {
> +               dev_err(dev, "Cannot find sysreg\n");
> +               return PTR_ERR(i2c->usi_sysreg);
> +       }
> +
> +       ret = of_property_read_u32_index(dev->of_node, "samsung,sysreg",
> +                                        1, &i2c->usi_offset);
> +       if (ret) {
> +               dev_err(dev, "sysreg offset is not specified\n");
> +               return ret;
> +       }
> +
> +       ret = regmap_update_bits(i2c->usi_sysreg, i2c->usi_offset,
> +                       SYSREG_USI_SW_CONF_MASK, SYSREG_I2C_SW_CONF);
> +       if (ret < 0)
> +               return ret;
> +
> +       exynos_usi_reset(i2c);
> +
> +       return 0;
> +}
> +
>  static int exynos5_i2c_probe(struct platform_device *pdev)
>  {
>         struct device_node *np = pdev->dev.of_node;
> @@ -777,6 +888,12 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
>         i2c->adap.algo_data = i2c;
>         i2c->adap.dev.parent = &pdev->dev;
>
> +       i2c->variant = of_device_get_match_data(&pdev->dev);
> +
> +       ret = exynos_usi_init(i2c);
> +       if (ret)
> +               return ret;
> +
>         /* Clear pending interrupts from u-boot or misc causes */
>         exynos5_i2c_clr_pend_irq(i2c);
>
> @@ -794,8 +911,6 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
>                 goto err_clk;
>         }
>
> -       i2c->variant = of_device_get_match_data(&pdev->dev);
> -
>         ret = exynos5_hsi2c_clock_setup(i2c);
>         if (ret)
>                 goto err_clk;
> --
> 2.33.1
>
