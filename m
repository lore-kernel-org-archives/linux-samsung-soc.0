From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH 1/4] ARM: dts: Add SROMc to Exynos 5410
Date: Tue, 27 Oct 2015 08:27:05 +0530
Message-ID: <562EE801.4000906@samsung.com>
References: <cover.1445859834.git.p.fedin@samsung.com>
 <185cfa03e31cee4187492e0b9b0050e4b6f1a8f9.1445859834.git.p.fedin@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:50236 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753674AbbJ0C4m (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Oct 2015 22:56:42 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NWU02X8ZYUF6Q80@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Oct 2015 11:56:39 +0900 (KST)
In-reply-to: <185cfa03e31cee4187492e0b9b0050e4b6f1a8f9.1445859834.git.p.fedin@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pavel Fedin <p.fedin@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Russell King <linux@arm.linux.org.uk>

Hi Pavel,

On Monday 26 October 2015 05:17 PM, Pavel Fedin wrote:
> This machine uses own SoC device tree file, add missing part.
>
> Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
> ---
>   arch/arm/boot/dts/exynos5410.dtsi | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5410.dtsi b/arch/arm/boot/dts/exynos5410.dtsi
> index 4603356..91dd302 100644
> --- a/arch/arm/boot/dts/exynos5410.dtsi
> +++ b/arch/arm/boot/dts/exynos5410.dtsi
> @@ -101,6 +101,11 @@
>   			reg = <0x10000000 0x100>;
>   		};
>
> +		sromc_0: sromc@12250000 {

Why sromc_0? Does this SoC have more than one srom controllers?

> +			compatible = "samsung,exynos-srom";
> +			reg = <0x12250000 0x10>;
> +		};
> +
>   		pmu_system_controller: system-controller@10040000 {
>   			compatible = "samsung,exynos5410-pmu", "syscon";
>   			reg = <0x10040000 0x5000>;
>

Thanks,
Pankaj Dubey
