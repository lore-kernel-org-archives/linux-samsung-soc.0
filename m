From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH] ARM: dts: disable PCIe for SD5v1 board
Date: Thu, 26 Sep 2013 13:48:48 +0900
Message-ID: <02c401ceba73$b0add230$12097690$@org>
References: <000301cea9fe$619d2900$24d77b00$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:63498 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750891Ab3IZEsu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Sep 2013 00:48:50 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MTP000KCUPDI9F0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 26 Sep 2013 13:48:49 +0900 (KST)
In-reply-to: <000301cea9fe$619d2900$24d77b00$%han@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jingoo Han' <jg1.han@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org

Jingoo Han wrote:
> 
> Disable PCIe for SD5v1 board, because there is no PCIe slot
> on SD5v1 board.
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
> Tested on SD5v1 board.
> 
>  arch/arm/boot/dts/exynos5440-sd5v1.dts |    7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5440-sd5v1.dts
> b/arch/arm/boot/dts/exynos5440-sd5v1.dts
> index 5b22508..78a239d 100644
> --- a/arch/arm/boot/dts/exynos5440-sd5v1.dts
> +++ b/arch/arm/boot/dts/exynos5440-sd5v1.dts
> @@ -36,4 +36,11 @@
>  		status = "disabled";
>  	};
> 
> +	pcie@290000 {
> +		status = "disabled";
> +	};
> +
> +	pcie@2a0000 {
> +		status = "disabled";
> +	};
>  };
> --
> 1.7.10.4

OK, applied.

Thanks,
Kukjin
