Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FB833997
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jul 2024 18:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722018728; cv=none; b=rSPG1GHi9ZY2nR/sKnfDMT/lxmeMmRiDK7QqRojR3bhyFUI6FTzbJ++gQpWO2Ihp//oceN6aRd4pyJXIbtlsUB7/22fn7qwaNKa/8I8XAs/qannWbf1lnlh8Zq0nGSoWCtUp6wdnriK5lY7FWLtDXBSCswzmgeAtTaK7XpSF2D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722018728; c=relaxed/simple;
	bh=LcqkSuMuNnl7/EFnEDUzZFYLInqU1aN6PbEOOfIXya4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oMlVwYX7Qv3GKgxg+7M6T/wad05A0PYEOvXDo0uuevJU5s767uEMav1p5xpDI5F1NjdGQQ0H6uGRPNbo80AGWXY0Crl66QXyUtYcL0WSBsGVkQmFZiGvVyogjfxPnZ88ENvJtDVvUOxxEgVN3EH/6O4C6U44fbbfI/uXsx7Oc9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eGDMozfY; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eGDMozfY"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-66108213e88so22585917b3.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jul 2024 11:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722018726; x=1722623526; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hvU4GKCCA3VC4F0Qd0CpFcI4FShvIv+cMmwAVX3v5RQ=;
        b=eGDMozfYB8gEAmLJs5f2osYiaiPav1IliQSQKwQtBH36sjlH0l7oWv4T6us+2GwulT
         MuVElySTcarVNjtLNP7w6lW0hRUtG7/98qZUillPRIbRgHoRYXZrASlWgP/681Ynj2yy
         3aY5eZoVFD7n25rvDMMAPQxjCUnOKnCYFRWWT0aLzXX8VUqEoBCgg5KuZ0QrIUYDSff2
         FkN7ptOEvcdKLXri2Nk2SS2i1TNqWLEPoFq1PbdHMr9oCFhGfH9MqiSltWNpr6xo0IGh
         gY8Gq/W981aYD5NW9YrV8n9HB5sS/YbdI4dKpB6FFrlCTSjaP/vv4a1s7jLrfl7gqWm5
         Q28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722018726; x=1722623526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hvU4GKCCA3VC4F0Qd0CpFcI4FShvIv+cMmwAVX3v5RQ=;
        b=bgoeq90gHknrM0R87xRHpWlp2DWJx6toZVi7txsOIyf92ic7/pvrbIrWJ8sx00HWUf
         FDkk/n9Sa5Le2F/viRWACVxrQzuzLc8ZIj53ImfKmbCFIr4346aDOfy1M/9ID9EVK4cG
         imRJVrNVhu2gx++I8410mrlM9YlARR06adllUgpo07M231EsHlpEIVm1CoK2XcJ2lZ8H
         e+VyMi+LeuGHjKTttYTG61kUAru38ZDXp6FOTxJ9OPnKe8QaiEVWRrS4ljjFmXXWiSDl
         STyV3Iev9FN7mTdKPx6Bb+WlRvz/w3mWjLKcqfwvqo/QTtKxGHdLVlqnXbQ9+Qjyu/mE
         JAkw==
X-Forwarded-Encrypted: i=1; AJvYcCW9bkcoI6xbI43y33MuGk6Ee2p81oWxtT6ayyX21RDYFNLbVrN5G4xC/RYJY+NtjIV28UuPYKWO/UBi/S7GI/sZP6ml+w/f3hsNlsfRrV92mR4=
X-Gm-Message-State: AOJu0YxvRSYToiWtZ2tyZ9SeV5vet+fFXgSRrSZ0Kv0aESU7OJuyUYj/
	Sjc2rzH+68yqB4ud1A7B7k+h4EWqj7rGIIFBFdW+GKITcb+mKJ+gaTiMaCLvJ0EqctpQZSg0Pv0
	ILFVqo2CJ1ZPf02cGRR61mMGhJiQkzal0B3ccsw==
X-Google-Smtp-Source: AGHT+IE4wP0yM1DlRgLAIm5ti9a4WsMp4eaJ8CYbOpEzOgzqand4B0+L/HFmtEMuilCr8eOCv90No9Xi12wmTjZOZHs=
X-Received: by 2002:a0d:f3c2:0:b0:627:d23a:4505 with SMTP id
 00721157ae682-67a053e06f5mr8508687b3.3.1722018725753; Fri, 26 Jul 2024
 11:32:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20240726110142eucas1p29f261e5e81c177456fd5bb5546871eb4@eucas1p2.samsung.com>
 <20240726110114.1509733-1-m.majewski2@samsung.com> <20240726110114.1509733-7-m.majewski2@samsung.com>
In-Reply-To: <20240726110114.1509733-7-m.majewski2@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 26 Jul 2024 13:31:55 -0500
Message-ID: <CAPLW+4k3d+x1V4cPcfbHX=mJ2jM10mDORcuY_Kw4-qr4LND=SQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] dt-bindings: thermal: samsung,exynos: remove
 outdated information on trip point count
To: Mateusz Majewski <m.majewski2@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Anand Moon <linux.amoon@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 26, 2024 at 6:01=E2=80=AFAM Mateusz Majewski
<m.majewski2@samsung.com> wrote:
>
> This is not true as of commit 5314b1543787 ("thermal/drivers/exynos: Use
> set_trips ops").
>
> Signed-off-by: Mateusz Majewski <m.majewski2@samsung.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

> v1 -> v2: remove an unnecessary sentence.
>
>  .../devicetree/bindings/thermal/samsung,exynos-thermal.yaml | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/thermal/samsung,exynos-the=
rmal.yaml b/Documentation/devicetree/bindings/thermal/samsung,exynos-therma=
l.yaml
> index b8c0bb7f4263..b85b4c420cd3 100644
> --- a/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.ya=
ml
> +++ b/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.ya=
ml
> @@ -40,11 +40,7 @@ properties:
>    interrupts:
>      description: |
>        The Exynos TMU supports generating interrupts when reaching given
> -      temperature thresholds. Number of supported thermal trip points de=
pends
> -      on the SoC (only first trip points defined in DT will be configure=
d)::
> -       - most of SoC: 4
> -       - samsung,exynos5433-tmu: 8
> -       - samsung,exynos7-tmu: 8
> +      temperature thresholds.
>      maxItems: 1
>
>    reg:
> --
> 2.45.1
>
