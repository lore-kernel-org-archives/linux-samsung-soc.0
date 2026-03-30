Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6E2391848
	for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Mar 2026 10:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774867987; cv=none; b=Do/maOuc+mYlNDOzbA3fN+HwkqF/YIRdUR6oT9MTiUqpFruTNsCZJNyrwL0l5tkzf4v7raO3ImxqlKjXDtszrVtyj3LlSHjZaJiW/risWwnNJOwuz6NsUrlWj3/7In9YtudK18dFSF/TE3OeGJ8UPmeZf2NkbC+LX7Z2bnsH7oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774867987; c=relaxed/simple;
	bh=BNYWE4ZNfeLRGblM3h9jfVP9WIaSB0fZFyHZKbb2/BY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PeIijloVliaAIXtlT1ZappzHunBTgjt3iQid2Wndz6doVwBQFnzDJpb3VPs3eiRMWvWulLAB2o5D89j3NJCcPF5B5UsRqYh0XCRTGQ4+GkQZBH2S9wnQabKHnmHplZNePAKz50c/uKZT06BnyO35lYpFLlZOAGh97mk2EY0RpYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TATXPP8o; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TATXPP8o"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43d04fc3bf2so225003f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Mar 2026 03:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774867983; x=1775472783; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nzbPas/zVRhWvMIP9KSmda2kkwwqeTULljeMJhCNvcc=;
        b=TATXPP8oQZLLpCL5KsAbv7XDn7cKmg9nSldOrFdSaePhsGrjiYktxRxakmzU3qRWsw
         diGnL0KCwMdRNb7Y1dbl0Jbzg56l/L40ZsBuiXIg4bIJsq+BJQPmpxeRrpZWzaWP0DmC
         XMB05gv3bTPzZKNxjqS01cAcNiOzBzIVKVDvWsWqgy0GIRRD8pI9rCvIK228Bc4+e0Hp
         u12CZLOVWdxGJOnAEeccPFC9mhaEDyNIoY6hJIpOOp4WA0Cpgby51JjrA0gYuQnTq8bO
         SOpvtVO8U9wEycMtYHDp0Plko4SZ0hbUAHWeWg4iChXZ+t+kH0cPUEvov2yD0c4kP/ia
         q5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774867983; x=1775472783;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nzbPas/zVRhWvMIP9KSmda2kkwwqeTULljeMJhCNvcc=;
        b=PZTZFYr782j4QIjk455MiFlNEKDntQNscoeWvHUdxlkSTmgO6MXqyopdag2n4dF7sL
         AxdDkRxDRY+hPhiFEdkg2T38DtVMik8jure45JnHzVi8zYNgafM5VkmZE88ZS5xGjJ0H
         vto0vFx/CEjniJqFcb9XH1ocy/42tqiEJfDaHFJneXoKdOVakqslzTNi8N87LzZhVX6j
         6qy5TGRSHkgjJi+43qbfM/7eIWJ7yKuxU0RNTbKonKTCdIBp5WXgR96GSTh00zf1FuCI
         ZBFadB6pzsYFX28OULV7Ut8jjyWU47mxtXTjIivoPnb4RUPS+naUykkDXWSfvTH6pZzO
         A40w==
X-Forwarded-Encrypted: i=1; AJvYcCUWEviDnGqPRe3o2KmTERtEW6+Wfmnr/LHVQuEGr6Th4ZRYznzVlj0BB0jSGwKtoobSznub8zkFFO4rKg2bmfVGYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUHGZS7Lih9gsnkuRSdyhRtE/8OSM/NR+zyHD3UATQLjQybgfW
	vPuLc4qPKW6QnVK4afVqBA/lspkp+kX+F6//JCgxeQ4/rRfFX3nGrjPGMx+2qfMrOrU=
X-Gm-Gg: ATEYQzySMWKs8SHVAStpMokIpW86Jqa2kuUBtDZYCYiAQ1GBoGN8KytpSHhZkvu8dUc
	OzjNkvAgOpwOz/fNwWp4QfDB8nGA1m9M1leEimXq4wff/LaOyanelOdzHufb3mvmGNCQ6Op8hs6
	9h/PKqPP3w29LLg4AHVEVWDhV6Wx9E+WAJ0fu8q5eKGHIkvZw/0Qwadszn5rX4lTXLpMkv2wI/Q
	y3O0mys58gyYLpKvHteoBHtxifdsGkx6y2eXLM/5fm4Gx3h8xbQdLjNkGQgwuWC4GiPQKLg131q
	q/C6Y9Tby9Gu82duwNfunyzYHcciTdPi/L8nIC8FjeuImJRC9XV2QuF2HkHOCTizP45z402VNGt
	9xG5zCqEWLo6Xn5qGC8wCEWvSZSenAz+3RxhveuFIFexEtly9Qifx5UF2/5ws4PCCQdzzZ1UY4C
	apJ3Hpago0t2D/9Ru6DORHQSiud+sP
X-Received: by 2002:a5d:64e6:0:b0:43b:8fa4:1937 with SMTP id ffacd0b85a97d-43b9e9d5ea1mr20787372f8f.5.1774867983379;
        Mon, 30 Mar 2026 03:53:03 -0700 (PDT)
Received: from draszik.lan ([212.129.78.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf330872asm16354366f8f.17.2026.03.30.03.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:53:02 -0700 (PDT)
Message-ID: <61f4ba09a77a255008078a8655e8f4791e4c87ff.camel@linaro.org>
Subject: Re: [PATCH v8 05/10] pmdomain: samsung: convert to using regmap
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
 linux-kernel@vger.kernel.org, 	linux-pm@vger.kernel.org, Marek Szyprowski
 <m.szyprowski@samsung.com>
Date: Mon, 30 Mar 2026 11:53:03 +0100
In-Reply-To: <177409897341.266364.2957933304869869135.b4-review@b4>
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
	 <20260318-gs101-pd-v8-5-241523460b10@linaro.org>
	 <177409897341.266364.2957933304869869135.b4-review@b4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2026-03-21 at 14:16 +0100, Krzysztof Kozlowski wrote:
> On Wed, 18 Mar 2026 15:27:50 +0000, Andr=C3=A9 Draszik <andre.draszik@lin=
aro.org> wrote:
> > diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmd=
omain/samsung/exynos-pm-domains.c
> > index 5c3aa8983087..68b1e7ba8729 100644
> > --- a/drivers/pmdomain/samsung/exynos-pm-domains.c
> > +++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
> > @@ -120,9 +140,26 @@ static int exynos_pd_probe(struct platform_device =
*pdev)
> > [ ... skip 20 lines ... ]
> > +
> > +	reg_config.max_register =3D resource_size(res) - reg_config.reg_strid=
e;
> > +	pd->regmap =3D devm_regmap_init_mmio(dev, base, &reg_config);
> > +	if (IS_ERR(pd->regmap))
> > +		return dev_err_probe(dev, PTR_ERR(base),
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "failed to init regmap\n");
>=20
> PTR_ERR(pd->regmap)

Thanks!

A.
