Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D103A9630
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Feb 2026 10:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770288839; cv=none; b=WHBHSjtPANb4t44ib3qHbGvUa42RD3gYtNtyoxrzidSX/XNL4kE8x+CqYoPPn93FQWzSLe5euutf3saQRiF6Fa3d9ejjhgGmMyzwI5hdRg64HAtpOGHpZi+LvE5UncgbE+BDp9ubPfzeucaVHBmHnlxveT8iLI4F1zOC09MXWuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770288839; c=relaxed/simple;
	bh=dxFq6aqpPeZS/KnlY9gG7jWe91WmosMBfsS9OGUv+zA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OsF2e0yBUXESBnRac5XsuX729v6gvtClaXGFVfX37XQvoMaqFkiGYs1wl8PpH16Zt8703YxDYmDXQ9GFDOSyyFgecsiYMh1TE77UQup0ddVuKBwc/zqOqhoa4GZXm0+WuWJPoyf09EEWiLveBZJqP/e7roa7bUBhMfUJxZjfSzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y7wVITrd; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y7wVITrd"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47edd9024b1so6354395e9.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Feb 2026 02:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770288837; x=1770893637; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5MpsejmhVxhP6NeQbHNzOvF3lV3oAS4n7Jzmwih0cw4=;
        b=Y7wVITrd4H2B2VrYNm16a5O9nGvyzthwy9v1r9BUHq9OC7edUAU5W9PmGyeBEsABvk
         EFPcJu2+Ed3JzR3zaFkQniktMvPfwSZ8H5p/9WCv+G+ity1CyJ6sF68T402KDojqSLfY
         sJHm6DsckdO3soPvxoUby+kVKiDrCTnG2YKy2Rk/Hd7hcXCv1K+syLIQESU4GJLZ+oPg
         WDTIbTiaISw4Ha6dAqn7lVixg4V1UqLsHH09CY9GU6cjOOvJ3YgNyPyRxlTOBhfk8Qgi
         yQUl1QIZ92Rypj+Q2euwEiRfVBn0CyIwlcPeMmffpMIkhrPSOaA2U3x/THTXrtWgaugr
         Aiew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770288837; x=1770893637;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5MpsejmhVxhP6NeQbHNzOvF3lV3oAS4n7Jzmwih0cw4=;
        b=dyN1UtgyhLbjLyZFF7Xy/Xi6XrnveBTATts3ASK8vWvntFztriaShg773QLVy3EsLC
         7W0xg6v16tI81/4tYGP+NUZrUObbO8f9++T7l/QilGTTJMpQn4nw62Z+VbR4gQ5zxneP
         6YOxZCvpZHlWCnPqpeXYuhA8M7jUNFCcneSzhdKntzG+nYyDdzjBvfDQa/uGr70pX98c
         frXLQgBwiNuhLEowbEuzk7NffQTmuH+czB8w9fnqCOJc5G8iGKv8+7amYgVwlboksUzT
         cbtq5I9Br2O0JSd0QbOE5UWeDI4WORuJ2xD/xEZcVgf5cqxocfSOCTlbz7eSyp/NNtrR
         kkNw==
X-Forwarded-Encrypted: i=1; AJvYcCV09g3oKaPsHRqPoYF5Q0p8t6ghpfIxfZUNp3xnU4uVOLwS+IJShadzqoBZn3Jqv5FTDQcX+qpbepRSF0+R41Um4w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0BhVPvEoOuUSdsua0BeK4fps7vN9X7JtbPriUAw4pPPHsB5LC
	LFsZrwE8snongrQ7mPJOtauWnJBdflV1H2+50IYLPRGYwsIBs5kU6E3BiiQjRZNg6eI=
X-Gm-Gg: AZuq6aL2rmsMjZjTglMuhIJk4IbcVcd0ygt4IwrPc3635nInt62IronL8ctCa1vy5K1
	uV1CG/o2RvNwOavDSE9vzpYiTK76urdRJItCU9k9IDNVuC3YPFFWsyK3dwGdmgIsWtjFqndx5UM
	8whP0/ozn/YOjLcO8RkJvbJUnBYtkwo2KRdWG5DJVioSY9gTGOig+2FXhIlF9kU4sBDMYh2qe+b
	hjcfZFjsXt08OhtVj4/m7oFgCPkZLqfOwmwTWWcRjUntQFW7vhdTYkrSJ1B8vwxt0ZrGmeRSOWO
	AHR8z2rs8st6O/zdB6RFlQi3RBEAFS7bLMo5r9NxCymyT3JTgZmSBxMAjvOBbjSsv5pCht88S+L
	PHnSUFWRJto9N4/u2p5tzFaBk5Uz0dMh875NeBUq+hkitAsF1sBeoOsi4CcbfmG5qjtc1dF4rIt
	HxEFudLsG1uT55SY7pXQ==
X-Received: by 2002:a05:600c:6290:b0:47e:e20e:bbb7 with SMTP id 5b1f17b1804b1-4830e990a83mr75256515e9.25.1770288837395;
        Thu, 05 Feb 2026 02:53:57 -0800 (PST)
Received: from draszik.lan ([212.129.81.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d4a6b1sm50273325e9.11.2026.02.05.02.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 02:53:56 -0800 (PST)
Message-ID: <09c1ac114ab108d5f186ee581617a524b9651e96.camel@linaro.org>
Subject: Re: [PATCH v2 08/12] leds: flash: add support for Samsung S2M
 series PMIC flash LED device
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>, Lee Jones
 <lee@kernel.org>,  Pavel Machek <pavel@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo
 Choi	 <cw00.choi@samsung.com>, Sebastian Reichel <sre@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Jonathan Corbet	 <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-doc@vger.kernel.org
Date: Thu, 05 Feb 2026 10:54:16 +0000
In-Reply-To: <20260126-s2mu005-pmic-v2-8-78f1a75f547a@disroot.org>
References: <20260126-s2mu005-pmic-v2-0-78f1a75f547a@disroot.org>
	 <20260126-s2mu005-pmic-v2-8-78f1a75f547a@disroot.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

On Mon, 2026-01-26 at 00:37 +0530, Kaustabh Chakraborty wrote:

[...]

> diff --git a/drivers/leds/flash/leds-s2m-flash.c b/drivers/leds/flash/led=
s-s2m-flash.c
> new file mode 100644
> index 0000000000000..1be2745c475bf

[...]

> +
> +static int s2m_fled_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct sec_pmic_dev *pmic_drvdata =3D dev_get_drvdata(dev->parent);
> +	struct s2m_fled *priv;
> +	struct fwnode_handle *child;

[...]

> +
> +	device_for_each_child_node(dev, child) {

If you switch to device_for_each_child_node_scoped(), you can get rid
of the goto and the struct fwnode_handle *child declaration at the top,
and you plug your leak in your early error return a few lines below.

> +		u32 reg;
> +
> +		if (fwnode_property_read_u32(child, "reg", &reg))
> +			goto next_child;
> +
> +		if (reg >=3D spec->num_channels) {
> +			dev_warn(dev, "channel %d is non-existent\n", reg);
> +			goto next_child;
> +		}
> +
> +		if (priv[reg].dev) {
> +			dev_warn(dev, "duplicate node for channel %d\n", reg);
> +			goto next_child;
> +		}
> +
> +		priv[reg].dev =3D dev;
> +		priv[reg].regmap =3D regmap;
> +		priv[reg].channel =3D (u8)reg;
> +		priv[reg].spec =3D spec;
> +		priv[reg].pmic_revision =3D pmic_drvdata->revision;
> +
> +		ret =3D devm_mutex_init(dev, &priv[reg].lock);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to create mutex lock\n");
> +
> +		ret =3D s2m_fled_init_channel(dev, child, &priv[reg]);
> +		if (ret < 0)
> +			dev_warn(dev, "channel init failed (%d)\n", ret);
> +
> +next_child:
> +		fwnode_handle_put(child);
> +	}
> +
> +	return 0;
> +}

Cheers,
Andre'
