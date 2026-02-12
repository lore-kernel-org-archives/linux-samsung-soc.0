Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB95F9D9
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Feb 2026 20:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770928413; cv=none; b=tLtrVKIGWDt6HAtrDzo+SQ9nOZ6YE5rXnr+VchluHur35jQIltm0oB4hu9MZIMKRAVEDyJS5bCHGbm9p6wemh0CTGrJZYmIIlbcP2e4KgzF+2Yj6o2xcA7g8TNKzBKaFM+p5LowmMYNkKLo5IRkV0zZqpHvybgJqsclgz6zBJgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770928413; c=relaxed/simple;
	bh=GnVOYFS1dOs4ytjskGYRNbag345ulKuZ+IaQUN3bwJk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tjlMA/VQmF1HGlkAMkYEGUr2N++Ji9+WaseB4hXujQyx03nSK+zOp/4rGnxNducVlH92jIYlcA1UX2CGYyKCRKoS4/CUsMAHMfWMEWftJZSn8pYP0gdNhKXEU4t88/XjHItxWVRiRwgSov0GbOI+CfXuIHwct3qpY6LspJsrvsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=irfRbt7K; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="irfRbt7K"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4362507f0bcso171897f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Feb 2026 12:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770928410; x=1771533210; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GnVOYFS1dOs4ytjskGYRNbag345ulKuZ+IaQUN3bwJk=;
        b=irfRbt7KDGQMMfULLyinfvoxkP/hz+aooshWz3GdSJHtAnlDu1FHGnHxAuOUqbTz+k
         m3bePX4J2eKz0Xdi2WFWc+s9uXzdzZk6E0O4CX+VaI/M6SXRPwt5P/BO0F84JLLDpEen
         Lmz7s9Wq8G71G0MFVKUg04VgfTOWEsAMnmGETOPAjhYnBWrFku4zvuv1YWBWXcmJYkGW
         ZHss5nV+gnmW+knAaVTX0+8z9SBpPWU3k0nvj/9NFqVLUb3sGBmXu4R4608KAXyfv9Dc
         qY6HzyBDELOwu/MCdwtaHhGy+d64ZhRNqwiQuTNSn+X0diclK5SEJ8wW8iERbYgJepsf
         qKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770928410; x=1771533210;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GnVOYFS1dOs4ytjskGYRNbag345ulKuZ+IaQUN3bwJk=;
        b=vsSJy21YOlNLForOAJMMdMMolmi1gFkZBhRzOQFBjKik9Y4emN7RUdmZmg7ePiNV+3
         pCa0nPh6DxHNuqNuGqguUi0CxoeLLGXU1rE9ReTOruDHblUJUt6+ZG4qdhxOX/nNt4/s
         QsdeQQHzTLFVPcyfkIX8odl9vYwgmmzt3vuTYX7S3cxBAI4QdseOtx5sQvKtMrEbQwSs
         ABYTFzenaI2gwAaxXFnmJqjwTnEFtIQbIS3sqoiSPGswtj+XVI129PgdW2dePW2U/eos
         ABTYLgTG09lZXbIiDKl33FX8umoy/AmatPWDLHUmhGFKDXsnVGnnjAoOT/blOC6/Rzoq
         H8tQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIhTpWZNHzENN8lRrYWJGmab08zdoAVy1YkQdSOo7QFY5wLMjyPb/bDj3Id4AzTS5a1KDufl/lX7syHyPVuPTEGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuW7/L3zxoQFZ98wNRP25Mioc1nbR3hoYrSuPD+KTsagIoq4AE
	yUxRZcBjCcxI4TNQh/AZveedSFD+OH9+1EUdi208kcxYCdI6kCsQ06DKIvbBuJmF5Js=
X-Gm-Gg: AZuq6aLbafoFLcE9c7cYnCOocrVVZLqyfS5ecvkBeYWi01BOx80htvW4BwXc9vBb5h/
	31YsoZE0Z7kKeILobmVwSEqXQU88VH2BMseFw6A9Sn4wvvx7dXQGN7wNmR5uLrjGtfQAVN9oL8w
	bkT51i6wZUIDySEMusv7u40ikvAhK0A77+2WGAlDcxLXilhqZ1sWZE/pDFn8ixhTP63UhmLgVRn
	WHRONqceNNjqdtJNWqk/psOfelJCgPO6iGSUBhKzug8YHR4E1PuXPOsBWG46MNsBxAtuRVmEicR
	YRb7AhKztdkDhsxCHPXHTe6JwELznrp0QNc3hpML2rihbAgq6s5HTZ/G0K7csENg7nKUzJj6u+u
	jwfGyQAmca1dBsdkQbuuCwu4+sDPRiuatzkghPng+Orsh81gsLTLoOXvz7qrQTTByUxzKAJfEVb
	76i5klw80/WSv4/4FsAR9MQzbUdiRGpnYBLy9ZgdOt
X-Received: by 2002:a05:6000:3113:b0:435:9e81:105e with SMTP id ffacd0b85a97d-43796b22389mr268014f8f.19.1770928410444;
        Thu, 12 Feb 2026 12:33:30 -0800 (PST)
Received: from draszik.lan ([212.129.82.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac9d77sm419495f8f.33.2026.02.12.12.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 12:33:30 -0800 (PST)
Message-ID: <f190f9a211a69bf5200098f9d26a40b117ff7953.camel@linaro.org>
Subject: Re: [PATCH v5 04/10] dt-bindings: soc: google: gs101-pmu: allow
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
	linux-pm@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Date: Thu, 12 Feb 2026 20:33:33 +0000
In-Reply-To: <CAL_JsqKKig8ePmmMZH=QagSyw0d=FKrORTxKzj7HOZqd0jLZFg@mail.gmail.com>
References: <20260205-gs101-pd-v5-0-ede49cdb57a6@linaro.org>
	 <20260205-gs101-pd-v5-4-ede49cdb57a6@linaro.org>
	 <20260211211229.GA3882182-robh@kernel.org>
	 <b5078af810a681333043f64d71b7d6ea55ff44bb.camel@linaro.org>
	 <CAL_JsqKKig8ePmmMZH=QagSyw0d=FKrORTxKzj7HOZqd0jLZFg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Rob,

On Thu, 2026-02-12 at 14:06 -0600, Rob Herring wrote:
> On Thu, Feb 12, 2026 at 6:03=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik=
@linaro.org> wrote:
>=20
>=20
> "google,gs101-pmu" represents some specific h/w. That h/w either has
> power domains or it doesn't. So which is it?

It does have power domains, they were missing during the initial submission=
 of
bindings and DTS.

>=20

> > The compatible doesn't change with these patches. So I'm not sure how t=
o make
> > your suggestion work without causing warnings for existing DTs. We can =
either
> > have an old incomplete DT+binding:
>=20
> If this is considered incomplete, then you are going to complete it
> and add the child nodes? If so, then the warnings are appropriate.

Yes, I'm going to update the relevant DTS to include power domains.

> If you were going to maintain both bindings forever, then you would
> probably want a new compatible. Or just drop the properties from
> required. Note that if you have child nodes with 'reg' and parent
> missing #address-cells or #size-cells, then dtc will warn about that.
> So it's not too important if the schema doesn't.

Maybe the commit message or footer comment was clear enough, sorry for that=
.
I never intended to support both old (incomplete) and new DT.

Dropping from required did cross my mind, as I also saw the warning about
missing #address-cells or #size-cells in that case. Missing 'ranges' would
still not trigger a warning, though.

So does my above explanation mean you're OK with the patch as such? I can
reword the commit message a bit to point out that while this binding update
breaks existing DTS, I will update them as they're simply incomplete.

Cheers,
Andre'
