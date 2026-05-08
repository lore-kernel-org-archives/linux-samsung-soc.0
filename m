Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D4D3128DF
	for <linux-samsung-soc@vger.kernel.org>; Fri,  8 May 2026 22:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778277911; cv=pass; b=OY6Wf7TqEd1y3Z2Aiq3Q1LFKtFZkhryjdGIfgR5OzH9TqEFA6+Vuwr9Qp+bqOaXlorjxCy06NgkFz3aiO96noByde35tAE/eXASrNT+Hiu2ql0S5+KW77RysYoiXB1nUiDOREHDBfIyUoDGg4y8Y/SyXPg813GpCOzxuDhrcY3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778277911; c=relaxed/simple;
	bh=sFhOkypFgUFtrwO3/lD2eVgWx0KBMQErr2EqNiq9JBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LrKriMjXKzDWvr8DiSjrLctKWeD5wTT1SuQGkamV5YqM7FlA4uZ/b9LFfhg/GJkDvs4MX/3mrrYFdYQ9aFH305feuJwjHCd/h/2Qb6+/jpp26lBsLSjpIZoH8o9OvyA0Wxq/tF0NYz6uPo9SR2ZBIbl5rIZOBhXO3Dw4TMY6QBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Te0YCfX3; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Te0YCfX3"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-67b6da5a618so3578337a12.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 May 2026 15:05:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778277908; cv=none;
        d=google.com; s=arc-20240605;
        b=ascpvjcBZtC1ygzkeSf8fZrTCs1NJa4EdvjB1E5OdB+OUPCIKb4UqGlrDQnE6qjBpO
         Wl1RCcTUBcyvOsY0ICX4dwyp4+eZMQodrNpxV2udz7Owrx1Q8Q9TKBWr+IYcDE1ULSS5
         MadKrcYYBJK7qQ6BsnFPo+nrkhvr5IR5d7MbtO+Bpo/YCfbD1Q+/XlJxwkl5POct12L9
         2sIfy3qTNW8Uimv4VfVjYTDkeXay4thmQnp2BppS1UgGbv5EQ8+v98POfZHl9RRol4k3
         EkzmXAqeBDKR3SkumNWuMi1CXmbGKwkkHyZB23QVdy4Q1866WGAcUnjMhWdRGy8cQ2V5
         OeQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9axHN34RSuU5CsT1lGt5XlZGT/hvy0PsddNDcz/MesI=;
        fh=/6B+y2ptKLPejVwEtKgQYz+sj5tmbtXU0a6WOSMxZmM=;
        b=DzmU2PYmjNJRGlViU6D+0In7xXNyIru5KS/wxYHrzylKf+7CLT5sAOG/ReznYvZ84e
         Qg7pvAFn06tgBo9g3XwCxQojcPKrWt5sE4oeuAJynt119Sz0eyKe8xiSBcK5tlztzJJe
         I9UqSGLI2Mxz94ywtmDJRo/8DrC3p27nUKEvZHqKo94BjsjVR5sJbeP3ai1LQFyGWILr
         p585sCeCN981zuGvYjh+nLm5GJjxS4lPz2jdxz6Vtul0LYsGWEeqYJBxpXMUXhJVr7JD
         oid7wYj64w5UdqBTdYLwWTShjRhjH2No55bPnbfY/ezcK+PETnK2OzlVq2FkBlQ9tTqe
         lgEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778277908; x=1778882708; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9axHN34RSuU5CsT1lGt5XlZGT/hvy0PsddNDcz/MesI=;
        b=Te0YCfX3YWorWj7GscIhG16r7LxH79T+UiD+AsvoWWXWPL+85VG+pjrqtb4Zx/zmNe
         0URm0AEsB/WVu2Vlqs8x39bIGdvfwqWk7ucNGgQ4V23RAHvW6Qa6ILyb8RPVJTiFuvD3
         ik75Hs7UmbZ8TsN48VnjL3/lciUzIp7ZtXulibrc9RwlpwDB1mDyGVdAVvt/Rfc+Ynxs
         rKPE5zO2Qewb3jZ7x9pT2Ced7pF6WffFTdpHp6xuTkPhShZLGzxK6Gl/P0/Np13/kjul
         isFDjs7cGPKlNBa5AVhr0bN897SwuMU2WJGUcNOW2mcDIctbHF2NnC6PzOIIQxKV0XKH
         ZcBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778277908; x=1778882708;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9axHN34RSuU5CsT1lGt5XlZGT/hvy0PsddNDcz/MesI=;
        b=OvaQ8lGu+SiuR+/w/9c8FttQOU0ooNXtamztUPD6tjcvqeHAOJydzCW3eTS+gEFpEc
         9RRsxiVEHq6vGHTVZ+0uqyprxj3W2sarII5Wyf7yX9ldNAzSITogqbUHo42zoVgadywF
         q2YoKtoUtNjCLUROevmZhqs7kmF9zPLvxP1PfQbUJBrhyn5chXXBDcMhjaVgZOwY4TX8
         ICt5BUDcieeN0Qoi+IK6nitIK7AKKfppnIyrKkn4ff3oZ3euSeObXN7/XEv/7YGrDL57
         ALN/SSDbWyDsubU6qhzNdDgC5MzKaJVhUe4Wxow3vZXHdU1+O3JySOzqeg0UICgt4h+V
         qqCg==
X-Forwarded-Encrypted: i=1; AFNElJ/2Q5rjjPUoJb3SY5R1hNTI8RaHsAS7rsZHUIMbXm8Gd3wyvuS9fNPPyZvzm9tFJpd3OWDjMGiLjfZUwKqRhPFzbw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr+aKalkJygeDmOXFF8zlJa/Asst9deF8T1Ic/KuJjsAs+h18L
	D6iZRbIZ6GbHNjV4GMxcDt9yx+T8yVY6ZItcDbvsycp4Nd2U9nuUXG3Idzr7qQWZnzQPcSs/Wl0
	qGubh8vwxRa1E9Dpwc2Fb2RLebd+S9qGCu+VgHIT7/g==
X-Gm-Gg: Acq92OEm8GTbshCwLe0S/buNnKXaXVW+FQQlzp48ruoI6PAyleoMEbt9F0Gl52Z3BE/
	zyawccKvYlcdpNXtFQ89GWPgJK6yqjWqqooiM45wXMyTX1+n+z+oI/eDU4mwCyNQ/L0U5BX9TJe
	2WqjECgsZGCyDzn7qmwLhZ9BnNRm8dZVggvEJ21RZXTFnZuoe0Xtu/MkmA/89ZWXG+ydIfNJLJo
	Ir0EnKo8wi53DlHpTKcqJFOFPAj9NM5dNTnyyYWhcQ61InF7kpCV5s/KxOTwjxBInq4l8XDiHjm
	UX8QR+jO/lcp0jmWWGCVX81KYWdYm7V4tygVqI+IxTS1AETFu+Wb
X-Received: by 2002:a05:6402:440f:b0:679:4b89:d348 with SMTP id
 4fb4d7f45d1cf-67d648b2341mr7555694a12.24.1778277907636; Fri, 08 May 2026
 15:05:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260417115842epcas5p1fb06d6f1663b97b1eae3aafaa6a3de0b@epcas5p1.samsung.com>
 <20260417121452.827054-1-alim.akhtar@samsung.com> <20260417121452.827054-3-alim.akhtar@samsung.com>
In-Reply-To: <20260417121452.827054-3-alim.akhtar@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 8 May 2026 23:04:56 +0100
X-Gm-Features: AVHnY4JcC94zWVXrCoUpySC3LgZfp20jXlP-UHsUMtZ7sbT2HpSsWnqgH1G_b7s
Message-ID: <CADrjBPrD1o40K8_seeaQHzqiZRYMVVteMOPozpTVz+q0zGr3sg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: ufs: exynos: add ExynosAutov920
 compatible string
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: avri.altman@wdc.com, bvanassche@acm.org, robh@kernel.org, 
	martin.petersen@oracle.com, krzk+dt@kernel.org, sowon.na@samsung.com, 
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Apr 2026 at 12:58, Alim Akhtar <alim.akhtar@samsung.com> wrote:
>
> From: Sowon Na <sowon.na@samsung.com>
>
> Add samsung,exynosautov920-ufs compatible for ExynosAutov920 SoC.
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Sowon Na <sowon.na@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
> index a7eb7ad85a94..710ce493f3b6 100644
> --- a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
> +++ b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
> @@ -19,6 +19,7 @@ properties:
>        - samsung,exynos7-ufs
>        - samsung,exynosautov9-ufs
>        - samsung,exynosautov9-ufs-vh
> +      - samsung,exynosautov920-ufs
>        - tesla,fsd-ufs
>
>    reg:
> --
> 2.34.1
>
