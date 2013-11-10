From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCHv3 3/3] ARM: dts: exynos4x12: Add gps_alive power domain for exynos4x12
Date: Sun, 10 Nov 2013 19:16:31 +0100
Message-ID: <4207742.ampVWzpqgB@flatron>
References: <1383530161-24080-1-git-send-email-cw00.choi@samsung.com> <1383530161-24080-4-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f181.google.com ([209.85.215.181]:37418 "EHLO
	mail-ea0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752041Ab3KJSQd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 10 Nov 2013 13:16:33 -0500
In-Reply-To: <1383530161-24080-4-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Chanwoo Choi <cw00.choi@samsung.com>, kgene.kim@samsung.com, t.figa@samsung.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, swarren@wwwdotorg.org, ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org, rob.herring@calxeda.com, kyungmin.park@samsung.com

Hi Chanwoo,

On Monday 04 of November 2013 10:56:01 Chanwoo Choi wrote:
> This patch gps_alive power domain to exynos4x12.dtsi.

Patch description lacks rationale behind the change.

> 
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4x12.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
> index ad531fe..3f5b416 100644
> --- a/arch/arm/boot/dts/exynos4x12.dtsi
> +++ b/arch/arm/boot/dts/exynos4x12.dtsi
> @@ -35,6 +35,11 @@
>  		reg = <0x10023CA0 0x20>;
>  	};
>  
> +	pd_gps_alive: gps-alive-power-domain@10023D00 {
> +		compatible = "samsung,exynos4210-pd";
> +		reg = <0x10023D00 0x20>;
> +	};
> +
>  	clock: clock-controller@10030000 {
>  		compatible = "samsung,exynos4412-clock";
>  		reg = <0x10030000 0x20000>;
> 

Otherwise the patch looks good.

Best regards,
Tomasz
