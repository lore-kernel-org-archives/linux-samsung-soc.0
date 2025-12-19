Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDF733D6D4
	for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Dec 2025 14:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766156046; cv=none; b=jWVjTyRzKTdyOu8KsGHwLPb3eJbBzgWOmdPm/Thz04Sd1iIc+yS7pH+XvUm+F2CjSR1qZmDPBHDQicZD4EEvPA0Dja6JuaXrcHpK50o7KqoFtWEgDuy8TORxrmaH7f1a7SB3ZrF8lqN7yIaGXaS5O8oNbJsj1EGHnw+F38bBVTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766156046; c=relaxed/simple;
	bh=2SY5w+tUH8s9MZEweKPOypbqcfjFIujvFs5cE+TaQsk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VqSVdfovcFVaKWKxR6desoBbSwM47IqmIlKKPPJZE4YtDe0OWCU38Wxt/yhIDouCPmuhUMjgs8u5LXQEhiuo8cq/u5TMXCX0DXwD7ilcaVHD1DZZy2dmvjCIJ27Nnv8uYO3ocs8QlHCnrcJnVY2X90B1zHYCaG8u+alGJ66h5VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xSUVgFWg; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xSUVgFWg"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a102494058so14679275ad.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Dec 2025 06:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766156044; x=1766760844; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2SY5w+tUH8s9MZEweKPOypbqcfjFIujvFs5cE+TaQsk=;
        b=xSUVgFWgtgFSj6LA0if8keTrYc0UGCZbjoOSsblmCIQIEYQyGofoL/FsSdAPzZBWTi
         /RKPPHp49G7uOIyt1L4Y9GlOUEpvub8RaU7ThLp7mg5Lf40zDKn9UXzLTyFpuBiuF+ua
         22VYkF8ipNcH5//ARwgwoDF7ccVLfMLoHKR2rVmsXWnjVZBXY6V+UfY4sAAC8IYeDp2t
         2tj5OiJOZ9YprZjKy1HRWpLTwjAGLN7WtICDApMkkKe98vV79XUO08PxwIz7vekZQw3T
         uKov3b3OpPZ0iLpfxiObi0/nCtiNBchX8ucdNukY71ltoJqTCneEwXRXNSFfy+XDmcVx
         S84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766156044; x=1766760844;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2SY5w+tUH8s9MZEweKPOypbqcfjFIujvFs5cE+TaQsk=;
        b=A1bwqbw5+cUP5zAnv4t6itqAmQOZw6E9aTeELR0NRugLIJ5/fEbtvcJ/3LJbAUVSsV
         MXwYFYjMd9wb8XsEsfE2Lq2KtVGwGClA24qZBBqUlifXn441aAGWZFshRMeJQBvufbGM
         Iuo79Xrw0Pb039TRpkcV/oReb9RaGv9GYzyxLeccpoDgrpGLZQde04z6ypE+iUP0VQnl
         OKsKrPhBWYBom80c3u1tQGBCMtlNntNHm/6mfVvqVIlc4YenmxsKxZxjDDM1w6nqSPQQ
         WtUO/47d3cc7cyOyfkfACELgIh0QWeR+fgdtBoqvZO/u4biSE7Evg6HgwZlxxm/SIc1m
         ioTA==
X-Forwarded-Encrypted: i=1; AJvYcCVHEqpy6CmzTjo2VtCfCqY29nRIDSOqg1a1zBN5FsNEiaSgp0iJuadt4bIvm15mNLsC3KxdYtJnrVlJMuB4TUmm7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzNhcFVbHqjruHnBcmeEeldPNKF409JVSzg2z6T7QTCRQxiHR2
	5vthIQX1HiOKAEAY2RizdQpgVpMteOb5kNhzCPQQIKuCaX1ZqEesLtPCu9lEFE+bRH4=
X-Gm-Gg: AY/fxX6Aec1yDqHdpMw4Ux2GSUOXMjioMlIchLQPkIlqFoziNz1gMW0xhTndtgP+M+t
	d6vDS3W/5eF3NTtVVXGoFRNFwiDQ8uRXcQM+47XUqImwiQLHRf/AZC07zA5V20+xHEWSm/LFYl0
	ZnaFSraJg9lqXDwRf97FCPvaVeDVF8jAnNrjwEVzqJgd+im5HR5aJvc9wr8W0nsESu9fvRTqIG/
	vJiSdqZa19qghXLH9ZJHfhCEJhKEfKI+G22lctKIB0RpccL0JxFKLfC3eD+39uizf17j71lhfnt
	6laYgVc6yXuj0dCsCK2cKW8YazHwg0Wh0I86lEO/3/UawEy6aufGIV8creJYhVw3ehFN5aeMVDc
	iotSiVOlci1zuCPgVOhYX6y6FnLXVMa2CNUbg5sj0uKXOPja2c5fupC7JPdVnyMmxJdtuTj6K0C
	GxIlim5XlCWcTooz1a+szc7fRgTayB
X-Google-Smtp-Source: AGHT+IEfQV9bnP8fsaEkN3KGv8ZqOWPjOs88+7XQncM6ppKvoaKoftTo6/MtRekt02qZ2G9dsu6RDA==
X-Received: by 2002:a17:903:3508:b0:2a0:9047:a738 with SMTP id d9443c01a7336-2a2cab1635dmr57855615ad.19.1766156043627;
        Fri, 19 Dec 2025 06:54:03 -0800 (PST)
Received: from draszik.lan ([212.129.80.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c66bd3sm25192085ad.1.2025.12.19.06.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 06:54:03 -0800 (PST)
Message-ID: <5b366a0c0d7f4dcb6a3daa793ec503a43ea754b4.camel@linaro.org>
Subject: Re: [PATCH v3 1/6] soc: samsung: exynos-chipid: use devm action to
 unregister soc device
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Peter
 Griffin <peter.griffin@linaro.org>,  Srinivas Kandagatla	 <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
	willmcvicker@google.com, kernel-team@android.com,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Fri, 19 Dec 2025 14:53:58 +0000
In-Reply-To: <20251120-gs101-chipid-v3-1-1aeaa8b7fe35@linaro.org>
References: <20251120-gs101-chipid-v3-0-1aeaa8b7fe35@linaro.org>
	 <20251120-gs101-chipid-v3-1-1aeaa8b7fe35@linaro.org>
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
> Simplify the unwinding of the soc device by using a devm action.
> Add the action before the exynos_asv_init() to avoid an explicit call
> to soc_device_unregister().
>=20
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> =C2=A0drivers/soc/samsung/exynos-chipid.c | 28 ++++++++++++--------------=
--
> =C2=A01 file changed, 12 insertions(+), 16 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
