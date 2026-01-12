Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF18229E11B
	for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Jan 2026 14:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227973; cv=none; b=Ae/PywU9t3VysePMzflO4Ow3oO1mXEtKDS9fRBLpHS+JsgzfUqNta7T08lxsPcLn/7UmiXr05cLcbNio5HBgq9RkrnyRjTYQGLRcugZVR9S6bXiZyXiXNkCG2c3P9wJ9B0DFTulTr1dQUojZGW7hLoXxKKhf2LCbU2m69NtFC2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227973; c=relaxed/simple;
	bh=MS8wKf7u9HcQpruwLfOyUPj69gKiTphjKQB/fIaDSQ8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nqn8fBuQFGaKsEH1J6yGrntoAWt5TYZNZaaRaSxfvodxXB39FFh7AaxgeRqJtnQvfFVsLpHVLVN94Am/WUEfudd6CGdfn+wQ2OLIz5ODnk1+pkwMdW4OOlVIdQmchNK/k6vnvUDP1ZEs1J8GU3uws+PGJ4FH9igHfdLni3GaXOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=knWp3W29; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="knWp3W29"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8b22b1d3e7fso625421685a.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Jan 2026 06:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768227970; x=1768832770; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MS8wKf7u9HcQpruwLfOyUPj69gKiTphjKQB/fIaDSQ8=;
        b=knWp3W29f/bmH/9fyi0pIIWdXQDlIsPlvpXHZQMlNdiwhZ6lpY0qbZf3YX6EaZ9IxK
         bEEJY/naMXnfVbqp+tA94PClq/pc7tu5dr3kefOmvgCl3jn2UdAFjdC0lpnvv19s0i5U
         AdmV2LXqP4F/9u7N2uYoccN+cM5Mm8W/OoAkAn1iMfnBUbj4g1rhuw7akm1fnHRFVOUi
         1PGYVcKxLU3kV3k5dh4pynAwundoqm7Vvxr9dseGj9jz/pVu4XOouov3hmVZJPtjOlXA
         S2ryjqdHUx9Zp4Hy+v7m2qHep6p8eq1alKBf06YzoKrcmeXt77Wtu8qL33bGxDgTp6Dz
         Hwig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768227970; x=1768832770;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MS8wKf7u9HcQpruwLfOyUPj69gKiTphjKQB/fIaDSQ8=;
        b=NpkDnWeeov6JyI7V/VPjm0OKnCJeGqo8ahZk3+S6Nwacydfb+WCYTOtPsKS+4NgzuI
         RdcoXo3wgRzO8WxKmOj8Amy16FUpB/xh0930tGyRoFOrdj5kLHk/tqYmadxDHdwBf7em
         z1HK+b1TPVZhbZlyDEw0Z2bFdxWsaq0d+B1zXIH3HGr5Ii51aYirnFr1G3xq30y5sdR+
         Cb9LhhKmL3L0myA3sv8gn8uO5DI9vOWMklt28v2iOq26WKhS7rzRj0Fn1DsM5O0tq9fV
         8RcDdtqLwDSEA+ZAHcqa2Y7TgfOgJQzV0U5iDZzavOOyLBL0w1To32H8kg54zDHydf5L
         Vh7A==
X-Forwarded-Encrypted: i=1; AJvYcCV8UrtbAM0Y7ksFmvUszulrpDL1fkqfvEEX8xURZESHXFprXkSBRwwe0RBOeWwB2w1VA4l6b+1F0pJBF/3cd6I44g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSkKXkFfxX9/W0x6CA+IbJ3yA2S9nzFb+oVbkulvrxfdRVz8j4
	mc4rMQgDj2ClHvj0hGT8HfWAOWTwiPaKjyghUXac+4H/A43Z9MeQ7OKiHzua4IY8oJ8=
X-Gm-Gg: AY/fxX4wNI1a9NnXsYbhsL6BXOq2falzuaRxAHEIF4K+lsZVZGY4gWCc3TzSHBSP1hi
	N2E9Mmf9Ko7Y1LSBFIQYcWXB6MTlkeYG4jS36zaTL58YDuaAVALgZcnlIPsarX7EZ0isFSjAfDv
	iYu1yhnjrUtWXU1y7ljKD30x8KN8MBNlhW0e0B1ige045bQ6psvl2mELlGZEWsfX5P4++s3djdH
	xGJIHa59yfBkiQHiGmUOGX0zvg5Dkhc9zheX/tCuPpllpm7R+eG5dNOFHjo1lmWPMsuygpUtqVS
	7Sy0SiGOoFQpgABGGwODpe1yLFxYMaQdrCz6I6BQSaPeGnhVAlCut9sx4FMd+FbBW+LrPa6fWIc
	uwBdN/4A2MFXEs2Bk0H4fZXxZ1tSP+AiGZwdwFnbNTJyVzHASPD5Sx6JETo8CR/B246S2Yytlwn
	FZ7nL828PDnAr5whkO
X-Google-Smtp-Source: AGHT+IEXjJKk5zH4bo+R8LKpMF4MK489YPX2dESNeMCN9H3Av3eoQMSWyP5H4NLuxZlAI34TDI5m9A==
X-Received: by 2002:a05:620a:708a:b0:8b2:e827:14bc with SMTP id af79cd13be357-8c3893ea256mr2530528585a.56.1768227970407;
        Mon, 12 Jan 2026 06:26:10 -0800 (PST)
Received: from draszik.lan ([212.129.79.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f530f99sm1509223485a.36.2026.01.12.06.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:26:10 -0800 (PST)
Message-ID: <ba585515010ab9a9b417d000ba744f8178ca9e24.camel@linaro.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: google,gs101-clock: fix
 alphanumeric ordering
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
Date: Mon, 12 Jan 2026 14:26:48 +0000
In-Reply-To: <20260112-dpu-clocks-v2-1-bd00903fdeb9@linaro.org>
References: <20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org>
	 <20260112-dpu-clocks-v2-1-bd00903fdeb9@linaro.org>
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
> Fix the places that don't have correct alphanumeric ordering. This will
> make reasoning about where to add future entries more straightforward.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> =C2=A0Documentation/devicetree/bindings/clock/google,gs101-clock.yaml | 6=
 +++---
> =C2=A01 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.y=
aml b/Documentation/devicetree/bindings/clock/google,gs101-
> clock.yaml
> index 09e679c1a9def03d53b8b493929911ea902a1763..a8176687bb773ae90800b9c25=
6bcccebfdef2e49 100644
> --- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> @@ -27,13 +27,13 @@ description: |
> =C2=A0properties:
> =C2=A0=C2=A0 compatible:
> =C2=A0=C2=A0=C2=A0=C2=A0 enum:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - google,gs101-cmu-top
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - google,gs101-cmu-apm
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - google,gs101-cmu-misc
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - google,gs101-cmu-hsi0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - google,gs101-cmu-hsi2
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - google,gs101-cmu-misc
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - google,gs101-cmu-peric0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - google,gs101-cmu-peric1
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - google,gs101-cmu-top

If we keep 'top' at the top as one outlier, it'd reflect that it is the
top unit and all other CMUs are children of it.

> =C2=A0
> =C2=A0=C2=A0 clocks:
> =C2=A0=C2=A0=C2=A0=C2=A0 minItems: 1
> @@ -70,8 +70,8 @@ allOf:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contains:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
enum:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - google,gs101-cmu-top
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - google,gs101-cmu-apm
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - google,gs101-cmu-top

And here.

Either way, I don't mind:
Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Cheers,
Andre'
