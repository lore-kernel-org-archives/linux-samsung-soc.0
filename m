From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH] ARM: dts: Add USB host node for Exynos4
Date: Wed, 24 Jul 2013 09:08:41 +0530
Message-ID: <CAK9yfHz10ao32Y4VRsvjNLe+zaq+hYk4KVgtwFgSLDsN-9Pfpw@mail.gmail.com>
References: <1374600763-19466-1-git-send-email-tobetter@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:65159 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751579Ab3GXDim (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Jul 2013 23:38:42 -0400
Received: by mail-ob0-f180.google.com with SMTP id eh20so11754029obb.25
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jul 2013 20:38:41 -0700 (PDT)
In-Reply-To: <1374600763-19466-1-git-send-email-tobetter@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Dongjin Kim <tobetter@gmail.com>
Cc: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On 23 July 2013 23:02, Dongjin Kim <tobetter@gmail.com> wrote:
> This patch adds EHCI and OHCI host device nodes for Exynos4.
>
> Signed-off-by: Dongjin Kim <tobetter@gmail.com>
> ---
>  arch/arm/boot/dts/exynos4.dtsi |   20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
> index 3f94fe8..1cdbf89 100644
> --- a/arch/arm/boot/dts/exynos4.dtsi
> +++ b/arch/arm/boot/dts/exynos4.dtsi
> @@ -155,6 +155,26 @@
>                 status = "disabled";
>         };
>
> +       ehci@12580000 {
> +               compatible = "samsung,exynos4210-ehci";
> +               reg = <0x12580000 0x100>;
> +               interrupts = <0 70 0>;
> +               status = "disabled";
> +
> +               clocks = <&clock 304>;
> +               clock-names = "usbhost";
> +       };
> +
> +       ohci@12590000 {
> +               compatible = "samsung,exynos4210-ohci";
> +               reg = <0x12580000 0x100>;

Register value and node name do not match. Typo?


> +               interrupts = <0 70 0>;
> +               status = "disabled";
> +
> +               clocks = <&clock 304>;
> +               clock-names = "usbhost";
> +       };
> +
>         mfc: codec@13400000 {
>                 compatible = "samsung,mfc-v5";
>                 reg = <0x13400000 0x10000>;
> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
With warm regards,
Sachin
