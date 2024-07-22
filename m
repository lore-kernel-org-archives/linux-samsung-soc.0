Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C54415252D;
	Mon, 22 Jul 2024 07:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721635018; cv=none; b=uzumqsuoV6vPNVucdCmbsW+E9UXKQy8OLD3XWFiIMjRczBLUh4L2FYfMP679sPNDtiPhOg+cFtmaM7VjiBxw3imy1csouY30snvtf8z0rH+LK7PrZ6nM0atDLOYLShvh69a5s+8x7LougoScYfc9STL8SoWnNrnn6qxUFZqTrtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721635018; c=relaxed/simple;
	bh=COQMtfBNJwfO8uljz2p9okL45TamVuQg+CNbtYLtpZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BkEU74y3d7HPNHIaP0ti0tOAT0D2awTF3IC/RC0BmTOk/PznWY2E9lAP93oNbO1iwv6gbYLZUGF1uwaW0GKBb1+BpweSq5vMTnsUjFWe7wH4LBpFJyk7nEkY116baOP6S8e2bZi0Ur1YF6mSSlBqd+6CldR9h0uJr0bnEajJhBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sbawr4QQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sbawr4QQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B32EC116B1;
	Mon, 22 Jul 2024 07:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721635018;
	bh=COQMtfBNJwfO8uljz2p9okL45TamVuQg+CNbtYLtpZM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Sbawr4QQYzw5QLZVw8zvAqKoy7urqCgbWgYlzmZaBYFN9RPr+ZzuP9p7jhtK0/laG
	 QO8/5fCc8oNhng7DxdUzK5Rd3qkKXj4jcXdKOVhShzba0OXRgg4aXW5defW8lq0AMx
	 Jmv4ieATVzjO7dM7fpnr/FrHFdEGkhyrqrVTOlZV13e76LA3nlFh6DDhpDFN5N2Eiv
	 a7XCfPvcz8MDOnKOtsb0Vl1Ny7WHHojLiYi8VUWXbiQzXw2+/yA2uda+v5kR6u4RGq
	 EpzJfNw+cTG4HIoojCtpiwjtV2KFQQHAirTQ7N89ZBtshELZ9ynJugep+jglGHE7hS
	 MidUhEHCxk8Sw==
Message-ID: <ebe3853e-aa69-417c-ad0d-efe58a0dd1b9@kernel.org>
Date: Mon, 22 Jul 2024 09:56:52 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] ARM: dts: samsung: exynos4212-tab3: Drop dummy mic
 bias regulators
To: Artur Weber <aweber.kernel@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20240716-midas-audio-tab3-v1-0-a53ea075af5a@gmail.com>
 <20240716-midas-audio-tab3-v1-6-a53ea075af5a@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240716-midas-audio-tab3-v1-6-a53ea075af5a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/07/2024 21:36, Artur Weber wrote:
> Add the samsung,tab3-audio compatible that makes mic bias regulators
> non-required, and drop the dummy main/sub mic bias regulators that
> don't exist in hardware.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
>  arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi | 20 ++------------------
>  1 file changed, 2 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
> index 2f39f3c0661e..a140f86d399b 100644
> --- a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
> +++ b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
> @@ -286,20 +286,6 @@ display_3v3_supply: voltage-regulator-3 {
>  		enable-active-high;
>  	};
>  
> -	mic_bias_reg: voltage-regulator-4 {
> -		compatible = "regulator-fixed";
> -		regulator-name = "MICBIAS_LDO_2.8V";
> -		regulator-min-microvolt = <2800000>;
> -		regulator-max-microvolt = <2800000>;
> -	};
> -
> -	submic_bias_reg: voltage-regulator-5 {
> -		compatible = "regulator-fixed";
> -		regulator-name = "SUB_MICBIAS_LDO_2.8V";
> -		regulator-min-microvolt = <2800000>;
> -		regulator-max-microvolt = <2800000>;
> -	};
> -
>  	earmic_bias_reg: voltage-regulator-6 {

This should be voltage-regulator-4.

>  		compatible = "regulator-fixed";
>  		regulator-name = "EAR_MICBIAS_LDO_2.8V";
> @@ -310,14 +296,12 @@ earmic_bias_reg: voltage-regulator-6 {
>  	};
>  
>  	sound: sound {
> -		compatible = "samsung,midas-audio";
> +		compatible = "samsung,tab3-audio", "samsung,midas-audio";
>  		model = "TAB3";
> -		mic-bias-supply = <&mic_bias_reg>;
> -		submic-bias-supply = <&submic_bias_reg>;
> -		headset-mic-bias-supply = <&earmic_bias_reg>;
>  

You just added this line. Organize patches or code in a way that does
not move it within one patchset.


Best regards,
Krzysztof

