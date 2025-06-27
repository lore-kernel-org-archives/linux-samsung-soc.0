Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FAF2737F9
	for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jun 2025 09:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751016034; cv=none; b=i02sYWoXY8x3Xpmf2GJYw8G3wxEostt0PEXBlPDaDItUkwFLM+tX6lNy4a9CCQ83xYLUMkPBoRl6H0ITXppThFlD23v6OoY+uG7CbagNgFrVpOrmIBAdvMU6PoEmhvGYg880PuqkSmzPkJwttqhd9cVLJb7+QruPaEjGwgFbb2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751016034; c=relaxed/simple;
	bh=vrfc+OaRtOineRFy4CtDCLlKcnvGZaPz1fpHowUDsSc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aRJWB9wwT2QIefXZNckL4gOaswP47XE1a3pPBi61w42BeqQJsYBxoR4dS74pbdAQOHdqSs3DZlAYVhcPGqDI+OaX3szwlLQtuPbQOz+LZ0wK2l4CLD1nd0vUXFJIJiMnEN9kpZg6QC0n1/0CxaJo4Uon0ADWAz92744tIg+8ISo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cEt6J6yz; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cEt6J6yz"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a4fea34e07so918856f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jun 2025 02:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751016031; x=1751620831; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tgKoLmuCFkyudsO+uSw17e0plXs6RB1iSrnaKVMcAlE=;
        b=cEt6J6yzO62eYt7kNtmpEGbhW69x168ysd20wk5l1TcSeW6/IZxVlXJuym6wOflxto
         EQAoYfAVB/uGyNkkCwTWcAVS74bU4V08xYmWyd6KaghFRCJwJ4xIYWtDJJN0sM6Sax7y
         Yov9lAuPSCc6A62uiYqJnoLWUshtswUPIx7reH8cnmeL2sG/RHOi88/8JdrHdxZo/0SJ
         EyEalRSvCGsuF/uOi85RdfS3pJikSNh+oT8G4Vn975GR8aAbxFII7vQkeWyIWchBTWBr
         9FKKhQXAPg0KkGdeN/bOtb3iUX7vLNWwTt/8NNGOUP2qj9tm95xzWvEaiXMiS+8SI4gp
         3DtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751016031; x=1751620831;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tgKoLmuCFkyudsO+uSw17e0plXs6RB1iSrnaKVMcAlE=;
        b=YzFoZYO2azxmEATKXrJOlZN8yZLouRLKe26PtRzITBfZ6Fp/HyyTzgOLh/GoD4khpd
         ONzoeOpAqO0f49jWZY1aG0Oj0PAP0/2WQ4Ixw9lqGZz6DVfp+pyudYSQSyhvpHVu1UUf
         9tz0Mdv9Ojk2qlkCKNjwNl0ZMaQGevWFID2EQ+KY4y6Wn8TYZj+GZ2Ls61z5Vzzw76M/
         12U2fQ/6NKqOpxjjCx30wilDNwfXGfrjDdko9FBzhgllxpGy1cgu/PxoqryQy9Z3FK/9
         hGhnXBZ0+q0ZYtaUASaB4GXl4fXg6m+iFxrmYl9WmJBxbg4ItR1U4aqJm59wr50X/Oku
         BErg==
X-Forwarded-Encrypted: i=1; AJvYcCWkOJtEH0d2HUXDs3U1DElZJ4ySTjcRiy2KwLub7Tq2dlmnnoomz7Pm64+crNtNUGYK1eVAv2TXfS1OB+18+IpLLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgDwIcS0LvtW07InpAB0YN8ui27jo0yjgiacXg+pTMefDqalA/
	Jv/J3/o8G1AWLQI55qhEMH7uQhtkiN/LyJY7xjxaMf16zu+PJQ4j0er9I3sUlJRCqRc=
X-Gm-Gg: ASbGncsaKhiyZ7pCJUXlRqcHhvoOfeVaF2DyMIOzo1Z2b0qOx/dYnFBLEnQ02VoMD0C
	HFHvy2F9ecteXggMDbMpHKGrxRLsTY4uXDBfC9ueT2Ok9Mq9ivuugNWphKA+vwzktTO1yTcdOks
	piFw3f8vYSTE2wjBYSOpNz++NZdx+uXrbmJNyejk+7epkDMgDZokg9vRwGlHuHKNEr00is+6e5x
	5Wlavbn+qXdyNbYDglQefWMI6KsxelbPCT7IU+M6G8JR9y6Xp+jj4t5aWsFStvsxNAeFWGpb3JH
	bnsI0Xs+g5Pw1A1FEK7ra5XGk4fmmGoq6dQR9RiI4PgnBpfZXdAeK1v1fj+RWLI3VaU=
X-Google-Smtp-Source: AGHT+IF5bV6mT3bv7iCEja7u7RBHkEVwKldtXgIAv6BJdG93VXVqYj/0JSIpoX8i21kmQ29S6VbX7g==
X-Received: by 2002:a05:6000:2013:b0:3a4:f7dc:8a62 with SMTP id ffacd0b85a97d-3a8f2f34f7cmr2365868f8f.0.1751016031058;
        Fri, 27 Jun 2025 02:20:31 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a390bf8sm45349135e9.4.2025.06.27.02.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:20:30 -0700 (PDT)
Message-ID: <508b60bf64d060fb48395366b8377927d248b60b.camel@linaro.org>
Subject: Re: [PATCH v2 2/4] arm64: dts: exynos: gs101-pixel-common: add
 Maxim MAX77759 PMIC
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Catalin Marinas	
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Peter Griffin	
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Date: Fri, 27 Jun 2025 10:20:29 +0100
In-Reply-To: <4cbc691e-c725-48eb-9932-4549381fa55b@kernel.org>
References: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org>
	 <20250524-b4-max77759-mfd-dts-v2-2-b479542eb97d@linaro.org>
	 <2c491166-d8ae-4fb6-a4f7-74e823e1205d@kernel.org>
	 <b2c3b78d60f3dc3e4576e8b79298e22ea46567c6.camel@linaro.org>
	 <4cbc691e-c725-48eb-9932-4549381fa55b@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-06-27 at 11:12 +0200, Krzysztof Kozlowski wrote:
> On 27/06/2025 10:54, Andr=C3=A9 Draszik wrote:
> > Hi Krzysztof,
> >=20
> > On Thu, 2025-06-26 at 21:49 +0200, Krzysztof Kozlowski wrote:
> > > On 24/05/2025 07:21, Andr=C3=A9 Draszik wrote:
> > > > +
> > > > +		gpio {
> > > > +			compatible =3D "maxim,max77759-gpio";
> > > > +
> > > > +			gpio-controller;
> > > > +			#gpio-cells =3D <2>;
> > > > +			/*
> > > > +			 * "Human-readable name [SIGNAL_LABEL]" where the
> > > > +			 * latter comes from the schematic
> > > > +			 */
> > > > +			gpio-line-names =3D "OTG boost [OTG_BOOST_EN]",
> > > > +					=C2=A0 "max20339 IRQ [MW_OVP_INT_L]";
> > > > +
> > > > +			interrupt-controller;
> > > > +			#interrupt-cells =3D <2>;
> > > > +		};
> > > > +
> > > > +		nvmem-0 {
> > >=20
> > > Why is this called nvmem-0, not nvmem? Is there nvmem-1? I see bindin=
g
> > > does it, but why?
> >=20
> > 'nvmem' is used/declared by nvmem-consumer.yaml as a phandle array
> > already so using just 'nvmem' fails validation:
> >=20
> > Documentation/devicetree/bindings/mfd/maxim,max77759.example.dtb: pmic@=
66: nvmem: {'compatible': ['maxim,max77759-nvmem'], 'nvmem-
> > layout': {'compatible': ['fixed-layout'], '#address-cells': 1, '#size-c=
ells': 1, 'reboot-mode@0': {'reg': [[0, 4]]},
> > 'boot-reason@4':
> > {'reg': [[4, 4]]}, 'shutdown-user-flag@8': {'reg': [[8, 1]]}, 'rsoc@10'=
: {'reg': [[10, 2]]}}} is not of type 'array'
> > 	from schema $id: http://devicetree.org/schemas/nvmem/nvmem-consumer.ya=
ml#
> >=20
> > https://lore.kernel.org/all/20250226-max77759-mfd-v2-3-a65ebe2bc0a9@lin=
aro.org/
> Heh, this should have been just folded into the parent as Rob suggested
> during v2

AFAICS and remember, the other discussion was about gpio properties only,
nothing about nvmem. And I addressed all gpio related comments I believe.

> Well, let's just merge it.

Thanks Krzysztof.

Cheers,
Andre'
