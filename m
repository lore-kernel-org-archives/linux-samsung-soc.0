Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6935D7483
	for <linux-samsung-soc@vger.kernel.org>; Sat,  8 Nov 2025 14:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762610938; cv=none; b=G40lL7KSOJoz/8iIZ5xJHtvBsp+xrQDIxrvFC+4/gm35TDrkwj/1/t8qDGHOL0A//tmrEh9gl4hgeeujs0vjfKmX57PcePorog5EivGJeHOBhPxe0BG6aysI81LH61Xv3uYf3gOlRZUO35X3XXPWo+ox3UPV74NWON8RWvqoL3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762610938; c=relaxed/simple;
	bh=88SK9HlF8ID4j2mgeXZK5r75pqvAiovy9hjLKXg2mUA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rJBh8PyrHZFQkYUpD1++uAEJ96+6PAfcuxV5EzlP/q5QUHppHWO8klkCPKDtwf+ezQN9wP2R5Q95LQOORWPT5u7intBHqp82RNmzePZeczDvXEygl+JyQLkq+fiRbLnu/RWev3ErUpu/yGkQpIl6Ffi5DA5jStS2Jamq5BDn6A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bw2oL8Nx; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bw2oL8Nx"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-640b0639dabso2974594a12.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 08 Nov 2025 06:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762610934; x=1763215734; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=88SK9HlF8ID4j2mgeXZK5r75pqvAiovy9hjLKXg2mUA=;
        b=Bw2oL8Nx5pdDvt2hub1vX/LWOr0w5YNESA2TcldKBBsBsyJmr2aV47BBk8BqOB/BDH
         z+AL9mKc17uEccImArnb/6hesdfBqfowvxh+YT4ZVviQm8yaMuwYVB3hgf4zyst+uiJZ
         H0MQPNbnehx4A3pb1DtFJNcuOTWcuM4HkJuxv1QONrNzrZVTmVkhtoi2uYtBxHfsPFqD
         wY8JIzCk6siJ+d6FXP/ZcUaoypqsv8TF9BmUy5uZweW1KbvcTTdStBXgqS9OEt+0xA89
         zcg2+McMY+QsKfyL/SjGMJuZSsmlPF4q1/ff1A0sVPpCLbXoLOR/g5vUpIOMKN8Oedvt
         Xy9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762610934; x=1763215734;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=88SK9HlF8ID4j2mgeXZK5r75pqvAiovy9hjLKXg2mUA=;
        b=S7UJnAEqgIX1gFRNgyQymIN59ALLQYdk3u8DDlQN/8UHStI5+B76/kC7jnNHso8+5D
         SsSPOS+jZOjZzeDbm5M4vRmLVnUOzdsqEmiqY321sHxnU96GDc5Rz4m/df3LlXIUNqh8
         hYr9Bzoc/BDE8IURF2ej5vYtL1Gn1YhPhRbFr4ZtvNjcd7lb+p+ziYQECDi8GGF1b0Qa
         N1FCxsfbeRntVNFkJ0ylMMeDnB1WW0oSRREVgfs0xpvp/+04Yip076oNM7T4/m4WUv36
         vBwpodg8sCI7bdCiwek5djB3AmGt0Z3NelHdK6e3fT97QRMXzsQ90TsLMmxjuN4jymLJ
         /Kqg==
X-Forwarded-Encrypted: i=1; AJvYcCVIJqUCMYnOLx1gak8hCemBO1GuGilRDL7gJfEP+fk7T/6O1zPF6ZxbflfDse0M2ASp5sUxnJLwuAyTzO2l3mhQpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwgryVXliFywgp+iFTwZjuA+h/SUPcy9Eye4bFAwnddcaPZ2qO
	A29lV791S+k2WOIj1f0hyuoAX8e6C52XBc5yzukN/HXot9sD8oE+dWjYpukclI4JBMQ=
X-Gm-Gg: ASbGncsXhD0YuoobFSIoBq09FMeCJ5yy4aJckz2Aal7XudWqFeDbrU0DzQ9dYg9mcXP
	+jNXaIOdKSb9/yX0/Megrp5/dWboB18W7ZHczbDseU+la9ULcZ2IBrIUHtF4xCq3KWpkaYo8Rzm
	CiALW6ol5Klak5oQLEHy8HIw6LNZ9oUcCB+ru3loKkhPaex2Xhrb8UZjCAQVvx+p+1xd9NuH1/n
	TqTtlHyyZtl1fQ5wqAuI+RIbh7/GZq9ISoWT1bIpBKtUWAiJC0MF0VRa8aZrPeOTFpbsJ2h4vL+
	uZwCH/32D6iUukaroAsCf+lz3UIGDdH/Uhz5RtwgTFI3jyDU+1zsRL3y+f/ZeWMByx4IpfNw99y
	4g1NTMga846fVKq0TPGssIOh0++P4Ift5Ux4rAel7+fRKP7ZzEqsZZKz8X1zUyq5GMkSCJg+24j
	SUiy83csq+lVSIX+IzZfky
X-Google-Smtp-Source: AGHT+IEU8px863DOF0SHJM2dOiCgYfSF7uWOZKjlSkmUmm2odBp/m7f85l+VxG8z6Xkcbao4KUCsgQ==
X-Received: by 2002:a17:907:7ba4:b0:b72:26ec:c8db with SMTP id a640c23a62f3a-b72e04e2c4emr263436466b.30.1762610933770;
        Sat, 08 Nov 2025 06:08:53 -0800 (PST)
Received: from [10.41.228.128] ([77.241.232.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97e447sm577021766b.42.2025.11.08.06.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 06:08:52 -0800 (PST)
Message-ID: <fa2e704a2f295f2c9b2c7811e8ca89972554ff7e.camel@linaro.org>
Subject: Re: [PATCH v3 07/20] dt-bindings: firmware: google,gs101-acpm-ipc:
 update PMIC examples
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
Date: Sat, 08 Nov 2025 14:08:52 +0000
In-Reply-To: <20251104-awesome-tacky-magpie-bacd9f@kuoka>
References: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
	 <20251103-s2mpg1x-regulators-v3-7-b8b96b79e058@linaro.org>
	 <20251104-awesome-tacky-magpie-bacd9f@kuoka>
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

Thanks for your review!

On Tue, 2025-11-04 at 09:31 +0100, Krzysztof Kozlowski wrote:
> On Mon, Nov 03, 2025 at 07:14:46PM +0000, Andr=C3=A9 Draszik wrote:
> > In a typical system using the Samsung S2MPG10 PMIC, an S2MPG11 is used
> > as a sub-PMIC.
> >=20
> > The interface for both is the ACPM firmware protocol, so update the
> > example here to describe the connection for both.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > =C2=A0.../bindings/firmware/google,gs101-acpm-ipc.yaml=C2=A0=C2=A0 | 40=
 ++++++++++++++++++++--
> > =C2=A01 file changed, 37 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-ac=
pm-ipc.yaml
> > b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
> > index 4a1e3e3c0505aad6669cadf9b7b58aa4c7f284cb..c25e155926e5f44bd74f195=
cdbff3672c7499f8e 100644
> > --- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.=
yaml
> > +++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.=
yaml
> > @@ -45,6 +45,15 @@ properties:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const: samsung,s2mpg10=
-pmic
> > =C2=A0
> > +=C2=A0 pmic2:
>=20
> pmic-2
>=20
> Are there more pmics? Bindings are supposed to be complete (see writing
> bindings) and if you did follow this approach earlier, you would nicely
> call first "pmic-1" (instead of "pmic") and then "pmic-2".

There aren't any more PMICs on ACPM, no. At the time 'pmic' was added, it w=
asn't clear
unfortunately that two nodes would be needed in the end.

See also https://lore.kernel.org/all/963bbf8db71efc0d729bb9141c133df2c56881=
fc.camel@linaro.org/

That said, I believe we can change the existing node name from pmic to pmic=
-1 without
any driver breaking. The sysfs path would change, but I don't think anybody=
 cares about
it at this stage, so I think such a change would be fine. The ACPM driver d=
oesn't care
about node names and instantiates all children regardless of name.

I propose to update the binding (and DTS subsequently) to add pmic-1, to al=
low 'pmic' as
a legacy fallback (i.e. to not issue errors during validation of existing D=
TSs until
they're updated) and to use pmic-2 for the 2nd pmic.

OK?


Cheers,
Andre'
