Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFD33168E1
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 11:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763121339; cv=none; b=D7IWnzSxdtgEsGgnyQXiulmXP9gA2VwK9eNMrJpsuJUk/KXrOGXNmcIiPVKTI1+CAi9DnZDICQ03wpkNOF3oU58r+FFx+sm6f3lWfgDOtU1FtKn/jwUOdN2ReiAybDmE2Of4Y5wZpDxe/N3dv1BvhJXwA7E7Jw3DVnQIXdG2O9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763121339; c=relaxed/simple;
	bh=kSsVcz8630KwHo4IO7LJsqMTZrFWGAD+oaRzx2FLL3w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VEhEntn+FY7ocWugltBUAHODqL0Nk4taZqKOdT0pbIRyJYM45LfIaGG6IUWSlcAEYBFb3jRwqWfOrqmFsER2zz6CI49Z+GisuswN4O3fNlSqrd3y1kW6xVrtVFyOeZc4YBYlsleabnhaA47aodOlspm92d8OAZK/3XTt9OUZAgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SLawjDEm; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SLawjDEm"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477442b1de0so12929775e9.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 03:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763121335; x=1763726135; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kSsVcz8630KwHo4IO7LJsqMTZrFWGAD+oaRzx2FLL3w=;
        b=SLawjDEmIkye7FklV/K0NRjVRjISwZlLXhh7NLhMp5I8d6eIDNFW3ENbEsrnKlOEbK
         wP0JiezJ6FXzc0YP0NiJOoRTpo2jTNUHgpttC37nd6OidVHmg+Z64cRg9Honr90y+7fD
         vY4U5+gOET7UBDi2+6m0nE3IHVqTC+n8b2MjOoukKLSqOQdSZcbd7UFfL1zB8pbmmyxV
         nzCfQmH8JdYSC1KDcjNxE6slEewY9NdKw+gPg7Qt9glB4DcEfcCKGThdsdB/7uqtGY+c
         Icm6rA+EMa6fppbBYI178ND65UVjuOU36LmpQdA7TaLx/mqrvylgW2CLEK+1YSXtpTqF
         //2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763121335; x=1763726135;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kSsVcz8630KwHo4IO7LJsqMTZrFWGAD+oaRzx2FLL3w=;
        b=kNM4vRy3a8eCAJpU2UtBG390GHlkpU2jVwRmLvw30WxFwNgyF5sVxienlnO0jONSyE
         3QktllKzNKx046vd7kQug+KPfjLp4o3BNpq9rECZRrXB3nX+8IyJVKHp+PrZ/pWODIz8
         HIU0jJDmZLMpN8BcKEgp5uaA19Y7TcqHAMeBUCuq8oeMfFj0BjwP2QjUPuGnUVTtUWgG
         TR4IaqnH7IEO9m5E4dLHdSgsM27gPrU7ZxP0yNOeVM5szZ9NFtCLSNj8miPpQqUVdHYJ
         u3K3tjNriWzpvXeVxaOOpbV7tuPMoT1zISb9qPzCKIndgopbmECkFWdZoUZKphChabaS
         A44w==
X-Forwarded-Encrypted: i=1; AJvYcCWnUo6hmuTjei8+P9ai+hXFJICcMgTSivavynmU72o/td2GEg8OQL6XHhyg/J2ZUK4Ti7niL22gwlQ2BmJaofKQtw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6XYSVHlkVM0SRSPeK/BGzdz16MlbUkdvPz5RBJYetGlLCgt2H
	Z7K5HUR1JbR367rSBC3vQ7UKGycsxGDNTH04BsNTcE0Kl186JGVTm4rvOgvz+OSL6Ag=
X-Gm-Gg: ASbGncsZIEBfDiCKOgOIkrPrNu19P4kXf+JId7gPVbFXv7f5OdjSA096qR7/mwnoUZF
	t2wx0WMcpwORA1M8ELHK+S4B+8K5X2UHeO7hcESADBOOCQKuz/F970B8mBAJdX1HIGeMofqslgI
	vdKhE4YQXwTalx+/tpTgad8eDgXB43B+Bd3NOUJI7mO/7OvVWpqLoQdm7TufcGNL0Z1Hwo55uVB
	I4mCJ5qvbibKmkL8UHVQSOOAQeCYTcpJ+mNNMvk1PblXa7tZeaBphjBYaiKI4PvzlYUNfL/RaNv
	hHMhW3NGDETQ2NWhxnshPtsRJPdf6tR6m+v1FkvEyhVX++u3Pji128SZZ4t/BmWKO8jAvYSBrv9
	Vro2+1ramTrsCgiJS5UfFb31qsXGDKBmrtcmNqzU4Alg8aHsBJXlefwdr8M0CciICksjPwxPdJP
	4Fd6dW4w==
X-Google-Smtp-Source: AGHT+IGaX63VyG7288bvhFhh9mADvgY7EJnU+zr1vNcvBNVERTkgMmla9vn+invb7igtQmyDtjSXdw==
X-Received: by 2002:a05:600c:1c16:b0:476:4efc:8ed4 with SMTP id 5b1f17b1804b1-4778fe49c3bmr26839345e9.11.1763121335290;
        Fri, 14 Nov 2025 03:55:35 -0800 (PST)
Received: from draszik.lan ([212.129.74.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e85e6fsm9688761f8f.18.2025.11.14.03.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 03:55:34 -0800 (PST)
Message-ID: <6479a8d84052b326ffeb5609959aaf3a1aac9ff8.camel@linaro.org>
Subject: Re: [PATCH 06/13] mfd: sec-irq: add support for creating multiple
 IRQ chips
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Kaustabh Chakraborty
	 <kauschluss@disroot.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo
 Choi	 <cw00.choi@samsung.com>, Sebastian Reichel <sre@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-leds@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-pm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, 	linux-rtc@vger.kernel.org,
 linux-doc@vger.kernel.org
Date: Fri, 14 Nov 2025 11:55:34 +0000
In-Reply-To: <20251114075004a444bff0@mail.local>
References: <20251114-s2mu005-pmic-v1-0-9e3184d3a0c9@disroot.org>
	 <20251114-s2mu005-pmic-v1-6-9e3184d3a0c9@disroot.org>
	 <20251114075004a444bff0@mail.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-11-14 at 08:50 +0100, Alexandre Belloni wrote:
> On 14/11/2025 00:35:07+0530, Kaustabh Chakraborty wrote:
> > The current state of the driver only allows creating only one IRQ chip
> > per PMIC. On some PMICs, such as Samsung's S2MU005, there are multiple
> > interrupt blocks, for which the current implementation stands insuffici=
ent.
> >=20
> > Add support for creating multiple IRQ chips for a PMIC. Every IRQ chip =
is
> > given it's own index, which is used by sub-device drivers to request IR=
Qs.
> >=20
> > A macro is defined which states the maximum number of chips supported.
> > It's set to 1 as currently, no PMIC requires more than one IRQ chip. Th=
e
> > value must be changed accordingly on adding new PMICs requiring multipl=
e
> > IRQ chips.
> >=20
> > Moreover, adjust the s5m RTC driver to initialize IRQs with the
> > appropriate IRQ chip index.
> >=20
> > Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
>=20
> > ---
> > =C2=A0drivers/mfd/sec-irq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 163 +++++++++++++++++++++++----------------
> > =C2=A0drivers/rtc/rtc-s5m.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 15 +++-
> > =C2=A0include/linux/mfd/samsung/core.h |=C2=A0=C2=A0 5 +-
> > =C2=A0include/linux/mfd/samsung/irq.h=C2=A0 |=C2=A0 14 ++++
> > =C2=A04 files changed, 127 insertions(+), 70 deletions(-)

Your patch reminded me to finally send
https://lore.kernel.org/all/20251114-s5m-alarm-v1-0-c9b3bebae65f@linaro.org=
/

If applied first, you wouldn't need to touch rtc-s5m.c I believe.

Equally, I can rebase mine on top of yours - no strong feelings.

Cheers,
Andre'
