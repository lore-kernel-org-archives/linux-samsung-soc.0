Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61A81DFDBF
	for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Dec 2024 09:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733218324; cv=none; b=qMiJjoYlWB4mPduBbuSceN7EakH28z54DXXHOs0Y6lNqaE1XlTMYKtBShxpZHPNGPzQ9YSd7cSyZKg+GKDLqiwJ8VpviFrbmIWMRApMMA4GW16i2mvCfS09bYCvPylMAqXzaEgfHr9gjrGc2uVHlG5bd/2qhHquvX09cXSOMjaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733218324; c=relaxed/simple;
	bh=Kv/bDXDpLX0h9bWxvgUWTMNx/ULHSEzO6+v37eKmhD8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ebEpJkdI8KMQ/3W/tVnTnOoFJLSiHG/a2aEaSSQaBFtw4V/YzSF/iFFIH69GCT623h1CyAiOjNEYWX7BQKnFcn9zczWmnsTd/WL59ILv7y3yiUSjqgGqWmi6hbQTKSerkfCzpKVDZnnXd4GGvxIb9tMPwOX18vFUdhVBv8Ld7vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=evjMuwzh; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="evjMuwzh"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-434a736518eso65568805e9.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Dec 2024 01:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733218320; x=1733823120; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Kv/bDXDpLX0h9bWxvgUWTMNx/ULHSEzO6+v37eKmhD8=;
        b=evjMuwzhEt7HoFurpjNeX2s58kn8cA04jT+tW/P206PuxMD/6NBLA2myHsuxga3ruM
         +vYB9xlzP2cxs7SSebD/JVak1+ZDni7MdQKLh9W6x6rFlVqaXDIHeJo6fktUKo6vUghb
         P2D+FBS0D7YCLAo4XYDMi9SR6s0IGfijT9PSVjPFRCr2w6xLv8mMAzfrHNPDZZvVR9oM
         VmSVvUwB++7x/ji7hx7nTdbWvow2SCnyrjoaSKPlUcv/JnJzZ01tqG3EXNcT2XzMVcIc
         oDcPPscoZbvgdmKP+zIECzLrLl5HaXwE0QZn8+JYRrP9GLiCcv9P/UhuNNekUFvTFdg2
         ppFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733218320; x=1733823120;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kv/bDXDpLX0h9bWxvgUWTMNx/ULHSEzO6+v37eKmhD8=;
        b=DGdDngkK2hsUh0vnTdQBZ41xAQW7fE4eL6k1i1p9tfARFm+3dcrNDyqKaQYohyn2Lw
         b13wLt8omMCy+bjdDce6CEJntzFN9bOSSbsCX4S58ZG5Gat2+slabgOuwtBab0/scMU5
         v5k00ERqYsIb49IPf/6m4fSfnpQ4gR8U9lR+YTW9t7oXU7lh7GrFGCQE/IpTBbI3oEx3
         aVWcqDd7/VSZ94sDTDvMgKdUWVold8PfdWCJeT7lQwEwgSWkZMOKHc5eQ62CJhmvsi7c
         1cfMe2Crea/j/Qysb+qtgOWadvvWL8Q7buH3ZqUkaCrmlQXLAK/NhFLZN2kcqoh6DeZP
         kaaw==
X-Forwarded-Encrypted: i=1; AJvYcCW5Q9fwirSJ4VzzfNXJ3p/+5GMcld7XqiNZqgL/ygHlE59a5ta17WEs+kqi3W34GBlpBbuFjXHr3wUC15UzT71H9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRS+ErrMdDUT4ucF1qsSlE5cKwHrnDQWwfWNLCn4ogJI4hVTKa
	ijQ1vIHSLQOfl8ROyaPVOHw9gf/5eb4DMQ6Lc4h9wODb6yckmDyQKg/aDMjHfe2i68Nc5s3QrNZ
	8yeU=
X-Gm-Gg: ASbGncvH7uvSWBWo7s/4M99XzoeEJVRLPgYtBX08YcNKS/O9GqbXusZRraY9bcbHSO8
	/i47bAPf8H80UFNp5y3JQD1ErcIGFwpvBQoNzC5/aY/FkBpHfP7FJny/5+Cb2miZJaqzthklH36
	YVMtYOp1DDZXbmPbli8X542MsQVsjUt61Z2rO7ngnNhHiEBD70M/KU4hpyUPQDL1mwCE6Aq42bS
	eLMfsdgSoz2qgZ0oH8RhmO11gmPEhRETtDVaVZp6hyZgPnfVhOmPqg=
X-Google-Smtp-Source: AGHT+IFK/C18Dsfxx4kwzaYYJOtx8zRjw5Mg8Ta/YqGYVWUqOTuIRgGuf9GpFBBUxIcPs2ZZtod4mg==
X-Received: by 2002:a05:600c:5106:b0:434:a8ef:442e with SMTP id 5b1f17b1804b1-434d0a2864cmr17075505e9.31.1733218320000;
        Tue, 03 Dec 2024 01:32:00 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7d22d4sm212974605e9.27.2024.12.03.01.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 01:31:59 -0800 (PST)
Message-ID: <2883fb0dd22312d5da9039d4fef869276a0bd430.camel@linaro.org>
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
Date: Tue, 03 Dec 2024 09:31:58 +0000
In-Reply-To: <9387c0cf-d291-485a-8cd1-1aced7eba14e@uclouvain.be>
References: <20241202-b4-gs101_max77759_fg-v1-0-98d2fa7bfe30@uclouvain.be>
	 <20241202-b4-gs101_max77759_fg-v1-1-98d2fa7bfe30@uclouvain.be>
	 <c377f3302c6c282ad826211c859e2b65bb1222cb.camel@linaro.org>
	 <9387c0cf-d291-485a-8cd1-1aced7eba14e@uclouvain.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2024-12-03 at 10:08 +0100, Thomas Antoine wrote:
> On 12/3/24 07:47, Andr=C3=A9 Draszik wrote:
> > Hi Thomas,
> >=20
> > Thanks for looking into this!
>=20
> Hi,
>=20
> With pleasure! This is my first time trying to contribute to the kernel
> so sorry for any beginner mistakes I might do.

No worries :-)

> =C2=A0
> > > From: Thomas Antoine <t.antoine@uclouvain.be>
> > >=20
> > > The Maxim max77759 fuel gauge has the same interface as the Maxim max=
1720x
> > > except for the non-volatile memory slave address which is not availab=
le.
> >=20
> > It is not fully compatible, and it also has a lot more registers.
> >=20
> > For example, the voltage now is not in register 0xda as this driver ass=
umes.
> > With these changes, POWER_SUPPLY_PROP_VOLTAGE_NOW just reads as 0. 0xda
> > doesn't exist in max77759
> >=20
> > I haven't compared in depth yet, though.
>=20
> Is the voltage necessary for the driver? If so, we could just not
> read the voltage. If it is necessary, I can try to kook into it and try
> to find in which register it is located (if there is one).

Downstream reports it in
https://android.googlesource.com/kernel/google-modules/bms/+/refs/heads/and=
roid-gs-raviole-mainline/max1720x_battery.c#2400

so upstream should do, too.

> > > =C2=A0static const char *const max17205_model =3D "MAX17205";
> > > +static const char *const max77759_model =3D "MAX77759";
> > >=20
> > > =C2=A0struct max1720x_device_info {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct regmap *regmap;
> > > @@ -54,6 +57,21 @@ struct max1720x_device_info {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int rsense;
> > > =C2=A0};
> > >=20
> > > +struct chip_data {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 u16 default_nrsense; /* in regs in 10^-5 */
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 u8 has_nvmem;
> > > +};
> > > +
> > > +static const struct chip_data max1720x_data=C2=A0 =3D {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 .default_nrsense =3D 1000,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 .has_nvmem =3D 1,
> > > +};
> > > +
> > > +static const struct chip_data max77759_data =3D {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 .default_nrsense =3D 500,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 .has_nvmem =3D 0,
> > > +};
> >=20
> > This should be made a required devicetree property instead, at least fo=
r
> > max77759, as it's completely board dependent, 'shunt-resistor-micro-ohm=
s'
> > is widely used.
> >=20
> > I also don't think there should be a default. The driver should just fa=
il
> > to probe if not specified in DT (for max77759).
>=20
> I hesitated to do this but I didn't know what would be better. Will chang=
e
> for v2.

Just to clarify, has_nvmem can stay here in the driver, just rsense should
go into DT is what I mean.

> > > +
> > > =C2=A0/*
> > > =C2=A0 * Model Gauge M5 Algorithm output register
> > > =C2=A0 * Volatile data (must not be cached)
> > > @@ -369,6 +387,8 @@ static int max1720x_battery_get_property(struct
> > > power_supply *psy,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val->strval =3D m=
ax17201_model;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 else if (reg_val =3D=3D MAX172XX_DEV_NAME_TYPE_MAX17205)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val->strval =3D m=
ax17205_model;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 else if (reg_val =3D=3D MAX172XX_DEV_NAME_TYPE_MAX77759)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val->strval =3D max7=
7759_model;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 else
> >=20
> > This is a 16 bit register, and while yes, MAX172XX_DEV_NAME_TYPE_MASK o=
nly
> > cares about the bottom 4 bits, the register is described as 'Firmware
> > Version Information'.
> >=20
> > But maybe it's ok to do it like that, at least for now.
>=20
> I thought this method would be ok as long as there is no collision on
> values. I hesitated to change the model evaluation method based on chip
> model, where the max77759 would thus have an hard-coded value and the
> max1720x would still evaluate the register value. I did not do it because
> it led to a lot more changes for no difference.

Downstream uses the upper bits for max77759:
https://android.googlesource.com/kernel/google-modules/bms/+/refs/heads/and=
roid-gs-raviole-mainline/max_m5.h#135

I don't know what the original max17201/5 report in this register
for those bits, though. Given for max77759 this register returns
the firmware version, I assume the lower bits can change.

Cheers,
Andre'

