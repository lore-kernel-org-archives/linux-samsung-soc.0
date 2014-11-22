From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [RESEND PATCH 1/2] ARM: dts: exynos4x12: Device tree node
 definition for TMU on Exynos4x12
Date: Sat, 22 Nov 2014 11:39:03 +0900
Message-ID: <035001d005fd$7abac670$70305350$@kernel.org>
References: <1416474343-1283-1-git-send-email-l.majewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:28986 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752850AbaKVCjG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Nov 2014 21:39:06 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NFF00BMH6146O60@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 22 Nov 2014 11:39:04 +0900 (KST)
In-reply-to: <1416474343-1283-1-git-send-email-l.majewski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Lukasz Majewski' <l.majewski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, tomasz.figa@gmail.com

Lukasz Majewski wrote:
> 
+ Bart, Tomasz and MLs

Hi Lukasz,

Please post including MLs, even resending.

Will apply for v3.19, and just note that you asked me to apply this for 3.18
in personal talk but I couldn't see any requirements for fixes-3.18. If I'm
missing something, please let me know.

Thanks,
Kukjin

> The TMU device tree node definition for Exynos4x12 family of SoCs.
> 
> Signed-off-by: Lukasz Majewski <l.majewski@samsung.com>
> Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Reviewed-by: Tomasz Figa <tomasz.figa@gmail.com>
> ---
>  arch/arm/boot/dts/exynos4x12.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
> index 861bb91..2e9f1f7 100644
> --- a/arch/arm/boot/dts/exynos4x12.dtsi
> +++ b/arch/arm/boot/dts/exynos4x12.dtsi
> @@ -271,4 +271,14 @@
>  		compatible = "samsung,exynos4x12-usb2-phy";
>  		samsung,sysreg-phandle = <&sys_reg>;
>  	};
> +
> +	tmu@100C0000 {
> +		compatible = "samsung,exynos4412-tmu";
> +		interrupt-parent = <&combiner>;
> +		interrupts = <2 4>;
> +		reg = <0x100C0000 0x100>;
> +		clocks = <&clock 383>;
> +		clock-names = "tmu_apbif";
> +		status = "disabled";
> +	};
>  };
> --
> 2.0.0.rc2
