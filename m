From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: dts: disable MDMA1 node for smdk5420 board
Date: Tue, 22 Apr 2014 11:18:13 +0900
Message-ID: <021301cf5dd1$1d0ec910$572c5b30$@samsung.com>
References: <001a01cf5b0c$5ddc7d60$19957820$%jun@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:8279 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751217AbaDVCSP convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Apr 2014 22:18:15 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4E00DYSUEDWS80@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 22 Apr 2014 11:18:13 +0900 (KST)
In-reply-to: <001a01cf5b0c$5ddc7d60$19957820$%jun@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Seungwon Jeon' <tgih.jun@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: javi.merino@arm.com, tushar.behera@linaro.org

Seungwon Jeon wrote:
> 

+ Javi Merino and Tushar Behera

> This change is similar to commit 3da355c(ARM: dts: Disable MDMA1 node
> for arndale-octa board). If MDMA1 region is configured with secure mode,
> it makes the boot failure with the following.
> 
> Unhandled fault: imprecise external abort (0x1406) at 0x00000000
> 
If so, how about adding the 'disabled' status in 5420 dtsi file? Then if 'enabling' is required, we can enable in each board dt file...

- Kukjin

> Signed-off-by: Seungwon Jeon <tgih.jun@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420-smdk5420.dts |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts
> b/arch/arm/boot/dts/exynos5420-smdk5420.dts
> index 6910485..9a48e3f 100644
> --- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
> +++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
> @@ -373,4 +373,10 @@
>  			};
>  		};
>  	};
> +
> +	amba {
> +		mdma1: mdma@11C10000 {
> +			status = "disabled";
> +		};
> +	};
>  };
> --
> 1.7.0.4
