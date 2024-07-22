Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B5C31A89
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jul 2024 21:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721683622; cv=none; b=qAI5ocjwqCnew2tx15QtiC6gM5EiUsEPUUkFSGMyqeUwfyaxN6FmtSc9hrQP8qN7VkKbp6MbHj4aHkXndErW/AeehKjFBs15i17og537zOMopl4UhUHtRZTAsCdXjDqbtUWh4+sevEYAHeN4wfnTvx7/mkh4Su7uv1ddOq9438E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721683622; c=relaxed/simple;
	bh=sCJG3bWH3eDtbjb5D5X4+uFiGPj+jwOyLufNrBNFIjI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DYheE0wWyAI/4m98ckaP7+B65y/v2lNrU7FzMSGXyU4D1dtvH1iy1ey0nGB4ZqkPn45piGBKFY8RZihaKEZo+LsUM81LHh50KSR2+YEJZK6rQX5mbZCzIkebk8gayAdS9QnFr/QEFx67iuAFhcNLUBpxJsE+Hzvkd+5b8fCqPi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lzUbgGMf; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lzUbgGMf"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-65f8626780aso49604907b3.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jul 2024 14:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721683618; x=1722288418; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Irn655mCRXY5mqdwBo1lh7DDX2toQETaPWSZms/YpXA=;
        b=lzUbgGMfRKe/vuzbqfjYWS2SvAR+CdIWVaibqZX9dn6fC97KlJck7BUstJVDVYAD3w
         xZOWKvIMAcRQvTyBjCLQg/HhIwy2b4KOHCTGVECIPZc8uwNXeAlwbt2M/LDbeXQGBWTM
         JOfrlZg1qoAyZ6iWTdKdcW1QW9v5gR/Dv4uuM7zxrPehzfItJBbbVLfsdGuNseRiju7S
         8fsnlXBrQfS5Q/UvPestuZQSdrxs7o0NKlAb5JhQHFS05kEJElJ3jInUkk/sP8kH5vo4
         zxoJ3a3ZtJwrxt+ROm6h9ZFzrcE948UY5UTDCqZTjkfjnLk1aBhOyNDTyCnVebidAC67
         iwHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721683618; x=1722288418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Irn655mCRXY5mqdwBo1lh7DDX2toQETaPWSZms/YpXA=;
        b=MFslF/XDB33LjMtWKGygb2MwSPLkNLLgBEIgzuy2N+jYsJLRToxiB8sgNum+rwKhCN
         JXSE+p/n1QyIOLsgKJFYJhD4m3GnlqRWWO9uLoeKGDv3eDkRhzb5vn26TWlygALgVNfk
         W5iVFnuNYjYLJAw4z9bdUp9IVzUojzHcxyaPUzguie8yDhNdU/3YJ/mwWWMbAIvaj4BR
         T9xLKprx+aSnGYemzhhx6An5Hsy67/Ld2DF8jPi9qHYBbNSsfEdrlOTK7EwhuAN48q9O
         0ISQKCUfUnYA//9LqEV15D1sNEfjl3e3tSZbqa3eL5a4OhHxqpHe/gCU8gyuHlTXXLiC
         NleA==
X-Forwarded-Encrypted: i=1; AJvYcCVp5gcClKBf7BRYdsfYT5QrrKhnptF+NQ+eMueQXeqdyeFJ3LMPG1eOPOjdmcLF3m8rPMA3+cO3dVTu3+VLF0S2PfGEZxvqPoDn9fe+2Ckm+y8=
X-Gm-Message-State: AOJu0YwAZ7rwAxnYG+15d8GdthJEBhVMfKoT+8A2gAxaWsQjpMp6ySeo
	OOk6dFX8K8wx9QWfi+DiXmDyyA//TEik3lN7Ke9lYdiRXRwRmFFiIASlo1YqYaQybWUi78bfFTU
	8MpOU/MPNlNOfbQI1JlgmspDXSIaGBeboNLWDuw==
X-Google-Smtp-Source: AGHT+IHvJp11LN5ee6Tk7UlnQDxVoVyWHR++Sg/eVWFbC4d3fcFZdmIiD/WbWCUKGQdz8BjtsebP2EEPCwOFuv3YIlQ=
X-Received: by 2002:a05:690c:2f0f:b0:64a:4728:ef8 with SMTP id
 00721157ae682-66a688a5b7dmr106293807b3.44.1721683617937; Mon, 22 Jul 2024
 14:26:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20240719120947eucas1p1344134823e100feaf49238de0e226431@eucas1p1.samsung.com>
 <20240719120853.1924771-1-m.majewski2@samsung.com> <20240719120853.1924771-5-m.majewski2@samsung.com>
In-Reply-To: <20240719120853.1924771-5-m.majewski2@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Mon, 22 Jul 2024 16:26:47 -0500
Message-ID: <CAPLW+4mY_n21iFbS_jLf9xY4E0f3iB8o6mwV_GyYSPRPn1WA5A@mail.gmail.com>
Subject: Re: [PATCH 4/6] dt-bindings: thermal: samsung,exynos: add
 exynos850-tmu string
To: Mateusz Majewski <m.majewski2@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 19, 2024 at 7:10=E2=80=AFAM Mateusz Majewski
<m.majewski2@samsung.com> wrote:
>
> Note that unlike others, Exynos 850 does not require clocks, hence we

From the TRM and from the downstream kernel [1] I can see that there
exists at least this clock:

    GOUT_BLK_PERI_UID_BUSIF_TMU_IPCLKPORT_PCLK

Isn't that the TMU bus clock (needed to interface the TMU registers)?
Of course, it's not present in the clock driver right now, but it can
be added.

[1] https://gitlab.com/Linaro/96boards/e850-96/kernel/-/blob/android-exynos=
-5.10-linaro/drivers/soc/samsung/cal-if/s5e3830/cmucal-node.c?ref_type=3Dhe=
ads#L1196

> have to be a little be more specific about when the related properties
> are required.
>
> Signed-off-by: Mateusz Majewski <m.majewski2@samsung.com>
> ---
>  .../thermal/samsung,exynos-thermal.yaml       | 26 +++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/thermal/samsung,exynos-the=
rmal.yaml b/Documentation/devicetree/bindings/thermal/samsung,exynos-therma=
l.yaml
> index 29a08b0729ee..4363ee625339 100644
> --- a/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.ya=
ml
> +++ b/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.ya=
ml
> @@ -27,6 +27,7 @@ properties:
>        - samsung,exynos5420-tmu-ext-triminfo
>        - samsung,exynos5433-tmu
>        - samsung,exynos7-tmu
> +      - samsung,exynos850-tmu
>
>    clocks:
>      minItems: 1
> @@ -69,8 +70,6 @@ properties:
>
>  required:
>    - compatible
> -  - clocks
> -  - clock-names
>    - interrupts
>    - reg
>
> @@ -82,6 +81,9 @@ allOf:
>            contains:
>              const: samsung,exynos5420-tmu-ext-triminfo
>      then:
> +      required:
> +        - clocks
> +        - clock-names
>        properties:
>          clocks:
>            items:
> @@ -105,6 +107,9 @@ allOf:
>                - samsung,exynos5433-tmu
>                - samsung,exynos7-tmu
>      then:
> +      required:
> +        - clocks
> +        - clock-names
>        properties:
>          clocks:
>            items:
> @@ -132,6 +137,9 @@ allOf:
>                - samsung,exynos5260-tmu
>                - samsung,exynos5420-tmu
>      then:
> +      required:
> +        - clocks
> +        - clock-names
>        properties:
>          clocks:
>            minItems: 1
> @@ -140,6 +148,20 @@ allOf:
>            minItems: 1
>            maxItems: 1
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - samsung,exynos850-tmu
> +    then:
> +      properties:
> +        clocks: false
> +        clock-names: false
> +        reg:
> +          minItems: 1
> +          maxItems: 1
> +
>  additionalProperties: false
>
>  examples:
> --
> 2.45.1
>
>
