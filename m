Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E9C33981
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jul 2024 06:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721973735; cv=none; b=gL3y+BQe15no4ze+rWlQbiF9npSFO82v5Bc3EShaMGb+PCa49GGR62yz67bieyMrcZggqfisa0e6Vfwyc1TTHKsnF1fbEiv4cO6OFQk+tdeLPT+Aoe/VNd/7RAzOr8nyiV/GHy+kbkYLAVf5zpIioOS9cAmwKjp6vd7PcfrE7Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721973735; c=relaxed/simple;
	bh=rNgR2JbRnvuvQ8FNSWDeS5hOPWs2py2ht5Ejpugq7pM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bT/NX79lQxNFunZz55QSEKBh5KzrF0HJO/qA5f32bad1DX4dTpGaWVpaFiFZn4SxEal2LFsmi0pkgzlzYVQVFtOIoNDVIESl+ht5mrbUxMtUmy1E4m+047JAOUQOyg1MsMgHzH8nH1/xbFXKhpSF7z5w4p6sLvdKSKkr20lRLWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vxUF+L7r; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vxUF+L7r"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-426526d30aaso12630185e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jul 2024 23:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721973732; x=1722578532; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rNgR2JbRnvuvQ8FNSWDeS5hOPWs2py2ht5Ejpugq7pM=;
        b=vxUF+L7rAkHgm9J9fjcF6VpJiPMH75rp1GxCnx8wp/H1FgarCuuUCVNlC/Odcy1a6e
         JF8Ww50Fvw/e6rjKRFDoGkD2zRw7XLwWcI/stTzMqwXWR26c/LslmCkRclR7BPMDYAnp
         cICoiG8oK84TrC5hKv+GuvP5vPUvfEhY/v5MG7vYhgnA9LIJMbGBEwXFVr8FsDnf56Fj
         NY84bw5pVwxMeVA0+E8pIHuJp4igubRJeJFlsbgvBBfVELI6/7yHKQCZe2eDmIwoeTQx
         QnbGwjcz3CovhjhPLCljVUSjiA4LNTnddDnbNZVoo5R6HvSOsPOHqL9bH5G7qX/Inlvu
         QPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721973732; x=1722578532;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rNgR2JbRnvuvQ8FNSWDeS5hOPWs2py2ht5Ejpugq7pM=;
        b=dZfvDaIKrMOZ9mHD4tWPpurJ+WqpHUeex2ccF0ZelvQy70i0XzoC5jm5aO3EVXucTX
         ChiizpSlL4y0vXNSzDj75bpR0vGiXsYFAICwf4wovNaF3RAq6xDopWsSApAam7DimXjm
         Vb1NKA261Z/4oRj+1yovNdhKO/zjWdAUIaOtNtrknPYGgI46Oq1d3Vp3LKLqG3keKIqg
         kbZhwKrP25H11imi61GSzAT0mKkCdQuXTJPUStgdo04EUB9tUUXw8OiKDyJWWje4ovZ5
         RamEMtU/Q+1dCnGZn4Zr7qvf8sBAAjN9rJ8nx3WsveGa/IpC0RLizIdqJ7H2US9O7QsP
         L8uw==
X-Forwarded-Encrypted: i=1; AJvYcCV2jSExykKDf14n6uV9RQSr4EBnRwNzWk1hTD9OaG1Xs85HLhhPcfXuDSXbRvSer9v2ywsKCPffgnXrGh6ZnrmFuu/8/czIb7PtBQ/VyaeCEBU=
X-Gm-Message-State: AOJu0YwRJozEwhJwyr5GujvUwzES9cCORtI17MiQ8w0SuQrLt2ujGS1A
	1RkZZ2TgMi+ISkCk5YK/s8E4efnrUrAvLZwTBaxK3PrHyi/sz0fhp5RpJJvcChQ=
X-Google-Smtp-Source: AGHT+IGZITgAy64Un/8wyyMq4vbFh/xNWJjrD62oeqgqKxJlyGVdbqIZ92b5GkG6r6jaxg78Jk2SnA==
X-Received: by 2002:a05:600c:3551:b0:426:67f0:b4fa with SMTP id 5b1f17b1804b1-4280546dec3mr29466515e9.1.1721973732563;
        Thu, 25 Jul 2024 23:02:12 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4280574b2c2sm60659955e9.28.2024.07.25.23.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 23:02:12 -0700 (PDT)
Message-ID: <ace0b95ad77fe044881068a4cf1944e10b306730.camel@linaro.org>
Subject: Re: [PATCH] phy: exynos5-usbdrd: convert some FIELD_PREP_CONST() to
 FIELD_PREP()
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,  Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 26 Jul 2024 07:02:11 +0100
In-Reply-To: <20240710-phy-field-prep-v1-1-2fa3f7dc4fc7@linaro.org>
References: <20240710-phy-field-prep-v1-1-2fa3f7dc4fc7@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

On Wed, 2024-07-10 at 07:45 +0100, Andr=C3=A9 Draszik wrote:
> Use of FIELD_PREP_CONST() was a thinko - it's meant to be used for
> (constant) initialisers, not constant values.
>=20
> Use FIELD_PREP() where possible. It has better error checking and is
> therefore the preferred macro to use in those cases.
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
> =C2=A0drivers/phy/samsung/phy-exynos5-usbdrd.c | 12 ++++++------
> =C2=A01 file changed, 6 insertions(+), 6 deletions(-)

Any comments on this patch?

Cheers,
Andre'

