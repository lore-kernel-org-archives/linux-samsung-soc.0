From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 1/2] ARM: dts: exynos4: Add JPEG codec node
Date: Thu, 05 Mar 2015 15:13:42 +0100
Message-ID: <54F86496.9020103@samsung.com>
References: <1425561042-28258-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:26899 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751465AbbCEONp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Mar 2015 09:13:45 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NKQ00JO7T1IR470@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 05 Mar 2015 14:17:42 +0000 (GMT)
In-reply-to: <1425561042-28258-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, s.nawrocki@samsung.com, Kukjin Kim <kgene@kernel.org>

Please ignore these both patches in favour of the patch:

[PATCH v2] ARM: dts: exynos4: add nodes for jpeg codec

-- 
Best Regards,
Jacek Anaszewski

On 03/05/2015 02:10 PM, Jacek Anaszewski wrote:
> This patch adds an entry for JPEG codec found in Exynos 4210
> and 4x12 SoCs.
>
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Cc: Kukjin Kim <kgene@kernel.org>
> ---
>   arch/arm/boot/dts/exynos4.dtsi |   10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
> index 77ea547..e157d98 100644
> --- a/arch/arm/boot/dts/exynos4.dtsi
> +++ b/arch/arm/boot/dts/exynos4.dtsi
> @@ -452,6 +452,16 @@
>   		status = "disabled";
>   	};
>
> +	jpeg: codec@11840000 {
> +		compatible = "samsung,exynos4210-jpeg";
> +		reg = <0x11840000 0x1000>;
> +		interrupts = <0 88 0>;
> +		clocks = <&clock CLK_JPEG>;
> +		clock-names = "jpeg";
> +		samsung,power-domain = <&pd_cam>;
> +		status = "disabled";
> +	};
> +
>   	i2c_0: i2c@13860000 {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
>
