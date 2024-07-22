Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C1E770E6
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jul 2024 18:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721673601; cv=none; b=f9J0Wbz/Si/3Detc9Gb8/tIOmOvtIF3I255sl+VJo20eZmxHHvBTFFwXlATmlcDtc+5CmWgB9r+kxLhIpUARZoj9VJq9h4f5aoq33JZ2F/okuXHICuD2C1IE9r4JUvZrTBqelaOd2SgkCXa3MgYvmwcfNtp6QkI5nA0+LJrIhBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721673601; c=relaxed/simple;
	bh=jiivNKC7lQbRfNg1Kjpt39Y+ifXLk9Fuixvd9EbV8+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b6X/vZz4r6KBU7u9KDl6L4RiuU7DcgA7vC5V/r5XJr7tAoC90pPzGvnOxmYu+oPhfiPeYqsuIJQ3cMTwhAjduGL9LEQaECs63a4L1ED7lLkqmL0edXgK6Gli6GiWM+H8KHC6yj+vpQDVtL4TrXu1EBsGHpdDzQqCgl1RySEfC3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e/wE/RZQ; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e/wE/RZQ"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-66526e430e0so48939257b3.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jul 2024 11:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721673598; x=1722278398; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1c97fZFJ3UOJw/ZZR/BLt9bIZt0krqS+WJPVRsmyTw=;
        b=e/wE/RZQWHKigEckl6HNT959oxaZ7ZC4jQi2uz1f11XBtrOdCSL2IOvOfawiqHTWY4
         tqpzp4yG3rGi4ZGCajXWslVG50XnJXqXKtX+dIta6m1COUOZeOsXLqdsuRKGm+lcFfAd
         JR7M7CRlc7TXZ0rXSmKvHAsASWPu6j+7RUNhKb4V4Lyj19ngD64lp2Z++aHEu5b7U6Pf
         Ng3r19lk1eFB3CC7zBBxHg5eVdm4OpHmDC6YJnPRWt4cWfKlH0JM28FzAIhjLRct+CSC
         3JWKtX4DABpBOXkQCTldq7Go43GrHCZZMcGdG730JvLrdyojYM/YDhr5Sqqzs1tknvAc
         q5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721673598; x=1722278398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r1c97fZFJ3UOJw/ZZR/BLt9bIZt0krqS+WJPVRsmyTw=;
        b=lUs6voQBuxcvg/JSOQPvfP0KFuc+O6ExvlYeBVF0SNzrbq5+IOcOKvaq9edj6uihe6
         32gsMSdBHeQ1SOUHuIr5eu7D7FyPm9XeTwh59CmgVpf8+NoO9owZ5CUlxXvdE0mOll/x
         OQP9dVSU3xYGBUBwESPugoOx2Tu5YH0WahGxsVJ8RIu75c/jW1DaDy2MEdKWYnTvxSe7
         Q8h4PmxqZXPX96/ET8iSmZeO7D+6XfEgD1u4GEfynPKjPBxnzF9vAg6BvVfOBoR9bTu+
         FFmHfuQgLXEZgi9Cr/OoENIHip6ygWQ+nxnq0HKXXmvR6D/SxO6nYX8qbFLxZOhkRMlh
         KK+w==
X-Forwarded-Encrypted: i=1; AJvYcCUbPmf/TPYCYmEEHT/lcsD0dz+D+Vakro5rQbzF0006A/vdf6lKyJ9rgxqrXMozSAty5x9Ej0V0Z0CM55oGdpTLSv0NFUyMeyLLmnM16AgFPUE=
X-Gm-Message-State: AOJu0YykgvSVmp6JEN2G816Ab4w0dXuWk8sHtBYTFUMdSy69ffyQ4FqR
	WnCkCh0W4HAqwo82o17T7DsuWemw6bZ1GzC6h11ngIGb2gQQYdZef1OgtxguGZ3SAbx095RHyqo
	xTiJ6lBAgJMCkrGOrs4IXesQareaC0dbD5ZF/mQ==
X-Google-Smtp-Source: AGHT+IEReHOHNiIFa0oMgVRxlCG9RA8ftspFBW9UmBDqwYk4Nh57Mi8IAfbccJjJtUaTYgJaPpM1V++zASopTbzE/EM=
X-Received: by 2002:a05:690c:2e0d:b0:64a:7e85:9a94 with SMTP id
 00721157ae682-66ad91c36aamr79649327b3.21.1721673598539; Mon, 22 Jul 2024
 11:39:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20240719120944eucas1p29318fb588150b15f60f637fbea48271f@eucas1p2.samsung.com>
 <20240719120853.1924771-1-m.majewski2@samsung.com>
In-Reply-To: <20240719120853.1924771-1-m.majewski2@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Mon, 22 Jul 2024 13:39:47 -0500
Message-ID: <CAPLW+4m0xG5yHOT_ucGdrOhLZvjhga8caqHQZmVH6HHKUnBgkw@mail.gmail.com>
Subject: Re: [PATCH 0/6] Add initial Exynos 850 support to the thermal driver
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

Hi Mateusz,


On Fri, Jul 19, 2024 at 7:09=E2=80=AFAM Mateusz Majewski
<m.majewski2@samsung.com> wrote:
>
> This series adds initial Exynos 850 support to the thermal driver
> together with its requirements (tmu_temp_mask fix, making data->clk
> optional, adding the new string to dt-bindings), while also cleaning up
> a bit (using DEFINE_SIMPLE_DEV_PM_OPS and removing some outdated
> information from dt-bindings).
>
> Mateusz Majewski (6):
>   drivers/thermal/exynos: use DEFINE_SIMPLE_DEV_PM_OPS
>   drivers/thermal/exynos: use tmu_temp_mask consistently
>   drivers/thermal/exynos: check IS_ERR(data->clk) consistently
>   dt-bindings: thermal: samsung,exynos: add exynos850-tmu string
>   drivers/thermal/exynos: add initial Exynos 850 support
>   dt-bindings: thermal: samsung,exynos: remove outdated information on
>     trip point count
>
>  .../thermal/samsung,exynos-thermal.yaml       |  33 ++-
>  drivers/thermal/samsung/exynos_tmu.c          | 279 +++++++++++++++---
>  2 files changed, 270 insertions(+), 42 deletions(-)
>
> --

Thank you for the contribution! Did you by chance test it on any
hardware, perhaps on E850-96 board? Just noticed there are no dts
changes in this series (or as separate patches). If no -- I'll be glad
to assist you on that, if you can share dts definitions for E850-96
and the testing instructions with me.

Thanks!

> 2.45.1
>
>
