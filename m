Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EF62F8BE6
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 21:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763157477; cv=none; b=g5llDIPbyGVMtJ1dJruaFPL1b1j2e6MA5LzN/kxnL2K6bykMVl0Tq5MRRQBqTHie9pSqmj/BYj/aTEOEzlewsZqdiADYCbF2c78fWZdKG55jV/2yIltYjrTmQhtEHLwlL94BTl2iG8eMpVO0i0Le+4nXslGUPfk6V6OonFPzRp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763157477; c=relaxed/simple;
	bh=NejWZ+/c7eJzxkqIJLUq6kOMKEwS/zt3yIZkcOMgvtc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hcr3I3gyBbjOGiz40nG+dNKNKcRXMTuxU/VOEpWkmN8AHB+0YAodiBVfodMBHMGaW5QBJ7HMxA+eVQooQY7ch6enqBSwOroGNKS20mvKj0PeqA4TDNtZIGsoAUV/3DMgg33R93BeT+502sJ0fHjbfL/gtnQCgOiu3VvOusX9Hdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dvq7y1MV; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dvq7y1MV"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47798ded6fcso192385e9.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 13:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763157474; x=1763762274; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vbNWOmHpdEa5AGQhVuTfa8JxnnOc6K3WrOIf2UEgPrA=;
        b=Dvq7y1MVyrcGRpWXca4pLx+e+8RdgNkKTnASp232YHPUasCie0xPxnL9F7Rp+RCoyq
         xo6RX4VzSZ6jRzeRNwOpeLA56N452p7lXYF25nlHdwaghfFqeXqbU3kaSwY1hnPqDJU/
         W1GnX0hoRP+jen3R+qFgFgruB0GTikL++sxvCePrrLkMHK5LlOw5h6XpCGMgnVhsotEe
         6uTF8cmdry+dmzj/0Wtw5EhxPuG0nR0OUHaW75A2EG9HIPKG99ObxHI1fv9w1UyBAwgS
         hQahVYFxliyUAnTbEXMEsbTII9+Uw01y5QzWXXhYKlkbJ+nIvTjHizQNefZM6N4EhhPC
         Vh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763157474; x=1763762274;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vbNWOmHpdEa5AGQhVuTfa8JxnnOc6K3WrOIf2UEgPrA=;
        b=LkUIoa06/gH+9CA3cpaCF+j6C6dOtF1LRT2H33pW3sF7wq9g4VY80BtLdFotK57hdV
         V9VzBRRHfcC4oeY2kE++xKL6ME5QeYOwg8tRhbOezylg0snIwtgIsQRQpVOwlNCGKA4N
         GZfuVAuxn1KqiS46gmwyAdPmNSYWKoWD5qNDohWkWz7dWWf3gWL8uwYKTV7GpcEMle97
         5WLYYXIsV1R6b36uIQee0M0HEAuemx+C/qGHL9mnpMzNuoYDvMPH4glTVksIpgNy5hst
         /UblOP4FK33TsOnsngUww/keoPeHZPcEAl/ckBr2a5xj/ouBVfewttUiGLWXqHCVxO5v
         ZuYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvyuOXcZZGatEnL6AaSUKG5DAyb+yT7INh4lwCZS9dLoxy4XhUXEnwj7J+pHVU3uDMZeAx7u9ygsucvpM3k16cMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPf9hkhOHWiQO+RTSJVYLMrIDntR/at1ujhsXSEfxR6FR6gMm7
	+kU5Ed/q2e///bStwjas309+ldLKqSNj3IBb2GnZkRWczAwezJjC7HrWcmh570KcOcI=
X-Gm-Gg: ASbGncu+u6OVieSGEekbjh+32QIj3KnC6qKdmnaadOob7YsZgRpJrnRr74bmpf62n61
	ogmDz+85nMrGmw05egGPTZUF9tnfadoEOEkwypo34giXu8eCtIT++14q6awvpxGAADALS7Cz2FT
	Kbbf+Yo4YsbBc7I5a5n8AUfvbH6VwI6FCcQ0l0ldKKhiKHL9mVs8LzPzfWaii65avPXHZp0jqHx
	jZuuUj9BOhLvVgEyvuob48821/HtIu4/wY/Lzl07dekWsYVLVNvy7xwcDfZZsosmNBQuR1HElVW
	dRxFBnXoIrtRnMjeP+SshXK244gQByNpMulTK+NhsBXWzd1IR9EbFOXD1LW1QU7ahVHANKSlHOf
	jeTaY70BrCyg373CcgeiCPDUWnLeo+malCF0PpCQsuC7qxU5FmbypQ4Owonjo6Ed7e0WuGF2Xic
	q6UROR82yVkAQeCE3FHQ==
X-Google-Smtp-Source: AGHT+IGZJojwQ5TmPU9HbJqZqk3xKa3jFdu0oCf5mPPHwz3sSCeo2kX4zEUPEQ1wpVk6J/TBJSkFkw==
X-Received: by 2002:a5d:64e3:0:b0:42b:4061:2416 with SMTP id ffacd0b85a97d-42b59396ee3mr4481398f8f.52.1763157474288;
        Fri, 14 Nov 2025 13:57:54 -0800 (PST)
Received: from draszik.lan ([212.129.82.217])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b8d6sm12805516f8f.28.2025.11.14.13.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 13:57:53 -0800 (PST)
Message-ID: <f1e9a9e35f7c16d8db0e39128eb184f3f42b7d02.camel@linaro.org>
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
Date: Fri, 14 Nov 2025 21:56:41 +0000
In-Reply-To: <db7e95dd-2361-4579-b52c-b9556da4633a@sirena.org.uk>
References: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
	 <20251103-s2mpg1x-regulators-v3-9-b8b96b79e058@linaro.org>
	 <20251113162534.GO1949330@google.com>
	 <45ce203c03ec34631a0170baa7e4cf26c98b9cd3.camel@linaro.org>
	 <db7e95dd-2361-4579-b52c-b9556da4633a@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Mark,

On Fri, 2025-11-14 at 16:46 +0000, Mark Brown wrote:
> On Thu, Nov 13, 2025 at 09:43:29PM +0000, Andr=C3=A9 Draszik wrote:
> > On Thu, 2025-11-13 at 16:25 +0000, Lee Jones wrote:
>=20
> > > > +static const struct mfd_cell s2mpg11_devs[] =3D {
> > > > +	MFD_CELL_NAME("s2mpg11-meter"),
> > > > +	MFD_CELL_BASIC("s2mpg11-regulator", NULL, NULL, 0, S2MPG11_BUCKBO=
OST),
>=20
> > > This is highly irregular - in that, we've never done this before.
>=20
> > > We're going to need to have Mark look at this.
>=20
> > I did see this in at least one other driver, ah yes at least
> > drivers/mfd/88pm860x-core.c is doing something similar, maybe others, t=
oo
> > (I stopped there).
>=20
> Other drivers doing something doesn't mean that they're following good
> practice.=C2=A0 We do also have drivers which have multiple identical IP
> blocks and are passing in resources with base address, interrupt and
> whatever for the IP blocks which is different to just passing a Linux
> internal ID number through.

That's fine and I understand that. My reply was in relation to that this
has never been done before.

I'm happy to use an alternative approach that can solve my problem, if ther=
e
is something that I have missed. I think the commit message for patch 8
describes the problem in better detail than this one.

Cheers,
Andre'

