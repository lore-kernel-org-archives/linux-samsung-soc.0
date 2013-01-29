From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 3/6] ARM: dts: Add MFC codec support to SMDKV310 DT
Date: Tue, 29 Jan 2013 14:40:55 +0100
Message-ID: <5107D167.4050209@samsung.com>
References: <1359432822-23846-1-git-send-email-sachin.kamat@linaro.org>
 <1359432822-23846-4-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:17142 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752200Ab3A2NlC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jan 2013 08:41:02 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHE00GY53BEDT40@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 29 Jan 2013 13:40:59 +0000 (GMT)
Received: from [106.116.147.32] by eusync4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MHE0042I3CA6E20@eusync4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 29 Jan 2013 13:40:59 +0000 (GMT)
In-reply-to: <1359432822-23846-4-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, patches@linaro.org

On 01/29/2013 05:13 AM, Sachin Kamat wrote:
> Added MFC codec support to SMDKV310 DT file.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/boot/dts/exynos4210-smdkv310.dts |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4210-smdkv310.dts b/arch/arm/boot/dts/exynos4210-smdkv310.dts
> index f634907..8481f8f 100644
> --- a/arch/arm/boot/dts/exynos4210-smdkv310.dts
> +++ b/arch/arm/boot/dts/exynos4210-smdkv310.dts
> @@ -189,4 +189,9 @@
>  			};
>  		};
>  	};
> +
> +	codec@13400000 {
> +		samsung,mfc-r = <0x43000000 0x800000>;
> +		samsung,mfc-l = <0x51000000 0x800000>;

With the change as I proposed in patch 2/6 you need to add:

		status = "okay";

in this node and for all other boards in the further patches
in this series.

--

Thanks,
Sylwester
