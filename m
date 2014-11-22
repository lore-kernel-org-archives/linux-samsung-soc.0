From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH] ARM: dts: exynos4: add missing clock to MFC device
Date: Sat, 22 Nov 2014 23:42:18 +0900
Message-ID: <5470A0CA.8090705@kernel.org>
References: <1416397436-13503-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.19.201]:58381 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750716AbaKVOmW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 22 Nov 2014 09:42:22 -0500
In-Reply-To: <1416397436-13503-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kamil Debski <k.debski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

On 11/19/14 20:43, Marek Szyprowski wrote:
> sclk_mfc is required for MFC device since commit
> 0c2272170d78f826f6e97f99fb8a67fc17feef07 ("media: s5p-mfc: rename
> special clock to sclk_mfc"), so add it to exynos4 dts.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
> index 0b5e46cd449f..c790a746b9c8 100644
> --- a/arch/arm/boot/dts/exynos4.dtsi
> +++ b/arch/arm/boot/dts/exynos4.dtsi
> @@ -398,8 +398,8 @@
>  		reg = <0x13400000 0x10000>;
>  		interrupts = <0 94 0>;
>  		samsung,power-domain = <&pd_mfc>;
> -		clocks = <&clock CLK_MFC>;
> -		clock-names = "mfc";
> +		clocks = <&clock CLK_MFC>, <&clock CLK_SCLK_MFC>;
> +		clock-names = "mfc", "sclk_mfc";
>  		status = "disabled";
>  		iommus = <&sysmmu_mfc_l>, <&sysmmu_mfc_r>;
>  		iommu-names = "left", "right";

Applied, thanks.

- Kukjin
