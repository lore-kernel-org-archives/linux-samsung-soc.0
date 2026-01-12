Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8808626ED3C
	for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Jan 2026 14:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768228497; cv=none; b=D6X4jWLZrgH82OAlWxPUm9a0qXOtsnFU35EcH3Xoj9UjjYG7I0lWy43o6FaVBTNrxFksE0z5CYLImwyUhIpL4mvAiGod2buzLe1QUftAzeI+tKWHa/HRZE6jaLltf8bGuEC59iHvyHWvu3mfqdhHCHZwcWlU6bfiRUn5koksANs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768228497; c=relaxed/simple;
	bh=I3IZav8x6KeIVwEYXoT0Fb7mxh2EWJMO+2D6AGLXtFI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lAp0ER5di/Cd9dY90Y4yQvyHedczy1iEeEa5xXgpwk2nkxFIsZ45rjwSPuMxR7LjhzVYPAfE6iBmReIPKuPB5UIBxuofNSFdVo53CIk+0lFFhGO5OHq0ABwN8M9qOQx7TQUD/efJaRN2+IeNWXJb2MWsiDeEgVYgbNuFwSu6Ly0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gkS5X7jr; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gkS5X7jr"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8bb6a27d407so629432385a.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Jan 2026 06:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768228494; x=1768833294; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I3IZav8x6KeIVwEYXoT0Fb7mxh2EWJMO+2D6AGLXtFI=;
        b=gkS5X7jr+akI8rVuE9kjcKgLg4gfxOThBHc5TK0PoV8vwy7Fb7TTsu/ju/5018ieQl
         MoXs3/v2XO7ctbjnBjlFCuagSNnqdetcpOdTFmix3pZKca3vvojMXjKlMpYLnnYXP97s
         x+VtP9WII0GwVT/RjGXLiFUyftFuEy9EpQB4qCOZI7l4t3kcm/pil5HGv5l/k3SIyJz3
         6cSY+Zfwz2EIZE0686oOU2GgjYOTtr+6BoWDcSA7GTRpsx0Mtq9YSpePoMC75dsPeLOg
         0Qvv982vlxS+h+PkwicEQTiDM3cnLi3cxs9DJTayOgHzipepqSwkrMSmhEQmoQB5fWzl
         rSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768228494; x=1768833294;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I3IZav8x6KeIVwEYXoT0Fb7mxh2EWJMO+2D6AGLXtFI=;
        b=MACUAWh1LHwRga2NOJ26Cox2aDG2AGrUB/5tjgpCfTN1+DoZoygNDuNBYIvgCCDbSv
         p0qz4oadiy9c2xVDs6vU5PhpqtuvWoGiBjsonh6H7AK4ikkb4WGHGW/lehD1nBEl9Zez
         F3ooTxQpxjgbmh19wwqzQFNOWIlGKAVlsohxKEQw9D56vuvWQ4ojjOm8Ro8FI4BR7t+t
         TfiK4WaB/K1XUiKHF2Tk0/T5gz6xPpYx20ZZeuWmC9+6YChKSWRXYj0+Xf+RtrbME/9n
         CpPdZWw+f/poH8LO0BYf9liAllzj7ljI6UnZzCxEi9bqU2EfZ9uX1/kqHQH2qqL8YqiS
         ESqw==
X-Forwarded-Encrypted: i=1; AJvYcCXU82/oxmC8jWh6izf0MEyWdeogvmWunMHpoUR2RX6YsNkalhSlGLs48+pSXmklhHgCkgtaBmSdVQEZGbZ0T5laaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzT6kYMf1tVLCCHvFzN2sEaG1cmWRf2bsRStuG8P2tyYNHqrPEg
	NhrfrcE/IcKOhDOlCNc4AD3ZME/BLu+82evGpg+bMeAUxKuOqzftgcYxBmlXjHYkksI=
X-Gm-Gg: AY/fxX4AAHoEYLG6a12pQIaQXa4qU+1DWWZJhOoz9DrTRNVXUwsdr1gTVS0PYF55421
	XcjG/VIKapnSIHIRihRQWwhkqGwz/OhxVyI0RnktrIvKYTo/tg+6rm0DiG2sfEeQwv3uzqfMRRj
	OzLxoB1kWRKiklfCdQ3d/TKFKtLYU/HS79RCsbbxTZO517d4qxmFw+e93pUclTHVUKsJgUa1Qib
	FzeuxX3axVarCqJvHG5/88aZUz5J1XRCbawEXwkP3kYZ0S1MD386vRKjJDOysQikwu3SAB6vQoi
	PVlzS7cn/kuY0l8kn8a/6WkusZVY8Ondw17LBJUX2lXMrAPr9z+pwlBjCHb4+gNV97cogIeNBAR
	vjcvgS4tQMroOyuQcvVoAlTkM9lzSoCjYf4vZeNDHVDOt/QDUpG+anf2cuKZ7TleYSQ6avjc963
	lI3oxDxSFV5xh/6tagBK0WdIVMzdk=
X-Google-Smtp-Source: AGHT+IG04Y7YMmlOxxQtJZWLENiUI2pQKTZxZxtP13zxTopqbGg/cTPtEwR9TRQdWUjb986bpAHcBQ==
X-Received: by 2002:a05:620a:4611:b0:8b2:f182:6941 with SMTP id af79cd13be357-8c3893dc9cbmr2437032985a.57.1768228494337;
        Mon, 12 Jan 2026 06:34:54 -0800 (PST)
Received: from draszik.lan ([212.129.79.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4c964csm1519599785a.22.2026.01.12.06.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:34:54 -0800 (PST)
Message-ID: <f9141db956695fd9ae34f86eeb4f3f71a78d5646.camel@linaro.org>
Subject: Re: [PATCH v2 3/5] dt-bindings: samsung: exynos-sysreg: add gs101
 dpu compatible
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki	
 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	kernel-team@android.com, Will McVicker <willmcvicker@google.com>, Juan
 Yescas	 <jyescas@google.com>, Doug Anderson <dianders@google.com>
Date: Mon, 12 Jan 2026 14:35:31 +0000
In-Reply-To: <20260112-dpu-clocks-v2-3-bd00903fdeb9@linaro.org>
References: <20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org>
	 <20260112-dpu-clocks-v2-3-bd00903fdeb9@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-01-12 at 14:16 +0000, Peter Griffin wrote:
> Add dedicated compatibles for gs101 dpu sysreg controllers to the
> documentation.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> =C2=A0.../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos=
-sysreg.yaml
> b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yam=
l
> index 5e1e155510b3b1137d95b87a1bade36c814eec4f..9c63dbcd4d77f930b916087b8=
008c7f9888a56f5 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg=
.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg=
.yaml

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
