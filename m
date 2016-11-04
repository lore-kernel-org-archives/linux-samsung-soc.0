From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [2/4] ARM: dts: exynos: Add SCU device node to exynos4.dtsi
Date: Fri, 04 Nov 2016 18:43:20 +0530
Message-ID: <581C8970.8030606@samsung.com>
References: <1478230764-13748-3-git-send-email-pankaj.dubey@samsung.com>
 <CGME20161104131500epcas2p485d63e00d312c4196da62046d1ce7675@epcas2p4.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:45450 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933226AbcKDNPD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Nov 2016 09:15:03 -0400
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OG402JLQCT18W10@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 04 Nov 2016 22:15:01 +0900 (KST)
In-reply-to: <1478230764-13748-3-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: krzk@kernel.org, kgene@kernel.org, thomas.ab@samsung.com

Hi Pankaj,

On 11/04/2016 09:09 AM, Pankaj Dubey wrote:
> Exynos4 like other Cortex-A9 SoC's has a Snoop Control Unit(SCU)
> and its SFR are used during SMP boot and S2R. Add SCU node to the device tree.
>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

>   arch/arm/boot/dts/exynos4.dtsi | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
> index 5f034eb..6865ca9 100644
> --- a/arch/arm/boot/dts/exynos4.dtsi
> +++ b/arch/arm/boot/dts/exynos4.dtsi
> @@ -78,6 +78,11 @@
>   		reg = <0x10000000 0x100>;
>   	};
>
> +	scu: snoop-control-unit@10500000 {
> +		compatible = "arm,cortex-a9-scu";
> +		reg = <0x10500000 0x2000>;
> +	};
> +
>   	memory-controller@12570000 {
>   		compatible = "samsung,exynos4210-srom";
>   		reg = <0x12570000 0x14>;
>
