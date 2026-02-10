Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B421E342534
	for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Feb 2026 09:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770717291; cv=none; b=H9rxQPG103cwME9A3QxJVgHjvfGCBibHmh2ykoSZq5QXhhbURh03wdnfE0h+wARqWg5XdrGC4JZScTxHVXcAWuoUD8IMOtwoPGm980A4ZmmiLlw6ZFaZ6KHht1zFAZRCrZlVDUvoM6Pojx6EjEFEm7YFk8XD9SdDxQlgpzZ3DoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770717291; c=relaxed/simple;
	bh=HxxenadFwN0QecO/VcAoIcmjFPcwyrISlXCM0v/oOYo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NlKDjTMocsIz4pLMDPi6qpXfqJ3/1YEJrLuH5pSurGdqWkxaMTjmPieoc2dOHfl6FyDR/J11tQFf+e1F5L09QRahHQjwCeRdrVPmHEdcChFALcCWxAaEf+mXIi6MFSNKOv/59p2zSTusfvFLxUr9F/bivUZ0jpSQ0M2wDm85M5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZQz7nBck; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZQz7nBck"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4807068eacbso5560305e9.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Feb 2026 01:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770717288; x=1771322088; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8HYdS+zrmd+b3Wrxo0gB3qyloTrSaCZ1qSRZuELJtL4=;
        b=ZQz7nBckSlVgz3NphooJaa4UG/JHDyLHzGwmCJrkG3TW0W46js5oASREoep3pjUDeX
         hY98/9Qvbt9lVdm9We9DLBc1PNR+mlInuHdl/4Wwi9mGrNgrz+S5vPy7Grw9dsEJs1vi
         YVSpbsP3xvFbPHVz19ui1gt1/tH6oRt/FMAmyq68Pm9V1+bcKvQ+pAmJ3whgwbRpF/go
         iNGy/EhkvHhDFT9kEwrXIWpF14HZrCgeddPgNGBMQkfq7XBuiNoYS95dsYM1JFFO4095
         u6su+gUqs5ZGHINTxlZiLKwFsMVne/PaglGpr+SNkALVS/SkgRUtGeuSH/lVD8Bb6LhR
         iSgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770717288; x=1771322088;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8HYdS+zrmd+b3Wrxo0gB3qyloTrSaCZ1qSRZuELJtL4=;
        b=J6CuYUCoRYHLFYnyuCbiIYUhkhovdjmIrHaZbhwXve8aRJ0KJp2bq0EUknzSLZ9+7D
         ie6T7rxtlqcDM+zJp3pbAGPynX3X2a3N9BLNIpwbyKMPdxXF2DSzXCQNaxRmeKrEAIqR
         qL24YfpmAyWgzjqdW7ARPThAfGGZO8hVb95wy5bdmhlsm1AjFws3hSPDnTH4uTRI4P3x
         OX/Z5yFLOP6+yur+DoCJe+Nmuaw8HIiGFJdRT+xZCNGG0ekadlXeBHBELeX3qJ5jqoBf
         yqaGc0yHFXq4JWATAdePXxmkaIexkS/VaeQEvEJ2AESfJhhsaA0ciJudytn4hEj/v6sj
         IWNw==
X-Forwarded-Encrypted: i=1; AJvYcCWC1WXQ7pBKPvGBClfNlJIQtMC1qC1qsA7FPFyirAwljxOEm+dUQSwILP0R1tOsVN8gwjdxSN2GjwCiu9r3SlmUHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBgmyjHbQzS3sQ35Vwt3WIxg8yJ1BEUuk8YJUrcV2SJezfqpGA
	WX48llgHfQNwp9rRHDwcZYoLbE5aIfEhz2TaGqIIM8W0zNEM+B/JeF1lom0VTB5wPgg=
X-Gm-Gg: AZuq6aIZYh9gB8y0MdliryNcO+3ya/EVWZnqY2AOkWZJElpGMd5QaE3wa1UtsKKx+mu
	3KxgaqJrhhOx930SGJaM3v5MWf2jjNxevNsXBr1bT/OTiZUX9wUyIWLD5NPtqZG91WoCKjg0iEY
	9sxgdn5+BExY9y7GeN88ubc5X8kRMIfAJKBa31gN86I0bIGiCLn6FtWDOwb6VR+Lls9dQGrVaFC
	CkRfilNCvPBFgYmblujRCTzTyHS8NIlyon0RFog/QRn4Aftrtx7Wv4Smf1VIpfTFLYeygCGglDY
	m2YRY1j8i7zRYJjWdHKYpqLZ418PdpGBXLBRmn5g/V5G0YNsbZRDtmAZ8EHkeERhYpaa/jlIBEQ
	vOBMlzl40IfMO/bKh6cHzNzdytfBUNafDtpxftgOIMGOTu1RxeXOm6m2Yh0QsdEpU7gFMe/c97P
	HJ5eVXqJpU9QpoMAVRYWyv+55w0peVs+4MSLv8SF2x
X-Received: by 2002:a05:600c:3509:b0:477:a9e:859a with SMTP id 5b1f17b1804b1-4832021604amr182180095e9.22.1770717288054;
        Tue, 10 Feb 2026 01:54:48 -0800 (PST)
Received: from draszik.lan ([212.129.79.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48320961701sm214759035e9.5.2026.02.10.01.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 01:54:47 -0800 (PST)
Message-ID: <6cb639e1b655efb68aebc8b21ae34450b8936830.camel@linaro.org>
Subject: Re: [PATCH v2 06/12] mfd: sec: add support for S2MU005 PMIC
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
Date: Tue, 10 Feb 2026 09:55:14 +0000
In-Reply-To: <DG74Y3QSCLIO.32Q8ZKCTISXXB@disroot.org>
References: <20260126-s2mu005-pmic-v2-0-78f1a75f547a@disroot.org>
	 <20260126-s2mu005-pmic-v2-6-78f1a75f547a@disroot.org>
	 <69e2c1b1a2f3d2ed5e5da995cc5ee49bb3627597.camel@linaro.org>
	 <DG74Y3QSCLIO.32Q8ZKCTISXXB@disroot.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-02-05 at 21:02 +0530, Kaustabh Chakraborty wrote:
> On 2026-02-04 15:23 +00:00, Andr=C3=A9 Draszik wrote:
> > Hi,
> >=20
> > On Mon, 2026-01-26 at 00:37 +0530, Kaustabh Chakraborty wrote:
> > > Samsung's S2MU005 PMIC includes subdevices for a charger, an MUIC (Mi=
cro
> > > USB Interface Controller), and flash and RGB LED controllers.
> > >=20
> > > S2MU005's interrupt registers can be properly divided into three regm=
ap
> > > IRQ chips, one each for the charger, flash LEDs, and the MUIC.
> > >=20
> > > Add initial support for S2MU005 in the PMIC driver, along with it's t=
hree
> > > interrupt chips.
> > >=20
> > > Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> > > ---
> > > =C2=A0drivers/mfd/sec-common.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 16 ++
> > > =C2=A0drivers/mfd/sec-i2c.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 12 ++
> > > =C2=A0drivers/mfd/sec-irq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 74 ++++++++
> > > =C2=A0include/linux/mfd/samsung/core.h=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 1 +
> > > =C2=A0include/linux/mfd/samsung/irq.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 66 ++++++++
> > > =C2=A0include/linux/mfd/samsung/s2mu005.h | 328 +++++++++++++++++++++=
+++++++++++++++
> > > =C2=A06 files changed, 497 insertions(+)
> > >=20
>=20
> [...]
>=20
> > > diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
> > > index 3132b849b4bc4..3f1d70cc3292b 100644
> > > --- a/drivers/mfd/sec-i2c.c
> > > +++ b/drivers/mfd/sec-i2c.c
> > > @@ -17,6 +17,7 @@
> > > =C2=A0#include <linux/mfd/samsung/s2mps14.h>
> > > =C2=A0#include <linux/mfd/samsung/s2mps15.h>
> > > =C2=A0#include <linux/mfd/samsung/s2mpu02.h>
> > > +#include <linux/mfd/samsung/s2mu005.h>
> > > =C2=A0#include <linux/mfd/samsung/s5m8767.h>
> > > =C2=A0#include <linux/mod_devicetable.h>
> > > =C2=A0#include <linux/module.h>
> > > @@ -130,6 +131,11 @@ static const struct regmap_config s2mpu05_regmap=
_config =3D {
> > > =C2=A0	.val_bits =3D 8,
> > > =C2=A0};
> > > =C2=A0
> > > +static const struct regmap_config s2mu005_regmap_config =3D {
> > > +	.reg_bits =3D 8,
> > > +	.val_bits =3D 8,
> > > +};
> >=20
> > No cache? And what is the .max_register value?
> >=20
>=20
> This was in the previous revision, but I ended up removing it because
> (at least I thought at that time) interfered with interrupts firing in
> some way. The actual issue was unrelated, so I will add it back.
>=20
> However, there is also another thing I see in logs:
>=20
> sec-pmic-i2c 2-003d: using zero-initialized flat cache, this may cause un=
expected behavior
>=20
> This is due to REGCACHE_FLAT, I am not sure if I should just ignore
> this.

I think the error might be because you should also specify num_reg_defaults=
_raw:

.max_register =3D xxx,
.num_reg_defaults_raw =3D xxx + 1,


Cheers,
Andre'
