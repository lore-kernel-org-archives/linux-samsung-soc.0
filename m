Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC21722C6CD
	for <linux-samsung-soc@vger.kernel.org>; Sat,  7 Dec 2024 22:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733609445; cv=none; b=Sdg3asJlYOCE/hHt95Nc7+zisrCilhgLiF2pCw7SGXqONazlCIdcv+6HJwCa9Oy1Hh80Bv4iPOae57wVJHUmsZmJBV+i2oa8n1pRQQHJbxRn41mU7iQ0Rgi1h8MSYttCtd3PqIl4Tn7JWDdLtdve4y2JE7y6AJuFrFYUkGZL0aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733609445; c=relaxed/simple;
	bh=2yeHJBuvknf2hLBb9j5/HvmE+uUK/8GcZejF0YdVYK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IrN0MeaqiLmFulrZkZxqDxMrKJ9THPRMOk8Ztl7KYM/uMen5Atw561tg8I1mo1qP5mfDTslAdUvgVWX94T3uaE7FFKc7P3l7tYTOwnQoyqtlihhkxKzXCEq3Fa4ENdtp9z/ag+pQvNsBLyGP4shS/Ae09H8nZUgJm/WJ1VbRY4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Des9A9hR; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Des9A9hR"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5f2abc195f3so132669eaf.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 07 Dec 2024 14:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733609443; x=1734214243; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJBGA6D5vNEtEB/ib66h+psHOFDDtr3mhYyS0Z6TU5g=;
        b=Des9A9hR3gOxmX7W3Ui7svdGAiytxqKy5j+LicvGHytfptaUS0vXd2uOX5kjMY/S9C
         rfI57AHvOXB+P7+wW8YSo8jPzYDXFfQrJ4bzt7HpkcYOF1LXte+3m5QsYAmaogg5eheb
         iOrUrWddvTfmveFH/2OKTzjHcIEKOudzLIrLU5ASoAKJsgoZG0gojKMscHbVyiDnKWO8
         +Ag6dRiQLaPKDYypl3qZfBnIS5+DmEraCtVOtxfwyTGa9n8i2mm2Lovti2pt5nu4Wsil
         G7LfqHoscGPlhrLsISsf1mTEdbv0IDSmRQHRTw6w5lypkyh3JoQCFi2BThFgibOYVw1M
         T5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733609443; x=1734214243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KJBGA6D5vNEtEB/ib66h+psHOFDDtr3mhYyS0Z6TU5g=;
        b=NHTbOWxlVsI4pHg1Cc6QOGG3kpvTa/mWzL79FPHv8KIiu18Yn7/FIeWzCJtQ5O0FnL
         1Rj10FnR05xeBIlpG72gwI1pCHCtE9uOqepMpzH8NaEGU3QOgk2+QMqAMYLnb4ksHkZL
         vQzsb7q2LVeuH//cLAbVsm9aA27IaRxWKq/VE3s4PvAPlqk3DA08Ony+DYFGU6lH7Iuo
         loifQWRCMQqR20bulhJ5nAnc/3SGhrooZq6rSRlGmAYYMiazqF9p3zvRL3Wip0yABlhO
         oL689hwgd2LkV/OHcADX2Gu+K7FBm13IjgtStV6TLPP34d3jVqRAJX/zHAkGVJPzjSch
         Wl2w==
X-Forwarded-Encrypted: i=1; AJvYcCVkwCU8aZRMZQkF+6SRQWvMfyxdlUAJMhihbskcgULmYa8crF724qqFCbC5KYqg8fbvxzsYyf1SkTW0McZW96Fw0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKRnoxushgK8gkKdpJIFs2jx/slv7I+DtiSVJnqtKksu2CTRtF
	A7Fvc6jAVKIDswBubJnb2iF0XoCMNgz2ZtwlIurKMxCxz114+7+OjuO52cCYub9pWyykOjvP9ie
	jakcUXMRtDPlGqTe9/gqh0XVM8ro+3FmG1cBLtQ==
X-Gm-Gg: ASbGncunJwDbMIZ5jVMr0ZI2wMsr5mVkSnpN0LHi5lVU8VMyGbzIBlbvmnGNtNmDwEa
	OuyPf4fj97PfNQJtgDWe+gvHVGebxGAw=
X-Google-Smtp-Source: AGHT+IEzfEqpnzeYKIfkF5R8fv702t9MqnWDdRkAxs3VAzNsDFAxfBBCyID+B7CHmUcn1Ieg9oCtaHwIu5Jv/QeLWcA=
X-Received: by 2002:a05:6870:f78a:b0:296:e88f:8f56 with SMTP id
 586e51a60fabf-29f7389c4e1mr8234677fac.26.1733609442837; Sat, 07 Dec 2024
 14:10:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203-gs101-phy-lanes-orientation-dts-v2-0-1412783a6b01@linaro.org>
 <20241203-gs101-phy-lanes-orientation-dts-v2-3-1412783a6b01@linaro.org>
In-Reply-To: <20241203-gs101-phy-lanes-orientation-dts-v2-3-1412783a6b01@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sat, 7 Dec 2024 22:10:32 +0000
Message-ID: <CADrjBPpOj3E72SPAB65Zrbct-ny=ynZxKx+21foJdQ9qkPzC7w@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] arm64: dts: exynos: gs101: allow stable USB phy
 Vbus detection
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	Roy Luo <royluo@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 3 Dec 2024 at 12:40, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> For the DWC3 core to reliably detect the connected phy's Vbus state, we
> need to disable phy suspend.
>
> Add
>     snps,dis_u2_susphy_quirk
>     snps,dis_u3_susphy_quirk
> to do that.
>
> While at it, also add
>     snps,has-lpm-erratum
> as this is set downstream which implies that the core was configured
> with LPM Erratum. We should do the same here.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org>

Notes on testing:

Tested with a Pixel 6 device with 2 different USB hubs and also
directly into the laptop, plugging and unplugging from both ends of
the cable. With this set of snps quirks disconnect/reconnect always
seems to be robustly detected.
