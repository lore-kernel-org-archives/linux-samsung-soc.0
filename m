Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53B0241695
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Dec 2025 06:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766990888; cv=none; b=jLCF7S+nRY/3DZkZJcnZAmlzFapICBU9iOA3OpL+3IoSLStaGyVvC5lLyegDE38mHxkAa9lSm8mK3osaMvEz8ukanXLC3XQsU3CaMx4enluoYuRQ+pX1wsArXbcJxyDMM2IJhkEdKdZwL1J/07NJNDqGNlIRityiqb154lSWD30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766990888; c=relaxed/simple;
	bh=OZvhZ7NpA5Ybm+ZyBhQlb2l5FV9Gu92NCEHcOuIiZT4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YTdjcQCBicRi9WzCIflbLZFlVZhJ4j+IuuPzdhMQ96+c1EjxT2Ct7K3ywPOKQ0F/rr31/0dmPiNlBcnO/f7zzWanD/rJvJjTwhIaykJcxgcR4HlyFzpe30BlYmhssexT/az+95mmKVyKT2t5hkbQWfoHuUVMXTAt0TcPtlQNk60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xFduY41G; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xFduY41G"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b832522b47cso370779666b.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 28 Dec 2025 22:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766990882; x=1767595682; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OZvhZ7NpA5Ybm+ZyBhQlb2l5FV9Gu92NCEHcOuIiZT4=;
        b=xFduY41Gix57+U7ifvJyavEcSA7re5yz3g5JhhXQqY8cwv6VBP5iGvNlET6qVDohdS
         9fGbV7771Id/xLUIfDRCb3jSDY6nwnn7+IOZGg/QpolIG+WcVLTpoHJvB5soE8Q3lQY0
         /+pB+/l9rCvwgrRQFJwZr/hh+xDgbK9SJTHU6Kq2NrltRaQaQdavQ7Ju5ttAWhUwXOj1
         GGxrZsVyKaaj+CLzhzUMwgIIEFuTAmab5s/wMpngnRccojoaiDVUhnJ3Yhj8J66Cs1vF
         WUYcCrDaIH/hGPmKTVHVEFyE0Fx72YXKEB1LiOYY07MeXrBAAeCsZgU8kiokujj+7bNL
         mS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766990882; x=1767595682;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OZvhZ7NpA5Ybm+ZyBhQlb2l5FV9Gu92NCEHcOuIiZT4=;
        b=MqZBVt/lPZ+mL1GnQIMxzNbdFYx/cqiURfUokQ1aayW5ej/3MFA7yXTM9ARpvE3iv/
         zitsbKQVzM8NXaIn11kK1j+g16eu/uTOgu6WMVzH86jsTSsJfWnZiOKqYs1l0pht+DzF
         AvVlZSDnLYiuvnThslFWDieFIAHPZY7SSfiDSiIhvmueJ+/pjuTXZy2aMcjr9LE5AO3W
         421hwVF7HnpJZ8bP0tN1t7Dzw4BrqW1KXCHuLdIJEs+LAlPRbmJYZGMED3xqrSTrq5VB
         kByu1xKC/o8lWn3XvTFuH4i4I4VmOEnQBhG6oCz7Qbb+iE+E1QpTstHxFoMsFWnWK7Nr
         TsmA==
X-Forwarded-Encrypted: i=1; AJvYcCWH3jH6m0G6giHxy1rAhluF+nV8n5j0A615a9KZ3x444fxpVUOcZ3qO6ztwtEQQtv76vKhSwz+UaVnZyNYTxTK/3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJe4juY7ijcRrriOgygWy0njeRqXh/JNSwt9U505p4qlon/O52
	2TuNVX+DT3M1xGZzH5jIKYjS7/Qwsc+VkK8Rz8KdmV7dopWuOgIqUrE8mg0czUu3010=
X-Gm-Gg: AY/fxX4cSoirnepMdSJoFxQ2xOWfoYQQf4SFWScM3yGHgL9ktzcsAeoutbTsvw+NVPL
	YOevpxTBx8tOHlW1TEVv3AF9Hm+sr/YeTi1F7DI1JrPKNgEB3z0fc1W0VkejhIg7cAeSYPQ+sD3
	D4PDzWE19R9ATWfPUDC9laNB3ey3e2fiK6r6JoVR7NDfVAUrexevYJIPhAMy9skA4eEccNvRNiC
	t95SIFwA2sAGyqojw1hDQJ2AIiwLINRyPS+Go73USCs7j4GC6JpHhLeQDL91WeqfPQCeKjfntnN
	V8tvUtHNX57w+8S5ydJgGtzMA4zdZdMoCOA12yvG6l2wJuJGM61UNRHYF1RdZnYoWrhjZZtIVJV
	loxNDcS8Nwds4tv2BqPWr9zqMmyLTyjjy+cC2P+/K7g1jzK9XiVhLGFbLC9M/B+hmEuaW1S65YS
	TCYRW0Lxs0ZL77yhru1g==
X-Google-Smtp-Source: AGHT+IFKJOEnoMT9pd7t4bMOfdAuLJ3dwRnOBx+hhm/y0iCl4h0HCimfd94oOij5S8bCa43IL/8WUQ==
X-Received: by 2002:a17:907:7f15:b0:b76:b632:1123 with SMTP id a640c23a62f3a-b8037159828mr3025066266b.42.1766990882195;
        Sun, 28 Dec 2025 22:48:02 -0800 (PST)
Received: from draszik.lan ([212.129.79.255])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ad83dasm3338654666b.25.2025.12.28.22.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 22:48:01 -0800 (PST)
Message-ID: <fe1428dd0d6b744ad3c57bf5797550b54f85ff96.camel@linaro.org>
Subject: Re: [PATCH v5 00/21] Samsung S2MPG10 regulator and S2MPG11 PMIC
 drivers
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>, Lee
 Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,  Bartosz
 Golaszewski	 <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Linus Walleij	 <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Will McVicker
	 <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Date: Mon, 29 Dec 2025 06:48:21 +0000
In-Reply-To: <20251227-s2mpg1x-regulators-v5-0-0c04b360b4c9@linaro.org>
References: <20251227-s2mpg1x-regulators-v5-0-0c04b360b4c9@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2025-12-27 at 12:24 +0000, Andr=C3=A9 Draszik wrote:
> This series extends the existing S2MPG10 PMIC driver to add support for
> the regulators, and adds new S2MPG11 core and regulator drivers.
>=20
> As part of this it was necessary to update the regulator core to allow
> regulator registration to succeed when supplies aren't ready yet,
> because on the current user of those PMICs (Google Pixel 6) multiple
> PMICs supply each other and otherwise regulator registration would fail
> altogether. This is implemented via an additional 'regulator-bus' which
> allows us to keep track of regulators with missing supply and retry
> supply resolution whenever new regulators are registered.

Forgot to drop this paragraph from the message, as I sent a separate
series series for that in
https://lore.kernel.org/r/20251227-regulators-defer-v1-0-3104b22d84cb@linar=
o.org

A.
