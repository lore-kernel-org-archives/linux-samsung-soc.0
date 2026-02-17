Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01F333C52F
	for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Feb 2026 12:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771331406; cv=none; b=ZXEEPvJokAHyP9YUpxgKrtfEcC6FyJLXy984VDJItQbKtNF+VSdfEXyVPX2kshXFGrhbT8hNB/MCBZa+04FPwLgOXA4Pp8NHTt7IGIG9SQclOGOFHzNr6TkMy5PqIco4b2bzC7fXbGozEcRk52aNTkR2kckJAgjTxgI4cDrHyGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771331406; c=relaxed/simple;
	bh=veW04ITIm+kS0Va3WwG1j5wGlLSf3zAowo/9T/TxpYk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H/ajWbzFfWDqX6SlPhI65ymK1LVBHJlYR5viVk4mOcVZ4sh1/nY6vJRnEV9QW5Oqd+MXlofRB5ZujfOh38WLR7QUdK3mxPFi0qCzXyiSa00qW8S519LkZQFh/VjtM011xUog+rdo6d0yJ+Aau+3XAek8xTkA45tlv73huyp615A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VVaqjOUl; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VVaqjOUl"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48371119eacso38972855e9.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Feb 2026 04:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771331399; x=1771936199; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=veW04ITIm+kS0Va3WwG1j5wGlLSf3zAowo/9T/TxpYk=;
        b=VVaqjOUlEnbQTJphLvsPvgl4lkEKSy4SyceAemvE1XVLVwgZW65D6T8/t5uU+loLX5
         RSu4hZ8sXzUlckC3vMKUTvP6unNvI1IC4pkil2Vz7YWZ0LklilbHqY3gq9/HZJtevgWK
         kF1oLzDGjFwhTgbnafuDz+XwySMKwyGDr8zGuEMvUwFZFZZGUCZo+GiCiidzMVCzVoue
         QouAVgMpfofzxLSJKRq3xmU+eBi4RKYEPX/B1GkwuYufz299O4VeZU3/OpnK0biO8FU5
         FM1lIDdJoWkrog+qhsrBpp0OylUGNdbzWF1mRQ6MiP0IM1Su+TDXzBjfWUMNmKCdHB3b
         KmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771331399; x=1771936199;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=veW04ITIm+kS0Va3WwG1j5wGlLSf3zAowo/9T/TxpYk=;
        b=FDjnu37BrSBwyBe7q8EogrnF8IwJs0rTb1L/F93KJ3bn3szuinxLSCb1mj69sDAAKx
         nnjI16UhRDiukyX/fas909mju4dLpjZR0oiXDASTkI6r0+H/yQCAZrIfXqopKc3ek/wo
         NDOp9Kwrgp2eCkl7lnqFNbYSaVCVyk+cXiym3LZcybjaxpYvsUk98W4HLX52ydd30rN6
         ksHBr3pKr354zz4/VIPZp4dslakX7oLne5LZH3A2prvGWi7srEE+uHv7D/LA3bO4l3jY
         D1JsLLizL5u8qJX/oN31JFej0mpW4XHaKZ9fePhhhS4Hoc1COAp8E3rQwi+LJd2/O1Zw
         2E7w==
X-Forwarded-Encrypted: i=1; AJvYcCW+xsEm/exMcBfr12d/BvwUAcvjAF3brtmUD3fj+o3N9gb8lDzEDWnsULnUTjTRmvyDTe1a7J6gFWGMAf5CjQYglw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpyRUQn26RWWJsGMWFtAbq89UEmcVH6XaLw4IKDk/z9eSp+ubM
	SMDZz7yNhwYAfnELB0XC9O2wJgrfpoOO5JYw20CJosqde0KnFVTyWSJ1r9R+y2hRP6U=
X-Gm-Gg: AZuq6aLuPRC5wu/Idn1EVlAD/f9q8A1PrdBhdhvsLgu6iK6+4nbz+SNJKozLyFj7XY7
	AhOI2oflp5xejr5z4TIdkq8h2FN6uF4F22tDiCWaRu2i4PH8lYj0g9JL2oH8nocDSDk8Mc3jL5V
	SKYF6xE5LMU2lqqnmN30KQzFa19PLTPsLam2W6HWi81L7cXGIkKnanRyjKuAe3Cj1p5ln3mN7h2
	hJ86FxuqzUeKfdFKfa3CNKuHCRMz1sv34fNYyDvrmI91vdcLBIjWqwRhpFzc/4flkIxHVaV6Fun
	JdPBSHpDCHeoE5w9x8rIxybDfuq90wXEfUa5K/fhGsNTSelhb66XrPho/AN103jzEMMA7ukuZNM
	1xhz2kYxb3WBZd/JDpZG+jCvfKyu2HP2uUHajlrgbuW68QaiazvMwmJdTFfpsx48emUCWzqen6D
	mEpMeho7nPumMVXpN3hiSVKff2I4I=
X-Received: by 2002:a05:600c:1381:b0:483:4a95:66da with SMTP id 5b1f17b1804b1-48373a1ad50mr231637905e9.13.1771331398916;
        Tue, 17 Feb 2026 04:29:58 -0800 (PST)
Received: from draszik.lan ([212.129.84.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a44ae0sm99721435e9.29.2026.02.17.04.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 04:29:58 -0800 (PST)
Message-ID: <9ac93f5456adb209bbc0e750434c356000eec6d6.camel@linaro.org>
Subject: Re: [PATCH v6 3/6] mfd: max77759: add register bitmasks and modify
 irq configs for charger
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
Date: Tue, 17 Feb 2026 12:30:17 +0000
In-Reply-To: <20260214-max77759-charger-v6-3-28c09bda74b4@google.com>
References: <20260214-max77759-charger-v6-0-28c09bda74b4@google.com>
	 <20260214-max77759-charger-v6-3-28c09bda74b4@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2026-02-14 at 03:12 +0000, Amit Sunil Dhamne via B4 Relay wrote:
> From: Amit Sunil Dhamne <amitsd@google.com>
>=20
> Add register bitmasks for charger function.
> In addition split the charger IRQs further such that each bit represents
> an IRQ downstream of charger regmap irq chip. In addition populate the
> ack_base to offload irq ack to the regmap irq chip framework.
>=20
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> ---
> =C2=A0drivers/mfd/max77759.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
91 ++++++++++++++++++++--
> =C2=A0include/linux/mfd/max77759.h | 176 ++++++++++++++++++++++++++++++++=
++++-------
> =C2=A02 files changed, 230 insertions(+), 37 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
