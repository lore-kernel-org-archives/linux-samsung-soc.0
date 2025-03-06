Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D002040B3
	for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Mar 2025 10:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741258663; cv=none; b=KJxHIlq9r4ksyjkPqjLH/Q07wL5i88Cw5WJL5gtTqnGzNTlNF4+rzm9CYtKfHPQukC/ACEC1w619P+ITvQotDDjiGiDbbXJAKofas43vIaYtV446qjjAhpdBXqSrMFBk2460ohus9PojesYRnM6ycNECrBgnNvTGjjceJQs2F88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741258663; c=relaxed/simple;
	bh=HUzA5Pu2VpXIYuAhDxgWPL7oFqKDgn6WYCQ3x4sKcJs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OmIDRxCzicclP7JO091CuQyCFWV0LKP9CJtpawMqABQn8GfFArwBW3PM1lZdEXzziiB64Mpyno21oazNkAP6crZyt18DeGhy1dTvXrSUp9T7OUAPcjri3UwC4WMYjlBhHUaSYopgOD3V6fQMTusYg8aJab3095bDsQnIdrEPR04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sybzewpp; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sybzewpp"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e4d3f92250so649905a12.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Mar 2025 02:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741258660; x=1741863460; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HUzA5Pu2VpXIYuAhDxgWPL7oFqKDgn6WYCQ3x4sKcJs=;
        b=SybzewppP+syPgdAproUY/UYNOHa+oKAKVn58hK1cGBbPtCe+Rdnv56fNJfPZObh8H
         25tA6MnxUhQ+Ajl/IFb7RyAsnZFsbzk31W0Vzlz27KPqB7KFpWFClaXIpMwl/OTT21o7
         MuMX1W73iBU5mJ21jnzY1vRSPvhTr2k22UfyrbQq69u4aS0No3lGILoAncFxEv/AcNxD
         C743Y4C6maxL8PHBpei3VYtAkxQ+RQwh0zleuUVQ7Q7o0exIupNv0VYRyNmusr6HeSJf
         WRhryFA1na4qUZtBGYMPFA67Z1ICgRfDnoY6pijJWdcLtQcP032BohQwbEwiiBq5Z5OR
         7Eow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741258660; x=1741863460;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HUzA5Pu2VpXIYuAhDxgWPL7oFqKDgn6WYCQ3x4sKcJs=;
        b=rVBwRd5GYYFziVJ/Px8yoRY6naqIMuDkwNih5bEEl22bHZCvYLC2/uog1stRFAi7y9
         X7+U7szfSmBrfnkGDbyHIwIqtCpJyidiWA57CrCc83+ZRuLhN6yY3SCibcRkRgTccfHw
         6Xp5lPnXzxPRxmBwLKms5sIXTWal+CoEBEFzOX/CghvXJ6JlXHD4hVJOehzvHtg8f0HV
         LQFC6Usw9sU8P766XySJnuIkragbpbswWvP5L8K0XUzBvKFeZ2bLPRgEyBPIOh+bj4yL
         /5cYJzVGS2wRxvqAfT3/QUQ00j3K+ao7maW2JN2XkS0x0ihaJ2qf4h81bzSRMUkdHORf
         sMkg==
X-Forwarded-Encrypted: i=1; AJvYcCU8X49vRZTjJJytH3gtXNwsyNz02P9D7r0eh1DVuElV8ZP3/LOSIwZ+znNOzAYO0cZkARvgkyVknV1xskZ3e8Eddw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIXwGT58Dsq8MCcYc8WpBaM1SGP8pWf4t1h5Z7p8mlOtO7w6jY
	sSLP3XpsWfk75iOdSq64cSrcVVivqYbNvncOUt893M0V+ndSwg3OYRS3tz+JnpA=
X-Gm-Gg: ASbGncuZu6mdiGuximPpK5hkOcPkjBz2j3lUflqWk+jBtqXsztPh9A/G/3MQ3SMuQnb
	R/XJjtKsqDC5qrH6Az+i6bEdQi+jnoRgm/2jltmuRUlwtQ0sVCPSJJpY21n9c6TY2vRPL+JXuIW
	WdzzMXDB7+ouqdHEbxcmKJWJ8NpiWKffGeK2B65HOFurglyaoR1QxomOQxmJSga/bV70s6yH11O
	YFSp9uj1574XIY2o9GIFGlBGb47iaK2ouMLfA4VmfmKgrBFqmdtCBJQeT8pryT0HzlR/ejvuq2K
	7Qn7v4afc3dWiXy3MZJMxYgFaVkPRIlU/Azf/uAFt8xnCVIU
X-Google-Smtp-Source: AGHT+IGeZOiaY1aJKJjqtYueXhMP1BS31yX+hr4PezJXUBtQPVrMxRBsSKLnYFZO+vtwvwtDRkBuEA==
X-Received: by 2002:a17:906:29c4:b0:ac2:29b8:1f21 with SMTP id a640c23a62f3a-ac229b8202cmr306641066b.49.1741258659698;
        Thu, 06 Mar 2025 02:57:39 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2399d47b5sm74174966b.168.2025.03.06.02.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 02:57:39 -0800 (PST)
Message-ID: <b70f17589b91730ecf6080c626492368283ce7a1.camel@linaro.org>
Subject: Re: [PATCH 0/3] gs101 max77759 enablement (DT)
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>,  Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Rob Herring	 <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley	 <conor+dt@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Date: Thu, 06 Mar 2025 10:57:38 +0000
In-Reply-To: <20250306-b4-max77759-mfd-dts-v1-0-9fe8b0eb8123@linaro.org>
References: <20250306-b4-max77759-mfd-dts-v1-0-9fe8b0eb8123@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-03-06 at 10:14 +0000, Andr=C3=A9 Draszik wrote:
> Hi,
>=20
> This series enables the recently submitted Maxim max77759 driver and
> updates the DT for the Google Pixel 6 / Pro (oriole / raven) boards
> accordingly.
>=20
> !!! Dependency note !!!
>=20
> This series depends on the corresponding driver and DT bindings
> proposed in
> https://lore.kernel.org/r/20250228-max77759-mfd-v3-0-0c3627d42526@linaro.=
org
>=20
> Note that in that series bindings and gpio driver are accepted, but mfd
> and nvmem drivers are still waiting for review comments.

To avoid ambiguity... with 'accepted' I meant reviewed, but not merged!

A.

