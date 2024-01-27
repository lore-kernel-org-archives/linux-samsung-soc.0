Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA9F9471
	for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Jan 2024 01:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706319611; cv=none; b=sDW6QWuE9geCz2xWVBvz6Xm1EJcEl9aDmRLYpYELPJhLk514MyGXcf/7G1Lh9ffNBspTp97YG4BxjXNsOjiLlBpMvicL2VjR3M6BiMckhq2ZGz9PCNwCHzxfpWwnz0p6eKdO9QYB3d6XfwjUONdoyY27HzrICOEyERs3T6jAn3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706319611; c=relaxed/simple;
	bh=2YnRIQRgnlZQnOPzyfaHkE0dDE0sohaqmY/s2G+mfzg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YGmkUdecuueTGkqq9sjntbTrtWIiYuZP3x9zTsmRoUFTecVHg//B/LhpVyKfZIXyV6/jkYDMtTjBt6aOOLJZi9VA8gERp6X4x066z5cKvrBrfP8uUEckPFrDm/BR66u/sM45DyLh5sBl1h0LZZN/+URla8RAq3lVGHwdCEbMqAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XgCqaS6D; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XgCqaS6D"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-33ae3cc8a6aso115962f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 17:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706319608; x=1706924408; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2YnRIQRgnlZQnOPzyfaHkE0dDE0sohaqmY/s2G+mfzg=;
        b=XgCqaS6DxHVmuWKwezOIapkseM35czie2cfoXTew0eQlot6qE+NUQmfxg5XMUccSFz
         lCPfz0EAD8ufFs9YaUGONVgj71Zn0lgxPcWE30uWiqVO4jGW2yTOVEltN+vIVppblsSs
         H5p5RglYzllCdHh2DR4FyjRsY6DeBXDi2/cT9sV7RU/LNBy/3g0nfwPu8iGxD1t3y/q3
         XVyc7S9ZCYrj7f3viY9lTPAJWHDJwj7NOPAfCKddNnA00cdOphaXQYy6Xnz+ZaSMrhAw
         DY57nYuYvnV3+F0tZf2lxzN5cTMF4IZffRCQnHX07Bo0Ggv+BeoYYIzL8+j5+6ylxwYX
         zNQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706319608; x=1706924408;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2YnRIQRgnlZQnOPzyfaHkE0dDE0sohaqmY/s2G+mfzg=;
        b=nlP7YBX/VaHDTF6Rjo8vDoFCvBGXeGmvvmHMe6alV9Q6Qs7dTBbGiN1OFHC6DxBzJM
         hF29CqJyWgBbWMr0cZRkE6yVgo8D1nHir9MPKFSSiLHjtUYpuOul+qAKR0MOIWE4xrcX
         lBAl0RxE5PC3ADrPRAGRMQijseHDbSw5Vd75zvPzL8uizHdotrVpoD5eKQS7CtzUVP8H
         /62TyhvM1gla/on9q8O49CoxZVceiNT8jwZqmxP1DJL2okzjlnXFcEfQymT/Obm5Gi8/
         MH2iOEhy04tvUZDWutWfaHYuInRS4PYEvE9P5Ydj4O6aRTL8zWOVhf/BrXQ25Mbl8lR9
         jcFg==
X-Gm-Message-State: AOJu0YyEja1qH5h6xlJ0/1GjAAP0+5W8qjzQMXG3FeQ3ASWH0W3OhVtJ
	+qu7IdXaH8GIMx2TG/L9T7TJ68xn56zVXACEQMpReV3zkFGGhhB8FvmWalJ5SRc=
X-Google-Smtp-Source: AGHT+IHSkzXyOriK243MXugaHyRihAWS/eBnZxFTiXv8p/Ej6AY/TMoTn1KUKXTbyrMaGD1ksZyjRg==
X-Received: by 2002:adf:a418:0:b0:337:c58a:a5fe with SMTP id d24-20020adfa418000000b00337c58aa5femr380086wra.12.1706319607878;
        Fri, 26 Jan 2024 17:40:07 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id bj7-20020a0560001e0700b0033920dfd287sm2357862wrb.19.2024.01.26.17.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 17:40:07 -0800 (PST)
Message-ID: <8af4f6c9c36474d971556f00981ba76d3506d81d.camel@linaro.org>
Subject: Re: [PATCH 3/9] clk: samsung: gs101: add support for cmu_peric1
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com, 
 tudor.ambarus@linaro.org, willmcvicker@google.com,
 semen.protsenko@linaro.org,  alim.akhtar@samsung.com,
 s.nawrocki@samsung.com, tomasz.figa@gmail.com,  cw00.choi@samsung.com,
 linux-arm-kernel@lists.infradead.org,  linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org,  devicetree@vger.kernel.org
Date: Sat, 27 Jan 2024 01:40:06 +0000
In-Reply-To: <20240127001926.495769-4-andre.draszik@linaro.org>
References: <20240127001926.495769-1-andre.draszik@linaro.org>
	 <20240127001926.495769-4-andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2024-01-27 at 00:19 +0000, Andr=C3=A9 Draszik wrote:
> The clocks marked as CLK_IGNORE_UNUSED need to be kept on until we have
> updated the respective drivers for the following reasons:
> =C2=A0=C2=A0=C2=A0 * gout_peric1_gpio_peric1_pclk is required by the pinc=
trl
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 configuration. With this clock disabled, r=
econfiguring the pins
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (for USI/I2C, USI/UART) will hang during r=
egister access.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Since pingctrl-samsung doesn't support a c=
lock at the moment, we
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 just keep the kernel from disabling it at =
boot, until we have an
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 update for samsung-pinctrl, at which point=
 we'll drop the flag.

I have patches for pinctrl-samsung implementing this new clock ready. Will
send next week.

Cheers,
Andre'

