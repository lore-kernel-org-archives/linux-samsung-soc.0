Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F35924022D
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Jan 2025 15:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736782682; cv=none; b=m3Bg2OiLoVCfgEBiQYjjE9g1Mwb+suLaAVed/V/OiijduvtOgrmVTOIHOxGrwXs8o8YGKKdejxG8ZNHlUL0YoyR3o6CqQ2f26QWrSckY4gd7T2zInOGhigCYHUzc/F9X/OyXSJnzkQbtw4gBDk0R/mo2qh4/u/YYNTW+juEbEmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736782682; c=relaxed/simple;
	bh=UgWOTZGuQDDiIxbJBPlqOCO2mm65GMRFIxvKgoDvxME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZqjF8/x0BGpK1RAHVei786KFk2xCIY6o+K93tPnqXwUJoNlnzNbyQySm1XWkQP11HKb3BXfgiVn9oqWedGsheQ7jaQmFGKpApDgVrIFzZDgP6qgNtdOihN/vWLemMB7Bv7TVMOA0Ln2CCQ4J/C1mztLlXXhJayuD2yik2rDUBmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pdMjRWGB; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pdMjRWGB"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e53ef7462b6so7372082276.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Jan 2025 07:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736782678; x=1737387478; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WHmss5GuNuMPMuJLhtCwmXANZEgbIohfRiOzTjx30TE=;
        b=pdMjRWGBChwMkQSArt/FWlYOnKMAkNdm5rLxmczBuOHSYZ5QTQ82EajGzZheCAcC71
         GVBPA1PWx6B0znGYojwt8mLfGz2sdGtmBPrpfc9yB/43LHnHSsWKYqqxDJNy5fak62V/
         oJRH+t934TWoC4pWZOtidyhHKfPzvHFh2lCLkubETddcNFj/NCE/u0UWLxqUCNLQgeeM
         5INH7bQHNa+t69p0QXQRmmUKtqZoouOtW4G0McB68qhxOMPvW7A4sw3SD23Cdl70K1qL
         wsanF3+k9aCsz4AxLELOyu8cuVkrcsanKPq2O4k8ThFrpsYGGR9JKwGFe4yyaNvQtzT2
         RA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736782678; x=1737387478;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WHmss5GuNuMPMuJLhtCwmXANZEgbIohfRiOzTjx30TE=;
        b=WdqGfLkZGk9N26AeyOEwf4j/BNXpdCfiPLdUZgMIn7KVYVa79F8l8UL8DrJZloNWmm
         VjzpOVxRcpL6w/FYVsdUGctXLC72u7qU+wBtD5K18nV/rxTEwc5q3oi3QNcLxHEhOutt
         +RcIgB87x3RVG6ou44B/pziKrQvueenbMCSufqrUmjU90vt4qQSjfRQ6R6Hr67QM+qqV
         W8fqpPg44C9Ffk+VpANQyzUytVDWdxSBjt7vidO89K5zdhLb1IRhQUc/34Nem+Zj4ydH
         pObdK57oxB7xItYo5DzEntA/ZoAgj6XcdWBVhaeVI+djGlT9Ro1oHFjQAvv15eykfVkq
         mXgA==
X-Forwarded-Encrypted: i=1; AJvYcCVFr7xuGOxjP+iJzYXtB82D4ERSDZDd2ixUcduWxm0qBIn0dlSVHQamakLfa8/Y8/T1PxEm2wk5e4vd7K+Y+WcnQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzM12Inu31+kHWbBhNgj7VtDibduiqP9lFsMLufKNl88sPdYm0M
	tcS17H/FBvg/BHn+Vq2YX1uksNGdp8+g5vlKFPftNqkbnMAzTtCobYmJCoFze2vb/fMsCm62e2h
	9AJaoyqjhtf7vh3/6PuPWXo7PYBYN38uCUmlQuA==
X-Gm-Gg: ASbGncvscNdCT7EOeNwynoPEgl8yP1Hjf1SjSqYp4Qbpcjl3U3Ev5+xDdJD8jbWCtNp
	KNQ91LdbpgRY2NGOaIuhGoVBSS7UQbZiQxyI9xUM=
X-Google-Smtp-Source: AGHT+IHmfuzafpUqk3KxG+kn0+sH+vHEKlPScEseDnN/W27tVQ+3wEY9S4Ua75At7AAxf3Kwrj/jQOrBdgSbPpY4wvU=
X-Received: by 2002:a05:690c:3693:b0:6ef:5abd:d0d with SMTP id
 00721157ae682-6f530f28e53mr163298117b3.0.1736782678456; Mon, 13 Jan 2025
 07:37:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250105161344.420749-1-ivo.ivanov.ivanov1@gmail.com> <20250105161344.420749-2-ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250105161344.420749-2-ivo.ivanov.ivanov1@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 13 Jan 2025 16:37:22 +0100
X-Gm-Features: AbW1kvb6SL7ENMYcV-U0gwzZDQlxjULLo1-VKuQbPKeXd7cbjjP45Tg9iM2uUAc
Message-ID: <CAPDyKFoUajmhPu-xTzvjrMZUzqmECGXX-N-KLq=A6+hrwNuvWQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: mmc: samsung,exynos-dw-mshc: add
 specific compatible for exynos8895
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 5 Jan 2025 at 17:13, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com> wrote:
>
> Add samsung,exynos8895-dw-mshc-smu specific compatible to the bindings
> documentation. Since Samsung, as usual, likes reusing devices from older
> designs, use the samsung,exynos7-dw-mshc-smu compatible.
>
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  .../devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml          | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
> index 5fe65795f..ef2d1d7c9 100644
> --- a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
> @@ -29,6 +29,7 @@ properties:
>                - samsung,exynos5433-dw-mshc-smu
>                - samsung,exynos7885-dw-mshc-smu
>                - samsung,exynos850-dw-mshc-smu
> +              - samsung,exynos8895-dw-mshc-smu
>            - const: samsung,exynos7-dw-mshc-smu
>
>    reg:
> --
> 2.43.0
>
