Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FDB33B96B
	for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Dec 2025 14:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766156291; cv=none; b=c06HWF6vaxvy43c9CEbdDEUgQcq2G9Msoe813er4svnxZ0qof44Y4BSdrwW+7kDFNMcocvr516BxGDPspzuPpxziEDlm790slNrBKITcKMPKLAaA9jsMrMC1C60fnTk//yOtvtn0HZcdo8I3yKJK8AyHPPYAqh5BoS8bsdXD0O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766156291; c=relaxed/simple;
	bh=bNc1dQiwRs9Ssf3LpIDfqsGZyzRfK4SH6H4kXeHx41I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AvmKMy+FE1Ihj+h/s+Ztmy4c5VfWJr2Gpuc3YNwywyI9NQH1e0D+mLpOPGKnq3BVH4KtbFbHLe8it7KBU3F4sKhnmdhrArsw3UMRJxR7BAgFYWqrJ2sKo9V5J0/PQIMjQnT1WcTXRUeSm44yP1Ut3+lBRzICiQKv9LUgUHqLoZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=clQ3KbMC; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="clQ3KbMC"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-64ba1a1ea06so696780a12.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Dec 2025 06:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766156287; x=1766761087; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bNc1dQiwRs9Ssf3LpIDfqsGZyzRfK4SH6H4kXeHx41I=;
        b=clQ3KbMCTGib+8UNjd6fz/NKm/I5e4T7FozpYTLSRp99jsTYJvv6C7VgWbVAmJk4RH
         xOsa9szyb2Y/i4BAKeAaHV0oq5qRIUIYuNQEykjLqWuo6sa80ZL9Rvpe1ZRdHTkdsGoJ
         0rzxx+i4w3Xlw9eEJlV8xC8+HLa6FyknAx//nHt9M6nykYq6t6Wzs9NCFikok47fNX02
         mbqx8CYMJk19kGKmZxbN8RsY4fGrlHUcZmsLlUTfHroo3WOfpxQx+ENolYMu7M+4XfxM
         uVoko6DhUBKZ+tekLvMf1hBpcYreKeSt33GD0p1OnHAE9HEh767967dVStZQNz7dHgdm
         xvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766156287; x=1766761087;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bNc1dQiwRs9Ssf3LpIDfqsGZyzRfK4SH6H4kXeHx41I=;
        b=rGp7zHCKJ/unxtZaW3A4ZDQDaOeR5k5ZmKYWZK5sFqi6kzwFbyxeMs0PknnatshZaf
         otJeZp+1HO/n9YN+dAxbhUUfahMw3I3Ibc9EVTmHwY4dfyPr5xWFSPzu9DgGtTXk6k0K
         AbvcrQjD5jz0cevsp0R/Xw4Yfjzrc4yiD0dk/F52I1gUUGPBnnNTkcAC+gptjJNg6jnk
         1dwusfFmflPlROhaj9JalSKXihc3xrRGfgKVCYMseygRYKPYm2oRXpaZqC8cyMoQwnfW
         juiGiSGx2PWvxteETziS5SbDEQPEpqXzaXrKVSGkaNmn3gX3eyp9oWJH3h0PVyXAjMUM
         wDPg==
X-Forwarded-Encrypted: i=1; AJvYcCWxCzk1IdvtK0CECX2QhHm0KzvXIJuEERenRQOwcHnRZ8BuxyXktqCYuJ90QIwSzNUP1a86pGEGcS7GOR11MTyc6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyeXlc5okdGUjoN0gEt84BtSUP/vsFUGOcjjNk7mVcK0+WDUbp
	XJ86MY1tHix7FM93WvqDLFsCjwZOtZ7VSbIyVh06alCWGjGXQQtjCq7rKsgVeQw0F6M=
X-Gm-Gg: AY/fxX7Ga05K+8zAff0Clld8tWFkCJY9eqkZ61tGDO4/NtKfNefe8M7V1A9VUrERj6B
	X1BuLGwHzpNhHwaGf3ODBEl4i7xEWFggbhk8cX0toJlxlPXmjYzQWM+/3fyeJyuNwP9o6OGKSmB
	ABaeQD4j6JBzHkPH0EpBHkAxJL1gNm8Qtzv8NZBrOEFZO20BT/2o52J+9Y9WCgZ4qlm7+qCxjYZ
	+YmhikOT16wYpQsCsT81NMCn2tq2YfHD+wPywNte+cjM2en6hjB/sRD+c+SlqdOA83juDyQzkJv
	BBk9EUGtfDsL+xxrPKe7x7CQOY/Lr5mRPwR8dVnUr8RYl0A3js8kIgm2tQIFGfvA/QuHgZNzqfc
	i1bkfYKZVHZAZs8D8e9aqUQb3GBBLTAYOIwwZLLtNZ2T0oFdrXUnTPpYjIZ0/LDhtif3SUVlTAU
	fBzz9CZzyQ1Mv5uoZMTw==
X-Google-Smtp-Source: AGHT+IEDWLL5f2CK6H3TmqDNWHhuiGj1D56NMXG4q2PHWr/qeo6wGDL4ChtB8dXpxrxWSNjxO3/ViA==
X-Received: by 2002:a05:6402:5188:b0:64b:83cb:d93e with SMTP id 4fb4d7f45d1cf-64b8eb6194bmr2724166a12.20.1766156287195;
        Fri, 19 Dec 2025 06:58:07 -0800 (PST)
Received: from draszik.lan ([212.129.80.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b90f53c16sm2370855a12.1.2025.12.19.06.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 06:58:06 -0800 (PST)
Message-ID: <cda2b1668fd30cdabc9a0d722319fec4e0706c50.camel@linaro.org>
Subject: Re: [PATCH v3 4/6] soc: samsung: exynos-chipid: downgrade dev_info
 to dev_dbg for soc info
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Peter
 Griffin <peter.griffin@linaro.org>,  Srinivas Kandagatla	 <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
	willmcvicker@google.com, kernel-team@android.com,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Fri, 19 Dec 2025 14:58:13 +0000
In-Reply-To: <20251120-gs101-chipid-v3-4-1aeaa8b7fe35@linaro.org>
References: <20251120-gs101-chipid-v3-0-1aeaa8b7fe35@linaro.org>
	 <20251120-gs101-chipid-v3-4-1aeaa8b7fe35@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-11-20 at 11:29 +0000, Tudor Ambarus wrote:
> The SoC information is exposed to userspace using the standard soc
> interface. Downgrade to dev_dbg to stop polluting the console log.
>=20
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> =C2=A0drivers/soc/samsung/exynos-chipid.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
