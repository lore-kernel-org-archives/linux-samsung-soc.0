Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B55B185B48
	for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Dec 2024 07:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734939933; cv=none; b=J88SqF8vRuHhbJu9miGQ6SEuF5Tgbp0MCsrOrSv3KGTSl5yw/+7gi7hgoCswxOEgchZGbJET5p0RQ12cxiG2kCkWx3uBzA/KXmo+tSC5n6TflcshU6PY2ZvHgukK8At3G/J2tfJ6mEVnBPAd45joQBPSwOzpv1PqvORQxYjA+8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734939933; c=relaxed/simple;
	bh=szSMFpu0X/jKqyAJJIRLoz8ialA5hbvm/LWaFM/VFz4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mVlLiTKgF8//5Qma8S5kxefMg1zf4A6aI3TNhTMWiIf8c8xxYdleYNbFWtxCt0CAaV2Eks34Ecrnj25BQ3GuNwSyqdjYgD7oFngCGuL0dFY67T5GK8oKR+Iu63z4nus6l1JeSWKPfEkZpd6MQxFJPKrFwfxKaEzh3LZCGyH9BdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vHL4HBK4; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vHL4HBK4"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385de9f789cso2971837f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 22 Dec 2024 23:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734939929; x=1735544729; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=szSMFpu0X/jKqyAJJIRLoz8ialA5hbvm/LWaFM/VFz4=;
        b=vHL4HBK4fi5VOKMvNN2LTvJ/3FoFHWfInmQbr1eS9uY2GCulCkjL6iy37kAyR29Use
         wBS70STY+qUyVFGvP2SOi+cNv1fHgmPZ9tvB/P0v5K/sa/xKE5H9y0UZoN3RdX//SaTN
         koETAbOhbfE7DcF0CrhpPTXWvnGwhdqZcfUKTZGWaq2tYBPL5DdfvfmSp6YxTQOU0F/i
         VWLv/HnoCP56ZFKYN8dBEYAIkhWAL3bZPfURQGi1C6QATAt2b1QaDqE0+U41MMa//IsA
         hlA2EaIeStVSxlrZBS5uVsSOBaLS00UwmS28/yj2r70aw0WVyrhdhAX6Pd0qXAHco2MN
         yJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734939929; x=1735544729;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=szSMFpu0X/jKqyAJJIRLoz8ialA5hbvm/LWaFM/VFz4=;
        b=TxyW3uzeQy6LXKcPr/ibwXA81OVjH2omjdbt4br17aVrO2iT29D4PNaOH/nmWN3kEl
         gUbAwZp7EE85FndW5nfwQij7lIp4sJCeLk6shDB82JDUVpe+whERl6KyPrch++1t/iqA
         Y3hkjgQEL1QF+WHc6Y5+Bb5PNbX//libuphxu4TmHdVrFgznkRP+h7khfOtvoEfoonnA
         hE5H3Ffefi4//dCmpJSzcsjeSqw2r6ThNxQOPIBkn/4cgZiSbQ0ybkwG1zIEejQGg+Z6
         /TuatWlql40h6eXF/WHr+hptPr+QG+WU9m1WWdjpW+CZRvMeqb+C5tsn4KNzr87tlat8
         b4PA==
X-Forwarded-Encrypted: i=1; AJvYcCU5UGay4Q2x0VLepilhWExzL5zW/fJyXPOsbU6Nr8VEGNFXBcIT26eklWabiawuCz8pXzv+UuCIcHGjKIX74iB4iQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxDEG3G6sUyDdK8NxWZMbBkl7GhJtlN/W1KoD0j8mQI1xnRCFz
	ZPs2AVJvEn38qP3Lyt9y5n3Rz9HCcx1wdYUd25iEk2vMJn2MyVt9ROhbkZNU+3A=
X-Gm-Gg: ASbGncvq4DR3Kthr9WqAu2SeIuy/gjnb0/nyYr7BrLV6MGNPCIYoSB0UbIFAiwYD0jB
	iaNx+MzBds6NIdt9dLofZQdyHN3QouT5SAZr01xI3NFC68FTxhJTsM77imrYSQcV+c5X+cXSfXl
	l65xCptJ28w4wXONCVSGaCnWYFJWwLVKgarZiD4dySjpoHZpDAu52Xb+tZSftubWFkchfDTTbTe
	s1g81ODBocomm6G0gK/9E0pd+Lipq7TqLS4/fuXAsg+ZWOkDeyP0YniOY6xaw==
X-Google-Smtp-Source: AGHT+IGDaeMCJrgzifSr2TvDYMPQhcDT2MRZ+98RU5GMa6SGyaKWu+e0yHVKL1/bnGNvSM8bZo3RoA==
X-Received: by 2002:a5d:598f:0:b0:385:ed20:3be6 with SMTP id ffacd0b85a97d-38a221fa7f9mr10193192f8f.22.1734939929304;
        Sun, 22 Dec 2024 23:45:29 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8a6e19sm10645963f8f.100.2024.12.22.23.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 23:45:28 -0800 (PST)
Message-ID: <cfdc5b1b03140e3d2ce3fb58e8b342dc2ac06d04.camel@linaro.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: google: add gs101-raven and
 generic gs101-pixel
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Griffin
	 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Date: Mon, 23 Dec 2024 07:45:27 +0000
In-Reply-To: <d0c1511f-b052-4690-aefb-3fb41e1e5875@kernel.org>
References: <20241220-gs101-simplefb-v2-0-c10a8f9e490b@linaro.org>
	 <20241220-gs101-simplefb-v2-1-c10a8f9e490b@linaro.org>
	 <d0c1511f-b052-4690-aefb-3fb41e1e5875@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

On Sun, 2024-12-22 at 12:38 +0100, Krzysztof Kozlowski wrote:
> On 20/12/2024 12:27, Andr=C3=A9 Draszik wrote:
> > Raven is Google's code name for Pixel 6 Pro. Since there are
> > differences compared to Pixel 6 (Oriole), we need to add a separate
> > compatible for it.
> >=20
> > We also want to support a generic DT, which can work on any type of
>=20
> There are no such generic DT devices upstream, so we cannot add bindings
> for them.

Do you have a better suggestion for the wording?
How about 'gs101-based Pixel base board'?

> > gs101-based Pixel device, e.g. Pixel 6, or Pixel 6 Pro, or Pixel 6a (as
> > a future addition). Such a DT will have certain nodes disabled / not
> > added. To facilitate such a generic gs101-based Pixel device, also add
> > a more generic gs101-pixel compatible. We can not just use the existing
> > google,gs101 for that, as it refers to the SoC, not a board.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > =C2=A0Documentation/devicetree/bindings/arm/google.yaml | 18 ++++++++++=
++++----
> > =C2=A01 file changed, 14 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/arm/google.yaml b/Docume=
ntation/devicetree/bindings/arm/google.yaml
> > index e20b5c9b16bc..a8faf2256242 100644
> > --- a/Documentation/devicetree/bindings/arm/google.yaml
> > +++ b/Documentation/devicetree/bindings/arm/google.yaml
> > @@ -34,11 +34,21 @@ properties:
> > =C2=A0=C2=A0=C2=A0=C2=A0 const: '/'
> > =C2=A0=C2=A0 compatible:
> > =C2=A0=C2=A0=C2=A0=C2=A0 oneOf:
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: Google Pixel 6 / Oriole
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: Google GS101 Pixel devic=
es, as generic Pixel, or Pixel 6
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (Oriole), or 6 =
Pro (Raven)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minItems: 2
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 3
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 items:
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 - google,gs101-oriole
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: google=
,gs101
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - g=
oogle,gs101-oriole
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - g=
oogle,gs101-raven
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - g=
oogle,gs101-pixel
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - g=
oogle,gs101
>=20
> SoC cannot be a board in the same time.

Can you please expand? google,gs101 is the SoC, the other ones are boards.
Is the commit message unclear?

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 allOf:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - contains:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 const: google,gs101-pixel
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - contains:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 const: google,gs101
>=20
> This should be fixed list.

OK. (This was inspired by Documentation/devicetree/bindings/soc/xilinx/xili=
nx.yaml)

Cheers,
Andre'

