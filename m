Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DE426ED4A
	for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Nov 2025 12:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763297404; cv=none; b=gAlCtz4QmPcON2jn3x0552jbA9XeX0jpIxPAXZmXZcKbDN57fVYTRwrYAS9fgGSU6sckCbZFuK8/xMi3eBmONqutBxlWA6vfzUyZ/Hpwai8uSr/90AvyYofHuMRylsDa+EMyq5YoXMpl0hSJBUubZsPkjmkTRrEudS5R9Lf+EAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763297404; c=relaxed/simple;
	bh=gx19Zcpd8CDYwPtKOoighCsasUF/1FspQKnjhc/ZnL8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FBTGHBUOmg9zInSh731ZZc+kZNPEE1wUoK2A480XKxTUM1M+RUl5nUPOao/IjVYPAAbAgiNcazxFwGCxrz2352+KRwCkg5p7HPO5aCN0pjfnRU/amJquYYoZ567dNjSmu1OHm5QbJa08LIZ9hI7+D8DVRrOwdwcVTSv1iUpmOM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GinTErf5; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GinTErf5"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso5060835e9.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Nov 2025 04:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763297401; x=1763902201; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gx19Zcpd8CDYwPtKOoighCsasUF/1FspQKnjhc/ZnL8=;
        b=GinTErf5fLa1znIuvRUTgMcM1tG1DFj5iD/HlPj13JUfYXEoenqVm0/B9qsMG6tlyY
         lyUqhbCbMUTS98bw8KokcwsQozwMfG5E6STgE252SnmreboSE2P8G7R+7ATwoMXo3Fib
         4EEVKLPdQPt7qfSH3aM4uU7cSipLth126j6HTv41cR97bYR5PGxN/P1pj/IhrBXi9Dai
         kFo0EUhDbOfrB2/5lmeiyia0MC/QETYvB9CoolrkK/feeHpRasLCyW67m1ME0LlfdCsm
         nDZT9q1pE+BDemfNJQYhRZRnxOmcA93GxNCrb+vU9wWFfR0K6jAxuW1CzhAu7X2VeoLK
         62nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763297401; x=1763902201;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gx19Zcpd8CDYwPtKOoighCsasUF/1FspQKnjhc/ZnL8=;
        b=aQB4z2ICn/QwAmHQv2QTKIvjD62jqvltBh0juao2Kdm5MutL82gKIs51wE2a+9n05U
         n11gqfdXbbjuI7I5hP786Qjgf2HAqtxxEkwJMVfgnTaW7PokcmCeFXKc32+lvE+m3hTR
         1BKp/TwlIMKq6DhcIzC2ngY7hK1EcLwbP6jFym2BaWULo+xt+h/ZbjcLjsJocmKA6RkE
         0ogT/uSh2wXSFWQPNKG5yH/nK4wrjQgWfOh5HxwhYP42gUMwG/fRJ3Pgcsd+gvP4RCJq
         oNXPZxl8i+HKvf2JQ5ESyVpW7UWi5UtSwPt4fUFTZl+xA7FxCogXqJUCZQFagVjnPWAi
         1XRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUih+KDVh4ReJIQkdqqfLjI8gZYiCc8YhY+/Jj1kCrBbm7kgoGEggTrWQj9/YTG0TOmkzzJueQ7vT68itmgda8L3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWIHUAvy3SA0agQkIA3Ca1Tc8HeTC+49dh3KRChz53GuywkVgB
	rLjNlu6hYCOzzsyUtxxSV6CeoAR6cHZQ54t6tL0GSRzai6LZ9iNh9vLE5TBHUc2s/RU=
X-Gm-Gg: ASbGncs09q75pkdBD+GXDBabdDnJPxAXq2De9mzwv63VeqVc1IueDb0NUPGJeTTSTHZ
	z3bvq081S1eBQEEYS+Wwt/C/mlzOBagyTB+qfNqwTYEtLOVvqEriAp8p2h03M8vPuSUPc/NNt1i
	WJR4IzfgncKe1NzW4VJKP4c0QJ0zq/cT1yR9MVT1PfkQiPiETj2jXw9gX/g+M/YEPNtJj780rSl
	Ltvko4reR2Wl7mewkMgiE32tcfOTXce/zgASHUEmRYez28ogo8Lt5fRSW+410pS1q6f7JbptQOp
	e1UTYu6Z9RoqrW5aYhawXUV1hdeG8XxPIOh/PeP6WZelQL1+S4XWirBBPIMe3zU9arRrq8krSZ1
	r7Ba4E7WTenaPR2jELjXFa2b/0jwyhtyV+/8PphLfubJ1E1ISUfWk3LSvWQx+hPHDvVXSGFKt4K
	HEVqLIulJVVRNGoL4uzldBGJTV8g==
X-Google-Smtp-Source: AGHT+IEgM25ruVJqzrK8xcgzvUOa4umu05fH/BlFqcaH2LfSeCBEN0GdEDr4Mmb0LqjvXyPsvNFoCQ==
X-Received: by 2002:a05:600d:486:20b0:471:793:e795 with SMTP id 5b1f17b1804b1-4778bf41181mr85683265e9.0.1763297401071;
        Sun, 16 Nov 2025 04:50:01 -0800 (PST)
Received: from salami.lan ([212.129.81.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e2bcf9sm254128125e9.3.2025.11.16.04.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 04:50:00 -0800 (PST)
Message-ID: <845ca29cf8af53bd3093d1dcbea64cc3e04432f2.camel@linaro.org>
Subject: Re: [PATCH v3 09/20] mfd: sec: Add support for S2MPG11 PMIC via ACPM
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,  Liam Girdwood
 <lgirdwood@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski	 <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Peter Griffin	 <peter.griffin@linaro.org>, Will McVicker
 <willmcvicker@google.com>, 	kernel-team@android.com,
 linux-kernel@vger.kernel.org, 	linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-gpio@vger.kernel.org
Date: Sun, 16 Nov 2025 12:49:55 +0000
In-Reply-To: <aRklfJtOJ_Cy7tEE@sirena.co.uk>
References: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
	 <20251103-s2mpg1x-regulators-v3-9-b8b96b79e058@linaro.org>
	 <20251113162534.GO1949330@google.com>
	 <45ce203c03ec34631a0170baa7e4cf26c98b9cd3.camel@linaro.org>
	 <db7e95dd-2361-4579-b52c-b9556da4633a@sirena.org.uk>
	 <f1e9a9e35f7c16d8db0e39128eb184f3f42b7d02.camel@linaro.org>
	 <aRklfJtOJ_Cy7tEE@sirena.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-7 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Mark,

On Sun, 2025-11-16 at 01:14 +0000, Mark Brown wrote:
> On Fri, Nov 14, 2025 at 09:56:41PM +0000, Andr=C3=A9 Draszik wrote:
>=20
> > I'm happy to use an alternative approach that can solve my problem, if =
there
> > is something that I have missed. I think the commit message for patch 8
> > describes the problem in better detail than this one.
>=20
> The more normal thing would be to just register one child device for all
> the regulators and then register them in a loop in the probe function of
> that device.

Thanks Mark, I'm aware of that, but that approach doesn't work as
I hoped to have explained in the commit message in patch 8 in this
series, I'll copy it below:

--- snip ---
Bucks can conceivably be used as supplies for LDOs, but currently it
can be impossible to mark BUCKs as LDO supplies. This becomes
particularly an issue with the upcoming support for the S2MPG11 PMIC.

The typical use of the S2MPG10 PMIC is in combination with an S2MPG11
PMIC in a main/sub configuration. Bucks of one are usually used as
supplies for LDOs of either itself or of the other: several S2MPG10
LDOs are consumers of various S2MPG10 bucks & S2MPG11 bucks, and
several S2MPG11 LDOs are supplied by various S2MPG10 bucks & S2MPG11
bucks.

So we have a circular dependency here - LDOs (and potentially also
bucks) of one PMIC depend on bucks of the other.

This means that if all S2MPG10 rails are handled by the same instance
of the S2MPG10 regulator driver, probe of all rails will defer, because
the supplies to the LDOs can not be resolved during probe. The same
goes for S2MPG11.

The result is that neither driver can probe successfully and probe will
ultimately fail. In other words it's currently impossible to mark BUCKs
as LDO supplies.

Additionally, multiple (LDO-) rails may share the same (buck) supply
rail and some of these LDOs might supply important consumers, e.g. RAM.
To stay with RAM, if one of those consumers needs to defer probe before
the rail supplying RAM has probed, the shared (buck) supply gets
disabled and the whole system comes to a halt, since Linux hasn't seen
the DDR-supplying rail yet, and hasn't had a chance to mark the buck
rail as having another consumer.

By splitting all rails into separate driver instances, the circular
dependency is gone, each individual instance can probe when its supplies
are ready. This approach also solves the multiple-consumers-on-one-rail
issue during probe.

The mfd_cell's ::id field is used to inform the regulator driver which
regulator to instantiate.
--- snap ---

Does that explain the problem well enough?

So unless I'm missing something, registering just one child device
simply doesn't work, the rails have to be instantiated individually.

One could register all bucks as one device, and then only the LDOs
individually, but IMHO that approach would make it more convoluted,
not simpler.

Do you have any other suggestions?


Cheers,
Andre'
