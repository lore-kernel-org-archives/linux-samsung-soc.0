Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2633FB05A
	for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jul 2026 11:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785150915; cv=none; b=um8x/gOG18GAabW+bJaS5TyC/coOaZ8vtO2VGMdND45RyOa6lSZbadmgLlzE0K8hDyP4SJPgRKbs86I6+4iUjh9aijAmjVaScar7fqUZ64xpyNG/DRGZhdA/uYW3QXT3GYnJIsQHQtb3McR3V/rI/Dbly+OtQOjhtZZF8692IGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785150915; c=relaxed/simple;
	bh=KbWGLoamsRqt9EF91CYlnFd2rzTQDmCXIFAkw07Z+E8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JVYh/rU0wAlZuqp8KSFIYCBbEpgJluePB2GB9cp09kAq3/778L47dKo3rLP1pX/n3JUw2kA7oRpP37K8saBKEgQic0ytY0lQL3MffhoySB8OkPOloPKBPEu+cnrsLph0pYD155a3AE7YcjOFKu2x8VUUFep7Cdu0SeeTHGtHoyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EAhbsMHC; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EAhbsMHC"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47f92e3c14bso2396869f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jul 2026 04:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785150910; x=1785755710; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KbWGLoamsRqt9EF91CYlnFd2rzTQDmCXIFAkw07Z+E8=;
        b=EAhbsMHCDnoB8n+E7vM+bqCnkDJK3OvfeYMf2O+Q6hf1DYStosBTK4JK7Dv+6vm5Oy
         9NsBkhzzxclyopRAG0LOEaWhkPfv1i4PcM7LMddxGO+qV6K/dL7rSGI6fFH4qTfaQ5Vq
         7rFdfbQl4Hlk2aJ/KiLcK7A0PvyRcBNf/euQONODWEoKB0TtpwbHh1nRaICsQ3qEStBz
         T8syZYMyrUDvEGIIGhqm+s2JxQ861cIIdSFEtR2BfaPbCWmdnZ3BBnQx1vH8oibEaqLI
         zON3plaH7+S/KBsr9Z9fYdRrymvdOHGy0MusHLYO5gywXtqvOPdOVxBw1+ue2XYEBGSl
         NKAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785150910; x=1785755710;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KbWGLoamsRqt9EF91CYlnFd2rzTQDmCXIFAkw07Z+E8=;
        b=XbUTEMNKZaNlbWdcnJ9NvcOfZ81aRRVxpy97lQwSjzyAuIatal7+4/fW9ajgkNf8Gw
         pvsgZ63sNiYhans8XJUreEJh2JiaumBvM5UzDLQvO3fbpkRGeXj4xS4lFyRebRsSMh0r
         1fQ8TisL3ohsYzojCMIW3SfDoIuQpXznBYggBEIGsJU6Gypj4t5sm2fNQrZk0eAnDhbG
         ztyCnttS7ThKJiCmWyIqnQTRa2XBvbigiPFsQEhh7zsvAybzWGVf8rkI9ZjXahEv0MPm
         0QgOEk+Dg34hkZhzyEhq8FIFiE0FdY9QaWw/uxdLdePwuOhrXoECQz9SVHsDK8VRnGq5
         6HeA==
X-Forwarded-Encrypted: i=1; AHgh+RpYtFvifEoXtzYA3x5UNpvlE2/RMHzFVKC7f7XW47uC/Fdtg3iWyiasa12YlGqtObJCRSzPNg8ua/M7Gibv6iqNYw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6p3zlMAy1oDrDOFGETdqWhpFKecDYVsK7n5d6mrpdUGmmKyyM
	4ThrBJkdcdNlBn0uRCO/9sPpjqL9GRxyWOgTAWK24/5ZgoZvrEG9wuNbA7MnmYVRGo4=
X-Gm-Gg: AR+sD11GMquucjvIC6TjPdl1NKf1NMXCk+mbDdtKA1uSYtH1pRlLKKQx7JAO/19cRhr
	3FrCwAV0qfCYZ+2q6cwigT7jYf1caS/0jNtAN31oY9AsVZ21CO9n8jLhbJE4zubLvYVCOSruNa/
	VF6cWzfNN7D0cd+1WwqGesOENpq6eNucBVc+ViCh6ngC3udh4pvLfqeGlJTQ8qQmWPyhf8imrpL
	E8OtkKKNjqMhrOaxazatBh8cOWkMhVbb5lCfVX+iC5SLDxfuUzNjQQ5qeQJnYgMNiMf2HEI9Yl7
	czVNtkKe1oTvSwpYoGS46F4BRIhMR21av8bFnfWJeRLKrkiKvA0q4Xl8lj8Sq0G0zH8EdEgR0ji
	FbS8uKc+R69kSCb5+wTfi7l2X0WlTEK1xKhiXQBBLxuCYEmFBnSiq8wE1Cw3gguIQ5ArMGdb1HN
	Gap3YGjg==
X-Received: by 2002:a5d:64c3:0:b0:47f:838c:4256 with SMTP id ffacd0b85a97d-47f9fc92c01mr10623612f8f.16.1785150910326;
        Mon, 27 Jul 2026 04:15:10 -0700 (PDT)
Received: from [10.1.1.59] ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f939c1465sm33628401f8f.26.2026.07.27.04.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 04:15:09 -0700 (PDT)
Message-ID: <d97c2e514a7c97c311a98ecbb4d3da47adef27af.camel@linaro.org>
Subject: Re: [PATCH 2/8] arm64: dts: exynos: Align continued properties and
 add missing blank lines
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Ivaylo
 Ivanov	 <ivo.ivanov.ivanov1@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin	 <peter.griffin@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Sam Protsenko
 <semen.protsenko@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Krzysztof Kozlowski	 <krzk@kernel.org>, linux-fsd@tesla.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 27 Jul 2026 12:15:28 +0100
In-Reply-To: <20260726-b4-dts-coding-style-strict-v1-2-e9e3e9879d05@oss.qualcomm.com>
References: 
	<20260726-b4-dts-coding-style-strict-v1-0-e9e3e9879d05@oss.qualcomm.com>
	 <20260726-b4-dts-coding-style-strict-v1-2-e9e3e9879d05@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2026-07-26 at 19:43 +0200, Krzysztof Kozlowski wrote:
> Trivial white-space only changes to adjust to DTS coding style and fix
> dt-check-style strict warnings like:
>=20
> =C2=A0 [required-blank-lines] child node must be preceded by a blank line
> =C2=A0 [continuation-alignment] continuation should align to column 39 (u=
nder < or ")
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> =C2=A0arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 19 ++
> =C2=A0arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi |=C2=A0=C2=A0 8 =
+-
> =C2=A0.../boot/dts/exynos/exynos5433-tm2-common.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0 | 120 ++++++-----
> =C2=A0arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 45 ++++
> =C2=A0arch/arm64/boot/dts/exynos/exynos5433.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 230 ++++++++++++---------
> =C2=A0arch/arm64/boot/dts/exynos/exynos7-espresso.dts=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 3 +-
> =C2=A0.../arm64/boot/dts/exynos/exynos7-trip-points.dtsi |=C2=A0=C2=A0 7 =
+
> =C2=A0arch/arm64/boot/dts/exynos/exynos7.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 34 ++-
> =C2=A0arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 4 +-
> =C2=A0arch/arm64/boot/dts/exynos/exynos7870.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 +-
> =C2=A0arch/arm64/boot/dts/exynos/exynos7885.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 +-
> =C2=A0arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi=C2=A0 |=C2=A0=C2=
=A0 1 +
> =C2=A0arch/arm64/boot/dts/exynos/exynos850.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 16 +-
> =C2=A0arch/arm64/boot/dts/exynos/exynos8855.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +
> =C2=A0arch/arm64/boot/dts/exynos/exynos8895.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 +-
> =C2=A0arch/arm64/boot/dts/exynos/exynos9810.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 +-
> =C2=A0arch/arm64/boot/dts/exynos/exynos990.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> =C2=A0arch/arm64/boot/dts/exynos/exynosautov9.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 +-
> =C2=A0arch/arm64/boot/dts/exynos/exynosautov920.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 7 +
> =C2=A019 files changed, 359 insertions(+), 188 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
