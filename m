From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH V2 3/3] ARM: EXYNOS: Add drm-device node to the dtsi file
Date: Wed, 26 Sep 2012 10:46:01 +0900
Message-ID: <135e01cd9b88$aea81140$0bf833c0$@org>
References: <1348232397-2477-1-git-send-email-l.krishna@samsung.com>
 <1348232397-2477-4-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:29998 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750824Ab2IZBqD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Sep 2012 21:46:03 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAX009QWOW9QF90@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 26 Sep 2012 10:46:01 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAX00M5DOWPJ170@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 26 Sep 2012 10:46:01 +0900 (KST)
In-reply-to: <1348232397-2477-4-git-send-email-l.krishna@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Leela Krishna Amudala' <l.krishna@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, jg1.han@samsung.com, thomas.abraham@linaro.org

Leela Krishna Amudala wrote:
> 
> This patch adds platform drm-device node to the dtsi file
> 
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi
> b/arch/arm/boot/dts/exynos5250.dtsi
> index 6401c94..f0cc06d 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -495,4 +495,8 @@
>  		reg = <0x14400000 0x40000>;
>  		interrupts = <18 5>, <18 4>, <18 6>;
>  	};
> +
> +	drm-device {
> +		compatible = "samsung,exynos-drm-device";
> +	};
>  };
> --

Please check below comments from Thomas Abraham and I agree with his
opinion.

There cannot be a node that represents a virtual device. Device tree should
ideally describe the hardware but the above node does not represent a
hardware device. The creation of the platform device instance for the above
device should handled inside the kernel code.

Thanks.

K-Gene <kgene@kernel.org>
