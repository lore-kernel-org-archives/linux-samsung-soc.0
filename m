Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61A926981C
	for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jun 2025 15:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750863941; cv=none; b=iyf0TYZNCAQ/xaHmquuhcHQX4kzALOfTy1+9wbRFdANLsDWFGkuKeL6EOX2CZ5yzfONjU7O3X64eBbLpRzejeA86oG0w6v/CymlesVOhi7yj2H7FvE+qKjbNylr49pxwKP+8XHdgaqNKNVwMOaWqIRxk8D2wulvZB6YEyRQs7UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750863941; c=relaxed/simple;
	bh=wlj7HklWXe5YtCatjQKwWuAP/xP3g/dB4xsuny3pKlk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M75eK4qcqaKGFI1LIfRxgrNUoCRn7Nr1Nb3sYkGg4n6jG5OPECeH64QVPlyCK7Urj2wHGiT13niP65CEyo4wg9JeaSkAcmw+Q6pSb2zkYaE+aJfQutR0H81LTDt8B2dusn97QAlLHXIAG6mQwLXROcidOD1UeKg5m+GTcyREZ2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kKSQ+wo9; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kKSQ+wo9"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4f72cba73so662560f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jun 2025 08:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750863937; x=1751468737; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wlj7HklWXe5YtCatjQKwWuAP/xP3g/dB4xsuny3pKlk=;
        b=kKSQ+wo9oT4PkbrUUZKhpI+S+N4jOlQGfiE8lvJWDeGpX8dhARAQSHw6Zd5qkTLbm2
         /rZ2srKSxSFCLeipJLGV85UllC0v60+4WdUdKmS3isHvluM8yN4kDtgZTXPd9vBQ+0xQ
         b1kdAw0P5xPgiohw1eb0X5AZCd7OoRz3Zgm5GBJOw2DuqhJhGCuHLHEJ7IPxTdVPE01U
         WOQhacOtW/oRcYO7YIoJYvu01RheQr5c0MZYn1zEBXmung0hdZ5XO53Vgl6QYTASHgm5
         tF3a/cpD7F59refays/NJAGYlVtedrQg+YKWKVy21xnxMrgNolepnscnjbgHrZO61LDA
         MY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750863937; x=1751468737;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wlj7HklWXe5YtCatjQKwWuAP/xP3g/dB4xsuny3pKlk=;
        b=LlBnfnRKS2Pzvzd9p4YBjDKBtSF0kKjSae+WZsLy3mMWpl7fxmuz7CQvcs02lEU42D
         ke6UQPGyVjIsaayQzn9tTsNgmXssX2rUJIdUuRhmTOyP1b3UQDGtbMzY6FmElmjt3HAJ
         ZSmNs238LRGeSHLQprcNXyEieW5ZXxe8YSx+DDrZ1ID92x08PYJ5CKgpRtVwtl2Q/StN
         2JFKoC07F8N4OFrnrcnwQCEfSvvmhBmyZDGTIZDiy/tr2iC5FKTCr+XiGbuWm7OyrXBL
         0Car+PplAirtVpWgnxn9XAo+EH/1NdjP1yYlE/5YWk7N0BbiEQtf2AmYqJGoruxIK2JY
         RFwg==
X-Forwarded-Encrypted: i=1; AJvYcCXriIVvonNJmge4Nyh60rJTAJfxoVdKHJAsjYYKL7/bzBQPvCafdzBI4SLNsbNYQQQv99tn10PTahNf+WCCI7LWYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZacZ/P5vCSLjKWmYTZKWB+OO3s8qM7/6cIAWPRgkglx6c66xQ
	/mnz6YTkXNfBOnH0zxc8ByoqxuHN6MRZZv6ERRNH67VXSC93DwejdRPWiYxFjX8k5U0=
X-Gm-Gg: ASbGnct9d9gsHb1Pn3R83T6Q7MZup/lemJ46XvLuTUbkfu3lMJsEcv3kYh1Wl9ofN4d
	w5ojyVXPM0SK3ZuD1i7hbTBiH4nMuLsmujpA8gQd36ZD8I0x2oFFh7ghz28fAsXi+8RrcmwzuAP
	Ot0zLP8XpWOIqd2yYUZc8t1i264upXXWHopdN23jJ0j5aF6IGNKEjX3OHo99tUbBcn/VCNm5U/w
	EO0vz4UienqjAJuY7Pi63JS7KbJP/IXfbIbGSMbmXdohBG/87NSgHzIrmlOlCSY/bB9u4u5tyVi
	jFtyyt1b7yPvmzKM7CYSQVxv0FE8JqaBDmXldSRtrJi07faB0FQ+ayimXPJeZEFFqw==
X-Google-Smtp-Source: AGHT+IEQo60y4nSkYuBCYnImSLe6MfyhEpVaq6bM9xHgfeeGrTtXV15DQSuydeKSFGHOA76Afhx/vg==
X-Received: by 2002:a05:6000:1882:b0:3a5:5136:bd25 with SMTP id ffacd0b85a97d-3a6e71b8792mr7030428f8f.1.1750863936643;
        Wed, 25 Jun 2025 08:05:36 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538234957esm22170335e9.11.2025.06.25.08.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:05:35 -0700 (PDT)
Message-ID: <1ada43bbb20b806975d6b0503e36a3b464287612.camel@linaro.org>
Subject: Re: [PATCH v2 01/17] dt-bindings: firmware: google,gs101-acpm-ipc:
 convert regulators to lowercase
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,  Lee Jones <lee@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski	 <brgl@bgdev.pl>, Peter
 Griffin <peter.griffin@linaro.org>, Will McVicker	
 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Date: Wed, 25 Jun 2025 16:05:34 +0100
In-Reply-To: <013f55a0adf0b23e0836e33ee4ea0e1e7864a467.camel@linaro.org>
References: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
		 <20250606-s2mpg1x-regulators-v2-1-b03feffd2621@linaro.org>
		 <20250611-robust-vehement-dog-2bf6ac@kuoka>
	 <013f55a0adf0b23e0836e33ee4ea0e1e7864a467.camel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

On Wed, 2025-06-11 at 10:08 +0100, Andr=C3=A9 Draszik wrote:
> Hi Krzysztof,
>=20
> On Wed, 2025-06-11 at 11:04 +0200, Krzysztof Kozlowski wrote:
> > On Fri, Jun 06, 2025 at 04:02:57PM GMT, Andr=C3=A9 Draszik wrote:
> > > Using lowercase for the buck and ldo nodenames is preferred, as
> > > evidenced e.g. in [1].
> > >=20
> > > Convert the example here to lowercase before we add any bindings
> > > describing the s2mpg1x regulators that will enforce the spelling.
> > >=20
> > > Link: https://lore.kernel.org/all/20250223-mysterious-infrared-civet-=
e5bcbf@krzk-bin/=C2=A0[1]
> > > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > > ---
> > > =C2=A0Documentation/devicetree/bindings/firmware/google,gs101-acpm-ip=
c.yaml | 4 ++--
> > > =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > So this is also a dependency for the rest of the patches?
>=20
> My thinking was that it makes sense to have it in context with
> the other patches, but it indeed could go stand-alone if that's the
> preference.

Can you take just that patch as-is from this series (then it's at
least out of the way :-), or should I resend it separately?

Cheers,
Andre'
