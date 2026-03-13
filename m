Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8069034751C
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Mar 2026 14:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773411289; cv=none; b=m0q+MzC70UhuksvIjlVZfmevm+h2DhwSvYfwHwBXwS5Xyh1TOJUr9hTmN03G/8mCUTQgob8xaXRucEGOSFnrLXTyPKbJq3dpSs6WslZawilSsHs8NUo8CJOaIjBexmBmd9fW7Myf2BNOb1Cwfvw3rIetpGiDXVtFj/mzlgiWSMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773411289; c=relaxed/simple;
	bh=yxLMf+p2GuGBniwtiAZ7R8MSn2ihPWUg3zgiw3eOsUw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EFhjMJ8xOpPHa5MNFA3hgjZ8C/jB3wb1IS8tWommm+tT0Swy0u66do/5ITFxIwHtd0wbQ0p7DITQifmhssTUQAYzZ6s/KPVVd4VcJVvkNxKT6JA3JY0w7qXjLGmYl3VDBkdks7gbixHyO3j4Zfx+7BJiaUmK63P08gLfCy/MunU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kciLrQqA; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kciLrQqA"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b94358796a1so311244566b.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Mar 2026 07:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773411286; x=1774016086; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yxLMf+p2GuGBniwtiAZ7R8MSn2ihPWUg3zgiw3eOsUw=;
        b=kciLrQqAi4EKYCA2AxVgKL4yEu6as0tpMa11p2mqIegQglDtql0VHepjsij6F2hTI+
         lwjJEBtOkmmH/K09zAxbnmUd80rPndsgdFGPxLxjEoRMa1NCk4mMt5KfPjMseeEjKcBk
         +4Fl+peOANpOSi0FXnhTsRB+Pymp4mAsTn6+ady4RP+MyFSH+Yvo9B4p8mjUThXvKkuQ
         LCEENHm8yDRUNtWfKbOZfgc8keWcqUR/SnUYwFTuYr27MVWSXrqbUtLX608G/NGG9NW2
         9t6O+zi9Y+b3+qUX5Fe73i+OpW0WOJUYRRdaK0qJyg4c9Tylo7vwz4ZUoTEioZyIepHV
         zwsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773411286; x=1774016086;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yxLMf+p2GuGBniwtiAZ7R8MSn2ihPWUg3zgiw3eOsUw=;
        b=P/X6lYdM1LYfl024OccwvC8rUOpjKyWq4V2V/9PpNwQDRbs1gT1TXp3eK66+UuIilA
         F6Psu7jhNG14Z4u0iGTc2pGFrhSgOJDCGg4UC20D0wB6/eJo2WSbpdvcL9LtYZT1fhwq
         5in1/ybKBZhW1VZqTfgRxeAqjJ/llFEKlxtKhB+v+tNFsZffaMxB/WFZH7PB4WY3ZvGz
         H6i+UEqTTMIky9CiDxapQbAF8ltS0O139jVJ4fLfevvOv0xw++ZpK4oAQWu1mYYAIExf
         ZotvxFM2gcWOMmmPwZaxS/Xx3nzPjVYlKs9pef15ltzFvvnjx+jx+RfTuD0AXOmeim9J
         Psaw==
X-Forwarded-Encrypted: i=1; AJvYcCVpYJCtQg+JRINGZCKJyIjGV0Dny4SffPoNd3Q9mLAPH8jtOB6IP9gfwUXtatb5DHQRU66yNco1pMNCrgpS5jLXGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRkZ9+Jjsogql8NSIFUSw7MNKrs0dxHoW6N9KNZZcXKq/MxVGJ
	WUT4UR2TGSASk7vFqiVp1E6V5lYle11MXGxu2Vf9vqXrDhfyEaF8BeS8Pje/C/3HfnQ=
X-Gm-Gg: ATEYQzyAeW6tz1iKd9XSS55d9beibwn+r1yWR1Ii8XCEUprHOMRH/GIjYTOBZDsyWbH
	LnpanbX4dCvyPeMtzStMjQ+YwHFIurqhPmPXHx7z+Kbx1mKflZVlfI1oSM3MebfOoCaOmwcj9p2
	55kQkicQpPdmMiqs6g6f5NDdxV29L+fw2zDNChwyvURHZmRyy7hWeBXl2cMn2XPBhXwGmKbN+6K
	gWqkrJ0t96ovpk+QgY6pYSVmaCREuoKfdmtIE6cj4PzbFShGe3to/0YsDRYv9v9KGBCIySivxeK
	5E1W53H50gfZMtAGoxvs0SmgPv8zMVZy3cuGeBEYhWppQbpGSWejTmbsG6HBoiEnnhNNySUuT+0
	5T9EgSqHglzG01fdQ1qLYKhnQsRy6aHxY5U6hwfQjPnr5Iz8Zi6A8UdX56EeGy3wWy9ri+RYSkv
	EyCC/CGxdeMYj4R6I5NK+ELgVTNCHBX5w99HA1Xgn4
X-Received: by 2002:a17:907:e98b:b0:b96:f6f1:e7d6 with SMTP id a640c23a62f3a-b97650e6e1emr210223966b.18.1773411285513;
        Fri, 13 Mar 2026 07:14:45 -0700 (PDT)
Received: from draszik.lan ([212.129.81.187])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cbf4879sm49502766b.17.2026.03.13.07.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 07:14:45 -0700 (PDT)
Message-ID: <82d2d515a38eabd78951effff1dbc459db864130.camel@linaro.org>
Subject: Re: [PATCH v7 04/10] dt-bindings: soc: google: gs101-pmu: allow
 power domains as children
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>,  Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Ulf Hansson	 <ulf.hansson@linaro.org>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown	 <broonie@kernel.org>, Peter
 Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, Will McVicker
	 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Date: Fri, 13 Mar 2026 14:15:31 +0000
In-Reply-To: <CAL_JsqKeSimB6OYFzOk2tWy-nbFez3qRwWrc=yD8uKDALYP8pA@mail.gmail.com>
References: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org>
	 <20260306-gs101-pd-v7-4-03f7c7965ba5@linaro.org>
	 <20260312151228.GA3136988-robh@kernel.org>
	 <da0726da3e59d83985650e8281ed945018a356e4.camel@linaro.org>
	 <CAL_JsqKeSimB6OYFzOk2tWy-nbFez3qRwWrc=yD8uKDALYP8pA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-03-13 at 08:26 -0500, Rob Herring wrote:
> On Fri, Mar 13, 2026 at 5:48=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik=
@linaro.org> wrote:
> >=20
> > On Thu, 2026-03-12 at 10:12 -0500, Rob Herring wrote:
> > > On Fri, Mar 06, 2026 at 10:29:55AM +0000, Andr=C3=A9 Draszik wrote:
> > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 system-controller@17460000 {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "go=
ogle,gs101-pmu";
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0x1746000=
0 0x10000>;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #address-cells =3D <1>;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size-cells =3D <1>;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ranges;
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 google,pmu-intr-ge=
n-syscon =3D <&pmu_intr_gen>;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pd_g3d: power-domain@1e=
00 {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 compatible =3D "google,gs101-pd";
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 reg =3D <0x1e00 0x80>;
> > >=20
> > > I'm assuming 0x1e00 is an offset from 0x17460000. That's not what ran=
ges
> > > says though. It says both addresses are in the same address space
> > > (system-controller@17460000 parent's address space). You need:
> > >=20
> > > ranges =3D <0x0 0x17460000 0x10000>;
> >=20
> > Thanks Rob! On gs101, the PD driver can not do direct mmio. Instead it
> > needs to use the regmap that the parent has created and apply the
> > offset from the PD's reg property (using struct resource::start)
> > (patch 7).
> >=20
> > When using ranges as per your suggestion that doesn't work anymore,
> > as resource->start isn't the offset anymore but the final physical
> > address, and using that in combination with the parent's regmap
> > doesn't give us the right address anymore.
>=20
> You are mixing kernel implementation details and h/w.

Just trying to get to the best solution, considering both.

> Are the
> registers in the child nodes MMIO or not? If not, then drop ranges. If
> they are, then what I suggested for ranges is correct.

While they are MMIO in theory and offsets into the parent's address
space, in practice access from the OS is not possible via mmio APIs,
only via the custom regmap created by the parent (which defers to the
EL3 firmware) - hence the driver's need for the offset from the
parent's base address.

> For MMIO, your kernel implementation options are what you suggested,
> do a regmap for each child, or use of_property_read_reg().

OK, I'll go with the first option then, thanks for your patience Rob!

Cheers,
Andre'
