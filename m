From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v5] ARM: dts: exynos3250 add MFC codec device node
Date: Wed, 24 Sep 2014 01:33:49 +0900
Message-ID: <5421A0ED.60704@samsung.com>
References: <1410781486-13983-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f181.google.com ([209.85.192.181]:56113 "EHLO
	mail-pd0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751883AbaIWQd5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Sep 2014 12:33:57 -0400
Received: by mail-pd0-f181.google.com with SMTP id r10so6813346pdi.40
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Sep 2014 09:33:56 -0700 (PDT)
In-Reply-To: <1410781486-13983-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

On 09/15/14 20:44, Jacek Anaszewski wrote:
> Signed-off-by: Jacek Anaszewski<j.anaszewski@samsung.com>
> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
> Cc: Kukjin Kim<kgene.kim@samsung.com>
> ---
>   arch/arm/boot/dts/exynos3250.dtsi |   10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
> index 351871a..68c9e7c 100644
> --- a/arch/arm/boot/dts/exynos3250.dtsi
> +++ b/arch/arm/boot/dts/exynos3250.dtsi
> @@ -283,6 +283,16 @@
>   			status = "disabled";
>   		};
>
> +		mfc: codec@13400000 {
> +			compatible = "samsung,mfc-v7";
> +			reg =<0x13400000 0x10000>;
> +			interrupts =<0 102 0>;
> +			clock-names = "mfc", "sclk_mfc";
> +			clocks =<&cmu CLK_MFC>,<&cmu CLK_SCLK_MFC>;
> +			samsung,power-domain =<&pd_mfc>;
> +			status = "disabled";
> +		};
> +
>   		serial_0: serial@13800000 {
>   			compatible = "samsung,exynos4210-uart";
>   			reg =<0x13800000 0x100>;

Applied, thanks.

- Kukjin
