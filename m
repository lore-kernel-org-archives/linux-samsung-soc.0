From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] ARM: dts: Fix PL330 MDMA clock assignment for Exynos4x12
Date: Fri, 11 Apr 2014 18:00:53 +0200
Message-ID: <534811B5.10906@samsung.com>
References: <1397226211-29775-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:59261 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933700AbaDKQA4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Apr 2014 12:00:56 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N3V00GIVJ59FSA0@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 11 Apr 2014 17:00:45 +0100 (BST)
In-reply-to: <1397226211-29775-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, kgene.kim@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi Sylwester,

On 11.04.2014 16:23, Sylwester Nawrocki wrote:
> Exynos4212/4412 has different clock for the PL330 MDMA, ensure
> the clock is properly assigned for these newer SoCs.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>   arch/arm/boot/dts/exynos4x12.dtsi |    6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
> index c4a9306..19589c6 100644
> --- a/arch/arm/boot/dts/exynos4x12.dtsi
> +++ b/arch/arm/boot/dts/exynos4x12.dtsi
> @@ -243,4 +243,10 @@
>   		clock-names = "biu", "ciu";
>   		status = "disabled";
>   	};
> +
> +	amba {
> +		mdma@12850000 {
> +			clocks = <&clock CLK_MDMA2>;
> +		};
> +	};
>   };
>

Since the ID for CLK_MDMA2 was added mistakenly, instead of reusing 
CLK_MDMA and it was not used by any device tree files anyway, I believe 
the better fix would be to simply change the clock definition in Exynos 
4 clock driver to use CLK_MDMA for both SoC families.

Best regards,
Tomasz
