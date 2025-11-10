Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688AD221DAC
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 06:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762756259; cv=none; b=qG9ipQeSRY6VodPgWWHbZf6AOJXZ9N5Sq+DAsb/MEVxiOnzYCQK0b5g8FuB9z8b4W4oWS3ZHUr9ZO7Hxdh9d7I0FUUwZRtukeDnUgrp881JqrZoSIEvXhes8S70Cbpmad4TbIU8xJ662fr9Lbl22tbG6pYHMQbefRdrmttzXMNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762756259; c=relaxed/simple;
	bh=gz2Tc2+ZpOYG2OzBbxLbgilswkkGbcUQjbej9kT3ykY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sxhubVL/rkP7C6hR455h3hQ8d41LRA80KGxsy9wUVZn1B0G6JLAtLh3R64M1NrkFjtBWqCpvX4h5Vv60wDFVNwBHtOYd4nccx4oFTrYywN4BkP8mxQ6mKF5tWKB6QwrDJzfmOh2iKdi2ptiG0bkL5730t3yThqQBidUoYDCLuDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o5K2ISc6; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o5K2ISc6"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4711810948aso16811185e9.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 09 Nov 2025 22:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762756256; x=1763361056; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gz2Tc2+ZpOYG2OzBbxLbgilswkkGbcUQjbej9kT3ykY=;
        b=o5K2ISc6bhNVXY8bIHTQ4KKcAedMfYbNe98yDermdBMwnpULRRTdKPKZ3Zvut28qJR
         cmwK2eUxwEOxqO5EkuHQD/7u7OnUAKrhopL2L3XSi6NEbUN1+C2dL4jn/gewrnZ9mXzE
         2y+BsrEIQxSTyOcPON2cc5Uol1PsFSuDLAnBKm/NaipaFdHG6v6vjL+tO1cCnFb0/XAY
         01NGw6434F0cvFxzmB3Y/2nbw392X8uIUo7aaelS0hPTc2ZTZV7JWHz6gDypHZxnii0z
         S2jnPJ+/h7LdB5vdqWS6uj7/mU1ba1hNDmCGgANENjkgbhEu5PPW252M96TViTBBtiqi
         bP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762756256; x=1763361056;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gz2Tc2+ZpOYG2OzBbxLbgilswkkGbcUQjbej9kT3ykY=;
        b=GaolmQTgDEsbronof/+F2r/beuUjjbosmH3UKA237Ggn7l8VWUJL1D2WC+x8t3tiFk
         AARHt71YM3XdBRz8QKv0hM7a3epyPhmvScWkmuvYJaAOf2+71iN62rHw2jHT0lZNa8ip
         iIQ/I6CxGXLJ4xRkDYxJmVucZPNRECN7BrJgQ2KuWIH+ewUdOzABU4J0OeYc4wrLqqWr
         cLJk26bo1DSDyPd5IdLm2ssOtsQKV+5uLU67i/7xXQMO6ULy/fNxaqFqCdWnd1/cU9Qf
         OhEVEoyMHoEpiB2jYZKhkzdRwO0e3v9RSqeIaEdT+nhiWZm7rVzRKAYAaWy4XYSdf3b1
         T2Gw==
X-Forwarded-Encrypted: i=1; AJvYcCXXXGrQ2BfY6g6dfJSbUtIsoo3aa+lfC5afQShshEEVdHn844RzyCEo6UoTAWkzaxqWRQtxNrE4Pbd0lBlN6gVrGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxU2Lu8JiM+sfwkGH5D4rnDw7jbkPikt4PjMPyl1PKV+n/P1vPh
	bpwUgXmJeKHCEOOAhdBuOsE/eP3R6WuxgM1oZtdRCxveIxmjeIrVNho+//jFLpcdEOs=
X-Gm-Gg: ASbGncscD2KMkkfHHzAbg++lhsbt6LwQg0NMrelVmRZX9l1LXXGSj3nTN0rf36KW4mF
	J3S8OyRuTy9H2G6ufPYHKlsjClJpgjf96Q2WJeFq3qjwgx/NC3JxzQiWAY5OeESzNtlwkLXbUQD
	KhGge9DkHcVsV0LiHLkHEXeHAzEYhG/7zmDpfGAxi1gY+pAhehfG3H9m0Ff78ARBrkxsxL1OXCZ
	343JNINU5pLYJvId6TWRZ42mVYOlo0pkUA/HABtyxo1zyMWZV7Hr6C/HY90+B0LFkZ8wXHTKtGN
	Iaz6aCS9So/n3STY0v2LeVo6b30IqKKI+BMkXjhkDo3COx9+R0iC5AmL08XeLJTEPN4Ib2+B3A7
	HFwM9DXFtob2pHoG7+YZKAGRcgyiXW4WrSN4OA/rQmDylMFa45/tmQCyRLdL2TpibjUVXf990P4
	vhjJcs7hU=
X-Google-Smtp-Source: AGHT+IEQw4YGmWYhhezCKKZpNUcmlZEpIju4sVG4oIvS3Njw1N4sMl3EeFVFvYxb/VKOCKvrHAj0Vg==
X-Received: by 2002:a05:600c:c84:b0:477:598c:6e1d with SMTP id 5b1f17b1804b1-4777325ab5emr48703165e9.17.1762756255657;
        Sun, 09 Nov 2025 22:30:55 -0800 (PST)
Received: from draszik.lan ([212.129.86.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4776419d869sm106249085e9.3.2025.11.09.22.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 22:30:55 -0800 (PST)
Message-ID: <776ac9f7ec2858a89c03b735653070f2749b986d.camel@linaro.org>
Subject: Re: [PATCH v3 04/20] regulator: dt-bindings: add s2mpg11-pmic
 regulators
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,  Lee Jones <lee@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski	 <brgl@bgdev.pl>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Peter Griffin	 <peter.griffin@linaro.org>,
 Will McVicker <willmcvicker@google.com>, 	kernel-team@android.com,
 linux-kernel@vger.kernel.org, 	linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-gpio@vger.kernel.org
Date: Mon, 10 Nov 2025 06:30:47 +0000
In-Reply-To: <7d9fa7ab-8484-4d41-bc3b-be2eff3b6e95@kernel.org>
References: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
	 <20251103-s2mpg1x-regulators-v3-4-b8b96b79e058@linaro.org>
	 <20251104-zircon-lobster-of-agility-cbcbb0@kuoka>
	 <46b008c946e36ea0b317691356ff874c4a78882d.camel@linaro.org>
	 <7d9fa7ab-8484-4d41-bc3b-be2eff3b6e95@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2025-11-09 at 20:00 +0100, Krzysztof Kozlowski wrote:
> On 07/11/2025 12:14, Andr=C3=A9 Draszik wrote:
> > On Tue, 2025-11-04 at 10:39 +0100, Krzysztof Kozlowski wrote:
> > > On Mon, Nov 03, 2025 at 07:14:43PM +0000, Andr=C3=A9 Draszik wrote:
> > > > +=C2=A0 The S2MPG11 PMIC provides 12 buck, 1 buck-boost, and 15 LDO=
 regulators.
> > > > +
> > > > +=C2=A0 See also Documentation/devicetree/bindings/mfd/samsung,s2mp=
s11.yaml for
> > > > +=C2=A0 additional information and example.
> > > > +
> > > > +definitions:
> > >=20
> > > defs:
> >=20
> > All existing bindings are using definitions, not defs. Shouldn't this s=
tay
> > consistent?
>=20
> Huh? git grep gives me 3 cases, so how is it "all existing"?
>=20
> But for defs it gives me ~98!=09

Didn't know it's ^$defs:, not ^defs: - thanks Krzysztof.

Cheers,
Andre'
