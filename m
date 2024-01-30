Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B67E605BE
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jan 2024 09:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706605952; cv=none; b=c9huyK6EGxnWxhoq6cq1LcftYUa8dobNHQJp1IAKECg/JGgf0GvtpNA1oUY5nrJp5UK6nWSPmGbVDf7OqBL0BQInLh3PwsTQpT73C+v10ri6QJNfOyf092vWm1XcUM/feU+Q0iPQE7yPwdHRoNQIV8wIlGsql6JUGFI2GbkRUwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706605952; c=relaxed/simple;
	bh=rKhHZGSb+Y6aNJ+cXifm6W5LIoIisj9pyI6bNCYAugc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gaUnFE9SS1bkPhv9Q6GWcyeYAmDE6L1mmOO7hFqeDzLRYLuwlevuf7zzcaoKksyIwkgEXdYaiAIvbQIXwp0bdk5GF02372dTgUisAJLXWEJ8BV/N72KGfSrIKidLInLj5kPobTBCGwawKzp3DSZcEiCNuqEY6WgERLWblWLAug4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jvCc+JWa; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jvCc+JWa"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-55c2c90c67dso3929191a12.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jan 2024 01:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706605948; x=1707210748; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dIk06W/m1toDs3ZlWZXYAsOHgljm2ZVOiVWudPYtTEg=;
        b=jvCc+JWat5DDimHXr1Yowksm8Qho2qnuIVHpjEkrMg5msithX5x+h/8OnPKIReulG7
         QzA+TEquRGYh5tFzqEhVgfhSerfu39i9qxdBj7hrYQMgeCfE8l2kBPL79c7HNxu31c95
         wuDY2LiK/scSwAG+fNbF7oFr7DJRtc2Aru0l4rA/WfXnE8MZ0DQXT6s2Vq6Lgh0DUrvd
         3QYLNHQmuq9kKPmNYi5g/5E2a/YuGrSV1uxPir24DbKCy9qkI47u+J3PflLYtLZaKyS9
         V4JTnNgB4QGWKCDQUrXKK0AKAgiE9tXHJmAtISb26Zyz3x9opxTa0L63TOjGaysYwXX6
         s08A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706605948; x=1707210748;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dIk06W/m1toDs3ZlWZXYAsOHgljm2ZVOiVWudPYtTEg=;
        b=R9MiOA5E4DdWSwuJJ8cZBIM2mxexWkOzbjRDWcpwfgoBqnHVUMkljjYENFDuGclpIM
         DJ6kM71u41OY/QWe67YY6Bj7riRVVc2SdFLAS6CVv19r48e7TouXl0kGP+h3Dnp86bJg
         K5ftY3HmBCbAXce9e4yEp/w411c33y7EeP4SUErLAMjGcpSSqKNJIeE9MnV5VAHIzh1L
         qcybyuVxXU+vwNJ4Nu0RAPd2F+AdqdDjFAAM0+/or069FGz4ku+AEU8T9kPvhKM1bEiu
         G2dTdzWagiWj8icHKTaAHnckvKde+MXvL2zS81iwVE4qCU/53Ai8PZFtLqjs0bYT5I2e
         1UfQ==
X-Gm-Message-State: AOJu0YyeFhFXRdhbMOiqF9CLj2T462vDNzYVQTRKUmW07ZrqF4Kl3A1O
	MFjrQOBpF/dCN41io2MkZ13Z/XphF5vsiJNc+2JGzXYKGZtIq8FN8mwv63jJqC4=
X-Google-Smtp-Source: AGHT+IGyVMf2OkueT1e2jkuy8V6uo08rZuNEronGpcRFfv+SAzH/npoMxojClmBxEorK0G3C/NJ1Jg==
X-Received: by 2002:a17:906:e53:b0:a31:1b72:9efd with SMTP id q19-20020a1709060e5300b00a311b729efdmr6023698eji.66.1706605948445;
        Tue, 30 Jan 2024 01:12:28 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id ss6-20020a170907c00600b00a3535b76c42sm3958064ejc.15.2024.01.30.01.12.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 01:12:28 -0800 (PST)
Message-ID: <338efca2-d1fe-4adb-8275-5f570ab445d8@linaro.org>
Date: Tue, 30 Jan 2024 09:12:26 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] arm64: dts: exynos: gs101: enable i2c bus 12 on
 gs101-oriole
Content-Language: en-US
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com,
 willmcvicker@google.com, semen.protsenko@linaro.org,
 alim.akhtar@samsung.com, s.nawrocki@samsung.com, tomasz.figa@gmail.com,
 cw00.choi@samsung.com, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240129174703.1175426-1-andre.draszik@linaro.org>
 <20240129174703.1175426-8-andre.draszik@linaro.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240129174703.1175426-8-andre.draszik@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 1/29/24 17:46, André Draszik wrote:
> This bus has three USB-related devices attached to it:
>     0x25: Maxim 77759 Type-C port controller
>     0x35: Maxim 20339EWB Surge protection IC
>     0x36: Maxim 77759 Fuel gauge
>     0x57: NXP PCA9468 Battery charger
>     0x66: Maxim 77759 PMIC
>     0x69: Maxim 77759 Charger
> where the Maxim 77759 has multiple i2c slave addresses.
> 
> These don't have (upstream) Linux drivers yet, but nevertheless we can
> enable the bus so as to allow working on them (and to make i2cdetect /
> i2cdump / etc. work).
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> 
> ---
> v2:
> * add short summary of devices attached to this bus & add TODO
> * collect Reviewed-by: tags
> ---
>  arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> index cb4d17339b6b..6ccade2c8cb4 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> +++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> @@ -72,6 +72,11 @@ eeprom: eeprom@50 {
>  	};
>  };
>  
> +&hsi2c_12 {
> +	status = "okay";
> +	/* TODO: add the devices once drivers exist */
> +};
> +
>  &pinctrl_far_alive {
>  	key_voldown: key-voldown-pins {
>  		samsung,pins = "gpa7-3";
> @@ -113,6 +118,11 @@ &usi8 {
>  	status = "okay";
>  };
>  
> +&usi12 {
> +	samsung,mode = <USI_V2_I2C>;
> +	status = "okay";
> +};
> +
>  &watchdog_cl0 {
>  	timeout-sec = <30>;
>  	status = "okay";
