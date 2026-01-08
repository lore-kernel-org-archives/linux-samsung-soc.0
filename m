Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B774A22EA
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Jan 2026 10:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767869717; cv=none; b=ATJg95vVF66t8I2aQPXSZUDPGq52xLtiwERPzNQhXJSVNs4xFGLsD0DN0mEUdKQEG+blaj5o6KKAi3M9t5BHemxO9EZVDwBkDtHhFzgltgC6TzdT8CCDg8KHMq2f5RYgHxiPJB8T5OU3/z6LWQyCYah959dx5ZmNdOhVRYUsRnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767869717; c=relaxed/simple;
	bh=1EcDxSiAG1moBRCzOCZJ8zXcRYQt9YQGzwc3QfezyV8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CGgETdDKqipapwQA+jk48S1JAyj6H5PlRrwn1bnb30EflTV8Mu63kwYl+BFbt/dLvDON0+i1Hac4pOLCn/SVV55CE5V851ypQyBA4J8ox9f1cNKxrSRs7fEcDooZFvW4u5lsLgJrzgx2WwPOQPPkuyc5N9JPIEV3GEmYorBB3FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IulLOtog; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IulLOtog"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8c30365ac43so288187585a.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Jan 2026 02:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767869710; x=1768474510; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Xp+jLnpi2PjqF/80J1/P3vKHgVtAc982+H+fWTmGZ9s=;
        b=IulLOtogqry/8kwuO67XPqp5pdFEowA6GHUKufqq2Zb66dfz4LueeKVDnrkwr5U1/Y
         cDnDqZ7r2eqvUCmYE3+EV31pVUWmHBfc4p+e4/yJ/tYmTSfh/aVl01mLKnBsmVxoRxSd
         Czly3hrALXQUKZa2ZGcpTzDUtm70D5zYE/hI6u3Sz1EBimnrjWbj4ySWZPcViLzE76XJ
         xUAB3LvMmrXVpSugFvS1a9bOAuz+PGC2+g8VgFIbBpBs009rj1uTqL63kMZ/8I7+Qd04
         mKNR8RjbMli/hfcDP5SgQ+K27oHniXLJXrnLFyMV8KzeAiP161eKN6hEfqdSi0nFTD/1
         ZVAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767869710; x=1768474510;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xp+jLnpi2PjqF/80J1/P3vKHgVtAc982+H+fWTmGZ9s=;
        b=G2Wb41GgWV75cX9KVGQVzg1JEmUXmDU+4hC1Bv5nYqWO5fNbp+u9cetU8TZ+L1Qvyb
         D8CVRnGnNQkMJF1TQRD70aOWuIj0ZMBdEYqj6yCKYNj02OxptzCUmdMv70CRdeq6iqcm
         2kOYnHnBsQCPyzHMf4jLOaI26YMUPPAgkRsV9enqLI/fDKfdEORUIseQOjjFB3XoRM8b
         q1/QaRc/TjiW7KACscB/xU4hpj7bcx3s3EWn6XVFUQmvFfb8NYv9cc8RzPEey/K2QU/b
         2oSP/Q0BGDTYSjws29cevkhANlXzk462S021r4GHTFjp5SHwwJ8d5O6nY0kROxla2S3N
         gt7g==
X-Forwarded-Encrypted: i=1; AJvYcCVAGv6a1L/NqwSYaAxiMEpaamQ0bgT0yC6BuLZ+kisaTNiCOZqoPO7QOiMYG+kglkQKauqsiUDei1BXGw8RTETBUA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8I0aXU/ciM+eHquyEKvsb9ntU/2fvtRjto4qjTXm5OoRZUGQ5
	4hlJ7ID4vp2CZik2F6rVLWVafNOogm/7w8hJ39GPPjS6Ryp8vrSDQdQ/2u7LEIVoIR4=
X-Gm-Gg: AY/fxX59ErdSTh/6EYqPtsg56t5uvBR0cGYALUa3QGGTDIiXU+6+UClz0YZawcnoTDL
	dY/RkFrKYbnUFUR5TCYaD6b1vzhm6dcjZXyoVObr/La5wBZyI/PRS/cH0MNKgT3/stQs9cpu1zn
	4v3tZLkImhkw2CRBDlo9YOKUVFA4Vi23W0TQzISDUuu4l5A0a6/MFhHDmuJBo38KraLNeilmfjl
	25V6xry3AEbSqZJbfO14dhCsJQauly4pouTCbhvHhGE843+iYu8vhxh9xz9VygZhm6C0SIMdUTe
	FLgn3rogzv2cr3q/n+NEvY66WScvSOSFccUikOQx8LfW/WA+FpPM++eECAAJDZzF8uOw2o3nAR3
	A6T9GgyMb3YDmXrUV4ODhByD3vMIpRKUI50ZJlP70K+Ji9eoyK6KvCP4DBYcmREKTpKSA5uQSq2
	RFValS9i+lEAP//dEqc5vrZ3ho7RG7
X-Google-Smtp-Source: AGHT+IH+RaIZdxo2LBIZtEtzdVtnDlJ9INeZCwV1cPG9NK7uPV6RGwucuqTJ9BlmjvonRR2RJ30qBQ==
X-Received: by 2002:a05:620a:45a6:b0:892:8439:2efa with SMTP id af79cd13be357-8c38938d982mr647120085a.23.1767869710344;
        Thu, 08 Jan 2026 02:55:10 -0800 (PST)
Received: from draszik.lan ([212.129.74.168])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f400b59sm574557285a.0.2026.01.08.02.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 02:55:10 -0800 (PST)
Message-ID: <0c09a8c461db5a09e75de4587eef38bffbccf2d2.camel@linaro.org>
Subject: Re: [PATCH v7 3/4] clk: samsung: Implement automatic clock gating
 mode for CMUs
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>, Peter Griffin	
 <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim
 Akhtar	 <alim.akhtar@samsung.com>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko	
 <semen.protsenko@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, Krzysztof Kozlowski	
 <krzk@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 kernel-team@android.com
Date: Thu, 08 Jan 2026 10:55:45 +0000
In-Reply-To: <8b2c412d-3e1e-4be0-a9d5-ef67f6f0d409@samsung.com>
References: <20251222-automatic-clocks-v7-0-fec86fa89874@linaro.org>
		<CGME20251222103019eucas1p2c60f033dc02adfef360b4fc69bd4021b@eucas1p2.samsung.com>
		<20251222-automatic-clocks-v7-3-fec86fa89874@linaro.org>
	 <8b2c412d-3e1e-4be0-a9d5-ef67f6f0d409@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Marek,

On Thu, 2026-01-08 at 00:59 +0100, Marek Szyprowski wrote:
> > @@ -334,10 +456,20 @@ void samsung_clk_extended_sleep_init(void __iomem=
 *reg_base,
> > =C2=A0=C2=A0=C2=A0 * samsung_cmu_register_clocks() - Register all clock=
s provided in CMU object
> > =C2=A0=C2=A0=C2=A0 * @ctx: Clock provider object
> > =C2=A0=C2=A0=C2=A0 * @cmu: CMU object with clocks to register
> > + * @np:=C2=A0 CMU device tree node
> > =C2=A0=C2=A0=C2=A0 */
> > =C2=A0=C2=A0 void __init samsung_cmu_register_clocks(struct samsung_clk=
_provider *ctx,
> > -					const struct samsung_cmu_info *cmu)
> > +					const struct samsung_cmu_info *cmu,
> > +					struct device_node *np)
> > =C2=A0=C2=A0 {
> > +	if (samsung_is_auto_capable(np) && cmu->auto_clock_gate)
> > +		ctx->auto_clock_gate =3D cmu->auto_clock_gate;
>=20
> Do we need to issue "incorrect res size for automatic clocks" warning=20
> for every legacy Exynos based board? The check above should be in=20
> reverse order:
>=20
> if (cmu->auto_clock_gates && amsung_is_auto_capable(np))
> 	ctx->auto_clock_gate =3D cmu->auto_clock_gate;

Good suggestion. I have one or two cleanups anyway, I'll add that as well.

Thanks for spotting this!

Cheers,
Andre'
