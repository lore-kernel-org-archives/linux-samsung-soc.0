From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH RESEND] ARM: dts: Add USBPHY nodes to Exynos4x12
Date: Tue, 6 Aug 2013 11:39:57 +0530
Message-ID: <CAK9yfHwxVtJFZMQNoh-RepaF53L_TruPBSUt3YH_XY+8iXjffA@mail.gmail.com>
References: <1375726723-20862-1-git-send-email-tobetter@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f41.google.com ([209.85.219.41]:53126 "EHLO
	mail-oa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754607Ab3HFGJ6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Aug 2013 02:09:58 -0400
Received: by mail-oa0-f41.google.com with SMTP id j6so8440283oag.28
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Aug 2013 23:09:57 -0700 (PDT)
In-Reply-To: <1375726723-20862-1-git-send-email-tobetter@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Dongjin Kim <tobetter@gmail.com>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene.kim@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Dongjin,

On 5 August 2013 23:48, Dongjin Kim <tobetter@gmail.com> wrote:
> This patch adds device nodes for USBPHY to Exynos4x12.
>
> CC: Sachin Kamat <sachin.kamat@linaro.org>
> Signed-off-by: Dongjin Kim <tobetter@gmail.com>
> ---
>  arch/arm/boot/dts/exynos4x12.dtsi |   18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
> index 01da194..9c3335b 100644
> --- a/arch/arm/boot/dts/exynos4x12.dtsi
> +++ b/arch/arm/boot/dts/exynos4x12.dtsi
> @@ -73,4 +73,22 @@
>                 clock-names = "sclk_fimg2d", "fimg2d";
>                 status = "disabled";
>         };
> +
> +       usbphy@125B00000 {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               compatible = "samsung,exynos4x12-usb2phy";
> +               reg = <0x125B0000 0x100>;
> +               ranges;
> +
> +               clocks = <&clock 2>, <&clock 305>;
> +               clock-names = "xusbxti", "otg";
> +               status = "disabled";

I don't think this node has any other board specific dependencies. In
that case you don't need to disable this.

> +
> +               usbphy-sys {
> +                       /* USB device and host PHY_CONTROL registers */
> +                       reg = <0x10020704 0xc>,
> +                             <0x1001021c 0x4>;
> +               };
> +       };
>  };
> --
> 1.7.9.5
>



-- 
With warm regards,
Sachin
