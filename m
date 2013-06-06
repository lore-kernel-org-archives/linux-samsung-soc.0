From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V2 2/2] ARM: dts: add dts node for the ahci sata exynos5440
Date: Thu, 06 Jun 2013 10:27:53 +0900
Message-ID: <09d201ce6255$111a6dd0$334f4970$%kim@samsung.com>
References: <1366104611-14315-1-git-send-email-ks.giri@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:47507 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755915Ab3FFB1z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Jun 2013 21:27:55 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MNY009JT6QF2NA0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Jun 2013 10:27:54 +0900 (KST)
In-reply-to: <1366104611-14315-1-git-send-email-ks.giri@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Girish K S' <girishks2000@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Girish K S wrote:
> 
> This patch adds dts support for the sata controller
> 
> Signed-off-by: Girish K S <ks.giri@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5440.dtsi |    9 +++++++++
>  1 files changed, 9 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5440.dtsi b/arch/arm/boot/dts/exynos5440.dtsi
> index 7c5dc38..2dc4ffa 100644
> --- a/arch/arm/boot/dts/exynos5440.dtsi
> +++ b/arch/arm/boot/dts/exynos5440.dtsi
> @@ -220,4 +220,13 @@
>  		clock-names = "rtc";
>  		status = "disabled";
>  	};
> +
> +	sata@210000 {
> +		compatible = "snps,exynos5440-ahci";
> +		reg = <0x210000 0x10000>;
> +		interrupts = <0 30 0>;
> +		clocks = <&clock 10>;
> +		clock-names = "sata";
> +	};
> +
>  };
> --
> 1.7.5.4

Applied, thanks.

- Kukjin
