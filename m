From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2] ARM: dts: Add peach-pit board support
Date: Thu, 24 Apr 2014 11:57:22 -0700
Message-ID: <CAD=FV=X8ZPrz=wHOzPXYXvO+FNWfDEJvENnDPoNTfw8uniEDXg@mail.gmail.com>
References: <1398313031-14848-1-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f180.google.com ([209.85.128.180]:51776 "EHLO
	mail-ve0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757915AbaDXS5X (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Apr 2014 14:57:23 -0400
Received: by mail-ve0-f180.google.com with SMTP id jz11so3339474veb.25
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Apr 2014 11:57:22 -0700 (PDT)
In-Reply-To: <1398313031-14848-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olofj@google.com>, Sachin Kamat <sachin.kamat@linaro.org>, Tushar Behera <tushar.behera@linaro.org>, Arun Kumar <arunkk.samsung@gmail.com>

Arun,

On Wed, Apr 23, 2014 at 9:17 PM, Arun Kumar K <arun.kk@samsung.com> wrote:
> Adds the google peach-pit board dts file which uses
> exynos5420 SoC.
>
> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> ---
> Changes from v1
> ---------------
> - Addressed review comments from Doug, Sachin & Tushar
> - Removed adc and lid-switch nodes
> ---
>  arch/arm/boot/dts/Makefile                 |    1 +
>  arch/arm/boot/dts/exynos5420-peach-pit.dts |  182 ++++++++++++++++++++++++++++
>  2 files changed, 183 insertions(+)
> +       spi@12d30000 {
> +               status = "okay";
> +               samsung,spi-src-clk = <0>;
> +               num-cs = <1>;
> +
> +               spidev@0 {
> +                       compatible = "spidev";
> +                       reg = <0>;
> +                       spi-max-frequency = <50000000>;
> +                       pinctrl-names = "default";
> +                       pinctrl-0 = <&spi_flash_cs>;
> +
> +                       controller-data {
> +                               cs-gpio = <&gpa2 5 0>;

Technically this could be

cs-gpio = <&gpa2 5 GPIO_ACTIVE_HIGH>;

...but I don't think that's a huge deal...

Reviewed-by: Doug Anderson <dianders@chromium.org>
