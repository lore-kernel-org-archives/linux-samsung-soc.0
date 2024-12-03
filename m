Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE2C1E32D8
	for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Dec 2024 11:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733223745; cv=none; b=asG+mhNDxRFFgT8N83s8nxYoIB8XNxhX89Lqy2BpqUMRMxbFwhFdLXmOG4iZx3ISHA4eCwizjAZgNDtyIXiwt6e0hNk835KzFPXqItPEJg1kAIee+Eht9FYvqyHJ1RvnmWAp7uVBmDN09rYe3dj05SR33aWlF9Du+R9zW7I94dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733223745; c=relaxed/simple;
	bh=S7MzIWIrLWAbVF89l+Uf6tn+k9bQS3/RiimZVSw8N/c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b9hbOkSGHZity91O1QVzpyiNHlxlGaufKLf816KVtF1LvXg6lGlCvwDu8qJ3ImQvpZULsR1x5XF2lhOiZHErk2hPUfEe7TldZdwozerdRaH1m+5z6M793+ln1/O3JHJiJ9/GNLZ/0ucM43qkPP1XkBD5bb3XsgR8LVcKERrhfEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ceAdjcHw; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ceAdjcHw"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so1898991f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Dec 2024 03:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733223742; x=1733828542; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S7MzIWIrLWAbVF89l+Uf6tn+k9bQS3/RiimZVSw8N/c=;
        b=ceAdjcHwfjffVfcCZsVMRK/A1cVsLHxzmwTaVEQvw66v0uswrpr9oaf2I4o/cjr5Nf
         ny7PKInr0DxKITyZU2vSr2UpDjORLu1neNrjy/2DeXJpx/fAMW/hlqgswAw3uA0d9HYp
         VWh+APDkJrVy/b3VkrihZbQs7YL/X+bk2o5h4RulgLhC35O93d8eoj/Kby1cJSo0LIAk
         +40QlpqnLY+D+cfCJDcV3HI/teTKhQd4BoPfrtSST3B+BA4vK7N9aBKPjU69xZRtPgP4
         rwvqirbD6g09anoF4Jvn5cHm7GNCXjq3BpIwmN8o2VqbRpPbbLapQRak1jxpJk89dAF0
         8SzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733223742; x=1733828542;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S7MzIWIrLWAbVF89l+Uf6tn+k9bQS3/RiimZVSw8N/c=;
        b=B+Lct7Cla9ZmhRWD2i2RXCKkOvg6HTthWucV4I2X29AvoKRgB0d0Kr6xvCArRRyTln
         8hutDigQ2bIkaFpQsa0G3R5qSU156rHFVSYgBkJ6GFdgFzlvWvvfmydlQg1LheBkKKNp
         ZJGMZLEh/DPwCsbrY9fxDuANdJhp9I7tFxOZOvIZ3u0myxjsEiT2gAKb2/JkDgHBkb43
         DUSROhcp998Hjer1iG9JvgJyN35Iw0Z4pNVVHG63mWvHc+yLRQ3iDoruSTZMhf/By8I/
         jE6bT/CXBmdIFIJ+yJOz64Bv2f+y258U/qX0SyDm0cVaH14uoC0uHwlyY19SQ2Jk94GS
         RLsA==
X-Forwarded-Encrypted: i=1; AJvYcCUFE3L/Gg3U76CXgWIHeU9qyUgO1gJWfWbf4/OQtVHZWtnzMZQjamJN+9Gia2slqJiXVmseWiQEC2CH3/IfMHdIGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcavndhOl8hmK1xE5BYKCPk43nAdrt9itOjNLN07AcYRhYZDaG
	gTM+8j+8Lh1SrLTgJY+tXzZq6VhztDDQqtpXMUpSpRrKbaPQJtpY78UYBLdeVBU=
X-Gm-Gg: ASbGncsMjgDB5Q9G3ypx07IJr7RSY4Py5w746f/NyDhkBBCLbiMahvM/p90tuHj1c3L
	yy5Q354W0bVp4YEF9BuBZkB38mP2Ohii8TmTWcznS2exP5U1W+t0kCIBkwBujviUIQ/kdOExrz2
	5cVxBaVkIrqzzX1z46Fp6rEBNCYbkvxpukAdr9SfCA12L4Ok40b8sb/ucMh+f8r7vGQ3BjYMnOu
	dXFqBz2jyPtn478A+m1GRiH+ds6NKBXYkqjgh5GRLlL4YzAEKmUGQg=
X-Google-Smtp-Source: AGHT+IE4z37Or9yADOv+O39FGI70uwdrH1eoqOGhO/GGECRsdGCnHKNhwdQTcxVdHXzjgp6xkbp4Tg==
X-Received: by 2002:a05:6000:23c2:b0:385:e1e8:40db with SMTP id ffacd0b85a97d-385fd3e9195mr1279542f8f.24.1733223741934;
        Tue, 03 Dec 2024 03:02:21 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e49cd788sm9516997f8f.6.2024.12.03.03.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 03:02:21 -0800 (PST)
Message-ID: <16f9b5f8aed79e9313b4638512896743fa5a8d6d.camel@linaro.org>
Subject: Re: [PATCH 1/4] power: supply: add support for max77759 fuel gauge
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Thomas Antoine <t.antoine@uclouvain.be>, Sebastian Reichel
 <sre@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Dimitri Fedrau
 <dima.fedrau@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>,  Peter Griffin <peter.griffin@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Date: Tue, 03 Dec 2024 11:02:20 +0000
In-Reply-To: <bce22ca8-aed2-41ae-b2ef-fdc71266709a@uclouvain.be>
References: <20241202-b4-gs101_max77759_fg-v1-0-98d2fa7bfe30@uclouvain.be>
	 <20241202-b4-gs101_max77759_fg-v1-1-98d2fa7bfe30@uclouvain.be>
	 <c377f3302c6c282ad826211c859e2b65bb1222cb.camel@linaro.org>
	 <9387c0cf-d291-485a-8cd1-1aced7eba14e@uclouvain.be>
	 <2883fb0dd22312d5da9039d4fef869276a0bd430.camel@linaro.org>
	 <bce22ca8-aed2-41ae-b2ef-fdc71266709a@uclouvain.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2024-12-03 at 11:11 +0100, Thomas Antoine wrote:
> On 12/3/24 10:31, Andr=C3=A9 Draszik wrote:
> > On Tue, 2024-12-03 at 10:08 +0100, Thomas Antoine wrote:
> > > On 12/3/24 07:47, Andr=C3=A9 Draszik wrote:
> > > > > From: Thomas Antoine <t.antoine@uclouvain.be>
> > > > >=20
[...]

> > > > > =C2=A0/*
> > > > > =C2=A0 * Model Gauge M5 Algorithm output register
> > > > > =C2=A0 * Volatile data (must not be cached)
> > > > > @@ -369,6 +387,8 @@ static int max1720x_battery_get_property(stru=
ct
> > > > > power_supply *psy,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val->strval=
 =3D max17201_model;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 else if (reg_val =3D=3D MAX172XX_DEV_NAME_TYPE_MAX17205)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val->strval=
 =3D max17205_model;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 else if (reg_val =3D=3D MAX172XX_DEV_NAME_TYPE_MAX77759)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val->strval =3D m=
ax77759_model;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 else
> > > >=20
> > > > This is a 16 bit register, and while yes, MAX172XX_DEV_NAME_TYPE_MA=
SK only
> > > > cares about the bottom 4 bits, the register is described as 'Firmwa=
re
> > > > Version Information'.
> > > >=20
> > > > But maybe it's ok to do it like that, at least for now.
> > >=20
> > > I thought this method would be ok as long as there is no collision on
> > > values. I hesitated to change the model evaluation method based on ch=
ip
> > > model, where the max77759 would thus have an hard-coded value and the
> > > max1720x would still evaluate the register value. I did not do it bec=
ause
> > > it led to a lot more changes for no difference.
> >=20
> > Downstream uses the upper bits for max77759:
> > https://android.googlesource.com/kernel/google-modules/bms/+/refs/heads=
/android-gs-raviole-mainline/max_m5.h#135
> >=20
> > I don't know what the original max17201/5 report in this register
> > for those bits, though. Given for max77759 this register returns
> > the firmware version, I assume the lower bits can change.
>=20
> Based on this datasheet of the max1720x, the upper bits are the revision
> and the four lower bits are device. So it could change.
> https://www.analog.com/media/en/technical-documentation/data-sheets/MAX17=
201-MAX17215.pdf#MAX17201%20DS.indd%3A.213504%3A15892
>=20
> If the four lower bits are not always 0 for the max77759 then I guess it
> is necessary to change this as it wouldn't work with all max77759.

Maybe the best way forward is to go by the compatible (from DT), and
if max77759 to then print a warning if the upper bits are !=3D 0x62 and
!=3D 0x63. And maybe even refuse to load in that case.

Cheers,
Andre'

