Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6359A3C199F
	for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Mar 2026 10:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865641; cv=pass; b=rOamZ5RUj7h76EBCF2RPW7Oyl4sjfVD9dseuspMy26M7sDEu8Whswb+5pmKXSlsQ709AForm8rLFMF7X7L1SiKswP3GG9678q4KKcFiDQ/Ze9CvkKw7mwDzg1s+qTE4W1aTGZrRLM92ezaHYoN7IQpkWJucsqLU2SfQMB33FQFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865641; c=relaxed/simple;
	bh=8DkOPdKwP6pNMpxfQGoo9d8wOlA4fZlRmCG9iWkviCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Aqa72b48ntGx8qFASiI0cMTUZ+itYuO62VCjszhY+5HrnKq5+1e6UhX8X+gV3NLtA+HQI1CRCt3vrfIrFrEHt7scwVeWiRpNAQS28oiDc9LNWs7OcV4owrWpu/E9HQ5VEf78hqLOwYqmOvxxbOzKLLrNjM5uHhEGKiV9zJWkvpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rxNk957t; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rxNk957t"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a1307438ddso4611118e87.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Mar 2026 03:13:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774865637; cv=none;
        d=google.com; s=arc-20240605;
        b=XFgmscllIywKcnVyrR+kdBTtdUz0OoC2isKmx3eIq2g+NkvMqmMkKbQ54zGXnsMCNz
         W6AgT6iKipTa69VeCKOco9hDCpAHjyHoB598Zl0B1Db2k1uFP1Y//ilu7/3qjerTwN2w
         ESfeBzzMwGKFGr+zN4y0greErTj8EOxeiU6SxxHfekmtjop78ce49+huLSWbYRG5wNdA
         iiyb8djQ5i5Vr9cQzcYUOt8pLos/sBJD81AGCwQbsjxW19bwNTwymNaHybueXMt0FRzQ
         nGAcgwyt6sPyqvg6YthVzNraeeekuo2s5fRIbdqHzkR6mA0gPlInoMuXIT510RiLs0ow
         QOuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RWtl0HJjBJni2u27bxpNg6crCSE9pGY/Ablms6+Q03s=;
        fh=Pg9mhrSd40Y++/n63twUmwtimojIT9FJzZb3uTne4Ro=;
        b=YVH79pJxyc26upIoqE37R7k8+DGegyNukl+QqChXwmqjQ0j01GeU3Te6xxA8+xveaK
         EzAf5lJx06xutMEShZfvfmKYq4/lv1qqvkCwB+1qPAHUxY+j1PmfIGWyjn3/bh0O25Ex
         k2Z2d+50DRpaEs592s4CsNd20ql0nc9Lbsw9Dq31WeS2D9HcSTZYuiovaMKvMfBpurW2
         L90GhpZiGxanZnkVHUyEvyQv39ZUPD4XZ/+ZpSxsw4zMFm/+oHtCbKeAnO49CBnmmXbC
         Wtt0wcU6ZQIp8IgCeuJqXaiTSg99SMUYSaLcTz65nzG+DZkkG0G+S7uhA6cWy23kjZxX
         KDsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774865637; x=1775470437; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RWtl0HJjBJni2u27bxpNg6crCSE9pGY/Ablms6+Q03s=;
        b=rxNk957to7xN6eXqhpX5izC1k02whQTErDVpx+KFLHxV4m+5MU4cVnaPjZ3RdvgYuM
         4+Kk/CH+Yomh0JkR3K1TzIKfxt+WHyiiHyWAyaOL8hwfWCrKBnCOH53FNjUrqEZXKV8A
         KabwajUh83MFyJltmoAEmVLBFNKNv5Xhq1iNpqQJ7ihs9bYb/JgMd6caxffeV3+E7azB
         U6nBEo5SoyxTS9/U6ZXra5QXkbfFqYCzfBVKo0FsIvtUdTX0kVvogK8wX18wHcqXF4ug
         5u///FAxcO2qjSVV3PgwREjJp9yxRwYVCVZ+RgXjB221Vp/zmSmZmHnnElcUecur7jtx
         SQ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774865637; x=1775470437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RWtl0HJjBJni2u27bxpNg6crCSE9pGY/Ablms6+Q03s=;
        b=omys9SIM5LntMhivxEMrIHfiLCXFPO2lOccpJRBMSat1qMt6h7sWFgt4OZROCn9L4/
         diU2c5jeRdmYdKhdSWTIMWkDCAHuel7/X2EbsQUwt7BLqZzMA8MdQo28iaPG5vgEdNZF
         0ANsvNpQIe5MLphrEKdyoMlVAKSFhjZWsedld01iZ7p8jXa7BiLzywmr9HMqhdW5aync
         TE1TYgwqamCtpqrfzCbHlwLCfFgfjAPSOoM1cViGq7A0CnimqMduh+WSscn4KapMSQWs
         yw51jmSvKp9Gp4rnBPHgmMxKR4pcbOgyK4kcfbS+7oYtiaqYZt9UAFm6fZJbVHgrXPKh
         BI4g==
X-Forwarded-Encrypted: i=1; AJvYcCWW1EuBr/ziQTRJyizOFBY1pz0Za9e/U5Gitc2+ryr7yjaNOc1sKLGZ+oFNuOz2CVir8Guh58WQWXDKfeyRWkmgBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJpPgXkKeKMQima8nZRi4unYOTrjxTr7IEX3w2bdjzSqfPfbC4
	8mLdLBU25qPpOjsuw+KYKccA3lGU1M09+GX3il/4onkRiyaCYCleb1nyxxEiiTeKQaFUzL1otxS
	CaXpPpmbLBPW/uYtASCBUrI5h3UeCJgdWquqPKVPZQA==
X-Gm-Gg: ATEYQzwKGVBqT6C8hi+p0Ef7CoppdL7whzsvVTXi5hvNVtkzM+CRJont9Bp/PVO4L3y
	stON42x7tYvk/E2j8DOIZmz5j2fGk2LdUdGQNULUAIoK7LSN3r/XQCr8NHpIEGABSPCZ8Avs5CR
	t6FcSY9wvqH+Ct+CmQDA2yRS7MZ89J2eoXTegFITv0OZrDH8TJ86dnlzQFYGKiKVLvTMCw69YuO
	o1SqX+/EhzkaPHpPePhMnPsGkPcw5k7M3oFNq/mwiBnNbkNyV/ZHTB8I6zPETjXGp9aqRehxYwe
	m7xIvtGu
X-Received: by 2002:a05:6512:3d05:b0:5a1:3561:519d with SMTP id
 2adb3069b0e04-5a2ab7efbdfmr4713361e87.8.1774865637404; Mon, 30 Mar 2026
 03:13:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
 <177409907930.268981.5882592990447577348.b4-ty@b4> <CAPDyKFoz-sm0pfvn5iSYFY0mrW38vaGRZsFvrVPqsv7BsYxeWQ@mail.gmail.com>
 <1fbf5c54-8793-4585-be33-ded77019adb2@kernel.org>
In-Reply-To: <1fbf5c54-8793-4585-be33-ded77019adb2@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 30 Mar 2026 12:13:21 +0200
X-Gm-Features: AQROBzDdVJjqE87T5ud7_fnM2lD6hQfK23pJY5_ZrG8f3bl6KZeUN4yLdyWW2BY
Message-ID: <CAPDyKFrK3NLwaii-9FEmyaTzUAuVkMkLL3rWBQwQvT-M+PzEHA@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable

On Mon, 30 Mar 2026 at 11:54, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 23/03/2026 12:13, Ulf Hansson wrote:
> > Hi Krzysztof,
> >
> > On Sat, 21 Mar 2026 at 14:18, Krzysztof Kozlowski <krzk@kernel.org> wro=
te:
> >>
> >>
> >> On Wed, 18 Mar 2026 15:27:45 +0000, Andr=C3=A9 Draszik wrote:
> >>> This series adds support for the power domains on Google GS101.
> >>>
> >>> There are a few differences compared to SoCs already supported by thi=
s
> >>> driver:
> >>> * register access does not work via plain ioremap() / readl() /
> >>>   writel().
> >>>   Instead, the regmap created by the PMU driver must be used (which
> >>>   uses Arm SMCC calls under the hood).
> >>> * DTZPC: a call needs to be made before and after power domain off/on=
,
> >>>   to inform the EL3 firmware of the request.
> >>> * power domains can and are fed by a regulator rail and therefore
> >>>   regulator control needed be implemented.
> >>>
> >>> [...]
> >>
> >> Applied, thanks!
> >>
> >> [01/10] dt-bindings: soc: google: add google,gs101-dtzpc
> >>         https://git.kernel.org/krzk/linux/c/10084aeadadfab72648f6ed1cc=
78f7cd87b861ba
> >> [03/10] dt-bindings: soc: samsung: exynos-pmu: move gs101-pmu into sep=
arate binding
> >>         https://git.kernel.org/krzk/linux/c/3ec3c42b426fe5e2b48ff19c55=
1dec50bc78788c
> >> [04/10] dt-bindings: soc: google: gs101-pmu: allow power domains as ch=
ildren
> >>         https://git.kernel.org/krzk/linux/c/c8229a5160eea145b796f54317=
d6e659cec9b080
> >>
> >> Best regards,
> >
> > Usually I pick up the power-domain related changes for the DT bindings
> > and host them via an immutable branch called "dt". If needed, SOC
> > maintainers can pull it to apply/test the corresponding DTS changes.
> >
> > That said, I am open to whatever you think is best here. Perhaps it's
> > easier if you can drop the DT patches and provide your acks instead or
> > if you can share them via an immutable branch for me to pull?
>
>
> I did not pick up any pmdomain binding patches. I picked up only soc and
> according to cover letter there are no dependencies between anything here=
.

As I understand it, they are all related and some even depend on each
other. I think keeping all four DT patches together makes sense.

Although, as I said, if you think it's best to funnel them through
your tree, please do and then share them via an immutable branch, so I
can apply the pmdomain driver changes.

Kind regards
Uffe
