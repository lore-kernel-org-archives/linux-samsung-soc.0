Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86E713A3ED
	for <linux-samsung-soc@vger.kernel.org>; Sun, 25 May 2025 07:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748156752; cv=none; b=YE1zDeW55TQomAXbPWHYqwcrmXaipBd7LX6mh6k9CTxWXZz+1A0pPZ7u+nesb33xPk2u3TWHqNAPkyR1k8EVx1oRjDQjspXjnDt+1M6UD85GZOtsrtuW9Fst/NmziN2SYSW7H6Zz6tZZui9ZZI2o2/0oUeSeRCWgR2bUK++3WQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748156752; c=relaxed/simple;
	bh=jvhoBaZylv5JALI+/bZ2X6Rv5t1lsNh1PTJCaRNalmI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cle7ES8vwAnBTtMYJMTWe/xYLdwFDT02nwTS15f8as7HY3tt+usrXDbMg8kCrjC1wb9DABdu8acla/Z9/Qia+1Aeayqokf3a7Ke8yeVCopPk/9aHQSikApNCE5Z16JVlzojqcUcXWb5zUHNudCfJxaVjY2K+Gcg4qwveINFfsHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zMcEloKP; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zMcEloKP"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-605f7d3215cso541538eaf.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 25 May 2025 00:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748156750; x=1748761550; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jvhoBaZylv5JALI+/bZ2X6Rv5t1lsNh1PTJCaRNalmI=;
        b=zMcEloKPiYVWgdWwOM8+4IfmGknQltM4azGGIxnUZh0tpXmiO3BJtLilWCovoKF7QN
         HCqa2n6yjEZxUg9jIrPl84EHVWA9SKjMI3ZxEHe85vObwZb/lBWHPwnxkzb/XNlIaxxP
         iDvieoc3zjU/D9TPuKANDNJrgLcmVSfpi8YjAzQ8HWB8dbCekc85fZQHszb6qXnxkI5p
         HZjecqkrpQbqS8uomjeDJWfhIv7AccpilQUx0I9IYBr/9KCDArm2wOAsSjp40m3AZoVJ
         lBWQ+Y39GGmH4DZklc314dZmkO4JCo0iK3WbyB+SAlqvCoMtMkVik8BqY4A8EPnnNzQE
         VwYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748156750; x=1748761550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jvhoBaZylv5JALI+/bZ2X6Rv5t1lsNh1PTJCaRNalmI=;
        b=Dj6niKLdaNFr/AbvgsoVzLzmVV15oJE89Qkc0BwAQn0Y9TjUTmvKW4gS61d7sRtnGW
         3N+vWHBR4J9FwYXnUQNmCsUbVHGFd/wMf8hQkqnSm1Eg+15DNTofEpNUn83NmGmS1eQb
         GcNiMeVOgPd9jcjfcE0Xz6Aqy7eAg88ar3xUyt8kpzJfU7UIOIq4lMKC6jqpKMxHUxSM
         T+7G0MpCofGK7Ztoe1D6gAsrSgJnuBrIskrdbTRornEBZPaLG+/+2mbVSTjz4lt3Vjry
         +9qgUVpz1uVgtVM/9Ab9PRZvaDCCJ18sHlehzmF29k2Ci2gfiscEbvH1FSNTVR7hxCdL
         VIcg==
X-Forwarded-Encrypted: i=1; AJvYcCVaio2Zczo4KFw+YjZsiIBk5ncqf/j3sda1Sflt+v8cYYL4msn+Br4c98NNwNQbMYXtmjFpkK5Ck1NBQUM8DHGXSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzapeO99El/TL0aUvHTiiEAbOyOEWS2Qc4+syEUwIwoZjzaVS+H
	1pPM8Yk5qWolyuUV5iGshY8Kvufc5gjQatcfzWpBtV5qJKFxy1OfXuWBl2cHW2LrZmaZbxADh5V
	e3o5GN3YvTB+YHKOFo+dpiLqjWJscyYCx+lG6fJ7ipINAgb69ypwWcqM=
X-Gm-Gg: ASbGncvRRKLl894p5a9gS7XDaSqtJwPSKRXtbezhINtFAGlhzoJ68TqfjjyeMomgN88
	+ASZNgmc+gV5QMC2ARH7JM+lgB+aJKMSjBQccNlWAcRj13s0v+NVFr8k+i1FEY5sk8lD0sfwW20
	JGDE7kZefL43qqDcG1ipDX4CCb9lW3tVPBFp4y3HIbv1KWOULc9ku6BZJbsUk/HV8D0w==
X-Google-Smtp-Source: AGHT+IGPkyRDJYTnbDg706EyGxrFrSBuZIpU6gujwRJ5t4G9MskZVR3FMKn2gTUYPOf5EomM6pt3h4XtTjZNiHOsagk=
X-Received: by 2002:a05:6820:1b1a:b0:604:5e57:80ab with SMTP id
 006d021491bc7-60b9f8ac9dbmr2898191eaf.0.1748156749921; Sun, 25 May 2025
 00:05:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org> <20250524-b4-max77759-mfd-dts-v2-3-b479542eb97d@linaro.org>
In-Reply-To: <20250524-b4-max77759-mfd-dts-v2-3-b479542eb97d@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sun, 25 May 2025 08:05:39 +0100
X-Gm-Features: AX0GCFuYwVDbJuGWCNZYKWJexcFUkr6L5u2qT_trsMWFdA8H8nt3PvddMdXZGPc
Message-ID: <CADrjBPq9jzuDKXE1++ds=q85eOFDfBQ2VizjE7GX9t24wMsbtQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: exynos: gs101-pixel-common: add nvmem-reboot-mode
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 24 May 2025 at 06:21, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> Add the 'nvmem-reboot-mode' which is used to communicate a requested
> boot mode to the boot loader.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>
> ---
> v2:
> - add dm-verity-device-corrupted
> - update commit message slightly
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
