Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624403ACEE6
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Feb 2026 12:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770293182; cv=pass; b=bfyIPjdMzgi5y+liDlvr73umunx7ewL8DuhElX+2zkPJhpk0qANNVJFp3nszf7/7qQIc6j9V5l1pzd06WcJlH77w0druF6U4+KBXCIM1q055z6em1x0uk9D8DSNVYvtoXEWF0XC/6SCslTwbyqqSAV9FvfkDVV3PBRk/zkrqoGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770293182; c=relaxed/simple;
	bh=epTizwofu6tUIWScFsKfhBb6Vw+PqSxYlpupgsKdrEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mbH93XmrqWVXBYxi+XTVN9vj0yghuCTemC35V37u/WbIkjMrxEkw3YnH0+6tgNgQIn0RV/fRDCXSuyyFlB6ATonymUabn78O/CAa6i8O0RbHeH5DveD1sHpFaSSHgWWkD3tzljMsGIeNlJhSl+H/lZDwMI4vVnhdqFwLkqcrrJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aairm6CY; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aairm6CY"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59dd9aef51eso1084154e87.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Feb 2026 04:06:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770293180; cv=none;
        d=google.com; s=arc-20240605;
        b=g5tdVnxqL8fNi2tmm/LDqsMW8ZzAtkIQQbliDInx/EVQCYEkdp1pO7MlsIsww7dEGm
         /vu7kOJ1M4BY27wrOqq/L+Oj0caL8cYiCpVtJncOeaAzjVV+lrmmF/arOHljNOqDg5HF
         if5FBQeLtsG14pS5ltz28IoYQqnmGYtEYPiAizZerttR9VwGzVM5L+ax7u+7aoKgFm7b
         aQs/1tdNYg6jYbToS7ILu+MtUjpTcmQtHlL8mXGE4/wp9+Vb0ER1UryU2NkSBzQef7lu
         GJgCf9doPx32yNEYPzLsAGctjTG4upfXLBI4SByFNqnV998r57MZcZlNPpmABOnhwceY
         rjRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cdO9CFNu6vQJNd/2WSszJmp2jWHwNCxretKor7RUNos=;
        fh=lZUx67i/2iJbAEBBpmW7D1TbxyokQUlFDVC2alt5F/8=;
        b=X1MqcEzbA3B98v1OF6nmn1a+pYvbyAkRnceEAL2gtQSVMhFpGoAG26+AtevnpXhWIm
         HSPTDlq2mlUfFrvV5ah5TnoYJVtRDeeMsYcs2NScKdABZc4EPqh1ygih56AUOmPQJh56
         yLfxYnj9ZcrcLFeVHhy3MPzTY1cMWD5slLAE+0Pj5QfHelpc5rz8MxRP/2paL+6VOwG8
         yhy7JwP3ZVQIHE5KSVseb+1TB8hRkugussOnio/IgdVXOqFBJNVHNfk6Ezty/wcoWPCH
         quUTmPmYe2OZS0Th63rXWxJQ+0jkUsHlVnNXT0AnS0qXR/XX6fu8Jm8dXx1l42wdTa/J
         hwFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770293180; x=1770897980; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cdO9CFNu6vQJNd/2WSszJmp2jWHwNCxretKor7RUNos=;
        b=aairm6CYrP5gbN7adLgwmLaStWmc5LLpMxrDDWJwMASwSVvhYYiAfHD7jyQFa3bIZ6
         1pMdfMb033FVhAMlatLotidw/wGkIrrCEMXp7mSuUxL61cU1pVr5KEuoaKAQvfsH1bHZ
         mntNuXS1UGNs/n01EZTtTNQKoq8/Py67Xvc8jby00DCpLtWFhhbh6F+w79x7kJGV1eR3
         ryJHjBrVuL8qzWlABW3t9VDRH7s1IYMdOkjJdDKKFhKfA24QPLjCwmuKAHCxUv0KqcOK
         6dsZ+lVGfbXAuh8p7MUFfv5wkVX3CECmsVOk7GMyFHltmrMQDiSbY3zozUzoEal1/ch8
         VWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770293180; x=1770897980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cdO9CFNu6vQJNd/2WSszJmp2jWHwNCxretKor7RUNos=;
        b=RCKr0B+2zeVhJkrHViakUm7ekiHj/6x3gzXac4VfscVtry6Vhv+dbipS5E2LbjwG/7
         X1bRvMesP2H3k1Ga18N4xNu1ffWVILcKLB1bbbHPBqkDmdNAc8KdQif+x00HDom6Nf9I
         CUG+P4aPd9CwkpUq5MBbc4NhtK/S3rTSvw/Eh8gwvxkFClxcLdTjCchrkwz7i4dBGH9l
         OZl3nSc8YfhAct1MzMkKNJJDuX+RnsmSE6XYICIQDpIs8KmEpj0QE7APJIZamR6sdY33
         5Fy8F45FCKqkRWiFdeWsG0srSJ9qO9jpdERJKEWciHdaS0mhKUPGFJuGU50rX4WP6MA6
         8WvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyMl3ZqA6KRO88N3JKZqC46D4vf8ANlMGjQ3R2iB1hRl9dsfrpLhucwkUoISU4qwG52uxgKlkDyuG5W3hxrXGMVA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0OQQGUwpzPtYX6uLinXpoezJ6KbGlb6kJlm4cWWkEw7bKwzd7
	T7zb0iEsaX2HuIDJiNh+nQI37vbljx+Uo1/onH4wFrGMM2O6KQeZFzytp5VdCyVQ9CXUfDbz8w9
	cu01N/KGpdRQ4DpWQZvhjKQXxZ4XfqZwz7sa5DhS3MA==
X-Gm-Gg: AZuq6aIeowGDqcb3gq1YV4KP5FDoW8vCtd2+2FBUxwVgZyDL9mOJgKO/i7HN48HfsxK
	yP2v+uFc+t+C94FcKz6CA2AVzbLRY7xU/njBKwDCPyZXq7Qv8DmDQTSvik27iKZdtQoCuDQx+JE
	jQ/IIlRQkOFzrqzXfEXUsRbonkckVex0rpLEQtlG7Rf6G0EXXWq2+zUhH003Nz928QtKDeAKGdo
	tHs4HNu4ZEs/agj8+lGQIOgJd54k2E982N6I2d6WDcD1MqN4Et1w80TE0gg0YXCpH70aHDb
X-Received: by 2002:a05:6512:10ce:b0:59d:ea35:bc8e with SMTP id
 2adb3069b0e04-59e38c2955bmr2270537e87.24.1770293180225; Thu, 05 Feb 2026
 04:06:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128-gs101-pd-v4-0-cbe7bd5a4060@linaro.org>
In-Reply-To: <20260128-gs101-pd-v4-0-cbe7bd5a4060@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 5 Feb 2026 13:05:44 +0100
X-Gm-Features: AZwV_Qio0mUxbt1hdbXGSjmWyyPdwpqKntqpt17Vt_Fu987EJSjXGSrypfMmYU0
Message-ID: <CAPDyKFoRXaiZiZw0NmmgnJzfw3sCYi1cNAuLHUU6fyF-4gxDuA@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] pmdomain: samsung: add support for Google GS101
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 28 Jan 2026 at 17:10, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> Hi,
>
> This series adds support for the power domains on Google GS101.
>
> There are a few differences compared to SoCs already supported by this
> driver:
> * register access does not work via plain ioremap() / readl() /
>   writel().
>   Instead, the regmap created by the PMU driver must be used (which
>   uses Arm SMCC calls under the hood).
> * DTZPC: a call needs to be made before and after power domain off/on,
>   to inform the EL3 firmware of the request.
> * power domains can and are fed by a regulator rail and therefore
>   regulator control needed be implemented.
>
> Bullet points 2 and 3 are new compared to previous versions of this
> series, and related changes are in patches 1, 2, 9, and 10. I can merge
> patch 9 (SMC call) into the gs101 patch (patch 7) if preferred, but for
> now I kept them independent to make it easier to see changes compared
> to previous versions of this series, and because patch 8 actually
> applies to not only gs101, but to many newer Exynos SoCs, and to make
> the two patches themselves easier to review and reason about.
>
> The DT update to add the new required properties on gs101 will be
> posted separately.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
> Changes in v4:
> - drop unneeded or already merged patches
> - drop patch "pmdomain: samsung: convert to regmap_read_poll_timeout()"
>   as Marek reported issues on some platforms
> - rebase
> - DTZPC related changes
> - Link to v3: https://lore.kernel.org/r/20251016-gs101-pd-v3-0-7b30797396=
e7@linaro.org
>
> Changes in v3:
> - use additionalProperties, not unevaluatedProperties in patch 2
> - fix path in $id in patch 2 (Rob)
> - drop comment around 'select' in patch 2 (Rob)
> - collect tags
> - Link to v2: https://lore.kernel.org/r/20251009-gs101-pd-v2-0-3f4a6db2af=
39@linaro.org
>
> Changes in v2:
> - Krzysztof:
>   - move google,gs101-pmu binding into separate file
>   - mark devm_kstrdup_const() patch as fix
>   - use bool for need_early_sync_state
>   - merge patches 8 and 10 from v1 series into one patch
> - collect tags
> - Link to v1: https://lore.kernel.org/r/20251006-gs101-pd-v1-0-f0cb0c01ea=
7b@linaro.org
>
> ---
> Andr=C3=A9 Draszik (10):
>       dt-bindings: soc: google: add google,gs101-dtzpc
>       dt-bindings: power: samsung: add google,gs101-pd
>       dt-bindings: soc: samsung: exynos-pmu: move gs101-pmu into separate=
 binding
>       dt-bindings: soc: google: gs101-pmu: allow power domains as childre=
n
>       pmdomain: samsung: convert to using regmap
>       pmdomain: samsung: don't hard-code offset for registers to 0 and 4
>       pmdomain: samsung: add support for google,gs101-pd
>       pmdomain: samsung: use dev_err() instead of pr_err()
>       pmdomain: samsung: implement SMC to save / restore TZ config
>       pmdomain: samsung: implement domain-supply regulator
>
>  .../devicetree/bindings/power/pd-samsung.yaml      |  29 ++-
>  .../bindings/soc/google/google,gs101-dtzpc.yaml    |  42 ++++
>  .../bindings/soc/google/google,gs101-pmu.yaml      |  97 ++++++++
>  .../bindings/soc/samsung/exynos-pmu.yaml           |  20 --
>  MAINTAINERS                                        |   2 +
>  drivers/pmdomain/samsung/exynos-pm-domains.c       | 254 +++++++++++++++=
+++---
>  6 files changed, 395 insertions(+), 49 deletions(-)
> ---
> base-commit: e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
> change-id: 20251001-gs101-pd-d4dc97d70a84
>
> Best regards,
> --
> Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>

I have looked through the series and it looks good to me. I will be
awaiting a new version and to get the DT patches acked, before I
continue to apply patches.

Kind regards
Uffe
