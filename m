From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [RESEND PATCH 2/2] ARM: dts: exynos4412-trats2: Enable TMU support
 at Trats2
Date: Sat, 22 Nov 2014 11:40:00 +0900
Message-ID: <035701d005fd$9ca13620$d5e3a260$@kernel.org>
References: <1416474343-1283-1-git-send-email-l.majewski@samsung.com>
 <1416474343-1283-2-git-send-email-l.majewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:29060 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752518AbaKVCkC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Nov 2014 21:40:02 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NFF000PJ62ON840@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 22 Nov 2014 11:40:00 +0900 (KST)
In-reply-to: <1416474343-1283-2-git-send-email-l.majewski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Lukasz Majewski' <l.majewski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, tomasz.figa@gmail.com

Lukasz Majewski wrote:
> 
+ Bart, Tomasz and MLs

Will apply.

Thanks
Kukjin

> This patch enables support for TMU at Exynos4412 based Trats2 board.
> 
> Signed-off-by: Lukasz Majewski <l.majewski@samsung.com>
> Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Reviewed-by: Tomasz Figa <tomasz.figa@gmail.com>
> ---
>  arch/arm/boot/dts/exynos4412-trats2.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
> index 5e066cd..121430d 100644
> --- a/arch/arm/boot/dts/exynos4412-trats2.dts
> +++ b/arch/arm/boot/dts/exynos4412-trats2.dts
> @@ -551,6 +551,11 @@
>  		status = "okay";
>  	};
> 
> +	tmu@100C0000 {
> +		vtmu-supply = <&ldo10_reg>;
> +		status = "okay";
> +	};
> +
>  	i2c_ak8975: i2c-gpio-0 {
>  		compatible = "i2c-gpio";
>  		gpios = <&gpy2 4 0>, <&gpy2 5 0>;
> --
> 2.0.0.rc2
