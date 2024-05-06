Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B381DA3A;
	Mon,  6 May 2024 06:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714977037; cv=none; b=O3UL+GsRKHZ4fcJublO2yl6Is0FuGrUqqUeIndaFBbAueN0jMD1Mt5vwK1hsrTylcDgzk68FF+gKKbYxClk9DL5jUqVDukXHI9GcAyuCKBJNtBnvXDa1DcnWm4YeoQNXZIFvK8yVf6FTJgRCAsd/5zpNKlleTMH9Gl0QJKL/7NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714977037; c=relaxed/simple;
	bh=q1g4NGGH7/ausmEg/1oVhs9w4Q/ZB/1rs+nRhq8ssuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DZxkSh83vO6QEHouGhXz9p3hBS82rIeKRGMBTSxqvn7nO8Nf058QpYalOU3KwtDDTbjybIxFXLv44rQF6wGwGDUePLmy/DrJjdMFqVsaOeoc4XugR4GuwVtHtRyyHSlT8HsPwGn7PoXhuHiGwUmmDeNQ88RvUDTXnHV1Vd0KAqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AXB8Zjp9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AXB8Zjp9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 375B5C116B1;
	Mon,  6 May 2024 06:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714977037;
	bh=q1g4NGGH7/ausmEg/1oVhs9w4Q/ZB/1rs+nRhq8ssuc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AXB8Zjp9ykrIoQJB8Qr7a/tIXjqML5x9gDSQoonU5MOdWOHEEXcVvRIyrLHDoV1dK
	 Nge7qgj/fmg+OC5bM1CbThSEZl4gVgN+bA5FTg1m2Dgmywqeu/8kUScCz3WOVprDAj
	 Q3Ge9ZyL+B+n0ap1QIPYrJB7Ct+5ERHDZScSToyP1GnFgAsicQejrncwAwchCygKT4
	 ItKBxo1JO4XMmZ83xG+QS8skhTDBBcp410nMW9O6JqoLEUM4wnLDBUgVX3hxTRV/zF
	 M0b61/jArn1wH1ZWiCMlsTs7Km8g6O2T9etRQgyauGNy8/huNHQu4oJ+l7rnNBHlLG
	 PyPc0I7KyavKg==
Message-ID: <1038ca45-b9e9-4625-9c43-5ef4abf4a86d@kernel.org>
Date: Mon, 6 May 2024 08:30:29 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] ASoC: samsung: midas_wm1811: Add GPIO-based headset
 jack detection
To: Artur Weber <aweber.kernel@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20240503-midas-wm1811-gpio-jack-v1-0-e8cddbd67cbf@gmail.com>
 <20240503-midas-wm1811-gpio-jack-v1-2-e8cddbd67cbf@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240503-midas-wm1811-gpio-jack-v1-2-e8cddbd67cbf@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/05/2024 20:55, Artur Weber wrote:
> Some Samsung devices that use the midas_wm1811 driver use a GPIO-based
> method for detecting whether the headset jack is plugged in, as well as
> detecting which headset buttons are pressed. There are two GPIOs:
> a "headset detect" GPIO responsible for detecting jack insertion, and
> a "headset key" GPIO which triggers when a button on the headset is
> pressed. The plug type and the button pressed are determined based
> on information from an ADC channel.

...

>  
> @@ -433,6 +590,9 @@ static int midas_probe(struct platform_device *pdev)
>  	struct snd_soc_card *card = &midas_card;
>  	struct device *dev = &pdev->dev;
>  	static struct snd_soc_dai_link *dai_link;
> +	enum iio_chan_type channel_type;
> +	u32 fourpole_threshold[2];
> +	u32 button_threshold[3];
>  	struct midas_priv *priv;
>  	int ret, i;
>  
> @@ -468,6 +628,91 @@ static int midas_probe(struct platform_device *pdev)
>  		return PTR_ERR(priv->gpio_lineout_sel);
>  	}
>  
> +	priv->gpio_headset_detect = devm_gpiod_get_optional(dev,
> +				"headset-detect", GPIOD_IN);
> +	if (IS_ERR(priv->gpio_headset_detect)) {
> +		dev_err(dev, "Failed to get headset jack detect GPIO\n");

syntax is:
return dev_err_probe()

> +		return PTR_ERR(priv->gpio_headset_detect);
> +	}
> +
> +	if (priv->gpio_headset_detect) {
> +		priv->adc_headset_detect = devm_iio_channel_get(dev,
> +							"headset-detect");
> +		if (IS_ERR(priv->adc_headset_detect)) {
> +			dev_err(dev, "Failed to get ADC channel\n");

return dev_err_probe()

> +			return PTR_ERR(priv->adc_headset_detect);
> +		}
> +

> +		ret = iio_get_channel_type(priv->adc_headset_detect,
> +					   &channel_type);
> +		if (ret) {
> +			dev_err(dev, "Failed to get ADC channel type\n");
> +			return ret;
> +		}
> +
> +		if (channel_type != IIO_VOLTAGE) {
> +			dev_err(dev, "ADC channel is not voltage\n");
> +			return ret;
> +		}
> +
> +		priv->gpio_headset_key = devm_gpiod_get(dev, "headset-key",
> +							GPIOD_IN);
> +		if (IS_ERR(priv->gpio_headset_key)) {
> +			dev_err(dev, "Failed to get headset key gpio\n");

return dev_err_probe()



Best regards,
Krzysztof

