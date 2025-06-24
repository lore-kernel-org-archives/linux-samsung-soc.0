Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B5523E226
	for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jun 2025 06:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750747090; cv=none; b=FPdF4wRB7iyOOaVbRWL6sPmrGwXPX3MAKgPfw89PjuKrZMbEgYwQmp68REY0xKFPLp7FsQh/0BtfrbCBQ9vRgD7qGQ1Pe0iOGcDBf7kCjDU/i76dJJnZCMg7yxz3L6go7Z5A8ie2fn8/LXtlFl4vrmuRtiWv/+0pFidnrPGHtUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750747090; c=relaxed/simple;
	bh=UqT1UTBAsYvRB01kXkmbX0p3Nu6z/Y55LPEAo9YxJwY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FMn4NrqHusK07LTx6udEInS0XTAyw58O3cIRMNsiS1UUCJ/sMdENgnocKs6YK9Ao2xbTnQMvJT7G19BtRLLMSj3nZ1yyUOBiN33t8HJWiaWvmngpSmsVyWVJ4/FjZXIu8rM1WJ+4G2iAwmYD4GeMxHkgXUcVqfA75T3xO5mRymA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kFdQFOoC; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kFdQFOoC"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-450dd065828so326355e9.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jun 2025 23:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750747087; x=1751351887; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UqT1UTBAsYvRB01kXkmbX0p3Nu6z/Y55LPEAo9YxJwY=;
        b=kFdQFOoCEmr6IoMLPSVaYaMOGHHJh2fTIulYqQeMDujwwMIMtgcfzkDkKpKv6JWGAj
         guO0fasKgsx4sWjD+Q0ip96pr+dz8AnjQQUa2CzVixvvfwxvX6/E48RedAgFZi+DZgDu
         CXRc5Z8HsXPXifObXJZqrxMXZSoGlFYR2eO6VxW4tZoAp8tKZl4RfuTSHrADqn6Dt3vq
         wDVecDmWeXAKwSeAmp13CGnlOP/LBT5/hMx2PX8/snA4wIUWw79vHGD4cQNV86edQeEZ
         Z35GrDayuTX5rliE5f3IW7KQPySGWg5I7n6Nd8Y9moMrY8OtoZjJU8JXLOxinKJovBBW
         WbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750747087; x=1751351887;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UqT1UTBAsYvRB01kXkmbX0p3Nu6z/Y55LPEAo9YxJwY=;
        b=l640fM0kmv6Yq5P8I8rlLMKgTJ3cSNaM8lSCofEPI5dT6RHkZlI8bvH0ezpD2irKB3
         3E9w1MPs4dGpOWhU+Nwzw8w7VQspJLc9WWFErQ8cLh9WGzOot/mZUAuWsNKBXCyzeJU1
         TbtO+taFSAK+BZA/noDT2tm2u7SNDGxkgc6gYzzNvlfG81Uhocg+M54f+L2ZsxMTCPRi
         dg/pfnpJqZT93epp5yK1RNCFWwHAiSYPNrsZBr5nRv27YWcF2+DEIPdRAgqWMqBoZt6H
         jnyUumahvIIDSX3tik41oVC2XNy9BhpLbVXaQngfr9XYeCjjfBUcotj/TxavfDwQ2/n2
         Cl/w==
X-Forwarded-Encrypted: i=1; AJvYcCWEMTKTmopreFtfSF5xKN5CVMkAUm59o1uNHf2FqgClXks/Wok1reDFUPmR5Abpfw/kNivLQ1DyIF7kQ3cF3jihNw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzico4iFcr1fe8jXhhGe2pcKTYZ3/cx2ug+syFRCslmuHZb1QcP
	EVL6ht8OSPCVjUVoGgLq2Mr2jEg8lM+C2Cw2xBmI/pd/8AVXXLUY6eEeNqpKfxVkFCA=
X-Gm-Gg: ASbGncsFAH5/skwwlosT+LJJLVM58CSe95tFCukT1l7ujaBPw48AQ2cknV5XKqA8rTH
	I3SSVAq9tIrF7SRRbpwm/juNRF6FDpupv9jKdBaKe4oPvKkANPyn/HQgx1Yn+QG/7SfCcfLZ4DO
	oCZKn6nI3kWA2WoBp89BOkTtkEyA+tLWczMdPhTwXLGs7T+jxw+VaF71sy59fWmBv2BDEBcjaGH
	62cVP7hLV14LDHOOf4ORIFDqwaAcJN4troSKkapPDsv56opUYYd/5rLhWdqcIHVFV65lh+J3ZvA
	ecyFkObNGhRx96cSkBH73dTqYhDAHiJpMWZe/17oVpaCf/czLT5xxw1bGbrXdvYzLOlkqULuEuH
	vYg==
X-Google-Smtp-Source: AGHT+IGOPbecHGYgB2YysSR5anppdA2xKx7TGTKt6AUrQoPCRTvADAlN3zQqydUylWoqDxWazLJxPA==
X-Received: by 2002:a05:600c:1d02:b0:445:49e:796b with SMTP id 5b1f17b1804b1-453658bac72mr136170125e9.17.1750747087505;
        Mon, 23 Jun 2025 23:38:07 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453647f29bdsm131378405e9.18.2025.06.23.23.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 23:38:06 -0700 (PDT)
Message-ID: <9237a946ada82934ef4c0b5a84162a400fb5a88b.camel@linaro.org>
Subject: Re: [PATCH v4 00/32] Samsung S2MPG10 PMIC MFD-based drivers
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Chanwoo Choi	 <cw00.choi@samsung.com>, Alim
 Akhtar <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Russell King	
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon	 <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Tudor
 Ambarus	 <tudor.ambarus@linaro.org>, Will McVicker
 <willmcvicker@google.com>, 	kernel-team@android.com,
 linux-kernel@vger.kernel.org, 	linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-rtc@vger.kernel.org, Lee Jones
 <lee@kernel.org>
Date: Tue, 24 Jun 2025 07:38:05 +0100
In-Reply-To: <202506232219552539103b@mail.local>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
	 <20250415160212.GA372032@google.com> <2025041715425693974c6d@mail.local>
	 <24314441936d97a1892474eacdbbd690612de265.camel@linaro.org>
	 <905e6cab9932c814a578826329f5e3f944418ef9.camel@linaro.org>
	 <b193e94f042cf6134d2bed92152c23ee5bba6a26.camel@linaro.org>
	 <202506232219552539103b@mail.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-06-24 at 00:19 +0200, Alexandre Belloni wrote:
> On 16/06/2025 12:33:21+0100, Andr=C3=A9 Draszik wrote:
> > Hi Alexandre,
> >=20
> > On Mon, 2025-05-19 at 15:41 +0100, Andr=C3=A9 Draszik wrote:
> > >=20
> > > Lee has kindly merged all the core driver patches.
> > >=20
> > > Any chance the rtc changes will make it into the same kernel release?
> >=20
> > Friendly ping.
>=20
> I've applied the patches, I'll try to send them to Linus but there are no
> guarantee they will make it for this release.

Thank you Alexandre!

A.

