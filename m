Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D1C23C513
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Oct 2025 20:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759870411; cv=none; b=WMLylUGJAeGSrmytySChDtgvDshq42T6IWTzqjZJ9WskBh7ovo3WUfNCCeGmBbyPVt+05sYjXR8+skMwgTSm6UgkAtmJycX9aof8s8Hl1VzRzc5JRxnnlfjoyziayc/qL6Uwa/rxIWqjXK7OYnue8DXM+SLuSQ10nmZhwEPcH8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759870411; c=relaxed/simple;
	bh=/hCZP75SmDHrCZY5PWLz8NOVMBMSMd1PrqQADWHi6tM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qwTCrNgBmU+vBsHxsNw7TDu6McfKcxi6Ne9AhP1R/YtmQI3ZFmQQnOVec+S3bC9PRHIp0JAI9GLIDoMSXG2VNZi26QCHoH0X5xKiNSFki4sSKD8q30PDS6Pe9GYNjynsAZCLpe8IwVZ1MgMxbHVqk7hvKjGlnzu3NJDQpz1KnxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SlGUFpSs; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SlGUFpSs"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-74526ca7a46so2298892a34.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Oct 2025 13:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759870409; x=1760475209; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/hCZP75SmDHrCZY5PWLz8NOVMBMSMd1PrqQADWHi6tM=;
        b=SlGUFpSspz44Aw5wUKlHa342PN49vvlrUAMNLdS7xKJR2gulKpDZtYd70s33EVMqUB
         d2k3McBx8l0aDVxdmSsZYHq7L/xqAPwE8CZjoHAllk/QjDD5JiHdDeNEhI8oiAVpOzhi
         8hZrwkurrQLZdIa7JXTR0wxcwFACOC66xYgoSX0HRda5WnPfsxGs6DNKq4NQvnrnZaIc
         sk80RjesUNWg6H2sQwMcC4WbFP9/AY9uqfQaUHVxfhKflrpPxDr5eUfyBk4tdFa036G5
         E+ttBI2bX6sr1uowZuA8z/ToSCxC7e/00glVZRQ5OT3Tvbddfh11h7E/BXYBOJsBAzPl
         /F+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759870409; x=1760475209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/hCZP75SmDHrCZY5PWLz8NOVMBMSMd1PrqQADWHi6tM=;
        b=ov/nWcC6/17jM3KBHwY2m8f4toe0fFbOTpnCT2zWn5OUKSftP1zC+4iaVUAyc0eb6C
         8XEcNsxaUDewkWQqo1Q9+/X+ySGgl1DtXFR4mENKhZIx2BzgszBxtzIu11/wVcM20rI6
         g3mWCdcJtqS79tdGkFOtmacvESFmoJDSHtwegth8Al2H8n+LCv+/XL1f2vWHsVZEzFqQ
         0ORl13rXC3dektM1h1bK/jBZaUKfdvj/Nd7XMuC326vYFC6TXPTmdgfx43LK79zWoolY
         Vrw+IkkU5FaWIVZuQSlGfSBgk1ghTppvs8uFcy/wVDUam3ZxsQboQ1E4YDTpNi4/X/zS
         PPPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHAeGd0c5y/k1mTCk0zvpG788vhmrwADtO7rZ6M4EfkAzZcDDH4x+DaMKXjdH32whrtZlXpHYLoqP8MX/jhrWrwA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz45SP3ceioT0ybo5oAaIUfJz421xx64tM+vTM/+2E+OMOlDECg
	R8Ts9JZ+qV+2eOSmZtJAdgJTBYA1nN8W9zsX/K3j9vINo1UBN++PWxU4qSztU0KXbwLt623AeUA
	FstJkI8p3lqxTk/6O1bEk1xYzvi4NJEIEQ79DNX/6Jg==
X-Gm-Gg: ASbGnctODgXrN/ik/LIrLtUaWOeVsJzw9YYxzMtyK5Qe6lOitrn1SfB74PWiY0uIHQ3
	HY5iYO0UVe86/8ZLtuLWNLXJGIYzoLSuueb3unZRsq0nNfy98bFOGnKaVJL2gdxbL+Y3u1q7cRV
	qd/OK+fZTLpXgVJe8ukKV5vwOaINwVj+AJ7TQem5RrmWkyoS2MCBK/YZF4Qcr7Tsw4+mSkCxda7
	vwspjPL9PVPqBQ64JHXKISe8WDgcmIu0WxGmQ==
X-Google-Smtp-Source: AGHT+IFQJZVs4LBnBVbWSGDsdN3906KKw4UjF5sMiH1fvSeD9gn0otajPAH5kYHA1+VAEseWAd1TdVpRyCmSlYYSQ1w=
X-Received: by 2002:a05:6808:1988:b0:43f:57cb:7f83 with SMTP id
 5614622812f47-4417b3e3209mr436998b6e.46.1759870409126; Tue, 07 Oct 2025
 13:53:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251006-gs101-pd-v1-0-f0cb0c01ea7b@linaro.org> <20251006-gs101-pd-v1-3-f0cb0c01ea7b@linaro.org>
In-Reply-To: <20251006-gs101-pd-v1-3-f0cb0c01ea7b@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 7 Oct 2025 21:53:17 +0100
X-Gm-Features: AS18NWAUUQxOHKEKFHDJ43bMyMuc1k66q_SOXE8Wv3pAaENJrBaMTokvZjBYJtQ
Message-ID: <CADrjBPoharrk2BwLuFaAicErLxZXre+gSSqwws6Q07E4C9f8nA@mail.gmail.com>
Subject: Re: [PATCH 03/10] pmdomain: samsung: use to devm_kstrdup_const() to
 simplify error handling
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 6 Oct 2025 at 17:43, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> Convert to using devm_kstrdup_const() so as to simplify cleanup during
> error handling.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
