Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5AD1ACED5;
	Mon, 21 Jul 2025 06:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753080081; cv=none; b=hm33kFVqqzH43kNXcQRaNijRJpBOkyW2qSOoEumeAaNR3rgtdmj12KH3cq97fALh7UMk4PHoMBuHcom9UU62UUfNp3tvTI3+5thYxxrPzzm5/b0wRE9AG1lvVQBtuwWQBhVPT4g7V+dI8zWj7y+OkQ9U9ITjmCthnVwaLacqFQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753080081; c=relaxed/simple;
	bh=xl7vOESJTsfcCXVwLUmgzS9ZdYbuh4p/EOGZp1eq6U4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EnZh9BHTSFlUPoZR19M8JcfcS3zY13Z5XrXSBVG9nsbJVqnXRHVg22yV87aA/QsZ5eBSyDCWLZSdCByr8XkaQmWWX4zPx4Fvq25yWp7J0PZRlp9io9clS2AM46HOZ0DMt9htvYtjwWRnwSVUIQN5YA+FqxRTcAW+QyaXp9GqBgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ac6t/+k7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ac6t/+k7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 489EEC4CEED;
	Mon, 21 Jul 2025 06:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753080078;
	bh=xl7vOESJTsfcCXVwLUmgzS9ZdYbuh4p/EOGZp1eq6U4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ac6t/+k7D5HFwBBoGOduwPZFC2LVZqLI726GIl+1opIwkyeiu5X+XkrFdyN35tlWo
	 yuG5gRhvRPfB88ZyjpsXaRuiwBEWIxWch2bAIv0cno7kaqzvnoROwsBxAZc4gqlfCN
	 5+WECYpKsK1gsGSn0mC7Tic+0/A66xviLxQkRTWrde+ToKEDPPwNXtBw4Knc24UsaJ
	 PBOktbyrbqHd7Dm0j+eS2WNXlRQyTPuB4FSufGqOcL96AEBIYk+FSrX1hfn/AJU6lH
	 r3BA5kaMjrah1NbDezTpMHW4Aqb30DE7dhxAheRWXeKRPNcxS9IYtPVLF+yhsbiacY
	 1wHJAwsp7sz3A==
Message-ID: <b5da2e57-6135-433e-ad92-0bd2fa71458e@kernel.org>
Date: Mon, 21 Jul 2025 08:41:13 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] arm64: dts: exynosautov920: add abox_generic dt node
To: ew kim <ew.kim@samsung.com>, broonie@kernel.org, s.nawrocki@samsung.com,
 robh@kernel.org, krzk+dt@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, conor+dt@kernel.org,
 alim.akhtar@samsung.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250721023052.3586000-1-ew.kim@samsung.com>
 <CGME20250721024611epcas2p37ecbc204ea695d97f6477c04712a9974@epcas2p3.samsung.com>
 <20250721023052.3586000-3-ew.kim@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250721023052.3586000-3-ew.kim@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/07/2025 04:30, ew kim wrote:
> Add device tree node for the abox_generic platform driver to enable
> its registration as a platform device. This node does not represent
> direct hardware resources but is necessary for driver initialization
> and platform device binding.
> 
> Properties added in the device tree node:
> 
> - samsung,num-pcm-playback (uint32):
>   Maximum number of supported PCM playback devices.
>   Here, PCM playback devices refer to ALSA PCM devices.
> 
> - samsung,num-pcm-capture (uint32):
>   Maximum number of supported PCM capture devices.
>   Here, PCM capture devices refer to ALSA PCM devices.
> 
> - samsung,num-i2s-dummy-backend (uint32):
>   Maximum number of supported I2S dummy backend devices.
> 
> The node is declared disabled by default in the main device tree source,
> and enabled via board-specific DTS overlays by setting status = "okay".
> 
> This device tree binding document will be added under
> Documentation/devicetree/bindings/sound/samsung,exynosauto.yaml
> 
> to describe the node properties and usage.
> 
> Signed-off-by: ew kim <ew.kim@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts |  4 ++++
>  arch/arm64/boot/dts/exynos/exynosautov920.dtsi     | 10 ++++++++++

Entirely wrong order of patches.

>  2 files changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
> index a397f068ed53..a870c0b6847f 100644
> --- a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
> +++ b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
> @@ -86,3 +86,7 @@ &usi_0 {
>  &xtcxo {
>  	clock-frequency = <38400000>;
>  };
> +
> +&abox_generic {
> +	status = "okay";
> +};
> \ No newline at end of file


?

> diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> index 2cb8041c8a9f..4f086a7a79c8 100644
> --- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> @@ -1126,6 +1126,16 @@ timer {
>  			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
>  			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
>  	};
> +
> +	abox_generic: abox_generic {


And you did not resolve any of previous comments, just sent the same v1.

NAK.

Implement and respond to feedback. Then version properly your patches.



Best regards,
Krzysztof
