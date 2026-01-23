Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E0D33D518
	for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Jan 2026 09:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769161149; cv=none; b=h75lC4MquwXB1aUnh+DH+Fk+/Txr17cKnBtqCQBK9l+o0z99jgnhH5SIsQShFOkfo2IWgrhArpAzf3mVVmyia37T2+cZCyG/rMIT3mYLxGNFVXt3Z0lv5/nfnT3jLLmGBpiFPXDwuErgXM52besDTLcq1lHliepBwLyg7T+thLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769161149; c=relaxed/simple;
	bh=1InEW1W4c/YN1YNZ7twlVHXHgi9spzvj4pl49gkLuYs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=adTNYDYgzYUgQwrDszAtPdEsxnGf2hz2OOtuuRzBmIOigqGaHHWG9sU36Jm7a/1e+64o+0fH3jg+LGQlsQqtYYfxwGhTKbJeIHV9N1grI0CjW0bc27mZJKpQKckrzuDoMWbrh2a/OxYz2zibEF0K9kYzxahay9V4FYtQb9E3cIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YWGfAurk; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YWGfAurk"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47d6a1f08bbso9580445e9.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Jan 2026 01:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769161140; x=1769765940; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1InEW1W4c/YN1YNZ7twlVHXHgi9spzvj4pl49gkLuYs=;
        b=YWGfAurkiMJUJwm/BOEr3KwVBQIgxTI/teVtUulMd8ForjGUn9O5hconJZ539QTcrc
         EfktOTkpkabQstqIOheIQtGcCsIARZat+rV7toFjDnQxeA3/XRo5+ohObo8g9G5b0daR
         XKKCRsH7oNewPHacHo5w1ksdNQw+X8jO3FBZYTNuoilml0wzWWHSjwQMbkPCdhwWqvqs
         yge0dZ6bwKwioWgzXGTD8uvELYFDc6WZGVcSl1QpPkPDaJwNBLRrn5g5aYsM8dLByI4V
         oqrlIT7BRAeo1wFc/+4uk1tjlaaEyBXoiTT3zJ/k5/MpIxHHYflnl6fE6WEf6fB/ngHp
         Qeag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769161140; x=1769765940;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1InEW1W4c/YN1YNZ7twlVHXHgi9spzvj4pl49gkLuYs=;
        b=vAf5YTt9XgtccHEAKvZhUccsIGJEYmv6irhV0Yy+h+/W37bYFlFejD7TIz/DGjZqd/
         TI0czjRUFD4r9igcxdNaVuB0orWhvohdy5OzwhTu1jWO9RU0ArDNtA7aiVLF+fjVuqKo
         fq7ouv3VJAYUtaLRw9h6PNnfnoAJ4DwNClKcQBAL9fC0c3MtTgk1TYlNOPctQtjqrzdD
         WhunjUV7TLIW5xSh7hJFYj4Lbvwj+HGrHj2PtFwKayYqxJlDkwwPM5QiUyx+E6+JX2uU
         QrUIJ8B2v9mvcGggnBDkBMFZTVn4pP/Rat9hKi9RZtXcSzGZNzpJ+XeGbtB7KiIYoE6b
         oYow==
X-Forwarded-Encrypted: i=1; AJvYcCVKIqJNj/46zEDzRs4g0eIPby5JXPvWmfboTh+gQNcRcaMR3+e1UZyBOkpsfH3dTVnWmCRxgXy493+5IwODN4c0mw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6fUE1WDn06pUMLNz7Hu8JEfDOcV3klyj0vwRoai8B1b5/kMjq
	1+bqMbXuSiZYAi4huTmPIQ91fxIwUi7rJIT6A74+MqeQ8SaPWsqzpPrhYlXghvQlzLA=
X-Gm-Gg: AZuq6aIiw6Yeyx26nTK0lgJlwyUy0hQq0hS5ZR8sP2xgKEf2OBo4ToflBw0DKCOrTJo
	xjtqeKI7uyDkqWziLINttO3cO5YPvj4oHxVJ+zk96BNg1q3Jgb3Q1yTEEJY+I32Rlo3swActQnP
	Fv0GQN7ooEKwT70IUeNaTJmHDznegoabgosDe/8qavOZ7qZP/pcX+bbPV8uE6aOEcmVoKOuRkOQ
	IE6c2lct1G96kozj3oxwHlmj6InEYdWwcMWqMVniKZGB854MGv/Uapw7AddBrEIvZRybeQqdKnE
	+korHRKU6r/opwe4c2blqCIdoyVOTrM6utD+d/hq9U1eS9KOZlcGNulPGyT0aBXZ+e/MJYn1jve
	W1/3gB8Jm+dihwpgdlDyINReuokRY8BWOvHbw07klIOHdjpNtEoHTbyqaa/zVaZyrxYoIYEiLWy
	hs7I816DXzxTtieutCxA==
X-Received: by 2002:a05:600c:6215:b0:477:5897:a0c4 with SMTP id 5b1f17b1804b1-4804c94156emr41349285e9.4.1769161139974;
        Fri, 23 Jan 2026 01:38:59 -0800 (PST)
Received: from draszik.lan ([212.129.79.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480470cf385sm122548615e9.13.2026.01.23.01.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 01:38:59 -0800 (PST)
Message-ID: <0b4c5e699ce1d8211314a2bb28d7b6566e577037.camel@linaro.org>
Subject: Re: (subset) [PATCH v7 00/20] Samsung S2MPG10 regulator and S2MPG11
 PMIC drivers
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Lee Jones <lee@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,  Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>,  Bartosz Golaszewski	 <brgl@bgdev.pl>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij	
 <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Will McVicker
	 <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Bartosz Golaszewski
	 <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 09:39:00 +0000
In-Reply-To: <176909970862.4046298.23888884171864307.b4-ty@kernel.org>
References: <20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd@linaro.org>
	 <176909970862.4046298.23888884171864307.b4-ty@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Lee,

On Thu, 2026-01-22 at 16:35 +0000, Lee Jones wrote:
> On Thu, 22 Jan 2026 15:43:27 +0000, Andr=C3=A9 Draszik wrote:
> > This series extends the existing S2MPG10 PMIC driver to add support for
> > the regulators, and adds new S2MPG11 core and regulator drivers.
> >=20
> > --- dependency note ---
> > This series must be applied in-order, due to the regulator drivers
> > depending on headers & definitions added by the bindings and core
> > drivers.
> >=20
> > [...]
>=20
> Applied, thanks!
>=20
> [04/20] dt-bindings: mfd: samsung,s2mps11: Split s2mpg10-pmic into separa=
te file
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 commit: c19ccbf37758f90064f7b1=
e32ec291954d97b426
> [05/20] dt-bindings: mfd: samsung,s2mpg10-pmic: Link to its regulators
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 commit: ac1068790221a421e7bc4d=
acadfe8d39d6bec3a9
> [06/20] dt-bindings: mfd: Add samsung,s2mpg11-pmic
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 commit: d0cd9ded4bdef73303e65a=
bbeae47b00b7288059

Thanks for queuing these, but FYI, I think leaving out patches 1 to 3 will
give validation errors.

As mentioned in cover letter, the patches must be applied in order, for
bindings particularly the mfd-binding patches depend on the regulator-
binding updates, specifically patches 4 and 5 reference files added in
patches 2 and 3 respectively.

Also, without patch 1, I'd say there will be validation errors from the
example DTS that patch 1 updates in preparation for patch 4.

Maybe that's all OK while things are being merged via different trees, but
I just wanted to point it out.

Cheers,
Andre'
