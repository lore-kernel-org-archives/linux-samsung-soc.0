Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE69B2EBDC8
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Jan 2026 17:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768325274; cv=none; b=sq1+PQdstVprMzNLwutBGS6PDX2vUmmJ9+NhQqz7MKZZpfb31Z6sF87cLxsvjxnt57GU8mV4zLsloKemiC0NDtgTwWrB38TOS1u4xuIm9Z/gp+YCPsIXkPSyVADd+3/JexPFK4BOGnGx3AZMxElgxkSMpiriLLq1jJoQCjzFkn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768325274; c=relaxed/simple;
	bh=frju41CddkaBY4Kzofa1mx3Txjlx1h9nbA7zsFc4BMM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jHFgHGbnFRnuJMvSgAEElJRJIxgG03SB7ld/FNk9cwwk4g+iW14aLem5w6EO42weiLzPP/20DRGBrq/KZQLvdyFuEXG9JVzGUutr/VbYdfSsrsm9Pzlqryxhr0PosvejwcU08+uCcO2Co/JzO3aKzbuCwr3eS1L/xLEuqD4sRcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fMgNnZah; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fMgNnZah"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-81f3fcdb556so1643744b3a.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Jan 2026 09:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768325272; x=1768930072; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=frju41CddkaBY4Kzofa1mx3Txjlx1h9nbA7zsFc4BMM=;
        b=fMgNnZah+tRAxSaJewPIFrosBRbo01e9/jZaE9ir/CH03hixdrLA8IZKctOPryUPKu
         1wEbM6o/hRJuE2eD37Z6LuOCykY+6TujYzSGu93mSarbbDtDNYQdcB1yH781RnW2KLrr
         e+RHhJIcS5LRIVFlI+vBUUg8kFtyiMMzfmk6qhoo7epDjLfu9DZbFp5FT3lu1XQTsrIK
         fdjG+oOx7x2IyKkdqe5Xy+P6VprdupsiqmBjUareDBv/fg+JCPAjkKFlKujsN0cZc0hR
         B3e3jlip0DNZ5BjOIObaKWNfTf1XWPt2vh4fWu7qBl4Mz1cQ+3kxdzOltuTZJGpi1iWy
         4KeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768325272; x=1768930072;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=frju41CddkaBY4Kzofa1mx3Txjlx1h9nbA7zsFc4BMM=;
        b=kEOFlffkNgIl1mQCzfy1B3NlDilh/rXvy4Lyu5D43R6C6vmG2JmLlscLaGy03ZbsuD
         hn+TdDrCN/1I2hBQMudXjTP1LYhBn2COMTiPWbsoMaEUhsLr7jy69twlMo12V50ajFih
         izrJ2+4Q1wApE6N62iuoJNTwAwykU7Tlq7sXHfloU9VTrRG9+uFRtB36kouB9EqKu8cJ
         5uL+dkKmMJxxvMfhmckTT0WS/s66Y1bek+Zl6ZWaOTCXpSWNjr0ykgAffPWU5og9AvgW
         mApmgypWhiKgV22VOpKUrZS5AirwCkL55HC8tvxSSTQPMXtFfXv7U+jY1CWwZgoJJvxa
         fGkg==
X-Forwarded-Encrypted: i=1; AJvYcCWs5NkHRhHhMDuEFssVxVp/qtZAhF//o+ExFxC3zlLyU109bhINCbX78eHEmsc2dgIi7omkEe6ohzMQhjcVBMdJ6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWZ8nbP25+nxfuTbWeE5N/PJZaJIYH4UkwYMHo/PuAtqmPvjy3
	LY78DFrpWiqCUB3XsQ6sclTB/cyIN4+tx4CRTKd5Rr2jHMxgSRB5idEFsPcPTJdUiZY=
X-Gm-Gg: AY/fxX4zO5ZxA0blL+4cvNgKjRwGwU8LYZ0aS5sJX3F58EyGjVXbs9yDIFozLN7uTlW
	v9zo/0AaK8PyDCvt0H7kd569K13/OQqf7QW06TXMVaIqUKNMcs2I2E/RdzzFA2O7p6RyhUmHOeI
	q6/OwAve5v+niUPk3VDxwFQ2UTQoGiGOJb/9l5pJu7oRR3EcCJiGNBLNiGXmhJsUpRu6iupJiO9
	jVE4/raWogZmorAM6dB0V+OSRG7F8tDoFe4H0PT702U1RxywlTz8doRVJ8I5u78Sc8K5D/TF4kn
	KCW8tn0raL3BkiCQ16Sc9ICf8UgobWX38jwTkZ5ZBRV1mBrlsjJK5D4DqQ8BYaUT47Xyek7dIWm
	LOh1CBOlkVQb7pS3z8Jdqb/WpfvdoUNA9Zt3QSZlx+5w0hbNIgapnR+15XIlMyoSCX6SX+6AY7s
	H+CyWBvna55W+5amoR
X-Google-Smtp-Source: AGHT+IG41cDPOQCdX3XgrEWI3F6tVAXs0IS7rlseRYjYEyKPvHunMkGKaXtqLwq05QF3FCKe9goC/w==
X-Received: by 2002:a05:6a20:2583:b0:366:14ac:e204 with SMTP id adf61e73a8af0-3898fa57649mr17093420637.66.1768325272156;
        Tue, 13 Jan 2026 09:27:52 -0800 (PST)
Received: from draszik.lan ([212.129.80.26])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f44a94e98sm5809433b3a.69.2026.01.13.09.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 09:27:51 -0800 (PST)
Message-ID: <4502ece1dc8e949e23f971a93dc06dab2d4f0bf7.camel@linaro.org>
Subject: Re: [PATCH v6 00/20] Samsung S2MPG10 regulator and S2MPG11 PMIC
 drivers
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,  Bartosz Golaszewski	 <brgl@bgdev.pl>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij	
 <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Peter Griffin	
 <peter.griffin@linaro.org>, Will McVicker <willmcvicker@google.com>, Juan
 Yescas <jyescas@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, 	linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-gpio@vger.kernel.org, Bartosz
 Golaszewski	 <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 17:28:20 +0000
In-Reply-To: <6ace23c4-d858-4bdf-9987-104e706190cd@sirena.org.uk>
References: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
	 <20260113112244.GE1902656@google.com>
	 <6ace23c4-d858-4bdf-9987-104e706190cd@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Mark, Lee,

On Tue, 2026-01-13 at 16:20 +0000, Mark Brown wrote:
> On Tue, Jan 13, 2026 at 11:22:44AM +0000, Lee Jones wrote:
>=20
> > MFD pieces look okay to me.
>=20
> > Once Mark provides his AB, I can merge the set.
>=20
> Given that the bulk of the series is regulator changes I'd been
> expecting to take it?

Just FYI:
1) I just noticed I have to rebase/resend this mainly due to
patch context of the binding updates.

2) this series depends on another MFD series of mine
https://lore.kernel.org/all/20260113-s5m-alarm-v3-0-855a19db1277@linaro.org=
/
(again only due to patch context) which is still pending.

I was under the (perhaps incorrect) impression that changes that touch
MFD always go via the MFD tree. I guess that's not the case. I'll update
the relevant phrasing in the cover letter with whatever you two decide :-)


Cheers,
Andre'
