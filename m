Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0E93C454F
	for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Mar 2026 09:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774947730; cv=pass; b=r4ZRwAXRK0NdzBrETQMq71tsgwWH6RPDsYlMwEJZEtuRwktCNBxCwan1J3xnQebnwhtSyZzdgwYTUhJEOuyFn5WKcUAtqcvPUiSEZlbuqnnHniEjU34y6nIJtMAUYpRq6lTdjUu8tMl85cXN/kG8+zaRzZnuQt73PUoa+do9jMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774947730; c=relaxed/simple;
	bh=QuCvn599COW//1DtmRcEag0zAJukE3mULPcfdxWmbHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tcySHCWoghahhi/WRI2JlR491/ExeSy/fCfqcz7DLHHZJ0pHF33D0azLVF16g50io3f0JGnGWQQ1Oa//zIRxiHSHKF3bYbc1QMccxpuJSCxGzlDRdW1vIxMaMnUShtIAAY9dGc9urJ8ZedeJ+KGhC7tEeBZ/XMyS2z1nli7ifdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WyW8aOgY; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WyW8aOgY"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a0ff30b240so6143201e87.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Mar 2026 02:02:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774947727; cv=none;
        d=google.com; s=arc-20240605;
        b=cRq03jybLn0TM90jx4TAHz1ZmBlZCSTx3OnP/kmuIv6wLoxzRGMk24/xX/EG+3L48o
         rJqxvYDEoVTiNaEAZOo0qdK0ixGsaBIpEbs45do2U5FpxNEANXHr+VcuX9D6ZORm/UWo
         hqhdYsSxxgj9/ECBWdlrlEuacxp8dXrFvGY4JyK1AsJQj5I2lBBEbrr2lEgMxMlFCgcV
         4P37BTtVUsPVhstTY3Vaxpw//8RWHOB81Ne2eV3fuNcvAqk3O/6vpc24OmVSVArIj3AB
         4jC1kEAuLCvRNkoxAVoo1AH5hzelwSxlMBIJ0sNlk1XQsBubgEloMdA4aymMEZIqw//G
         Khig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QuCvn599COW//1DtmRcEag0zAJukE3mULPcfdxWmbHI=;
        fh=8h9aUDEcsLgDEyrP3yoIyvdc0bbHAehTVaEmcShbiG0=;
        b=IOJWvQ4ehhH4BkUYesP/Dp+qT1piF0lp8akC950M3o/FkL0D/QdnojIKPtP8INC8h/
         cejc7tsC2ZGr/fO+/CxGAcBT5XAiJlsM1793zjO/vA/NBeylMZB2v96ESzj+g9EWsVEG
         7l5WW6u0cSTGSBQf4AN+PRMB9e44RkR9cqQ/uVc/PMJ5BEp+9GH4gmi3zG+qvzLXPMz9
         7YpWgeOsrxvz3GOqJ+5jOgD5IqRdTsB3JjcH5dDs3QkQvenkVlV5NT8c7jIh4B5XM2aW
         Y3WWfEHXZWYl1Ukg1NfcUnBz8ByrOjs0erMZNlaJDcFwAPeR61OsdwBotTE+6dvtpYuD
         QwqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774947727; x=1775552527; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QuCvn599COW//1DtmRcEag0zAJukE3mULPcfdxWmbHI=;
        b=WyW8aOgYi8MVszoV+uXI6HpIqbblZcKFU61V67eBcX0jra4k/WaoEzrxKrnHaF2MdE
         5yyvdXkmBYkkOR+wbXPEtQ4ZtCbilrZeEuoFlyIaC56gAYJMxzM155shYE78fY1pfj7G
         M21H3Noe1GilKjaI1f40ma2GRIq3IP/2N8jl66/to2eiiEHlf2H/KUwUAEG+q9OE7M23
         Y6guly5IqcdEGm8HB6jN3l3OVon6JTBgQ4ia+/aH1ridr7GXTgTKKBI5ZHpMBsRWGIMv
         PMIf8w9+mVbgLeNUjVPRZL4CqVVS+M/mAgAcdQ3110A2jQIp0PM66DQ18sRdsVh9xnqE
         gUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774947727; x=1775552527;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QuCvn599COW//1DtmRcEag0zAJukE3mULPcfdxWmbHI=;
        b=SY2AKg/jLTdeKDzPTSqhobUrM+S3i+wXxgc+z57dgbg/eQnno+37N6Y8GHP/QHUBkD
         RmsYlHrvGZuc+vryRWwECrFlTw+Th6TBphtKmsYUEvOTFEF6B/wLTB1Zl+wsLWwscpvA
         TNfQsokG8hptijmAwH5qRlBZhlNG4Q2YVr4ooYITXxynjXhHgAPkyye6m7Bvx/fyhnnU
         MJSon3wEW5/G0M6eGUBSLd1XFNy3xiPzeIprgzM6eR0WMa4tQd4YUpusi4Qsi4dRXLA3
         IxKQkwX8BIDrVp5R+MrVgOVC3Ir9chU4jjR/LC/cj7mh3GrreCURPin1nhZERoXnqe5u
         2xbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsiuq/bhHKofHqwS6wbIlzST3X6/cpnxVAI08TE2LZNfe32+oX+d/DboFuShsB6IDkSgXmOCuWcUVXwo0h0IXOwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yww502WkkODgpOaykZvRYZsGpCC+5/gt8XPh0bXI9R23+qWpbBg
	M944X88XridJ5Mix2DpIOaApnBFLFfM/hwW9JRCZcvbROd1scBkrt0ZkgoIpdSSleGq1LRyh9Sj
	EGpxMeY3Zf+Q54iPbL4ufRLCGBbggAXdg9OUfrwRzDQ==
X-Gm-Gg: ATEYQzwKozBfwt36cX/ctL15cWIH4IspHZWrm4rQGVR9nJ8e71dbNwgQzXybp9O5pKk
	rddCOoXlxeIWtxlhjBxxXcZUpPRiIKuVWCzXs4QxeUNqHNk9yYjpUq5l8jSh7SBtwyKHU7EMnLH
	9cNH7lkF+K6r3vQQr892w4IfbEenBgDXIsJBRy3THAXu4JqRzl5YFHhc+ZPUKOBJAdLnBk3syJP
	TQRVqFP7lWRe9oV3Eh5jugjpH+7v5DmUGbSrOffEvD8p2J5UYOIwCKqEuB3eknWIbtenxt8cVvd
	lp++6S1j
X-Received: by 2002:a05:6512:3b95:b0:5a2:78f8:60aa with SMTP id
 2adb3069b0e04-5a2ab92e0a6mr5921259e87.37.1774947727265; Tue, 31 Mar 2026
 02:02:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
 <177409907930.268981.5882592990447577348.b4-ty@b4> <CAPDyKFoz-sm0pfvn5iSYFY0mrW38vaGRZsFvrVPqsv7BsYxeWQ@mail.gmail.com>
 <1fbf5c54-8793-4585-be33-ded77019adb2@kernel.org> <CAPDyKFrK3NLwaii-9FEmyaTzUAuVkMkLL3rWBQwQvT-M+PzEHA@mail.gmail.com>
 <3bb6b71e-947b-4248-95ba-79852f743c1d@kernel.org> <CAPDyKFpOPC2stAJ262jdap-=ByY09AeQ0kj6p_9FTGJBx+Tu-Q@mail.gmail.com>
 <a417e45b-1632-4b14-9e3c-f7110db53190@kernel.org> <CAPDyKFomzokuF+UL8d0+Syk1FCG3jnUfy7rVr+3iC1GPZmH1UQ@mail.gmail.com>
 <c4d6b758-474b-409d-b553-fa4ec1df494e@kernel.org>
In-Reply-To: <c4d6b758-474b-409d-b553-fa4ec1df494e@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 31 Mar 2026 11:01:30 +0200
X-Gm-Features: AQROBzB7d4a8fUYE9ADAwNJgppR-qAENvrUiLIFB9dQe-2GMylgbIm_d4czfNl4
Message-ID: <CAPDyKFrwxVcLByHef7GjbyB+Du0bRbD=6_ELmmnMWW-TsjMhCQ@mail.gmail.com>
Subject: Re: (subset) [PATCH v8 00/10] pmdomain: samsung: add support for
 Google GS101
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Juan Yescas <jyescas@google.com>, Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 30 Mar 2026 at 15:38, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 30/03/2026 15:30, Ulf Hansson wrote:
> >
> > Usually we want bindings to go along with their respective drivers on
> > a subsystem basis.
> >
> > Both patch2 and patch4 updates DT bindings for the power-domain providers.
>
> Patch 2 yes. Patch 4 not. That's why I did not take patch 2.
>
> >
> > Why shouldn't the bindings go along with the driver changes here?
>
> Patch #2 is pmdomain, so with pmdomain drivers thus your tree. Patch #4
> is not pmdomain, so not with pmdomain drivers, so not your tree... At
> least I do not see any pmdomain parts in that patch #4. It's a Samsung
> SoC PMU driver and none of further driver patches touch that PMU driver.

Yes, you are right that the PMU driver isn't touched.

Although, the PMU DT description added in patch3 and extended in
patch4, allows power-domain providers to be described in its child
nodes. Those child nodes use the same compatible string as the
power-domain providers described in patch2.

Kind regards
Uffe
