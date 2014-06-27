From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V3 3/7] ARM: dts: Add FIMD output property for peach_pit
Date: Fri, 27 Jun 2014 16:47:13 +0530
Message-ID: <CAEC9eQPecs1We7d7UZQegeQJwW-q1rbChY4iCTnJOrVq_NbOhw@mail.gmail.com>
References: <1403863946-15492-1-git-send-email-ajaykumar.rs@samsung.com>
	<1403863946-15492-4-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f174.google.com ([209.85.128.174]:59712 "EHLO
	mail-ve0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752779AbaF0LRO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Jun 2014 07:17:14 -0400
In-Reply-To: <1403863946-15492-4-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ajay Kumar <ajaykumar.rs@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, InKi Dae <inki.dae@samsung.com>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>

+DT mailing list

On Fri, Jun 27, 2014 at 3:42 PM, Ajay Kumar <ajaykumar.rs@samsung.com> wrote:
> Set FIMD output type for peach_pit as DP.
>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420-peach-pit.dts |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
> index 1c5b8f9..164f523 100644
> --- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
> +++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
> @@ -255,6 +255,7 @@
>  &fimd {
>         status = "okay";
>         samsung,invert-vclk;
> +       samsung,output-type = <2>;
>  };
>
>  &dp {
> --
> 1.7.9.5
>
