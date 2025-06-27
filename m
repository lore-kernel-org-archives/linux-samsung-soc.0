Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9B6136327
	for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jun 2025 08:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751014462; cv=none; b=f/XiP57WFO/rkwptQd7qJ9OI+Q96FwNDp3TbCWPNplnUypS+k9VkUEVWJPHwrEU2nTvbebALWBTSh6ic1th2L+PtrsbrcjGj72aBDdKBipJlNBfNM3bYbQLV1pwqx8ic0AHp7BTl1nsElnpjxf8Ccz5owOWMcX6IMPdl7cuWbUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751014462; c=relaxed/simple;
	bh=G/67mhxLuKytL5l5EvWf4Siqtg/clNGoegq0wOXrKnE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J+wSB0a6axP2yUUESk1L1y6Irr8XnVfBg2t7O2uK0EtGYJviMrsYOcxpFgnZJqTtWgkNA8vD+2uNSBev6e/mwHoTMKj6jq+xzhCc3ksOya4nFCP7AjD4umo78N2bQi+UzzJWyqeNaAcIzzBcLKK7qLYl4D3+ZB+Ud0px+7hZf9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iba02Znd; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iba02Znd"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4531e146a24so9936455e9.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jun 2025 01:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751014459; x=1751619259; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0BS+6uy4su/8ABLs5cJdrouwkh2bvREAZhph1XMTpHE=;
        b=iba02ZndNDEd8FYkIxmnk0X3mZnW4cYs7zKS8dLT0Aeltvyo8fofDespJ+Nq8ompjG
         D1uddw91hnsRPH/DNoGBALCrrFfow+lMQxqjgbxw6GqLYhORAVBy6XMrf6KUoxgC7iuo
         RtH+vr1MNWgySIOXmxJ29Arllq7sXQ23n5jhI4SeLEFg8kPnPRT4DJCM2LsHSa5IvMi+
         irrWWPcEV/CCNvXRjkbmr56FHRMtTMPvVMZBpbTBQWVITUbuWj4kG6VzRjESdoeSH88E
         InbD7swBRHhdZbonyFcx6JuBKfZ0YCrYh8mwIVg5ZSLra/e06iIDPzND/0QRkm5BPJ5O
         VBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751014459; x=1751619259;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0BS+6uy4su/8ABLs5cJdrouwkh2bvREAZhph1XMTpHE=;
        b=i+bkuJrLuIeGgx72m8S3AkxogLTqoMT2TttM0crB4o5pofFhJjLUpbWckbA5YoAjHB
         LDtj0vQFQ23WpuXFBDWPt0oLbynQTN9puUd6WcmT0JWh+fWi3yMHmBd2S06soQdCoKAo
         AKDrGcRTEH9lOiJSXitduvex1I5dkWvOtetZ6L/PLRHvUCiMwDX/GsXrrku3j3r+guXy
         gHlzX15H1fW9x9ioN1EkF9wioh1a7KnMfvNx4eLWpOiqZmyIMRnCDi0020SMhWbbUHNo
         kziz0XzcNvNpwEANbCvunMPxDAE16z4LeW6RMAedRYVGarzkkseOo8k05cTKJD55ngSg
         0+Jg==
X-Forwarded-Encrypted: i=1; AJvYcCUZLXZu2MWfc7rHIUsp2zMKcuyCVZAgKHAzaQjvJ1B2vESPX4igKXMenbgHG59VJwm/VGWO3rbRU8S6NztoZFVxEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNDLsy2gFMZh0ly7JjNf4pKmYZkvFR03Pt3t0LKTN01E2TUqKq
	8J+d555U2nCZ9ZRgLFtxxw7avDQqqwt4kihe7+VsczPnnOF3x3vt5tcfNtfwrBWpeWM=
X-Gm-Gg: ASbGncs8DRlDpL8GgYoPae9v1xclkcfWpQHwNYD41S/kWAtA04puUHfAxQ0jiMvTfvS
	cRaI76T5taGela4eodsup8Ox1oSsCapHCH4DKQTHWKCeM2Ipqa+3GjhopSUiCUs4IesTxQ3FxkV
	N2F9nn+oRiTdGI644pQeUWFdfrXyLy/IYCpQjmD7YzCwZ2sgnn2QMYTUkmJKYGaCe/ri5FRNXV+
	uTbIN0QiVqJXxvTWsQ3cxorlBKGhduM6RDSnaD6GZ9FjQe2xTqQTHgthjaMIh1DwQwwaA0cYwEF
	+fOaq9CuXydrMhNMh30FNN64fa2/laCKhVTwOlRuv2LflIZTh7CvNumTbGQjoUZGqQc=
X-Google-Smtp-Source: AGHT+IE4X30M79feYa1B4IoJp+P/zoAnkDqF1pqfPyj589N4UXNvVInq2V7VnCmuiR3hct5W2E2d9A==
X-Received: by 2002:a05:600c:1c87:b0:442:c993:6f94 with SMTP id 5b1f17b1804b1-4538ee59148mr23355875e9.12.1751014458664;
        Fri, 27 Jun 2025 01:54:18 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4537c6e2f64sm51190205e9.2.2025.06.27.01.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 01:54:18 -0700 (PDT)
Message-ID: <b2c3b78d60f3dc3e4576e8b79298e22ea46567c6.camel@linaro.org>
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
Date: Fri, 27 Jun 2025 09:54:16 +0100
In-Reply-To: <2c491166-d8ae-4fb6-a4f7-74e823e1205d@kernel.org>
References: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org>
	 <20250524-b4-max77759-mfd-dts-v2-2-b479542eb97d@linaro.org>
	 <2c491166-d8ae-4fb6-a4f7-74e823e1205d@kernel.org>
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

On Thu, 2025-06-26 at 21:49 +0200, Krzysztof Kozlowski wrote:
> On 24/05/2025 07:21, Andr=C3=A9 Draszik wrote:
> > +
> > +		gpio {
> > +			compatible =3D "maxim,max77759-gpio";
> > +
> > +			gpio-controller;
> > +			#gpio-cells =3D <2>;
> > +			/*
> > +			 * "Human-readable name [SIGNAL_LABEL]" where the
> > +			 * latter comes from the schematic
> > +			 */
> > +			gpio-line-names =3D "OTG boost [OTG_BOOST_EN]",
> > +					=C2=A0 "max20339 IRQ [MW_OVP_INT_L]";
> > +
> > +			interrupt-controller;
> > +			#interrupt-cells =3D <2>;
> > +		};
> > +
> > +		nvmem-0 {
>=20
> Why is this called nvmem-0, not nvmem? Is there nvmem-1? I see binding
> does it, but why?

'nvmem' is used/declared by nvmem-consumer.yaml as a phandle array
already so using just 'nvmem' fails validation:

Documentation/devicetree/bindings/mfd/maxim,max77759.example.dtb: pmic@66: =
nvmem: {'compatible': ['maxim,max77759-nvmem'], 'nvmem-
layout': {'compatible': ['fixed-layout'], '#address-cells': 1, '#size-cells=
': 1, 'reboot-mode@0': {'reg': [[0, 4]]}, 'boot-reason@4':
{'reg': [[4, 4]]}, 'shutdown-user-flag@8': {'reg': [[8, 1]]}, 'rsoc@10': {'=
reg': [[10, 2]]}}} is not of type 'array'
	from schema $id: http://devicetree.org/schemas/nvmem/nvmem-consumer.yaml#

https://lore.kernel.org/all/20250226-max77759-mfd-v2-3-a65ebe2bc0a9@linaro.=
org/

Cheers,
Andre'
