Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E129A84FC5
	for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Feb 2024 17:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708538183; cv=none; b=i9sfocmChQoPr7GDlq3N8TEyGxgAzehEU8QnZmfevAN/gWGGOxvVkYLivjrvPQDwm6QgED0F2PJMklPom8dViYd+OFZcHX2mi2Hhd2v4b+oB3c3UOSWbGs2C5Oqlpfn0NuEKczB7898suY9kkpoGNjlT8tyLqttHVOHKdjHZsaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708538183; c=relaxed/simple;
	bh=BVFBq8MbvqfaIxtlUennLRCVo9CZPL/TUigQ6CV2aZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mM/0PUMJVynOHrufBdrCxkwwFaFtHg/DoVmAIGaTC1UWxVv7PPzmcMhdDh9BpbHvpKWB7567EQVCNqK3/f5b+oJrYiLesRzZ6Jx8KbTVGg+X8srIxa1a9c67y9BF7H2Qn8Eoe8Fe0y7ISNbwCLrGmMoIXe6hIvkzEVAB2yXuDyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PpTetLSO; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PpTetLSO"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-55a035669d5so1750274a12.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Feb 2024 09:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708538179; x=1709142979; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=it/RVOfJK4MjxrALV/dDH3SHkP5fEcXIOdKDJod6bwg=;
        b=PpTetLSOkvJvzbUgo7YABJIGoDL0eqEBVZ/64PwD9QaSovxw8cYNI2WSJOdR64S9Bm
         xNYCZPwkAFm2I2nN+Aw5AQ6yBUAebcB7AwypfqPg01YzfIR9+RHAkVRlZPOB/+WieTNi
         Zhdtq55BSmPvm2J3L3FzyFlFZNkZw73D4oD9kTeX/0+1gj88X2mmjxkEAughodEjJPPN
         zy95aig64qgaxsgha4wT4xwgnuu8zxmZTzVkucWYEp0H0BsZaQ2HYcJxdcnj6AHyub8Y
         6wM6W88XZWTFHF65OT2TmpITydBK7Pmpjiot3O7m9+OaOanTuo1Vy73UwzkaWvNiLYPU
         MmFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708538179; x=1709142979;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=it/RVOfJK4MjxrALV/dDH3SHkP5fEcXIOdKDJod6bwg=;
        b=KHHs3ELGUzERPerJkQHAFEqi9X/Py6J4t8AirGbvcqLGuefIVN0pxy9dmWJ8o10Fhp
         vs3VkuFWcCNXoMj3RRi/yEo5SmMwUaPaLqnp1ycKhIJbTtf+F6OPk50TIcmMaMpBCD+e
         YIWDJxdp734J4rb4QHMkijBhByhfbD9jMPDoYQ2iqPpiOC1bZPERWBKJfKRNO9RGkabT
         liZ/GI2ao/zSL2cd+G/RDxQNSsM6Fiif8rJfmPfv023sjdsAS4oUEt5iJRncyDly2CKF
         9Qvc/aesg+ZXRX19M+ABORmBU6CJGTuI+uIx8Zo03f7fQJcvwg44Bc+GU1VJWMJysfCc
         at8g==
X-Forwarded-Encrypted: i=1; AJvYcCXZ1On4ipyiy23DIBJqDSrj4Lyjvxuu0wcAToHHgVzytFUsnvp7TH7AhLTxmg2UoK0LFMFXnLynTcmaKlXRVsAyfB3C0IUPcQF+NBHr67LtyIw=
X-Gm-Message-State: AOJu0Yz0BTnOR00jJRkhsOwt0dWopAHOLWGexwn13uJWn+mUPD8s5Ojo
	nVw6Wd7ZgIQowcxE9R84OE3lU0wplV4LJlGBhzSKVmwbDzjXej1pd50dO6F1z74=
X-Google-Smtp-Source: AGHT+IGqE47uiLD78T1yQU2qNPN6dVRDsaT5Rxu1kmz28dCgLQ7tsFftgT+1AISRebYrTKMrx/S7WA==
X-Received: by 2002:a17:906:b094:b0:a3c:a4ba:7917 with SMTP id x20-20020a170906b09400b00a3ca4ba7917mr11807476ejy.0.1708538179316;
        Wed, 21 Feb 2024 09:56:19 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id qo3-20020a170907874300b00a3e4efbfdacsm4234766ejc.225.2024.02.21.09.56.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 09:56:18 -0800 (PST)
Message-ID: <10f692ae-ac7a-4243-aadc-80712f781d39@linaro.org>
Date: Wed, 21 Feb 2024 17:56:16 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/12] spi: s3c64xx: switch exynos850 to new port
 config data
Content-Language: en-US
To: broonie@kernel.org, robh@kernel.org, andi.shyti@kernel.org,
 krzysztof.kozlowski@linaro.org, semen.protsenko@linaro.org,
 conor+dt@kernel.org
Cc: alim.akhtar@samsung.com, linux-spi@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, andre.draszik@linaro.org,
 peter.griffin@linaro.org, kernel-team@android.com, willmcvicker@google.com,
 devicetree@vger.kernel.org
References: <20240216070555.2483977-1-tudor.ambarus@linaro.org>
 <20240216070555.2483977-13-tudor.ambarus@linaro.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240216070555.2483977-13-tudor.ambarus@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Hey, Sam,


On 2/16/24 07:05, Tudor Ambarus wrote:
> Exynos850 has the same version of USI SPI (v2.1) as GS101.

I tested GS101 and it worked, I guess exynos850 SPI shall work too as it
uses the same SPI version, v2.1. Can you run a test on your side too see
if works? If not, Mark can drop this patch I guess. Please let us know
your preference.

Cheers,
ta

> Drop the fifo_lvl_mask and rx_lvl_offset and switch to the new port
> config data.
> 
> Backward compatibility with DT is not broken because when alises are
> set:
> - the SPI core will set the bus number according to the alias ID
> - the FIFO depth is always the same size for exynos850 (64 bytes) no
>   matter the alias ID number.
> 
> Advantages of the change:
> - drop dependency on the OF alias ID.
> - FIFO depth is inferred from the compatible. Exynos850 integrates 3 SPI
>   IPs, all with 64 bytes FIFO depths.
> - use full mask for SPI_STATUS.{RX, TX}_FIFO_LVL fields. Using partial
>   masks is misleading and can hide problems of the driver logic.
> 
> Just compiled tested.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/spi/spi-s3c64xx.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> index 784786407d2e..9fcbe040cb2f 100644
> --- a/drivers/spi/spi-s3c64xx.c
> +++ b/drivers/spi/spi-s3c64xx.c
> @@ -1576,10 +1576,9 @@ static const struct s3c64xx_spi_port_config exynos5433_spi_port_config = {
>  };
>  
>  static const struct s3c64xx_spi_port_config exynos850_spi_port_config = {
> -	/* fifo_lvl_mask is deprecated. Use {rx, tx}_fifomask instead. */
> -	.fifo_lvl_mask	= { 0x7f, 0x7f, 0x7f },
> -	/* rx_lvl_offset is deprecated. Use {rx, tx}_fifomask instead. */
> -	.rx_lvl_offset	= 15,
> +	.fifo_depth	= 64,
> +	.rx_fifomask	= S3C64XX_SPI_ST_RX_FIFO_RDY_V2,
> +	.tx_fifomask	= S3C64XX_SPI_ST_TX_FIFO_RDY_V2,
>  	.tx_st_done	= 25,
>  	.clk_div	= 4,
>  	.high_speed	= true,
