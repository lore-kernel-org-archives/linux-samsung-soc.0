Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5517BF501
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Feb 2024 00:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708562553; cv=none; b=UGqvSVLVE/XGY21Tmf/X0X+tP0Tq8Ep+zNa6IA8lID7Xla6Xu+FAHjJWklc5d9jWiOqSZ6c9KqGMTIiKjrOBN1ij3kkkFgXunuUW0+5iZdSxN2ynzECKNN4VY/lMMp+YLSB0/rqmdBabKZiW6v1tAi45Q4Xo8xVStcGoqEi9QGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708562553; c=relaxed/simple;
	bh=Bs9vhLKuGEIex6OPxJkFxMFJCT3jUj8PEgVKlk55ND4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TPo5aUJPv1pIsPa4zaC6K29BIRQPwcxE7quXZ5xEARQVkyzeYNQUXzQ5wLeKjfexAANLVMVXFIyo8nSwgu94ZPdo1+xQLNzcfuBgTao6LiwLZvH7go+vVhWOqpPdhu1qpwW5dTkKiGjw8ZMEciwJoOP8btJE0BAZ7sTMXoqoJWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UYtixNgB; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UYtixNgB"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-607bfa4c913so12354187b3.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Feb 2024 16:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708562550; x=1709167350; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShxvQ8PVoqtGaEPQqhEqEYNCHruhNGrg1u0pTjKfrU0=;
        b=UYtixNgBQFiKAO4w4+Udpn2GKuFPl0ARB5tOU1uUFetljSj8qUmr+Rn5G1gSGUqBg0
         f5tv5Q+P8Z5CSQegkDMu3wuvbSEGxAmkb/2Ur+cUWt9wEHexOAlA4nViBG3VLQK65bz1
         kqY7/KnQfsQRrJ7XeDuSybRY80SMRQLdCFrJHlwRi54sDKGV+oaExp0Gjff7O1orll0M
         8MriWzrdQQYSm2VeBeUzt2DQFs15sn706mvjUXqkhMVppZOC3rlaBUTHTYvSL9qqkWK5
         ayHgYwJIDv3Z1ff+NHd02CwxMpTPxSRp0FJ8d8IIKN7S3d6o+OIENWdKw7/do+acWQxc
         qSkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708562550; x=1709167350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ShxvQ8PVoqtGaEPQqhEqEYNCHruhNGrg1u0pTjKfrU0=;
        b=KoNpJlSjYkz2CZnr8dplMB/X0KUyM/GMDM6wRAJ56vaK3Ad4AoeFMwcI5zxiwPFTrX
         6w1v6YuWD+ZLDtRQS9QWPQPbMAiLB9z4njVuQo3HBIivNk78YJZVHVvypDpPrjakmVUs
         emiA2lNEpvdxOBjekzyLGrV/R2pmRBeYkgze1lmGwmto3XV++2n49ZF3waDO6tpABWAd
         Vr1etG1ZSE8MNbBPhZnY6EPWLfXJt6rr8FHagagSR3lLULXhi3RxLMk8aXZax2LT2vQ+
         zzHlzdDy9EOAKFtoHkVZfev2GEK3iIKGnwJtMHtpjia4Veb/tNv3Rt3N9u4+bvpXejn4
         N2FQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1NsKKRHQaNwXY3Rd3Qvc1SHme6qZJDmabrfN6OVU5oIvpcxc2Vfs3LGZvq3EV18omSXyogNylVTEON29o/Y7vBzC9uwB0hrTF7c4MTETlK6A=
X-Gm-Message-State: AOJu0YxV2ND+mtyswvqqYdsCpfvATc91k2X/7Fb1zqTYyqfBQcnC/SIv
	Dpr953qwXJ6sxOalBm+V3lgQHM1nh8kKM4lJ36RKCAvsNla2bQD6JxIhsWi41hkQFgTZWgX//rP
	ho72y2A2/Sp5jHtj0LvLFJiMtZWCtLsgfmKa1yw==
X-Google-Smtp-Source: AGHT+IHHuwGqbZaTb+bV+UPau4y6yhAeIrb6TWdnVktV+oEQVFlA8nEB2tKz9vC9H977t8keyZqZPMrkgYtfMJvYxvw=
X-Received: by 2002:a81:9a47:0:b0:607:a75e:9caf with SMTP id
 r68-20020a819a47000000b00607a75e9cafmr18882889ywg.22.1708562549946; Wed, 21
 Feb 2024 16:42:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240216223245.12273-1-semen.protsenko@linaro.org>
 <20240216223245.12273-12-semen.protsenko@linaro.org> <ce515530-428a-4a21-8c56-5a497cc8130a@linaro.org>
In-Reply-To: <ce515530-428a-4a21-8c56-5a497cc8130a@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 21 Feb 2024 18:42:18 -0600
Message-ID: <CAPLW+4=kpk=Vg=nX-hVxcCS0OttC6xmyUcB005tmX+vtUF9TLA@mail.gmail.com>
Subject: Re: [PATCH 11/16] clk: samsung: Keep register offsets in chip
 specific structure
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2024 at 5:04=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 16/02/2024 23:32, Sam Protsenko wrote:
> > Abstract CPU clock registers by keeping their offsets in a dedicated
> > chip specific structure to accommodate for oncoming Exynos850 support,
> > which has different offsets for cluster 0 and cluster 1. This rework
> > also makes it possible to use exynos_set_safe_div() for all chips, so
> > exynos5433_set_safe_div() is removed here to reduce the code
> > duplication.
> >
>
> So that's the answer why you could not use flags anymore - you need an
> enum, not a bitmap. Such short explanation should be in previous commits
> justifying moving reg layout to new property.

Will do, thanks.

>
> > No functional change.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> >  drivers/clk/samsung/clk-cpu.c | 156 +++++++++++++++++++---------------
> >  1 file changed, 86 insertions(+), 70 deletions(-)
> >
> > diff --git a/drivers/clk/samsung/clk-cpu.c b/drivers/clk/samsung/clk-cp=
u.c
> > index 04394d2166c9..744b609c222d 100644
> > --- a/drivers/clk/samsung/clk-cpu.c
> > +++ b/drivers/clk/samsung/clk-cpu.c
> > @@ -44,12 +44,14 @@ typedef int (*exynos_rate_change_fn_t)(struct clk_n=
otifier_data *ndata,
> >
> >  /**
> >   * struct exynos_cpuclk_chip - Chip specific data for CPU clock
> > + * @regs: register offsets for CPU related clocks
> >   * @pre_rate_cb: callback to run before CPU clock rate change
> >   * @post_rate_cb: callback to run after CPU clock rate change
> >   */
> >  struct exynos_cpuclk_chip {
> > -     exynos_rate_change_fn_t pre_rate_cb;
> > -     exynos_rate_change_fn_t post_rate_cb;
> > +     const void                              * const regs;
>
> Why this is void?
>

Different chips can have very different register layout. For example,
older Exynos chips usually keep multiple CPU divider ratios in one
single register, whereas more modern chips have a dedicated register
for each divider clock. Also, old chips usually split divider ratio vs
DIV clock status between different registers, but in modern chips they
both live in one single register. Having (void *) makes it possible to
keep pointers to different structures, and each function for the
particular chip can "know" which exactly structure is stored there,
casting (void *) to a needed type. Another way to do that would be to
have "one-size-fits-all" structure with all possible registers for all
possible chips. I don't know, I just didn't like that for a couple of
reasons, so decided to go with (void *).

I'll add some explanation in the commit message in v2.

> > +     exynos_rate_change_fn_t                 pre_rate_cb;
> > +     exynos_rate_change_fn_t                 post_rate_cb;
> >  };
> >
>
>
>
> Best regards,
> Krzysztof
>
