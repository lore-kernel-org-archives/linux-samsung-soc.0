From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V3 7/7] ARM: dts: Add FIMD output property for arndale
Date: Fri, 27 Jun 2014 16:48:56 +0530
Message-ID: <CAEC9eQOs_TLebA6_9EkFJPY_jUYb+5oJ5RwQVu0j0jrm+xis7Q@mail.gmail.com>
References: <1403863946-15492-1-git-send-email-ajaykumar.rs@samsung.com>
	<1403863946-15492-8-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f175.google.com ([209.85.220.175]:60953 "EHLO
	mail-vc0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750756AbaF0LS5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Jun 2014 07:18:57 -0400
In-Reply-To: <1403863946-15492-8-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, InKi Dae <inki.dae@samsung.com>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>

+DT mailing list

On Fri, Jun 27, 2014 at 3:42 PM, Ajay Kumar <ajaykumar.rs@samsung.com> wrote:
> Set FIMD output type for arndale as DP.
>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250-arndale.dts |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
> index d0de1f5..e803183 100644
> --- a/arch/arm/boot/dts/exynos5250-arndale.dts
> +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
> @@ -540,6 +540,7 @@
>
>         fimd: fimd@14400000 {
>                 status = "okay";
> +               samsung,output-type = <2>;
>                 display-timings {
>                         native-mode = <&timing0>;
>                         timing0: timing@0 {
> --
> 1.7.9.5
>
