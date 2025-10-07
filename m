Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDA51FDE39
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Oct 2025 20:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759868496; cv=none; b=cLoRvuAUdMJ+9/+P72Q5NGlRqp3Y3Ges/6i91e+ai/Sy1NGcPt3sjNgDojLdvNaYU5R+6cb7aAgwI0alugb6TdsL8C5qFaFk6OpgZqJ5U8X18Xcuv0m8PNYvAd7bmSeBUVbEfdJRtSp/yiKyr3CowpteU4S0i1liCyp2VEwGcak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759868496; c=relaxed/simple;
	bh=t4kdCtbMpSolLUWzyca+TrSgBjxKOUaqCLIHEI3NSpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DUZ/OsNTY2WopVoXBdzrtVmHHjzqO+0erGsOBl432xr6nbAYMeWjJm0BEntiI9/OfTsgCLDhXm52FmKgyZHqxok8Hy/tqOtCvKq/zCSKcn/k/SNVnMu+HDKsRIGitWDiTU6+UD3Sz63+lYDntZVPqMFss3bWv6LVq7lx7zTHZnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hHQtwXtJ; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hHQtwXtJ"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7bd8909c682so4172346a34.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Oct 2025 13:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759868493; x=1760473293; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4kdCtbMpSolLUWzyca+TrSgBjxKOUaqCLIHEI3NSpw=;
        b=hHQtwXtJEEpxiy2cS8AfLKG6xMyZxsA6Brt/B7Pz4bW3nn1/UByh/OWZUexJZUnXl5
         sVOrV0aU0jFZyzdZ/QmpdsU3X235GeiZhQ1PXVUBOiwACIDN2S3dzM/gT20qJMyWx+BM
         FNPrOuNYx1x2hUHqJ9Hqz4+ne7g5v/RD8uJJfEftNUbmP/S3jy081s7580w8iYI5KPtI
         FK/lzh2dp4FKJFkf2/eP9CrlWD8k6TzKcNG9Evz5/i9qEsR8ws461flW4ZuGPmnAdtSY
         DxPI2dK/hH4mzJM8pp592lfSbrvolnUZW0PITfFjLfdOVxnaEI5tAC5Qqjjvc0F8jze1
         mVtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759868493; x=1760473293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t4kdCtbMpSolLUWzyca+TrSgBjxKOUaqCLIHEI3NSpw=;
        b=hKyODkaDnXmugyuobjcFEFL/COMhkx1tTiu7IoXpEwrjuxtS5/OI5szVTtRvVl3aWe
         DcVPFHOiR7+qwxfu/cmJEdZ+u1gPUIhQ5m0psxp03mrGaNssVBz26Vl4bZ33TLORwPrh
         csG1dROMAWAZHmLJsMm5pkecEjreCGQcJrcJazvrDn44PyQlxFNWVRB2PG8iTnKs9lTK
         S8bjA5ByDr+r/PFzgQot7hmT5B4mAyM/wGMno8WIEWdxnowfeB85yuz0f0rO0Q+T0PCg
         XyY69x70l9oM1/TvoODQErwAVOLnQAcE4duFC+4X9qYvGWH4nkSSDdAPHHKKOruEqLhT
         ddwA==
X-Forwarded-Encrypted: i=1; AJvYcCUX2+0X/ioCm/hnpGnsPGWdPWekHJiZdRRFgSgwUqFqbeQkYsSu/ZBqpNZO1hBDjbR+Mq9s2B4dSyP9gwk7I9CEhg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yygta1c/Co1o8xfJOmwGUzO/WK4bsmQ8Mt70ZHjhJHFEtHXMc1g
	7R51LAqsOxVQMefZkT6FDPsqhj3WpFBBbsnzzK/mo8xzACNdflEg2lCaVWB34GDv5sSKVXJPvJ3
	odaMKA+4+jANWQmclrZ2du8mzVbswTALin54LITLchA==
X-Gm-Gg: ASbGnctoXrNhtz3g4MBB2I2KlzT8bvNb6JHYETnEnqES2FDnDFeZjSaR10DsJq7AAvc
	I6r8AIW/tStuUiR31KNgbRsL0uSgnej4tDl3N0L5StqQjzlIEyoUwXe/LWNGiVWrvWGg99fN9Ck
	GH+e4x2jHUr2KpqMFTB2+4Hv8KluCC07l+zCiTr/WB7/pR6T8jPFA0mdeFQGKfWApIVlgchNZzO
	QJah6DVq6WEM9/w67EgJ4B3BQVYsPsm5pJh0w==
X-Google-Smtp-Source: AGHT+IFpXtTl/XW7xSv6EAre9JtZi5PYEJL3Nxxq8Z5J/VjHzSG4hRXvlO0e3SJ/ojRDNDKk3AnJrSSYwAUNIg/KUXU=
X-Received: by 2002:a05:6808:e8d:b0:437:f364:8361 with SMTP id
 5614622812f47-4417b36da9emr428435b6e.11.1759868493573; Tue, 07 Oct 2025
 13:21:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007-power-domains-clock-google-gs101-clock-v1-1-1ee73c453ba8@linaro.org>
In-Reply-To: <20251007-power-domains-clock-google-gs101-clock-v1-1-1ee73c453ba8@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 7 Oct 2025 21:21:21 +0100
X-Gm-Features: AS18NWCC9b83T6F2zFo4-esWHDAnbT_8yqAmmeWUhP__nUnwGaXjsaGNRCUZonU
Message-ID: <CADrjBPqAXYBsjPaG0w2tdA7EAW93x=DU_OxrEeyuGKByhyG5vw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: google,gs101-clock: add power-domains
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 7 Oct 2025 at 17:03, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> The CMU can be part of a power domain, so we need to allow the relevant
> property 'power-domains'.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
