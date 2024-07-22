Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13102D627
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jul 2024 21:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721684101; cv=none; b=uUB024fmgvVDAGF59MNkNMagY9SubF7i234wpNdiVuHq2rj9lEKPjn8gjJgLfIhNR5TklO5GftPkNe+SYcV2zyVhYEK9BMqqU8nHM9AM2qDQCne2lQXJ0JqhjOu8pCIB1cQvogilnfKoH6GadvjqMetaE7wbW66NWMqHoup0T9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721684101; c=relaxed/simple;
	bh=DavKR6zlsHTTROZB3HzBGry3JUwnrQbFua6WuPnbWp4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mXGohx6L99eq+tuRFxPXkuRn0ufZqtlVsDYdZWa7EMVxJ+xpr2cZRPU/4hu3JK0z+Iy/FK1+aHkxRtJha3ecQEwUFfU25erq8HWBXApVEMSYU6ALF3BrfLobLioXtHB2+QBxRlUrRg1+4aNBxBnLIIIBw1PyDTvlberlJrzmOLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aekZUnLU; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aekZUnLU"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-66c7aeac627so17500937b3.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jul 2024 14:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721684099; x=1722288899; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bew7kISzf+Slt4HQdKRNoanuwNUVw3tMPgUQzbpwb8I=;
        b=aekZUnLUk6aVQQAgVJgBppyLsk0PRN9IP3rzKx7ylYE8JRGyYy+TrkHglCYMPWxMn8
         BZV5RWHtRN9Wa5gHBRlg2ui7OFf1DHkwgfYCxjYn49ixRz+spE2wri8jSAuokf4loICb
         hC86S5Vh2YXwlasYBV+eXXPSJjz9/KRyPgHF2/hmoxxvWQhoSHng7XRORlBep+dl5AVy
         HOgnuCgYkBjj8GzDshFwr9Xt7Atw8kltCkl6Wkwu7pO19e6M7L9CY/qdt33ESL5S/S5n
         +PKY5X8+G5OnYSaPlSBTBp/SV8zikL2ovoFwnX8hchTla+I2sOpLBNvUPTLDswDMGDTy
         rBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721684099; x=1722288899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bew7kISzf+Slt4HQdKRNoanuwNUVw3tMPgUQzbpwb8I=;
        b=BPIZBtYvIzRGdk2vjcTirJfltw3KqcPAe0fcbEJBfG3hVcIShUbaPT8XEXdYEiD22s
         PNNjYexAcM9yngT6OBr8hCvBS+QNh2IqNYSRxsBAXgYGNKSZZJ6nX483QP6RuyOPYA9Y
         ubBooZJqYdTE09Kqh1fKuEVOVb93xX4WaicP7wqEwKHQg4U9uMVn+wXgWZY5aDkoID3O
         ch2BXffEG616JqKO/s/sgh+2kbb5lNT7Y9GNC8jd2Rbq+QMU4vy3mo5pM3mMNp/vfETl
         QwV2830ADNTzWJISyjaoOLxQhmSsazHJozt0cBftQ8dmy8UibjXqlaPvBRl2+sesVgby
         iZaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJOI31p0nPT3l6kIWrnJiDytX8gKGFtCZ0P9QZedN45and8XidTB3PH2Yj+RGf6T6vkITR0T4EZ0GM8ZviBJcpiAuKuTF9MECdgAVmxWoaka8=
X-Gm-Message-State: AOJu0Yz9/FHnBUim4xvkOHL5LRyv0xvh6EskKgrwBSdixxd8dV3Ku3ND
	3nl4h5IK+Nv22OTnkKEDHL2DlS7lv9bqcdMhK6o5HS+5QiMmeiMDhQRyz+k6maH1dDx1TeUo4F4
	Vrxl2AK0vBbQQP89XhE6RjmZ7sEb95E3rTJ4d9Q==
X-Google-Smtp-Source: AGHT+IE0ltDhbLmGYW/fyUnYlpSuwc7uDLK7DxqB7eIHLb7TN7siloOmPdFA3AK/XHiKBZ174IJiHQAZ67jbE8WFQIA=
X-Received: by 2002:a05:690c:298:b0:66a:843c:4c58 with SMTP id
 00721157ae682-66a843c5e32mr107931177b3.34.1721684098995; Mon, 22 Jul 2024
 14:34:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20240719120949eucas1p1b061c716ac55b4a79ba57c407c0b2d91@eucas1p1.samsung.com>
 <20240719120853.1924771-1-m.majewski2@samsung.com> <20240719120853.1924771-7-m.majewski2@samsung.com>
In-Reply-To: <20240719120853.1924771-7-m.majewski2@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Mon, 22 Jul 2024 16:34:48 -0500
Message-ID: <CAPLW+4=MSeYjWs4GbriiY2rj8FsZ0_GGVRqfxV9GH4VxDREKCQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] dt-bindings: thermal: samsung,exynos: remove outdated
 information on trip point count
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
> This is not true as of commit 5314b1543787 ("thermal/drivers/exynos: Use
> set_trips ops").
>
> Signed-off-by: Mateusz Majewski <m.majewski2@samsung.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  .../bindings/thermal/samsung,exynos-thermal.yaml           | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/thermal/samsung,exynos-the=
rmal.yaml b/Documentation/devicetree/bindings/thermal/samsung,exynos-therma=
l.yaml
> index 4363ee625339..5a82764a4dbb 100644
> --- a/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.ya=
ml
> +++ b/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.ya=
ml
> @@ -40,11 +40,8 @@ properties:
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
> +      temperature thresholds. The trip points will be set dynamically in
> +      runtime, which means there is no limit on the number of trip point=
s.
>      maxItems: 1
>
>    reg:
> --
> 2.45.1
>
>
