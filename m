Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFD11E9B1A
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jan 2025 11:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736247624; cv=none; b=UAgIbFGyfA6EGhjwNo6dzG5RexjEee2OT+roigscCWq09A3WkrTf/APjxNvnCPeocCxbYzbpSpHMRQ4YaaZcHuEB99GAjHcDfjRgv4MfPTM5/QzyJAhM4WhZ84y50W5jfo8TccD5g85oxKROyqi1dp8Rfk5wqwD3rgl8OCOpf90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736247624; c=relaxed/simple;
	bh=h3VqLLJkYSL/Yzsi2h/Imjy/edDJq9YgtMjCyL5BxQA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XBVUBwUv2ehKKCc/vmpE5x7dhSwogezfR8MBcFB/JbRtt9pRRorNeRsjmeskeSa/h4vJS7tCG8c3ODxBawVwHi+H8v4RyypYDPus7d3PCG6+M4zWGFpLSRDb4IbTiPSL0RFvoCrsQv3U2Mvmng5bum76gbixNyPhNxjjEKNCrk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xRbHwSUK; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xRbHwSUK"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso152806915e9.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Jan 2025 03:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736247618; x=1736852418; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GgermC1KnnvFeBi+HFB4kuvSBtuR8pO8/HIDUgPUHKg=;
        b=xRbHwSUKHEHi4z/VmtwsoqSfzgQ4PMCJ6PwRwJ2c6V+n+tzbPKouW85zkIhGQBmFjQ
         n951oxUWVBn6R5wKXdiVOziud3Tx6EECDmTnzc3yX5IdTjC/V12YeWfuhrdbvq6d1wju
         SGmLmwktar4mmE4MU4NHpFWzAlAovf+0VM4V7Fa0PbgtrY3KDFUq4LtNDuT2TYc6ABHN
         hWfsVLzd+1l5Gb7G7pjHFOFMyaE6F0At7RNjqIGZEd4HZIUSFr04ooydJX4Crc/XP2jy
         YeP3wt5VL7T72ZRyBZjaS9/a+pkagVyA9vNUy9bMgEGvLyMWX9CufvXqh5xR5ttGD06F
         LljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736247618; x=1736852418;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GgermC1KnnvFeBi+HFB4kuvSBtuR8pO8/HIDUgPUHKg=;
        b=dmoWJ/rlrUw8I8N/jlqL0UU+kRXB/yrx/FbMIMzXxcB8AkDvx4N7AmSwza1JeHeeDI
         XGWNemHCpdeNj4ILlOB94SHqhOLhrMQ8m9cqzPzhXsGEUWwty5XyCvjL0rK5qSFuGyE8
         ua3MmHaFKwDoxosnGd5r1iP91r8r9IgtCIBRiBOFe8ig2E8cp4LNx3Am6VSTQug+NTCS
         QVQr+XYGIwBW/oXyPHZ8mf3mWkJlEG4x2xVN7gAqig6BDLE5uSkYJJV21fDO6XsHirex
         Xcux9CC4oLPHn8mHT1F95yKyGllJT3l2auKXsmKBOYO2Lt1JIK0UG8shyrWQEtv4cVDt
         5Spg==
X-Forwarded-Encrypted: i=1; AJvYcCW6edhrN0pTKje7ekMoaT828HEc2oKqM39W6G9kroAj0xR6cdJWA9AeL2CLgVMF4MUkXzI41EQYNoHkre1YNQXb7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUDFZ2Eo2osK4alx9jd46J4m+8QpPZE4LtT3edbEzWEITjIyZK
	6klIdHLUHXmzAMund67MKMf4wCXHt/DT2EzN0Ujbk5fhdSyjboYK+SUx9I4pwPg=
X-Gm-Gg: ASbGnctduUEGSQgDRfW6aeSyjrWKHIiA8w8KMqab/dfITxD+Vn8suCHfi6nWYNUciCP
	5drwEh7u3Rg0x4WLBrM5fvTNrJMO/mVVaiKbE9UTgt18pqtQ4t/dDSkpt8V8S2jbQA2XQPJ/YmN
	wRH5AJAAofGGlZ1ccOGRmlgtbEHJ9kD0GTkbt8UcFueF1grDxybSvS+b1GkT979ZMmr9fpQr1RF
	zsq6wxo7W/vrOJA1QPFy4CShznK/F3WzXD1IzBDXvGFYNYg3egWk0MQehdD
X-Google-Smtp-Source: AGHT+IFbec8gno5r3txZurFgpWnFa2Tw0B1U6ohzIg8oPkTeYV0R3Aylb3f7FAu8YsrgrAe4AIIpRA==
X-Received: by 2002:a05:600c:4f03:b0:435:1a2:2633 with SMTP id 5b1f17b1804b1-43668645cf5mr573322825e9.15.1736247617728;
        Tue, 07 Jan 2025 03:00:17 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea387sm599851945e9.6.2025.01.07.03.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 03:00:17 -0800 (PST)
Message-ID: <7178eb322fafaf0fbcdc4b91d9f9a65d996e4e6b.camel@linaro.org>
Subject: Re: [PATCH v2 1/4] power: supply: add support for max77759 fuel
 gauge
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: t.antoine@uclouvain.be, Sebastian Reichel <sre@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dimitri Fedrau <dima.fedrau@gmail.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Peter
 Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Date: Tue, 07 Jan 2025 11:00:16 +0000
In-Reply-To: <20250102-b4-gs101_max77759_fg-v2-1-87959abeb7ff@uclouvain.be>
References: <20250102-b4-gs101_max77759_fg-v2-0-87959abeb7ff@uclouvain.be>
	 <20250102-b4-gs101_max77759_fg-v2-1-87959abeb7ff@uclouvain.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Thomas,

Thanks for your patch!

On Thu, 2025-01-02 at 12:15 +0100, Thomas Antoine via B4 Relay wrote:
> From: Thomas Antoine <t.antoine@uclouvain.be>
>=20
> The interface of the Maxim max77759 fuel gauge has a lot of common with t=
he
> Maxim max1720x. The major difference is the lack of non-volatile memory
> slave address. No slave is available at address 0xb of the i2c bus, which
> is coherent with the following driver from google: line 5836 disables
> non-volatile memory for m5 gauge.
>=20
> Link: https://android.googlesource.com/kernel/google-modules/bms/+/1a68c3=
6bef474573cc8629cc1d121eb6a81ab68c/max1720x_battery.c
>=20
> Other differences include the lack of V_BATT register to read the battery
> level and a difference in the way to identify the chip (the same register
> is used but not the same mask).

It also seems the reported POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN is
quite a bit off - on my Pixel 6, it reports ca. 1131mAh, but the downstream
stack reports a more reasonable 4524mAh. Interestingly, this is an exact
multiple of four.

POWER_SUPPLY_PROP_CHARGE_FULL is off in a similar way, and I suspect that
related properties like charge_avg, time_to_empty, time_to_full are
reported incorrectly as well.

[...]

> @@ -483,14 +608,27 @@ static int max1720x_probe(struct i2c_client *client=
)
> =C2=A0	psy_cfg.drv_data =3D info;
> =C2=A0	psy_cfg.fwnode =3D dev_fwnode(dev);
> =C2=A0	i2c_set_clientdata(client, info);
> -	info->regmap =3D devm_regmap_init_i2c(client, &max1720x_regmap_cfg);
> +
> +	data =3D device_get_match_data(dev);
> +	if (!data)
> +		return dev_err_probe(dev, ret, "Failed to get chip data\n");
                                          ^^^
This should be -EINVAL.


Cheers,
Andre'

