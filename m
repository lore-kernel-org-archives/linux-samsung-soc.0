Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57FB2F7458
	for <linux-samsung-soc@vger.kernel.org>; Sat, 16 Aug 2025 17:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755365363; cv=none; b=CYtGmYLdWABBAwhg9c7YTPoHqPhj40zGv38fdWT8MiowXnIXErt04Wr8ksQIOkZy1ZiAWm+0t2mRB0AN65+7uA/gFAE/yE5qb3lXdhUHBuWQV4PEI6a42DahtCafCOjXK0BXbE++PvEuxCU2wpBQHQ2locJxuFZlHQcVhHv/qlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755365363; c=relaxed/simple;
	bh=N7+bvANbkNhrvL4ERM56Bdgs9ROg59ZcIUOKIv5dcY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mPUWzMyQ8wMEP7wm1Viy951173iCgIkHUrO2B6ptPGCC0hPNp0yyEjY431/rdkUfcbadoSJ0CnwYdTy4VPBZTaCyg+UDFAMznyEZSLwh24+NFe9pjXHcwAqPuhz/WVHGnFt7ie2A3voQK3+IB1WUOPB1eudChtZ/ldr9yJJ9jq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rnI0MfoD; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rnI0MfoD"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e933f00bc9bso444085276.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 16 Aug 2025 10:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755365361; x=1755970161; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+5JiFhhalBPjoGGIh6ZSZXsJU98iPlc8m9JpyheZsA=;
        b=rnI0MfoDrlFK30uELp59NGYocfNReI0jzEiwooetNLdYHSNTVeJNji1HnmJ7REBlLn
         vN1n7as6DONoOAyOoDTkNZ1N3iFlo2sjdjMlIxu4n5E6SU56ZuWfbtXGkJQvOuDU9o6Z
         uLtOIz/OpdwIYWbNFziclsk7uCNODnDbUAUORRTGoTXDagv8SZuEKOIxo7iQOY6STnXx
         Rz/QOmT2ymeniq0du6wUWiySqnxpMjwoP6vEbleVH/PM5SWG0vNWKI9xqqn6pSbq6KoL
         ODcihrSja8vDahqeOA4ksmEaP6erUKYp8Yv2glICN45JRsGE6YsmPmjX7haRWkiUODGb
         un5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755365361; x=1755970161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3+5JiFhhalBPjoGGIh6ZSZXsJU98iPlc8m9JpyheZsA=;
        b=UovRicb0TLSyyrmERoSMcwkgze7ewc9e4fYgzmnUOc3/BZ08G9nK4dAmOMs8K9tmY9
         8/JWalwiHpBtF4Bv4O4ESrYLZjXza14wSjw4fs97RRICWtqo/xNWsULAr+TeIaXiRvp2
         GRRPCIOdb391M3maWS8kkDQZyxQItFNIcZ0VYShllpVU4mtuAS/4fMekSL1EsMIc5sw3
         eFKKn4OhnYxY9haVYt9yOpoOiFNVmc1n0qFCV9klNCBWU+a9h8N19y9whO2nK19tr+QT
         2w+2aqLZo2x98QYPhxY7ybbDP8c9Q8TwzSYJ7V/9INiQvXggimNsVabyhDB3UGur6hkS
         VbaA==
X-Forwarded-Encrypted: i=1; AJvYcCV6+aCa8w0tdXYPWCS8bnmTxn1Vm4L6QJiTvUTBYMNj91509rbz0ou0WbgwTgBTHvMF97F5N8SH6xGZs9aoIlQZcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlKZu6QeFqJLMZMpIAJ/k7WoOwqPvw47BBMqJE/2j0eXzj6j3M
	muArY7gurjSH6nxj/YXFGwGijBbUx1Q9NtF02Z3zriE0d8ebtQIuYKWVTG6srxKjLe3/V2lNgKK
	B1v3O6QEMmeX983cV8zAKqLce+KAb4OWIXHk5UmCuqw==
X-Gm-Gg: ASbGnctVTnr+UBdWLjHoHzUOPFiFqyl6rLI45TrzpRN4jEqufhryiZCUBHCBd7vPU47
	gQY62lFAl0wBt2EgyEHOclatqIaqysFJsMeSUZxSZ0P4ahYB8SgIls6oHxrxbntX46YPyo2Rdd5
	mKez/o4DvPqhP/6BKrkYb6uX0IiAhT1b6PllX/o78X4sVHMXArI0S0oaEZiGmve72TRHEwAZqmN
	sgmwiBgkrh0sy+P
X-Google-Smtp-Source: AGHT+IFKBARxb/1Lma7PB89ED/9p/HJkaU8vopGLHCicm28KuK1UNdWyaBAVqg1jULjq8b+Am2EYtjOBcHLlU/v8Sbs=
X-Received: by 2002:a05:6902:1388:b0:e93:21fa:9945 with SMTP id
 3f1490d57ef6-e93324ba44emr7765313276.38.1755365360807; Sat, 16 Aug 2025
 10:29:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250815070500.3275491-1-ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250815070500.3275491-1-ivo.ivanov.ivanov1@gmail.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Sat, 16 Aug 2025 12:29:10 -0500
X-Gm-Features: Ac12FXzpvr6khCWsphPS4E5tM2OfJSpyb2n9DVhgj-nq125n0IzPALBV0Zd32A8
Message-ID: <CAPLW+4mjOmi4BM2zOPcR6GH=4ngA3FisotqFXXGAbHOghQ4x8g@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] arm64: dts: exynos2200: introduce serial busses,
 except spi
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 15, 2025 at 2:05=E2=80=AFAM Ivaylo Ivanov
<ivo.ivanov.ivanov1@gmail.com> wrote:
>
> Hey, folks!
>
> This patchset adds serial busses, implemented in usi, for exynos2200.
> It's missing spi, due to me having troubles with reads when testing.
> Serial_0/1 have not been included in the patchset, as it seems like
> they're encapsulated in usi blocks, but are the only implemented
> protocol and/or do not have a dedicated register for setting other
> protocols in a sysreg. That'd at least require patches in the usi
> driver and bindings to add support for.
>
> About the naming convention for usi nodes, I've chosen to keep the
> downstream one instead of relabelling all to avoid confusion when
> cross-referencing the vendor DT and to keep consistency with clock
> names. They're labelled the same in the bootloader too.
>
> Best regards,
> Ivaylo
>
> Changes in v3:
> - drop the serial_0/1 patch

Why did you decide to drop it? As I understand, having a serial
console enabled can be quite valuable for this platform bring up. If
you don't know how to add the related USI node -- it's ok, can be done
later, as soon as the serial works without it.

> - add r-b tags from Sam
> - increase the size of all syscon to 0x10000 and not 0x3000
> - change description of last patch to be more meaningful regarding the
> usiN and usiN_i2c mess
> - s/usi6_i2c_cmgp/usi_i2c_cmgp6, following the TRM naming convention
>
> Changes in v2:
> - add a patch that switches address and size cells to 1 in /soc
> - adjust all new nodes to define reg props with 2 cells in total instead =
of 4
>
> Ivaylo Ivanov (4):
>   arm64: dts: exynos2200: fix typo in hsi2c23 bus pins label
>   arm64: dts: exynos2200: use 32-bit address space for /soc
>   arm64: dts: exynos2200: increase the size of all syscons
>   arm64: dts: exynos2200: define all usi nodes
>
>  .../boot/dts/exynos/exynos2200-pinctrl.dtsi   |    2 +-
>  arch/arm64/boot/dts/exynos/exynos2200.dtsi    | 1433 ++++++++++++++++-
>  2 files changed, 1398 insertions(+), 37 deletions(-)
>
> --
> 2.43.0
>
>
