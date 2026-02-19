Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1E434A775
	for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Feb 2026 15:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771516349; cv=none; b=fe91udBY447jWSCPSbB+kxb5j7jTkSaATaHU2H531yc4rNMpA+lHuK7e/tc/lXr4B6QA2QthWpchKvJkVczdaZmkloxV9LMxDbQFyQcloqYytx1YSpl2cAGj56ti39t07Z9U4akCyv5bPJwOQA4rgqGL2TorPKoh+msqXumxMac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771516349; c=relaxed/simple;
	bh=hUVMfsGdV0aDbsIFOhfMsdPp5kAixuq61G/flR5Alxg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j+Gt46gm+8H+t+C9ecVuhfgIufExotJFpSdwXzCXUBeTg3RtkloPPmGy7WxoYJMclq43TgdZ65i9ayrXDTEOIQqY1NR47N7jJTAA9HkPASEm7cMMENtEqlyUSFolehWJ6GUKpuqDZq0wyd9aNF4iHm1fVmWjYaUhLSCHgdU3t2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yV9ak2c9; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yV9ak2c9"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43767807cf3so874536f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Feb 2026 07:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771516346; x=1772121146; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ausNYp9VNOhe1fBHOC525G26Oe60ih9EhrjdJ5sgpHg=;
        b=yV9ak2c9B8AV5lOFP2+ASu81htz4cub/EZEvHYTW6zwjxUR0sbJ3wNLOLEVTKUmniP
         Qg8C9YIASU2HiwGMvPlurEY5c/W3ET39r5gHOJ7kUZ+EdIEmraU0C24ueJM7mACg4PmJ
         ZfaKOqaNq0ptYYVRRMX/2DHWJTvP5sWZtMhaFvPE44b9l5mW1CNB56MV1wLIGMvN3ZCF
         SFryge4s8mXDYNGrOiOCuw+MdBh1Y8yKQFnXe/eIgdyxSV7zBpnVZgUyCFBwgsdcqv/m
         m6kcXoAB49/10DVAJsXRUI1I8nt1XhrdEw8XOexD0Wc8vDpyODntZbRxMsk8939vdZAE
         JvOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771516346; x=1772121146;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ausNYp9VNOhe1fBHOC525G26Oe60ih9EhrjdJ5sgpHg=;
        b=acwIbz/mBDYoJm8Q7e/buVAKLj0yjzphaKKIu6+5AD6j4Y/hC/9tQuQI/Ev3r+37Qr
         /SzM7GYaucBdRhD7cBZc5QNY+6/5BKJEZb9IwEU9rwQmXJ9Id5d+lQVqdWKXSWTkVmXT
         vRdxyxWrd5uC7oScvIeBsiHEAyAR0HUoZcK3b7GN97jDNdKAe0QBg3KtX9sVfS2p3bh3
         FNDuJ+lv2XbjXDAtzegh8YR6RwYY77fY87jn8xJSt3iqHNCDVSA2+5y4bZg/vlqfdgST
         llEi4y+rgxLWK7Wr13SIbeC/109ICTR9N4C66ATzBNQ3mwk7BpDnxGJFlid4g8MwHAdy
         5PuA==
X-Forwarded-Encrypted: i=1; AJvYcCV+yiwVhV9xGDi/axrFZxnoJi/0dbHo2Vm8jJdVkYdXTUvw5m5poMzhkXVicm0dpspIf0p7CMJueSh0AudGrZjNow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1KWRytrGtQeCcgG1WFxE7sb9uovzU7PJl3tL71sODdIZUNB+H
	ZmB5u55bRkXRhbqdqwzAhkzAgrOeyo1kwkdCoXt5WRnQRlnRqYyej5OVd/piaIoBw5w=
X-Gm-Gg: AZuq6aJVjnytL2Tn/eKSibHmZZkZGiGtUugpDUBKqXURqNXQSNNNRVc+TtTAJgr3x8l
	UaizETaveG8fDxzxeZp9xWoQ/pRCJuYNfLe5Y1sFM9a6GJJrzjZrKwwZWXPy/YvcHuSt2bA+nhd
	w3Gxe1BsvlhryAWyyUeIcfTwryNlt8p36weais+eqB+eAQuh06aGK7LvHI23gQX+WVDOzWKBvqW
	sdyiApaAyLi7XyaBazGFbTJBmU9b/LQMtxgcLbXQuRb5WXMpfuOEOtF519vg3Fzn6iN/zM1AvpJ
	+0qE4Z7zpu8mU4tQeMiQo0fKxPZN3ouTqJSV8MATraBx/jfWn9K1DEhIbZl6TTIGmF4T3CMXvu3
	arcVJopZYl4+YUBcmQmXqrnNeKGBMOcyGBJWAiKjcj+NQL9Nw5KjD8Gmny+9jtOoL/mktMZtNep
	j0yHk2QojmBOb1Uy+0lMd/TgxRDIdb4g==
X-Received: by 2002:a05:6000:2001:b0:436:3475:4737 with SMTP id ffacd0b85a97d-4379db8cfddmr32328493f8f.30.1771516346564;
        Thu, 19 Feb 2026 07:52:26 -0800 (PST)
Received: from draszik.lan ([212.129.80.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5ac7csm47748995f8f.7.2026.02.19.07.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 07:52:26 -0800 (PST)
Message-ID: <f46fa180198ec103aeb1e1c06286c6a2a0fb8b7f.camel@linaro.org>
Subject: Re: [PATCH v7 5/6] power: supply: max77759: add charger driver
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: amitsd@google.com, Sebastian Reichel <sre@kernel.org>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus	 <tudor.ambarus@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Mark Brown	 <broonie@kernel.org>, Matti
 Vaittinen <mazziesaccount@gmail.com>, Andrew Morton	
 <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, RD
 Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
Date: Thu, 19 Feb 2026 15:52:55 +0000
In-Reply-To: <20260218-max77759-charger-v7-5-e8d907ce69c5@google.com>
References: <20260218-max77759-charger-v7-0-e8d907ce69c5@google.com>
	 <20260218-max77759-charger-v7-5-e8d907ce69c5@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Amit,

I was trying out your series and noticed a few things that I didn't before:

On Wed, 2026-02-18 at 21:59 +0000, Amit Sunil Dhamne via B4 Relay wrote:

[...]

>=20
> diff --git a/drivers/power/supply/max77759_charger.c b/drivers/power/supp=
ly/max77759_charger.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..035f16822d85de94c7707ce11=
c49345c714cd559
> --- /dev/null
> +++ b/drivers/power/supply/max77759_charger.c

[...]

> +		dev_err(chg->dev, "Invalid mode transition from %d to %d",
> +			chg->mode, mode);

All your format strings are missing the final \n throughout this patch.

[...]

> +static int max77759_charger_probe(struct platform_device *pdev)
> +{
> +	struct regulator_config chgin_otg_reg_cfg;
> +	struct power_supply_config psy_cfg;
> +	struct device *dev =3D &pdev->dev;
> +	struct max77759_charger *chg;
> +	int ret;
> +
> +	device_set_of_node_from_dev(dev, dev->parent);
> +	chg =3D devm_kzalloc(dev, sizeof(*chg), GFP_KERNEL);
> +	if (!chg)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, chg);
> +	chg->dev =3D dev;
> +	chg->regmap =3D dev_get_regmap(dev->parent, "charger");
> +	if (!chg->regmap)
> +		return dev_err_probe(dev, -ENODEV, "Missing regmap");
> +
> +	ret =3D devm_mutex_init(dev, &chg->lock);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to initialize lock");
> +
> +	ret =3D devm_mutex_init(dev, &chg->retry_lock);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 "Failed to initialize retry_lock");
> +
> +	psy_cfg.fwnode =3D dev_fwnode(dev);
> +	psy_cfg.drv_data =3D chg;
> +	chg->psy =3D devm_power_supply_register(dev, &max77759_charger_desc,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &psy_cfg);
> +	if (IS_ERR(chg->psy))
> +		return dev_err_probe(dev, -EPROBE_DEFER,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 "Failed to register psy, ret=3D%ld",
> +				=C2=A0=C2=A0=C2=A0=C2=A0 PTR_ERR(chg->psy));

Why are you returning -EPROBE_DEFER here instead of the original error? Thi=
s
is quite unusual.


Cheers,
Andre'
