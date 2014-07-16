From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 2/2] ARM: dts: ODROID i2c improvements
Date: Wed, 16 Jul 2014 14:34:59 +0200
Message-ID: <53C67173.9060006@samsung.com>
References: <1405500606-5752-1-git-send-email-drake@endlessm.com>
 <1405500606-5752-2-git-send-email-drake@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:40661 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755112AbaGPMfi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Jul 2014 08:35:38 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N8T006J21N7GEB0@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 Jul 2014 13:35:31 +0100 (BST)
In-reply-to: <1405500606-5752-2-git-send-email-drake@endlessm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Drake <drake@endlessm.com>, kgene.kim@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, liquid.acid@gmx.net, m.szyprowski@samsung.com, linux-arm-kernel@lists.infradead.org

On 16.07.2014 10:50, Daniel Drake wrote:
> Increase max i2c bus frequency beyond the default for faster
> data transfers. According to the manual, these faster speeds are
> only available when the board is wired up the right way. In this case,
> the vendor kernel has run at this speed for a long time.
> 
> sda-delay is needed for talking to RTC on PMIC, otherwise the i2c
> controller never sees an ACK. Strangely the other PMIC i2c slave (the
> main one) works fine even without this delay. I Chose value 100 to
> match the vendor kernel.
> 
> Signed-off-by: Daniel Drake <drake@endlessm.com>
> ---
>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> index cb6f55f..adadaf9 100644
> --- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> +++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> @@ -134,6 +134,8 @@
>  	i2c@13860000 {
>  		pinctrl-0 = <&i2c0_bus>;
>  		pinctrl-names = "default";
> +		samsung,i2c-sda-delay = <100>;
> +		samsung,i2c-max-bus-freq = <400000>;
>  		status = "okay";
>  
>  		usb3503: usb3503@08 {
> 

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

--
Best regards,
Tomasz
