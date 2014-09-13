From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v4] ARM: dts: exynos3250: add MFC codec device node
Date: Sun, 14 Sep 2014 02:08:03 +0900
Message-ID: <541479F3.2030907@samsung.com>
References: <1410268169-18424-1-git-send-email-j.anaszewski@samsung.com> <1410268169-18424-2-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:52657 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751748AbaIMRIK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 13 Sep 2014 13:08:10 -0400
Received: by mail-pa0-f53.google.com with SMTP id rd3so3596636pab.40
        for <linux-samsung-soc@vger.kernel.org>; Sat, 13 Sep 2014 10:08:09 -0700 (PDT)
In-Reply-To: <1410268169-18424-2-git-send-email-j.anaszewski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

On 09/09/14 22:09, Jacek Anaszewski wrote:
> Signed-off-by: Jacek Anaszewski<j.anaszewski@samsung.com>
> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
> Cc: Kukjin Kim<kgene.kim@samsung.com>
> ---
>   arch/arm/boot/dts/exynos3250.dtsi |   12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
> index bbc1e4c..95cc5a1 100644
> --- a/arch/arm/boot/dts/exynos3250.dtsi
> +++ b/arch/arm/boot/dts/exynos3250.dtsi
> @@ -294,6 +294,18 @@
>   			status = "disabled";
>   		};
>
> +		mfc-codec@13400000 {

mfc: codec@13400000 {

> +			compatible = "samsung,mfc-v7";
> +			reg =<0x13400000 0x10000>;
> +			interrupts =<0 102 0>;
> +			clock-names = "mfc", "sclk_mfc";
> +			clocks =<&cmu CLK_MFC>,<&cmu CLK_SCLK_MFC>;
> +			#address-cells =<1>;
> +			#size-cells =<0>;

are the address-cells and size-cells required here?

> +			samsung,power-domain =<&pd_mfc>;
> +			status = "disabled";
> +		};
> +
>   		serial_0: serial@13800000 {
>   			compatible = "samsung,exynos4210-uart";
>   			reg =<0x13800000 0x100>;

- Kukjin
