From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 5/7] regulator: arizona-ldo1: Move pdata into a separate structure
Date: Tue, 18 Apr 2017 16:52:42 +0200
Message-ID: <CAJKOXPd81C9FOtXVcpwAd=-rWNS0jQK+Qt8NqokmppP8HUKLCQ@mail.gmail.com>
References: <1492512234-19210-1-git-send-email-rf@opensource.wolfsonmicro.com> <1492512234-19210-7-git-send-email-rf@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:57570 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751363AbdDROwq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Apr 2017 10:52:46 -0400
In-Reply-To: <1492512234-19210-7-git-send-email-rf@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
Cc: broonie@kernel.org, lee.jones@linaro.org, kgene@kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Tue, Apr 18, 2017 at 12:43 PM, Richard Fitzgerald
<rf@opensource.wolfsonmicro.com> wrote:
> In preparation for sharing this driver with Madera, move the pdata
> for the LDO1 regulator out of struct arizona_pdata into a dedicated
> pdata struct for this driver. As a result the code in
> arizona_ldo1_of_get_pdata() can be made independent of struct arizona.
>
> This patch also updates the definition of struct arizona_pdata and
> the use of this pdata in mach-crag6410-module.c
>
> Signed-off-by: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
> ---
>  arch/arm/mach-s3c64xx/mach-crag6410-module.c |  8 ++++--
>  drivers/regulator/arizona-ldo1.c             | 39 +++++++++++++++-------------
>  include/linux/mfd/arizona/pdata.h            |  4 +--
>  include/linux/regulator/arizona-ldo1.h       | 24 +++++++++++++++++
>  4 files changed, 53 insertions(+), 22 deletions(-)
>  create mode 100644 include/linux/regulator/arizona-ldo1.h
>
> diff --git a/arch/arm/mach-s3c64xx/mach-crag6410-module.c b/arch/arm/mach-s3c64xx/mach-crag6410-module.c
> index ccc3ab8..ea5f216 100644
> --- a/arch/arm/mach-s3c64xx/mach-crag6410-module.c
> +++ b/arch/arm/mach-s3c64xx/mach-crag6410-module.c
> @@ -209,7 +209,9 @@
>  };
>
>  static struct arizona_pdata wm5102_reva_pdata = {
> -       .ldoena = S3C64XX_GPN(7),
> +       .ldo1 = {
> +               .ldoena = S3C64XX_GPN(7),
> +       },
>         .gpio_base = CODEC_GPIO_BASE,
>         .irq_flags = IRQF_TRIGGER_HIGH,
>         .micd_pol_gpio = CODEC_GPIO_BASE + 4,
> @@ -239,7 +241,9 @@
>  };
>
>  static struct arizona_pdata wm5102_pdata = {
> -       .ldoena = S3C64XX_GPN(7),
> +       .ldo1 = {
> +               .ldoena = S3C64XX_GPN(7),
> +       },
>         .gpio_base = CODEC_GPIO_BASE,
>         .irq_flags = IRQF_TRIGGER_HIGH,
>         .micd_pol_gpio = CODEC_GPIO_BASE + 2,

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
