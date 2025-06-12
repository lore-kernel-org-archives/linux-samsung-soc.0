Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAFA1F8753
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Jun 2025 10:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749725960; cv=none; b=Y2XkwzaDktv71fuT8yqXcpNn0GOpvtqmZ99rH2P5D9CIorl9x9ep8jU5aoOv2RAtEyyJ9AZLnILEW+4KbLps6w4oeTO4QvuCBtbH4sKYNVQ2Pttr3PjSEpvVwM3xaov/7WRcIpFenYh2TOwwFZNnBSbx0ZcQzGIz3qI5FrhjXtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749725960; c=relaxed/simple;
	bh=WWPYYggyKVUIqcpZRwtY3ch16mcUxM6fvmZKKpyOsWg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mCNZ7IzDMCZPYVQQgTMhqrdURC9LGvKqPRufJotJyjhid19PJ6xrx6U9LWh/bqtI1Y2p845fvKCoz564h4u0k49Ir3WY3b3CV9ZcMtvx2y2shzlAt+Ws3UbSV47StwvGV756MrVZqdlINMyyYVEnyoqLN061p8j2O8jiV2oy1Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r6nN+AaH; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r6nN+AaH"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a365a6804eso484350f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Jun 2025 03:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749725957; x=1750330757; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OxVFpXC9gE/NnptI7yasZSeAwdsDwjZxI1xtlSOfvvA=;
        b=r6nN+AaH1FFt9eiD/oBB6xuxgOlHpttnmzJhBx3WCbi/KaDm+x7tLBZyac03mSdqFT
         n75/2p6JKdJjfULVxmhhVzlSK1CoWfbvx5ZN94xlE/oCvExe7Mpg/3DrCfHFBg38SpHw
         AZbxEyi81sDmbs6yXTlIWc7Hcf82sdtAv/myAQnpqMUwIZOHCL9FCLTX/CZYOXeeTojw
         ckQjb0s/Su47ljH+lKQ7oMYRtYI17ATM1q1zIqJjW2rNLvK6w0QCOxZ6WTYaUmTyURZo
         6P96e6qJ076z6uZXdapfKqBNGdoQxxjyN9Uwfwu3kSwDbprln1I3fE14n8rVDFcPp6iL
         4A6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749725957; x=1750330757;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OxVFpXC9gE/NnptI7yasZSeAwdsDwjZxI1xtlSOfvvA=;
        b=l0t7Fz9hXiYnGogZnaiKBORk982O1bDYqxruCo1mbnW9RmgJBFpn+nUghHezmyw2m0
         Hd3pBkRg/fNuAUV/EcTQQhRNOsO5cuJX5PCnFbxZ/RempcV+vRFo+P+pbJidWCyXtof4
         8reQQvrllk7RlakD1om630xK3nrqY07OTI7uIIKALTcxwV9TNTL5/+edEYaIB5PJOEeJ
         w4rmjjT0g+MmhsZVvwjtk+mE5V/OnFIRTEKJjpw9TIsslNr0BDyaI5njmQ3zd5H3zl1p
         bGJ+I1rNdburRlP2Fp8NrTcURiSPuvw889LRxT1Cqcdx2ldjIJmr8jejUVu5tKw+Q6Of
         G6SQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJArsrF9ZSmNEhzJmk6f6Is60Nc50BYUdAIIfw3oWYDBguv1ZeYedPlyLGJEoZ8jO628yJjNHoyDwKoQyQoYen7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlJ/6qLmbophMCTKZgbdkv91MutfFShIauW61Ya9uLqqwrfGnL
	ZppKFkdIOs9xWnTY96myLC3c2y0Ib6qGPvOoUpcdpqq5kVE8x/RHToQX78WpA0fhuBs=
X-Gm-Gg: ASbGncvE5o2J58fYNrZAfkqcn20mWoqTXxRB9/YB+iMlsADoFPpTKisHX/cQeRgxmur
	wQROiGOpTwQ1VlbdFLD7qDRF92dETNQpmLLKv7E+zxhStS33xqiJL1RDUnMseevwqy2AotP+JoI
	O/U6oRDAV0SDpG4g4P4cIubkrTSR66Dn9b7yJT+p5/QWDgiOnALHgbMcg5OeVesZzM3XWEum/uF
	3wKCaYPU1sFYE0iPB6o0MJpdDY+l9C1fRt9u57tJwIRRxUD9tCEZSCv3GLEaTW+fI+2JEhrmuXX
	uhLU5ePls+fr1FrEoRKLepXpQtqDbRftmFb31Lfnp8LMP+jjSVmqE10irUDhMW8nVg==
X-Google-Smtp-Source: AGHT+IHqd8/I6PcH/SsGO4ZHasePxLhvFKcF2xtJG5ImKC1vi9knPoEYRyrNOkQXYTNCKl3KYXGlKw==
X-Received: by 2002:a05:6000:4028:b0:3a5:1f2:68f3 with SMTP id ffacd0b85a97d-3a5586e9764mr5499812f8f.46.1749725956635;
        Thu, 12 Jun 2025 03:59:16 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561976a20sm1681124f8f.19.2025.06.12.03.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 03:59:16 -0700 (PDT)
Message-ID: <b090594cb2e61160a830b4cd73d7d8a529872130.camel@linaro.org>
Subject: Re: [PATCH v2 02/17] regulator: dt-bindings: add s2mpg10-pmic
 regulators
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Peter Griffin	
 <peter.griffin@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Date: Thu, 12 Jun 2025 11:59:14 +0100
In-Reply-To: <f5fcaac5-fa8e-41da-b1d2-e84197992e3c@sirena.org.uk>
References: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
	 <20250606-s2mpg1x-regulators-v2-2-b03feffd2621@linaro.org>
	 <20250611-statuesque-dolphin-of-felicity-6fbf54@kuoka>
	 <f5fcaac5-fa8e-41da-b1d2-e84197992e3c@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Mark,

On Wed, 2025-06-11 at 14:53 +0100, Mark Brown wrote:
> On Wed, Jun 11, 2025 at 10:55:44AM +0200, Krzysztof Kozlowski wrote:
> > On Fri, Jun 06, 2025 at 04:02:58PM GMT, Andr=C3=A9 Draszik wrote:
>=20
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 For S2MPG10 l=
do20m, the following values are valid
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=
 0 # S2MPG10_PCTRLSEL_LDO20M_ON - always on
>=20
> > No, use standard regulator properties - regulator-always-on
>=20
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=
 1 # S2MPG10_PCTRLSEL_LDO20M_EN_SFR - VLDO20M_EN & LDO20M_SFR
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=
 2 # S2MPG10_PCTRLSEL_LDO20M_EN - VLDO20M_EN pin
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=
 3 # S2MPG10_PCTRLSEL_LDO20M_SFR - LDO20M_SFR in LDO_CTRL1 register
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=
 4 # S2MPG10_PCTRLSEL_LDO20M_OFF - disable
>=20
> > I don't think we allowed such property in the past. I don't get what is
> > here the actual signal - you described registers in multiple places, no=
t
> > signals. Few of these duplicate standard properties, so this looks like
> > exact copy of downstream which was doing exactly that way and that was
> > exactly never upstreamed.
>=20
> It looks like we can infer the configuration needed here from the
> existing properties,

For this ldo20, yes, and I'll update binding+driver to do so.

>  if a GPIO is provided then use value 2 otherwise
> use value 3.

Close :-) There is another register to say if this pctrlsel should be
respected in the first place. Therefore if a GPIO is provided, then use
value 2 for pctrlsel, otherwise the value doesn't matter, as pctrlsel
will be ignored anyway. But doesn't really matter in the context of this
discussion here, just for future reference :-)

Thanks for your review!

Thanks!
Andre'
