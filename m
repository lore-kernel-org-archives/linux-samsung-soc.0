From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 3/3] ARM: dts: Fix MDMA0 clock number
Date: Wed, 18 Dec 2013 15:49:10 +0100
Message-ID: <2082327.zpbOvCVe5P@amdc1227>
References: <1386817322-11265-1-git-send-email-a.kesavan@samsung.com>
 <1386817322-11265-3-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:11946 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754933Ab3LROt2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Dec 2013 09:49:28 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MY000JINBUD8O00@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 18 Dec 2013 14:49:25 +0000 (GMT)
In-reply-to: <1386817322-11265-3-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: Abhilash Kesavan <a.kesavan@samsung.com>, dianders@chromium.org, tomasz.figa@gmail.com, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Kukjin,

On Thursday 12 of December 2013 08:32:02 Abhilash Kesavan wrote:
> Fix wrong clock number in mdma0 node.
> 
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index 9db5047..177becd 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -559,7 +559,7 @@
>  			compatible = "arm,pl330", "arm,primecell";
>  			reg = <0x10800000 0x1000>;
>  			interrupts = <0 33 0>;
> -			clocks = <&clock 271>;
> +			clocks = <&clock 346>;
>  			clock-names = "apb_pclk";
>  			#dma-cells = <1>;
>  			#dma-channels = <8>;
> 

Can we have your ack for this patch?

I'd like to apply the whole series into samsung-clk fixes branch and
send a pull request to Mike to get it and one more fix into his tree.

Best regards,
Tomasz
