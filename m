Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96901B6D15
	for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Oct 2024 22:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729030021; cv=none; b=KhVKgQuXPhsKlxpwL28k3w/G66u3p9b9Iyqgb+ClnYRQAV2zxgtTRl0l3KqLeBsxKFCavGDAp4FsPEHOVsKfMJoNghBzMx5W9xCCCMEUZetIvHWg/TSplWJrTrtPnPoTAy1O0oGH0RX8CoBavzI5VynGKLFsmRkqoIuAxtmhJ6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729030021; c=relaxed/simple;
	bh=8pjgUnj2wUxiv+ZEhs4guDnzJ2SvwMR/Pm0VIaPIRWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DF68lUt+D7G1ESA+RZnaQUqZ5GFigFdZSmcnhNzCpNS/8phXarwTlkhnG0BKy97MDR/kyCmek5PR0Dum7wDJT73BtJ7srSi2RiQ28qPoA57ljF4qpYl+6bUTN/CVaqmQwnq907uiYURbTCyLJa3Bl/BFISOkU0q9u9szaiFA7Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F3pzaNih; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F3pzaNih"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb4fa17044so26011751fa.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Oct 2024 15:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729030018; x=1729634818; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pjgUnj2wUxiv+ZEhs4guDnzJ2SvwMR/Pm0VIaPIRWc=;
        b=F3pzaNihtDtk7PPx9Ho/xI0GR7GlzhmOfsnAfk5RsOAjjiicurixp40s77Nna1PBz4
         7MdcNZNqXb2unF5Tk/Nc2CXw3IWaeEQd9EUSXhz1aCsUj8WLuWRzyiHVTaEufwQZFYYo
         CuSRgx4Wxs5NPzczp0Tu6GUf5i+CdtkzsMr3DTxnNDbNOe37tWla3VYHp7ki5NZStI9H
         aCaawtrgG9hXtCrRcvy8bxP8FoOsqQEIJJWdheOhtiZXRkZcc6eo2s4Avy+SD3B+j78U
         2oNTzFiFSwdvMwxaL1Uh53aGRuNxXczVrnvkD20LWBZPgRK6VzCuuB1CWsJEDE4yjVLv
         /VVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729030018; x=1729634818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8pjgUnj2wUxiv+ZEhs4guDnzJ2SvwMR/Pm0VIaPIRWc=;
        b=bGlcfpKWJoQiOkg6VmbXU5My1vAUBuZLOvhDAp/SjHV4++Nu9qESkQN0NFXhjD1nx/
         ZuyetWE3vYj/WHUyk4mo3qs7ld5Ep5O9MvtrhYonIfuTzFelJwZMD4snWdfvaMMXZ+5G
         tz4Ca+2o+nAPsD/lLzq7pLt4jGxXLVYnuV9ElmvBUMTq8L7Jc+LEtazW7jiA1rsvNYES
         5nZI890f+fXcR5if7T7nfyN+RVVEgZE0Xe2XdGfeyK5N9D3FanEIlsvKKe9b7lslUteX
         6UqToIrezSSwp1mxgRgMwWCSkmEGmh0Jq+bsdeSqhSthpYHjD29NW6ybj6z+YGRIFW0N
         ZX6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXW1qcC4pZI3nCyLz/rAN7zgngg6g3ws5ZHg2hxsxknW51JZxIXp/C1tdiADQr/Tb2Iu8Mi7eAn6mmquE+Sht+JIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjoMqnfRZdA8LV5dU+7hvuMekmkNpr5vz/fESkCL0C8E2HmPzZ
	MU6Z/3IzZmlf+fHjjs0PVJudCx6e+3zt+CeQuvubPM6+45O2dC9/iF0y5XHcy4E4I6nX4ReZOdG
	4l4gLA9ZBOA9FGaD12mHMSZhTI/DPkHobPJPiGw==
X-Google-Smtp-Source: AGHT+IHrewx2uW2O1wX1aY++a3xqOQG1Pr1rX9mO0IID1XuNhMOh/EDpRoDGq5POidQ1Sfd1Dv+NRfeCn4ylE3MZrOY=
X-Received: by 2002:a2e:d09:0:b0:2fa:f5f1:2539 with SMTP id
 38308e7fff4ca-2fb3f2472a7mr48758161fa.24.1729030017817; Tue, 15 Oct 2024
 15:06:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015065848.29429-1-krzysztof.kozlowski@linaro.org> <20241015065848.29429-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20241015065848.29429-2-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Oct 2024 00:06:47 +0200
Message-ID: <CACRpkdbLZwLEWBjF7KPX9pDAVseujHF6_ytD9558s1B-p0M1sg@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: samsung: Add missing constraint
 for Exynos8895 interrupts
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
	Jaewon Kim <jaewon02.kim@samsung.com>, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Igor Belwon <igor.belwon@mentallysanemainliners.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 8:58=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Expect only one interrupt on Exynos8895 wake-up pin controller.
>
> Fixes: e2d58d1e1c61 ("dt-bindings: pinctrl: samsung: add exynos8895-wakeu=
p-eint compatible")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
