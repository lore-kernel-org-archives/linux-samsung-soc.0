From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 3/5] ARM: dts: exynos4x12: Add GPS_ALIVE power domain
Date: Tue, 11 Mar 2014 13:28:04 +0100
Message-ID: <531F0154.9040409@samsung.com>
References: <1394524494-30641-1-git-send-email-cw00.choi@samsung.com>
 <1394524494-30641-4-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:13663 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754892AbaCKM2V (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Mar 2014 08:28:21 -0400
In-reply-to: <1394524494-30641-4-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, kgene.kim@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kyungmin.park@samsung.com, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ijc+devicetree@hellion.org.uk, linux@arm.linux.org.uk

Hi Chanwoo,

On 11.03.2014 08:54, Chanwoo Choi wrote:
> This patch add GPS_ALIVE power domain for Exynos4x12 SoC. GPS_ALIVE power domain
> include GPS_BLK for GPS IP. Exynos SoC used generic power-domain driver to
> control power domain. After completed kernel booting, Exynos power-domain driver
> disable un-used power domain to reduce power-consumption/leak.
>
> If GPS_ALIVE power domain isn't registered to Exynos power-domain driver,
> happen power-leakage because GPS_ALIVE_CONFIGURATION is default power on state.
>
> - 0x10023D00 : GPS_ALIVE_CONFIGURATION register address
>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>   arch/arm/boot/dts/exynos4x12.dtsi | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
> index 1ec77f6..066eb35 100644
> --- a/arch/arm/boot/dts/exynos4x12.dtsi
> +++ b/arch/arm/boot/dts/exynos4x12.dtsi
> @@ -41,6 +41,11 @@
>   		compatible = "samsung,exynos4210-pd";
>   		reg = <0x10023CA0 0x20>;
>   	};
> +	
> +	pd_gps_alive: gps-alive-power-domain@10023D00 {
> +		compatible = "samsung,exynos4210-pd";
> +		reg = <0x10023D00 0x20>;
> +	};
>

Exynos4210 seems to have this power domain as well, so I guess this 
change should be done to exynos4.dtsi instead.

Best regards,
Tomasz
