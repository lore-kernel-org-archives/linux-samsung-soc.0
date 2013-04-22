From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 1/4] ARM: dts: Add TMU clock entries to exynos4210.dtsi
Date: Tue, 23 Apr 2013 01:55:40 +0900
Message-ID: <51756B8C.5080705@samsung.com>
References: <1366605175-19161-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:62975 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753863Ab3DVQzp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Apr 2013 12:55:45 -0400
Received: by mail-pa0-f48.google.com with SMTP id lj1so3733916pab.7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Apr 2013 09:55:45 -0700 (PDT)
In-Reply-To: <1366605175-19161-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org

On 04/22/13 13:32, Sachin Kamat wrote:
> Adds TMU clock entries to exynos4210.dtsi file.
>
> Signed-off-by: Sachin Kamat<sachin.kamat@linaro.org>
> ---
>   arch/arm/boot/dts/exynos4210.dtsi |    3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
> index 50ab9d4..53654c4 100644
> --- a/arch/arm/boot/dts/exynos4210.dtsi
> +++ b/arch/arm/boot/dts/exynos4210.dtsi
> @@ -111,6 +111,9 @@
>   		interrupt-parent =<&combiner>;
>   		reg =<0x100C0000 0x100>;
>   		interrupts =<2 4>;
> +		clocks =<&clock 383>;
> +		clock-names = "tmu_apbif";
> +		status = "disabled";
>   	};
>
>   	g2d@12800000 {

Applied 1st and 2nd patches.

Thanks.

- Kukjin
