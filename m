Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0E52750E6
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 15:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762959644; cv=none; b=sch1+PnUw7LoHtIOf3NPbKOygEZX/s0JxM4l7zHPtk9CjPq0lKkgcaQlXYcg5wUvG39dGfFOvZD2zfwEIe/Y4763t//Gq0lmPERllSHgnh3sj/bctlzVX5RMmWgAGDx+edQ4yPhYgJ14blxzen07mS6G8YpqCnRkHmQg9jbbQiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762959644; c=relaxed/simple;
	bh=ftMi4rxMW7WjJXTDqOFjHRsNI+XGfNycEd6D7yRiwf8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ft/nyUrRkRSaZ/7sYl98qtd0walLJgDqi8te1MZxV7UTO3fSdSqq9kX+TBkucqiw7gznUUQmnpsEpeyTGxaQ9UB5zUgsZYoSryrwmVqy66sq08x8kOZEe2EPdxzJMVZU0idjv77/gtGzcu/1DUGqH3mMJG433WM7kmCM1VqMZvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xXjr/BiL; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xXjr/BiL"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42b312a089fso716243f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 07:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762959641; x=1763564441; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ftMi4rxMW7WjJXTDqOFjHRsNI+XGfNycEd6D7yRiwf8=;
        b=xXjr/BiL1xgYHNNsXrXQ4khd/bi3J6djLyO/bHVn86qOUbVkUF3rK9MYM0seJ0Bwt1
         YiO2SPPJ0PpUsBXbo8YUEkXFDUQQRhkYebv3ILk9Kl0M/H75pK4vPmaHkMS7Vg5oBNha
         QXuL+wmq33tFbpSLp4lLkLfRKFhEFDcssKXknqAK9JUVQBHANBgXnDXJGIn1WDDlrLRH
         h7YIv5qnhymqFyT7Mm5Xx4gRcExVv5sC4+XwGYwPv8aoeab++xUYbPOAmq/z73RQEdjY
         mQOvViiLiJQRNwDZ1LcQxHVELUa2p3WRZqDAj4ZJtrUSNCm4YczECQKfHGYihFLWk/Og
         OzBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762959641; x=1763564441;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ftMi4rxMW7WjJXTDqOFjHRsNI+XGfNycEd6D7yRiwf8=;
        b=uDhTQDKz5Wwn6MCihEAUtL5bNaHq7rbYxorFIZ18lXEpOfjz0cu2H209ANzxbHyoed
         siQ6HQZBMTsZPKJdJg/Uzyx+BtzSkdvOfJnrBORW3ugx9hDJErNrjsvIgTCsVRIhRMVD
         SI9od60mu/JVzMTGzWboTYY01llUCIgPHE+1ZYLym15TWirJ88OSD82zbnLk6fbGq6D8
         RVM8IXkYc2b+kJ7WW2w/ZRv4itwFHvy1B87gTJsRazcyTR9BLtemyNdVW7XlwUEtpgzU
         dK48ftcKV+qeCcmkCyEA2u8UxrBOuyCQWQ5ENOFsScDeoJx4ihemiAo5Urvwp/PFRbzC
         rMhA==
X-Forwarded-Encrypted: i=1; AJvYcCVAvxJTu3ipQGZkE3inBlK17b55pdbSQnRUhfiG2oJDQj9f5VpDT8KqDkRaDb2xIQmC9E3MF616FRFJOVpatnQCvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9jjiKw7qNAIleTrG7VKBuFTvS12Qu1iBeBWp7D7gZbfb4AyuX
	96KgzkGoj8gD3JiFl32614tUqBZxFH4XkHPjFrybN3v4aMUXBsMM3CoqCGk9ViL4M5Q=
X-Gm-Gg: ASbGnctvIc6dkZMUFI8LfAaPBYQDhp1/nZrLghnng1DTKBpU1HHn+7bQzKN+DPqxRub
	KxDi3IxmYI5skXHrHD/CJpnxTcF1FM0HgvjIzwN8E/QnyzILQm3Bo5dvQjyHdM6V8HZX8b7jVgB
	53h4A0kLV74zHFgzi1ygqvcz0B4xywwSXgYWwZLxi70KZJ/67bvNyFifWFcAUfB522khkhD/AWa
	6bMt8S17HzjXTrt4NToC8XLhBASiXW4hT3FTQm4/NOQqLJKY22Vut/PAr0PZCw8M+o3D8ZHkhhy
	41MpV7bGu5VWP4o8GIN6qrnZiuVr/k3mcslfMK3otXB7ZKzx/QvPsb1GlVWa4dZikTIa1ws3hCV
	uKuF4XAybKJA3xxrxAIzkjfDSfgrIPyMP4lG+pN5BXD49okb4RoFIHRQJGmyOxTrCsmk50R0lRM
	vVQ5Hc/w==
X-Google-Smtp-Source: AGHT+IEWtr1202SXBAEfNbT/oc0QWLUzOqznUI68ArPxhBNv/vhbmeoXarGP0UDkdCcwtG0Wq/w4+w==
X-Received: by 2002:a05:6000:2dc8:b0:42b:3eb2:1b97 with SMTP id ffacd0b85a97d-42b4bb8b5e7mr2354687f8f.9.1762959640534;
        Wed, 12 Nov 2025 07:00:40 -0800 (PST)
Received: from draszik.lan ([212.129.80.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b4789896esm8854605f8f.38.2025.11.12.07.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:00:39 -0800 (PST)
Message-ID: <0bc6fadc6ec9578873fc5413da4405c968bb402b.camel@linaro.org>
Subject: Re: [PATCH v4 02/20] regulator: dt-bindings: add s2mpg10-pmic
 regulators
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,  Lee Jones <lee@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski	 <brgl@bgdev.pl>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Peter Griffin	 <peter.griffin@linaro.org>,
 Will McVicker <willmcvicker@google.com>, 	kernel-team@android.com,
 linux-kernel@vger.kernel.org, 	linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-gpio@vger.kernel.org
Date: Wed, 12 Nov 2025 15:00:39 +0000
In-Reply-To: <20251112-gainful-flashy-seal-f2c5dc@kuoka>
References: <20251110-s2mpg1x-regulators-v4-0-94c9e726d4ba@linaro.org>
	 <20251110-s2mpg1x-regulators-v4-2-94c9e726d4ba@linaro.org>
	 <20251112-gainful-flashy-seal-f2c5dc@kuoka>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

On Wed, 2025-11-12 at 10:51 +0100, Krzysztof Kozlowski wrote:
> On Mon, Nov 10, 2025 at 07:28:45PM +0000, Andr=C3=A9 Draszik wrote:
> > The S2MPG10 PMIC is a Power Management IC for mobile applications with
> > buck converters, various LDOs, power meters, RTC, clock outputs, and
> > additional GPIO interfaces.
> >=20
> > It has 10 buck and 31 LDO rails. Several of these can either be
> > controlled via software (register writes) or via external signals, in
> > particular by:
> > =C2=A0=C2=A0=C2=A0 * one out of several input pins connected to a main =
processor's:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0 GPIO pins
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * other pins that are e.g. f=
irmware- or power-domain-controlled
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 without explicit=
 driver intervention
> > =C2=A0=C2=A0=C2=A0 * a combination of input pins and register writes.
> >=20
> > Control via input pins allows PMIC rails to be controlled by firmware,
> > e.g. during standby/suspend, or as part of power domain handling where
> > otherwise that would not be possible. Additionally toggling a pin is
> > faster than register writes, and it also allows the PMIC to ensure that
> > any necessary timing requirements between rails are respected
> > automatically if multiple rails are to be enabled or disabled quasi
> > simultaneously.
> >=20
> > While external control via input pins appears to exist on other
> > versions of this PMIC, there is more flexibility in this version, in
> > particular there is a selection of input pins to choose from for each
> > rail (which must therefore be configured accordingly if in use),
> > whereas other versions don't have this flexibility.
> >=20
> > Add documentation related to the regulator (buck & ldo) parts like
> > devicetree definitions, regulator naming patterns, and additional
> > properties.
> >=20
> > S2MPG10 is typically used as the main-PMIC together with an S2MPG11
> > PMIC in a main/sub configuration, hence the datasheet and the binding
> > both suffix the rails with an 'm'.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> >=20
> > ---
>=20
> What is the base of this? base-commit from cover letter:
> fatal: bad object ab40c92c74c6b0c611c89516794502b3a3173966

v4 was sent on top of next-20251110 which is ab40c92c74c6

Cheers,
Andre'
