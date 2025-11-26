Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F7B33B96F
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Nov 2025 16:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764173929; cv=none; b=QOkhxv7lIsHU6aaGu0NYNl7v7B5I2mn2ha8DTm7jWsVkFWFuZhXxP+hwHKFN31oVRykV8/6sBRwJ8FeNRq7NkPYjhdB8ikfUIRt2pdura4dAhgHq2Iu27PVVVZcwGxFhcWtQVzujLyELN1Kj36ITs1h/2fEGEv5NKYk18I9/ITA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764173929; c=relaxed/simple;
	bh=A8a/vfmrnuuCKlhPtRmNUE7pjBPlzlE2qXTzeU2dArw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OWHSJV+Jhmem+LigUdWbo/xHbafYjc3yfn2JciBGEBSmGGsSTg3I3aRbOtN37A+e2XLREOLNuBS96LCh1s8yHII3k+a6/wkGU9Y9OseAstQl64jPc9SPHyLdwnVSH+2TqVTV9k1ffyo5TnFtLj+8p5UTnGL9mgkm2ScAqq4l0sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qgGElSiy; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qgGElSiy"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477b91680f8so54452275e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Nov 2025 08:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764173924; x=1764778724; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A8a/vfmrnuuCKlhPtRmNUE7pjBPlzlE2qXTzeU2dArw=;
        b=qgGElSiyIIO8yHhW8+S/qQGLCjkjk9IxhK+nnnSm2NDKHJ7AUSU6NxdxT/i/Z7sD4g
         heltZSG8f/ZewycFWjjl8RO8FY5puX5L9eLhWhjf6ZGBa2Cyrk7GoqVnecvSrgCUj+PG
         LIqE2eipL6xW4SN1x4Y9dB2Y75L6zliNi2oWdP1bEsZ+Za5BupMBnulyNBPn9wC+td3Q
         heYgBWbLHyKpq3m4WxchKXS5WeQE+fgzCyWMhq4PiOPJtwNtfn8U4W/XxCABFXCBr8Wv
         tt3hW7iIQO1S6X2cobmtuttLVCTXmvzRMJQqNjcjHxXS0gF+MM22XjHSg2A6n0dpXewv
         Hz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764173924; x=1764778724;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A8a/vfmrnuuCKlhPtRmNUE7pjBPlzlE2qXTzeU2dArw=;
        b=HuBHLDJ7Xg7yvcWIzjqegq6bAJCNoATQcME1pwXyP6xSI+IDV8nOmSiBjgg1s/Yfy3
         5g69ZF2jnPAA8FN+A/KKZQC999/DkfRA+ekFY44UjjVRPatvKeyxDft0fKbAIlwpX0At
         gDB/nZ0OVmHI1GRDHIgJuAt6H6ILf6Cx8WQk28W29hqyRNm7s6a9xpzAT2IFoBNO7OfA
         0RKzAPrXGzTe1J5+Xi737/U91uD7b9/Y7nYZfSFY1cK67/axaDOtB5vzDtty2oTVer4H
         U5oIcqzVZN9a1r9HkHNMyHPk/w+cVPA1cPEWLxYFUD/v9y5PXXpYKOz4EfqPVg1TBorw
         tTrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvAjpziktQyEueDrhK0nlVjQ/WaY+uTpnqm8yyRImfoggBOjBwFTjpJ//m2Bfy8GiI3yIj0dB4m7CDtd1xwhxmyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuOwhYmMM2s+cGsqMBJcBFQV9FplTTBwXI0M2Uit9k7Fl827Qb
	44MJtv97SvqespZjwih9wNk08EshcaRzIyOZPp6cIR/4w6eqToStfsuaaGFjJltzRmE=
X-Gm-Gg: ASbGnctPSfdFmpDx+bFb9bxs0TIYVN/hWgvzlJ+tk1VnEVTZ+ir4pWSCYDTCK4GnBE0
	aDLByox4nWUYH450IWdSDVR0ThP3TAYEM4QRX0fNglSpM72RV7LhtpFIUJpsIDILdzywMZP2YV3
	MFU29Uup6pJGWer6ELocucI8NNkGxjRUCJ4BuxcUbUCTXlLubtjjTFqCFKiKqwvetrpiRSnWqPi
	WOJavdTT4jOhuZwPpGuFn47nKj4t2MHAfQEgKB0l3AkuFdWXgnM/EKmJ0rcjPZijQCcvn0GHEdx
	10s4NiCB37TbnC33WUb7E83teaMIPbgdy2kI++rm+C5VkYzkbGQjBdFJyfluFcL5GVSxGhzA72G
	vDe82SbVHnxWcyI6Pr0sI1EfKo3X8wDYxnoUsYe0PD9WL5mcDw53mJU25If9q0OAIfDhrsLpYei
	ghVh+ux5ct/rC3iLyd
X-Google-Smtp-Source: AGHT+IHPbIx23EDNZaUTAJ6Psvz/ev1Z/O51tl6vv+BcSPNYJjiwrPTdLBSRYd1ljvmAqn0aCxUGmw==
X-Received: by 2002:a05:600c:4f89:b0:477:9bfc:dcb6 with SMTP id 5b1f17b1804b1-477c10e2bb4mr209401045e9.14.1764173924510;
        Wed, 26 Nov 2025 08:18:44 -0800 (PST)
Received: from draszik.lan ([212.129.87.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790add2c98sm49691755e9.5.2025.11.26.08.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 08:18:44 -0800 (PST)
Message-ID: <8d8201de13b4694b26812722356a3a55637406c4.camel@linaro.org>
Subject: Re: [PATCH 3/6] dt-bindings: usb: maxim,max33359: Add supply
 property for VBUS in OTG mode
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Amit Sunil Dhamne <amitsd@google.com>, Krzysztof Kozlowski
 <krzk@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones	 <lee@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Peter Griffin	
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, RD Babiera <rdbabiera@google.com>, Kyle
 Tso <kyletso@google.com>
Date: Wed, 26 Nov 2025 16:18:59 +0000
In-Reply-To: <adc2d6ec-e666-4dd0-aaad-7ef014efafb6@google.com>
References: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
	 <20251123-max77759-charger-v1-3-6b2e4b8f7f54@google.com>
	 <20251124-rook-of-exotic-innovation-fedcc5@kuoka>
	 <adc2d6ec-e666-4dd0-aaad-7ef014efafb6@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-11-25 at 12:13 -0800, Amit Sunil Dhamne wrote:
> Hi Krzysztof,
>=20
> On 11/23/25 11:53 PM, Krzysztof Kozlowski wrote:
> > On Sun, Nov 23, 2025 at 08:35:50AM +0000, Amit Sunil Dhamne wrote:
> > > Add a regulator supply property for VBUS when usb is in OTG mode.
> > >=20
> > > Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> > > Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
> > > ---
> > > =C2=A0 Documentation/devicetree/bindings/usb/maxim,max33359.yaml | 4 =
++++
> > > =C2=A0 1 file changed, 4 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/usb/maxim,max33359.yam=
l
> > > b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
> > > index 3de4dc40b791..a529f18c4918 100644
> > > --- a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
> > > +++ b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
> > > @@ -32,6 +32,9 @@ properties:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Properties for usb c conne=
ctor.
> > > =C2=A0=20
> > > +=C2=A0 otg-vbus-supply:
> > How is the pin or supply called in the datasheet?
>=20
> The pin that supplies the VBUS power in OTG is referred to as Vchgin in=
=20

I think that should be chgin (without V prefix)

> the datasheet.

Cheers,
Andre'
