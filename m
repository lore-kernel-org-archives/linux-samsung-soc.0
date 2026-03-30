Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722C93BADBA
	for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Mar 2026 10:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774867934; cv=none; b=fpqEsTPKfj6NIrtIo4UFF4EP3NSCSs26NpelfimGhy/6UmyEzktuET0mVZEJ44vvvRQL4uVMIhxwtpy1ZAJtIQsz3Lo6vlh6rq2sEEEuy1nxiAy/Nl76doHm94/inyLHCrfMuAlGKZSfIH1OhLNL2RJ5IGnPYnG/u1Y3T6+Q3X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774867934; c=relaxed/simple;
	bh=8tGCl9H2u0kxygEigoVcToA6cJ97rZF07Am4vKOJmbs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y9DIzAuSBP2wRK/BHP6buNww3PjM5bMGEb4bps2BrJbnqfux+QzKNFvPS1FHWmIuDDg/BNVCykHXuMAWOCatlHHTOIei/Bey0GvsyRSFiL7RCXLWzumIB5A/SRNOitkhoEDEwuWRJBAmpmWRI7ddh2Nb8Fi+CvH+ZzqO6Ui5RJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VCvcQwNg; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VCvcQwNg"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-487012ce896so26179145e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Mar 2026 03:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774867931; x=1775472731; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8tGCl9H2u0kxygEigoVcToA6cJ97rZF07Am4vKOJmbs=;
        b=VCvcQwNgAwvtg6k5HaKlSk/DWAF287dpGwC0Rn8Ss871lQXbEI2DnRHtdW2xQXmJGh
         1n0yxr/aQ7X9PEd4x3a4rdhGLkK8/yVBNvq/kuJYFQ/MqrzWYRoAMq0xX/DVTmC4Ef4G
         Ytn4u/JkAGZur15HRZCJ9Q9rd2wC1JarucW9f8TKbKsDHtZcFgFZ0ziNyBOcbbhK+8At
         QJ/v1XvY0HOiHEfB7VRo3ZltFUZatWUXSOcapmU7lLnuSArdccf/tC+4RBLE2i4MmZW9
         Zwrac2m2GafZGJRLTfO56KACyfl0NUTm6Wm28CV/gxR9yv4YqTGJ/1i/uWgHcUK5SVtI
         TWYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774867931; x=1775472731;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8tGCl9H2u0kxygEigoVcToA6cJ97rZF07Am4vKOJmbs=;
        b=KI8dPe3vl5KLreCjAgXfS4E9AzBVqUUPhF9Nx+XihGnQg8/hNyKJUlEhGY9zKBPewr
         xc2aTrRJlInqutTTD99530zIjAxqpxyY7JsV3Vlj1JqFkVFscwScdeXQqswRmcS4x/Vg
         NDbFM1xBbW6XJ0KP4Q+nRUWCb1KVNlPqlUOlZBsx5ARQUkdbPzbf+QfuhhLv932sXhp5
         4qaRghSWhLNlH50hplsPOrUka2OV6F62ZwX6ZPnX/VNPfZY42f1Ezbp2bvh2JQJhjbsS
         AeUAe5CDej250FOirfNpfgSY2U5IV15Azj38b7EIscvULVHYwJwLff0LR05z5bXIpL78
         uIiA==
X-Forwarded-Encrypted: i=1; AJvYcCWhkSJaiRMX7PSdWxoLj0vRYbBpeyBF5jfCU4Tq3VHW4taGToortn3li1ONjDWDN2eBHmRyxpuQw5H1K19k6QeT3A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz888+vlRSGFZH2yAFaF294LjwnIBhcgk62oeGPQAwnZf4IpVXB
	lAeQBDSr3NxWilwnRzkVn7OdxPlV5TMjM5L/Ueph7kLPnXllFe79bqFUX4vmVvAoSKgmSa810Na
	w+jio2CU=
X-Gm-Gg: ATEYQzyDD2zfIoWEgSPaOhcfHl2slOilmjfaI1SeYA4mDXhfuidv1qXjsURTgFpY46j
	kxmQQ4zxoutckTx6VpUfu3UuyB/d1nQ/fULH5+fN3xEGhzISs2/eLfqs5bs/oT9s4KsJOoSaLBn
	wmXTqgUUUGiXIZZnDisgW1lF/ALBjei2B7V0JiJ0Y95DfugbyACmd/h9l4/KlGIR1tj0495+wBJ
	4VJhn0LMBlY/fblQpJjKpuDFUEXwJWJ3V+6pv5Q1HYPF49dhE4DftvoEbyGCmVT5aTkJElxCDSv
	HXGfrQZh7+F8KhwBOBQ/6j9+TahqPHtzCEnnQ6a/pTe+OZkGUq/sULOzSaZxhZ9vwfjXFSFT3lA
	hZ//rzCXo8PDx3ZvjEQ0sz2WKBNcv6gFb6Z+FyIoj8Gbsv2COQ9vjnfGyO9HjfFh0Ymb2dFSA8h
	VkmhHd9F9DAj/xrwvcj2QaxquKDgyC
X-Received: by 2002:a05:600c:a108:b0:485:3a27:a961 with SMTP id 5b1f17b1804b1-48727c82082mr167788605e9.0.1774867930830;
        Mon, 30 Mar 2026 03:52:10 -0700 (PDT)
Received: from draszik.lan ([212.129.78.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4873ab203e9sm78932785e9.0.2026.03.30.03.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:52:10 -0700 (PDT)
Message-ID: <6f0be0a71c74e7a7959e9ad02e93aff1cb8ef712.camel@linaro.org>
Subject: Re: [PATCH v8 02/10] dt-bindings: power: samsung: add
 google,gs101-pd
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Ulf Hansson	 <ulf.hansson@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown	 <broonie@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus	 <tudor.ambarus@linaro.org>, Juan
 Yescas <jyescas@google.com>, Will McVicker	 <willmcvicker@google.com>,
 kernel-team@android.com, 	linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-pm@vger.kernel.org
Date: Mon, 30 Mar 2026 11:52:08 +0100
In-Reply-To: <177409897339.266364.69715997034739052.b4-review@b4>
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
	 <20260318-gs101-pd-v8-2-241523460b10@linaro.org>
	 <177409897339.266364.69715997034739052.b4-review@b4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,


On Sat, 2026-03-21 at 14:16 +0100, Krzysztof Kozlowski wrote:
> On Wed, 18 Mar 2026 15:27:47 +0000, Andr=C3=A9 Draszik <andre.draszik@lin=
aro.org> wrote:
> > diff --git a/Documentation/devicetree/bindings/power/pd-samsung.yaml b/=
Documentation/devicetree/bindings/power/pd-samsung.yaml
> > index 9c2c51133457..3f1a2dc17862 100644
> > --- a/Documentation/devicetree/bindings/power/pd-samsung.yaml
> > +++ b/Documentation/devicetree/bindings/power/pd-samsung.yaml
> > @@ -44,11 +45,28 @@ properties:
> > =C2=A0=C2=A0 power-domains:
> > =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> > =C2=A0
> > +=C2=A0 samsung,dtzpc:
> > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/phandle
> > +=C2=A0=C2=A0=C2=A0 description:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Distributed TrustZone Protection Contro=
l (DTZPC) node.
>=20
> For what purpose?

It is part of the domain.

Furthermore, TZ configuration is lost as part of power-domain power
cycle, so this allows a driver to take necessary actions (inform the
EL3 firmware). I believe this handle to be similar to e.g. the existing
samsung,sysreg

> Your patchset is organized in odd way - first patch for me, then not for
> me, then again two patches for me. Please keep it consistent. Or better,
> decouple since there are no dependencies according to cover letter.

I'll update the cover letter to describe the dependencies. 4 depends on 2,
and 2 depends on 1, hence the ordering.


Cheers,
Andre
