From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: Re: [PATCH 3/5] ARM: dts: enable dp-controller for exynos5250 based
 snow board
Date: Wed, 7 May 2014 19:06:45 +0530
Message-ID: <CAPdUM4PLdY+qQF3zs2CYF9SP8E2W4sDESD6jYD9uF+WwhVX3pg@mail.gmail.com>
References: <1397994525-18537-1-git-send-email-rahul.sharma@samsung.com>
	<1397994525-18537-4-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:40009 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933452AbaEGNgr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 May 2014 09:36:47 -0400
In-Reply-To: <1397994525-18537-4-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, Rahul Sharma <r.sh.open@gmail.com>, Rahul Sharma <rahul.sharma@samsung.com>, Jingoo Han <jg1.han@samsung.com>

Hi Kukjin,

The only dependency for this patch is new property "samsung,hpd-gpio" which
is acked by Jingoo Han, Maintainer, exynos DP at
http://oascentral.opensubscriber.com/message/dri-devel@lists.freedesktop.org/17150750.html.

All remaining properties are as per existing DT bindings.

@Jingoo, I want to request you to review the dp-controller nodes for
exynos5420 and 5250.

Please consider it for merge.

Regards,
Rahul Sharma.

On 20 April 2014 17:18, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> From: Rahul Sharma <Rahul.Sharma@samsung.com>
>
> Ennable dp-controller for snow board.
>
> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250-snow.dts |   27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
> index 09f363d..60cc2a8 100644
> --- a/arch/arm/boot/dts/exynos5250-snow.dts
> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
> @@ -344,6 +344,33 @@
>                 };
>         };
>
> +       dp-controller@145B0000 {
> +               status = "okay";
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&dp_hpd>;
> +               samsung,color-space = <0>;
> +               samsung,dynamic-range = <0>;
> +               samsung,ycbcr-coeff = <0>;
> +               samsung,color-depth = <1>;
> +               samsung,link-rate = <0x0a>;
> +               samsung,lane-count = <2>;
> +               samsung,hpd-gpio = <&gpx0 7 0>;
> +               display-timings {
> +                       native-mode = <&timing1>;
> +                       timing1: timing@1 {
> +                               clock-frequency = <70589280>;
> +                               hactive = <1366>;
> +                               vactive = <768>;
> +                               hfront-porch = <40>;
> +                               hback-porch = <40>;
> +                               hsync-len = <32>;
> +                               vback-porch = <10>;
> +                               vfront-porch = <12>;
> +                               vsync-len = <6>;
> +                       };
> +               };
> +       };
> +
>         fimd@14400000 {
>                 status = "okay";
>                 samsung,invert-vclk;
> --
> 1.7.9.5
>
