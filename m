Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EFE26ED5F
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Nov 2025 12:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764160197; cv=none; b=UE8GVpQpIZ/ZMo5YZfgxp7DpT6z9uIkbQFZIhwMP7ka4k3yWGGkI7y80v0Bm3wYscnYfz+0BOq4Rj5T5+PWiCf981D9DXpj3e7ylwWxdT6S1G3tcO5S8Tt29I6o6U08l3yO8ty1cp8TwK96ahSXvzFtTkDv3kl3DWyCNEU9XkUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764160197; c=relaxed/simple;
	bh=bQwTEmXLZtBYbJIHQB1fvCQ564+9NYLXnwEpMuxsr1Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pr+YlZNYbhNyPmsSBn+oA/BoY75055cK+Xj5OnIAX9pGJk7IMVRnx4QaWDqkU7taprB11YrAv3w7ep9cL+uFcHwkw92KqLQhPHJmUNPY6HkaBeXfW9AToNDZ7ibIH6/YmAux0X11alCSKW2BPkJz/+8GrDPQtuTBUEvpcslRPck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=POhy+iy1; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="POhy+iy1"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47789cd2083so39375185e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Nov 2025 04:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764160193; x=1764764993; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bQwTEmXLZtBYbJIHQB1fvCQ564+9NYLXnwEpMuxsr1Y=;
        b=POhy+iy1YJOQoTgxlgr6OnFQL0JpoU4L3dKRJJzK62kmfA6IJj0C9bNXiEQcbNG3Ln
         433rrGwHz7r44ZwEDCNl2rqSaQJhppWcnU9+EH8xJESgzueGGVuTdWRe1Uboouw5XZEq
         MXa/QjfYBuVSDjxEvLRkUCtL8CSdYtW5uEVWFg6QOEpyr3+g8F+aDs268Zvl6iQgr//t
         4mzp0n/bzd1KaPxZJ8oiWef3xKAAXYgphaOfQcPHr+TJCFE72N0q9kfAN9XxdpQm9nTw
         9X+1eewg7LTTMAVsnVx0G4vpI58XKBQJSvS5LmWe3I/Js6HQsLjT+I1zTeOrx1i4NNd9
         ellA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764160193; x=1764764993;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bQwTEmXLZtBYbJIHQB1fvCQ564+9NYLXnwEpMuxsr1Y=;
        b=HymUlzkt8LktMQgZxpI3k1J9gwe5GEC3y8bRou14qMbxpUFc/pwWTI0pPxDpyw2lug
         CEVtbN5dXFvfOq1b4EFew9Piuz2JJVSilTjnq3Om1V9xYphMjRFlNuZFa1xGErblMa4R
         uRgkDyZWdEWlSrLv9QXK7AqMgfVZ4VfBrXGw7QHHriJDpQDZ1tcbYir3Io41c98aNQlw
         D8hp37pRnEZSKqohg4zs1ktSkhEU3g460nk4lUY8d1JVhLCGY7ojykiS/tX15RrbajsB
         Q3J8vMijLjjfYaHVvIE98iUQO2C3+llbyVbOPB7DZZ37lfWtqWRcdv+m4kIkXXVzoJcd
         OtdA==
X-Forwarded-Encrypted: i=1; AJvYcCVmF+vTkE70c5xl9cGOjhSfMAo0RnElUFD2h0dJ0Dxj13tcSeiX+jgcp/nLYp0Dq0MXqn7kd7chTKuLXVLe+ee/dw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvorZVaam2xDJwNQCzV385LHDxHzkNAGmJWj5uZOnQQ2nW3H+e
	KXKa2Z4f80pTnAfjrINcN/lm1o/PzXsASxXtVkB6OehHW4CLxY/p5T/ETqdwozGx2Hw=
X-Gm-Gg: ASbGncvTzBJSxWy/k2eiRcjCikyIJQfd3C42pI2J64+gDX2lwgm0BBR5DSsSY/A6szy
	ziaN6JlKmtWBM4sG1stTXvKlATMbFgWldNY0CeNcuMP6vUQa7MqgefsGyXEHLQXvRvGeiKpqEzN
	hnBSWWYCLCm5uMrPHKL4cfrQgEyHCysXh7ZDsfJzBLNokKn0TpYvBMCIMYKEVJR46R23/ZxU82w
	0JqB4dwA4UBboteJFUVktb3k83CaAxV8veQSenyQJNrfMNY/Jjf/mkLrx90LZF996figmLlpoV5
	x46QkQ1RCYKXapn0iB96hfma5ykp+fKx2+WknWMF5gq0Qmgksc9xW66uw3G2FUPyseMH3FveOiM
	NDiRAecUQOBOTN6uTTebjJYRBDyhgwsmJjdQma/Dyn5LgMlbMAtNqMnB9CTyiJumCOTHWLQxzaG
	85hJuCiNA20sNrkKsJ
X-Google-Smtp-Source: AGHT+IH0cSJo4Vlyr8Buk/DzCr1knoZZ+PmWD5VF6J1/HFBNtYH/a6qqjCDXW/RS7ARE0kpo9HhB3A==
X-Received: by 2002:a5d:584d:0:b0:429:d391:642d with SMTP id ffacd0b85a97d-42cc1ac9a9fmr19770309f8f.5.1764160193279;
        Wed, 26 Nov 2025 04:29:53 -0800 (PST)
Received: from draszik.lan ([212.129.87.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fb8ff3sm42694154f8f.29.2025.11.26.04.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 04:29:52 -0800 (PST)
Message-ID: <ac62fdeb7e436ccf1df00904fd53826778f4593a.camel@linaro.org>
Subject: Re: [PATCH v2 0/3] Samsung mfd/rtc driver alarm IRQ simplification
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Lee Jones <lee@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni	
 <alexandre.belloni@bootlin.com>, Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker
 <willmcvicker@google.com>, Juan Yescas	 <jyescas@google.com>, Douglas
 Anderson <dianders@chromium.org>, 	kernel-team@android.com, Kaustabh
 Chakraborty <kauschluss@disroot.org>, 	linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, 	linux-rtc@vger.kernel.org
Date: Wed, 26 Nov 2025 12:30:08 +0000
In-Reply-To: <20251126112935.GA3070764@google.com>
References: <20251120-s5m-alarm-v2-0-cc15f0e32161@linaro.org>
	 <20251126112935.GA3070764@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Lee,

On Wed, 2025-11-26 at 11:29 +0000, Lee Jones wrote:
> On Thu, 20 Nov 2025, Andr=C3=A9 Draszik wrote:
>=20
> > Hi,
> >=20
> > With the attached patches the Samsung s5m RTC driver is simplified a
> > little bit with regards to alarm IRQ acquisition.
> >=20
> > The end result is that instead of having a list of IRQ numbers for each
> > variant (and a BUILD_BUG_ON() to ensure consistency), the RTC driver
> > queries the 'alarm' platform resource from the parent (mfd cell).
> >=20
> > Additionally, we can drop a now-useless field from runtime data,
> > reducing memory consumption slightly.
> >=20
> > The attached patches must be applied in-order as patch 2 without 1 will
> > fail at runtime, and patch 3 without 2 will fail at build time. I would
> > expect them all to go via the MFD tree. Alternatively, they could be
> > applied individually to the respective kernel trees during multiple
> > kernel release cycles, but that seems a needless complication and
> > delay.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > Changes in v2:
> > - rebase on top of https://lore.kernel.org/r/20251114-s2mpg10-chained-i=
rq-v1-1-34ddfa49c4cd@linaro.org
> > - return struct regmap_irq_chip_data * in sec_irq_init() (Lee)
> > - collect tags
> > - Link to v1: https://lore.kernel.org/r/20251114-s5m-alarm-v1-0-c9b3beb=
ae65f@linaro.org
> >=20
> > ---
> > Andr=C3=A9 Draszik (3):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mfd: sec: add rtc alarm IRQ as platform =
device resource
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtc: s5m: query platform device IRQ reso=
urce for alarm IRQ
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mfd: sec: drop now unused struct sec_pmi=
c_dev::irq_data
> >=20
> > =C2=A0drivers/mfd/sec-common.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 45 ++++++++++++++++++++--------
> > =C2=A0drivers/mfd/sec-core.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > =C2=A0drivers/mfd/sec-irq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 63 ++++++++++++++++++----------------------
> > =C2=A0drivers/rtc/rtc-s5m.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 21 +++++---------
> > =C2=A0include/linux/mfd/samsung/core.h |=C2=A0 1 -
> > =C2=A05 files changed, 71 insertions(+), 61 deletions(-)
>=20
> The MFD parts look okay to me.
>=20
> Once we have the RTC Ack, I'll merge this and send out a PR.

Thanks Lee. Alexandre kindly acked v1 in
https://lore.kernel.org/all/2025111415582194c6ee16@mail.local/
and there was no change to the RTC part in v2 hence I collected it
already.

So should be good to go?

Cheers,
Andre'

