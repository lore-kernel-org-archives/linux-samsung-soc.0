From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 3/5] ARM: dts: Add clock entries to G2D node for exynos4210
Date: Thu, 18 Apr 2013 13:38:05 +0200
Message-ID: <516FDB1D.3050302@samsung.com>
References: <1366283719-9615-1-git-send-email-sachin.kamat@linaro.org>
 <1366283719-9615-3-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:8829 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966504Ab3DRLiI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Apr 2013 07:38:08 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MLG00BEG8A1DNC0@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 18 Apr 2013 12:38:06 +0100 (BST)
In-reply-to: <1366283719-9615-3-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org

Hi Sachin,

On 04/18/2013 01:15 PM, Sachin Kamat wrote:
> Added clock entries to G2D node.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/boot/dts/exynos4210.dtsi |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
> index 66e6b03..50ab9d4 100644
> --- a/arch/arm/boot/dts/exynos4210.dtsi
> +++ b/arch/arm/boot/dts/exynos4210.dtsi
> @@ -117,6 +117,8 @@
>  		compatible = "samsung,s5pv210-g2d";
>  		reg = <0x12800000 0x1000>;
>  		interrupts = <0 89 0>;
> +		clocks = <&clock 177>, <&clock 277>;
> +		clock-names = "sclk_fimg2d", "fimg2d";

Same clocks are used for exynos4210 and exynos4212/4412. Wouldn't
it work if you have added those properties to exynos4.dtsi, instead
of having same entries in exynos4210.dtsi and exynos4x12.dtsi  ?

Thanks,
Sylwester
