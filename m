Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F871F0E2A
	for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Jan 2025 11:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737458451; cv=none; b=kJ1x5bprdRYl7bygoKTu0bHutCgBCbSIcSZj2U+JsFfBYnR7FzNo2+CKS3ZV6r63frmQQFxkZaAT3JDkAUOwuIbfztSu1z+x3BpEfE7Ywk1QdIlS6dTvgrhpIzREwO6Xi4u5RyP52o9AsLy2Ew7kwbJdl9E+OXOQgNCA4Bz5h+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737458451; c=relaxed/simple;
	bh=qjTQpidvcCkYdy/tnoHQ2fn95+J5qhGDadqKW7PFyV0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bLDEaISY6clxun3cU5J8UmR8wyUnUKI2oWk+u8/oyYqz8fIYsVy1g2qiHu++tBEAsrUtslPSPkXAMCDX7NBmg5h6O7FLuv9ues4SB8OpgyT/FbTlVEO2eGo7rsKdWj+fjavPeGLL/f+CV8SWHUYo62Y6aVl1k6Rn2cGTkP8UlbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=quzr7SW4; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="quzr7SW4"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43690d4605dso37443805e9.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Jan 2025 03:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737458447; x=1738063247; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y7zIFb2biPGgp9ksv7Po3u3QL1cwm6u7lkcvFCycA2I=;
        b=quzr7SW4Q7iD5Rxt0rLBJ7BIx4yJyPty9IqT7YWkE3SGFOTJbN/DPMLfCEIxw57tsu
         4PdRzrhCT8Jlm8K/r4JocylE55Fkp803Skrs40RotbnPxpikKqD9PK2HJjHSDU9AtyZB
         eZfZlbo0FShh0z6oEONeGqvY+Rb4ycIHzQrnngQbeIi2zULQJWNtRZuXLyR1d7ENkwQY
         P042tAtMms6GKObHf3Gn04NYq6hYuVPVTZIFMCrQlles2w2htUWwEv7oL5Y3M41apAs5
         W39k5HsrKmd7Ap/zR4c5YpKQ6eqvsTT1Z/G07OJKB6lYv23U2CXuxxz5vcMw2N87xwjs
         oqUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737458447; x=1738063247;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y7zIFb2biPGgp9ksv7Po3u3QL1cwm6u7lkcvFCycA2I=;
        b=bVjq5zkBnN0UYaiEGVHOT7/xcbiNh6fdPFJ47UuQqHmpwLzn3GiDSeBfOnNceqmwk7
         gmbD0rFT3250tfNeAGGR0EQXjTRSvWVb+MBSKziYBqXVfymajcy6nkpd/sFGmVA7sMci
         LFP8fU2M9N3BDAaPt+9DSX+UXm9khcrVxEdMrVhBDut7XHTkryGk+mTeRjngl5+6U5Tk
         ITrj8qipn3yihcFaezna1yLVUNl14vlhjVwwYmuIg1YxmwbJPm2Ux+UP4RyrYY53V3Ee
         J0GRp7FE0dxEpXfWVgmrRH4y4GKl2Tmbjfc1JpUMOzQXJQvh7ZEUycOg9GGPJMsrHb0q
         mM3g==
X-Forwarded-Encrypted: i=1; AJvYcCWY7FLp/j6dJ0I2YlVxW8Ly3tPlCGx+RUbv0MTqdmAe6z5BB/pfYlOsRztOheL0lat/HqWlr0p69susinmScO1UgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEubjDQd9675ySvY2b0TB1yrFjy8aat4qvILiVQIbCU6AI0T94
	1mAqarLKPGn9uHza2RKhCwQXxq/1/C53BxDNSZ7VIZbPM+lYq8rsnrjXYXAmAdE=
X-Gm-Gg: ASbGncvLHjp2Pl45ySURGgAXi84j6RAMmHbyFLQDGZMIOfv1SndOhhGgW4v5eaBsIwp
	W5nI7wz8CeScWWJmm5cI3HiwKb9DITZ5FC/Mv3K95r40pFj2J25XAXZZXIsW4MaqtfFKpDYm72u
	zaOJV70sWSehaa30RmpXQnpKOV2ZoHLDLsn0CY80uirFsz/AG111/mcxRdm8Zn+PR8EQsIkBBIM
	x3aQTGG9BIMOy7u+GfTIz6gfHWlG8hENN+uObWfsW3cDcSksgZ0u5UHWVH1EeptCC3pIgtFsw==
X-Google-Smtp-Source: AGHT+IE0y+tu0fWyAhJdzk7OF8kSuvMPYyFJRvvseEP3YUChEAoRqL2VBPrLKjVbpVCv/r4cnPgqGw==
X-Received: by 2002:a05:600c:1547:b0:434:a04f:2557 with SMTP id 5b1f17b1804b1-438913c7fbcmr154303575e9.4.1737458447389;
        Tue, 21 Jan 2025 03:20:47 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c7499942sm234080805e9.6.2025.01.21.03.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 03:20:47 -0800 (PST)
Message-ID: <4ac64a481d80785973d038b9292a05781e70a670.camel@linaro.org>
Subject: Re: [PATCH 2/3] pinctrl: samsung: add dedicated SoC eint
 suspend/resume callbacks
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski
 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
 <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
  linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, willmcvicker@google.com,
 semen.protsenko@linaro.org,  kernel-team@android.com,
 jaewon02.kim@samsung.com
Date: Tue, 21 Jan 2025 11:20:45 +0000
In-Reply-To: <20250120-pinctrl-fltcon-suspend-v1-2-e77900b2a854@linaro.org>
References: <20250120-pinctrl-fltcon-suspend-v1-0-e77900b2a854@linaro.org>
	 <20250120-pinctrl-fltcon-suspend-v1-2-e77900b2a854@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Peter,

On Mon, 2025-01-20 at 22:34 +0000, Peter Griffin wrote:
> gs101 needs it's own suspend/resume callbacks to use the newly
> added eint_fltcon_offset for saving & restoring fltcon0 & fltcon1
> registers. It also differs to previous SoCs in that fltcon1
> register doesn't always exist for each bank.
>=20
> exynosautov920 also has dedicated logic for using eint_con_offset
> and eint_mask_offset for saving & restoring it's registers.
>=20
> Refactor the existing platform specific suspend/resume callback
> so that each SoC variant has their own callback containing the
> SoC specific logic.
>=20
> Additionally we now call drvdata->suspend() & drvdata->resume()
> from within the loop that iterates the banks in
> samsung_pinctrl_suspend() and samsung_pinctrl_resume().

Maybe split this patch in two:
* first to do the refactoring plus adding exynosautov920_pinctrl_suspend()
  and exynosautov920_pinctrl_resume()
* second to add gs101_pinctrl_suspend() / gs101_pinctrl_resume()

This way, it's obvious which part is the bugfix and which part is the
preparation and I believe it'd be easier to read.

Cheers,
Andre'

