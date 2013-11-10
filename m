From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] hwmon: ntc_thermistor: Fix typo (pullup-uV -> pullup-uv)
Date: Sun, 10 Nov 2013 19:18:11 +0100
Message-ID: <1404489.sfyjHCEcVN@flatron>
References: <1382492690-4056-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f53.google.com ([74.125.83.53]:51636 "EHLO
	mail-ee0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751159Ab3KJSSN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 10 Nov 2013 13:18:13 -0500
In-Reply-To: <1382492690-4056-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ijc+devicetree@hellion.org.uk, rob@landley.net, kgene.kim@samsung.com, jic23@kernel.org, ch.naveen@samsung.com, dianders@chromium.org, lars@metafoo.de, sachin.kamat@linaro.org, kyungmin.park@samsung.com

Hi Chanwoo,

On Wednesday 23 of October 2013 10:44:50 Chanwoo Choi wrote:
> This patch fix typo of property name from 'pullup-uV' to 'pullup-uv'.
> The ntc_thermistor.c use 'pullup-uv' when parsing dt data.
> 
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
>  Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt b/Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt
> index 47ada1d..5d49f2b 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt
> +++ b/Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt
> @@ -49,7 +49,7 @@ adc@12D10000 {
>  	/* NTC thermistor is a hwmon device */
>  	ncp15wb473@0 {
>  		compatible = "ntc,ncp15wb473";
> -		pullup-uV = <1800000>;
> +		pullup-uv = <1800000>;
>  		pullup-ohm = <47000>;
>  		pulldown-ohm = <0>;
>  		io-channels = <&adc 4>;
> 

Good catch.

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
