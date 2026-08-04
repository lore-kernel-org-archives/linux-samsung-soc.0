Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4382D39B96A
	for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Aug 2026 12:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785845271; cv=none; b=twfQThkoMXhANLSZEXDoiKyuDeWZsbl7MG27/WXiOef3F+WZAJ5hh3NDY16JxPEA01FhzPmYELTWBcpEv5EbwZ779VeyEQHMK0jkTgG7oprnRiGXQ5CraUvi5DrA1RrtzDmVmJ8z5rITLvPbK49ELbHmh37OKmFkui9pgsBEkrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785845271; c=relaxed/simple;
	bh=HgW9krDqxT2FKCqRiY4Ucv2waMe6ob+70M7DoaSCHZ4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=My7KJiaS3cr5dX51M2nH+PfuxgJxYZSAZLEZTEKgp7fu1JPOsyvMcde7VfsNnxgRmHiD58rSpEGeE9ysc2cWwP6uRzOZPhmNlLcw+i7ug8RcMdPaxiV1oygyJSmlx93aw7geCUetL2SyZkwv5FhIEti4ntIHHIAFF9ENlxmc4QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XBfDNasV; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XBfDNasV"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4956869750eso20425025e9.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Aug 2026 05:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785845266; x=1786450066; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HgW9krDqxT2FKCqRiY4Ucv2waMe6ob+70M7DoaSCHZ4=;
        b=XBfDNasVJDV5qQi9jQK1DlOsHVDUKb+NKaSIbE7Z7O+5FNa1d2M0RRJl64wIWj0p2m
         lcjYCr8Vl95uYGonIYqMQ7WTw0dhM7ZvmYfbjsI0RZYLrcKluk8On5YyXV2NHI0l9gnC
         QoMYS0vMzzorYgsD3msn46RzhyMPs4uWXh6ZqhwE3yerv5W5R4Y6Rvn+7stm95PSsKg7
         qTzYTeUcNMVVbnILodQxx3RpBp2zTLcraWmkTwkUlwCZUFJtkhT9BcCWPnS/AucBwGyh
         HtAl4oIq4tNPjZXhxvgNeLEJsJ1vYXmhqeKyRHh+H2LRyEzOHlMhPsrleIv+K1oQ+MMR
         9ZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785845266; x=1786450066;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HgW9krDqxT2FKCqRiY4Ucv2waMe6ob+70M7DoaSCHZ4=;
        b=FjLL5/+YcL72hHk5DXh/W5/rh6epyYdQxTvWA1/dypVXQ927v7jSMgrsq+hV/mYHQv
         jzy3Glnm9BadksqQVg3tjusRvnWoZbIRY1WEa2DzD6VAWoFcFs+/YLzjsGtwBVAe/dhT
         s1Mvsh6StaIXdAGL1IQZlMCL5h91bQw1dCh/DKcoj6/kUH6EVKkIWhOu++BbTYM/baN3
         fP/X0kEDUGlg/OaAOWDtz9yWT0R6SkYbEhaC7VPYxGj2pgBHO8D6lkJWGx6zSgmiFmEK
         i5wtJA473zPJj+bbu/L3vCQzo8yRGuvgMBPD77IVBQYxLujJwnnE4ESTIY+yMwrb+diD
         MYew==
X-Forwarded-Encrypted: i=1; AHgh+Rp7bhkjsiYLHlNLfwT6UFUyLRgzFkJaH5XqtnW4nL9ts9AvO45MsWx8Ko/v0WIA+NxnXe9Su8/sjUema/Jl+dUvAA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg0uVRBuD2YUvPZkVjrCZ4ss57XWoR5mPHXzBcL/ZJdcnFdHhT
	Rx4WmlSXbsOo0ipb92Hjv5ndcyUtyiV72opPyTilCH/NzQ9H8q/1G//Tqpo38xE3Tkk=
X-Gm-Gg: AR+sD11CiX1DYMKuaVMdDCC1vCVJp6qmSaLLjQvpqAHiyqsJ3FGjYHPrE9JjcbbzS6D
	d5GuFJ26Na5mwbtfT7dM9a4EgzWnczoPX8gR6i07rgtXiybZO9oUbbZOw0qlSI3FzImhJEs+IU1
	Uz7hetrxIsGQFpaJnfyLjr/mkyxsT4yiICSdynLLO2YnHPN3rRYCvx0pZtSvxsxgl/3H56wT5g0
	n0G7PpQYs5dz3c4HzTswOQt6lYhb2Qk8LoHdtqfy9uMthiW8gx7Wh92VU8NiTl4c3ocINH4wMBs
	qVC+EfRIFTDXLSzd16PdHUSHNtMVvsSl/SDz6IS1M/fN4ybvUqqS3EJog621rgDWE+iriqYniPP
	cVqB9+XgxxzFpLEESDdXrLAI3hRgcOuKMuyC9qRmgYxovX0qi3G9wsvARX4Rh/pnZQb78Fp9ASh
	sjK9CFv8eUrzlIx3VGek49XpGSQjFaLaJOx/T7FXs+yzw3N3uuQNOGp76O/uv24lXz
X-Received: by 2002:a05:600d:8443:20b0:493:e974:41ac with SMTP id 5b1f17b1804b1-4980c6562c5mr262857645e9.16.1785845265916;
        Tue, 04 Aug 2026 05:07:45 -0700 (PDT)
Received: from [10.1.1.59] ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fef72esm98922805e9.15.2026.08.04.05.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:07:45 -0700 (PDT)
Message-ID: <00b083b57df5107300491fa2023311ca93603a60.camel@linaro.org>
Subject: Re: [PATCH v2 1/8] arm64: dts: exynos: Move 'status' to the end to
 match coding style
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Ivaylo
 Ivanov	 <ivo.ivanov.ivanov1@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin	 <peter.griffin@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Sam Protsenko
 <semen.protsenko@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Krzysztof Kozlowski	 <krzk@kernel.org>, linux-fsd@tesla.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 04 Aug 2026 13:07:55 +0100
In-Reply-To: <20260801-b4-dts-coding-style-strict-v2-1-f09a659ab80d@oss.qualcomm.com>
References: 
	<20260801-b4-dts-coding-style-strict-v2-0-f09a659ab80d@oss.qualcomm.com>
	 <20260801-b4-dts-coding-style-strict-v2-1-f09a659ab80d@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2026-08-01 at 17:06 +0200, Krzysztof Kozlowski wrote:
> 'status' property is special, thus DTS coding style expects it to be
> always the last property preceded with a blank line, as reported by
> dt-check-style:
>=20
> =C2=A0 [property-order] property 'iommus' out of canonical order (should =
sort before 'status')
> =C2=A0 [required-blank-lines] "status" must be preceded by a blank line
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> =C2=A0arch/arm64/boot/dts/exynos/exynos2200-g0s.dts=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 2 +
> =C2=A0arch/arm64/boot/dts/exynos/exynos2200.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 98 ++++++++++++++++++++++
> =C2=A0arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0 | 10 +++
> =C2=A0.../boot/dts/exynos/exynos5433-tm2-common.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0 | 47 +++++++++--
> =C2=A0arch/arm64/boot/dts/exynos/exynos5433.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 55 +++++++++++-
> =C2=A0arch/arm64/boot/dts/exynos/exynos7-espresso.dts=C2=A0=C2=A0=C2=A0 |=
 10 ++-
> =C2=A0arch/arm64/boot/dts/exynos/exynos7.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 24 ++++++
> =C2=A0.../boot/dts/exynos/exynos7885-jackpotlte.dts=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 3 +-
> =C2=A0arch/arm64/boot/dts/exynos/exynos7885.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 12 +++
> =C2=A0arch/arm64/boot/dts/exynos/exynos850-e850-96.dts=C2=A0=C2=A0 | 13 +=
+-
> =C2=A0arch/arm64/boot/dts/exynos/exynos850.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 31 +++++++
> =C2=A0arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts |=C2=A0 1 +
> =C2=A0arch/arm64/boot/dts/exynos/exynos8895.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 47 +++++++++++
> =C2=A0arch/arm64/boot/dts/exynos/exynos990-c1s.dts=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 3 +-
> =C2=A0arch/arm64/boot/dts/exynos/exynos990-r8s.dts=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 3 +-
> =C2=A0.../boot/dts/exynos/exynos990-x1s-common.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 3 +-
> =C2=A0arch/arm64/boot/dts/exynos/exynos990.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +
> =C2=A0arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts=C2=A0=C2=A0 |=C2=
=A0 9 +-
> =C2=A0arch/arm64/boot/dts/exynos/exynosautov9.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 77 +++++++++++++++++
> =C2=A0arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts |=C2=A0 2 +
> =C2=A0arch/arm64/boot/dts/exynos/exynosautov920.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0 | 57 +++++++++++++
> =C2=A021 files changed, 485 insertions(+), 24 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
