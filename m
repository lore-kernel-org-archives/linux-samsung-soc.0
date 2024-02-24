Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEB64C635
	for <linux-samsung-soc@vger.kernel.org>; Sat, 24 Feb 2024 19:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708804669; cv=none; b=iaPXV7L8kVtPzwAhY9cQE71YpTDWV4uo678ZDVr0g9KM/mxGj8EBeMGyXttv+em62z7ea2Vb3BceWsCbtzIXBixGXFI1K8BoRjNjMNboQeqN2z8rITxiDgwRmk2s3CQiczWF4PCON9Of+bW0SlRQrnaSVwoAG5S3i379Rs0518o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708804669; c=relaxed/simple;
	bh=QT98gB0MamXu+48RZNGJKHHUP35XArdtMZSyttKyeqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RBKjNS2QvWBA0yo2JL9lQuetZT9V6BjTUQcEExwZWFOPRuqbWqoi+PoOUGmcXnnZM+OTSqmNHAtVj2jlVCpM6uM++87mk+fGcL1dOg4a223FhBF+TZhH+rVndTS17bZaRq9oQKQJW/DJbHLdFAE3uZrv/r3JOCkvJ6i8o9vibG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NAd4oJC2; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NAd4oJC2"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dcbc00f6c04so1920651276.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 24 Feb 2024 11:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708804666; x=1709409466; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3upkBSE7EW4IvTVy+GKTlfggEfeNrb15KBzrmzdqVsY=;
        b=NAd4oJC2v0oLjR3kGoQO+AQEzFPHslNy3YRTisExxy+Usvy2yJdcVgOuoDax/aNm9N
         p+iC1ALNpX9ejayOImmiGDpAnwavMnaU+IvwWWfI1Tw3imIcWtTCxRRBzOFRZgd1pgr4
         FiG/1jNbqRLyqr11b8yTvs9VAQ1XzzZ16shc3cpA8hN9gcEMjdKJ/+taPko8QMXXbo4T
         Xx72TUHuxwGtL58WOqAGIp5EscHc0r63w+2lG3q+tyvlKyPP0NvwxHBZQdLKet3salEF
         5WgukKqjJTGgUluNq9TF1mTPssqzBLOM+W77RGvvKWbK0FBACpLFDwknQlPO3cwtcaMv
         stOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708804666; x=1709409466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3upkBSE7EW4IvTVy+GKTlfggEfeNrb15KBzrmzdqVsY=;
        b=rV7JywKZS9VStE1rBeUhqDBsvHK0JL30dIw60b7TVTOQkkZU9NFX5tvYMRmcHUfUPN
         PUufLIjS2tZCcXbdSmsiiTMUw28aL/Hh7jscU56WPQOaEDhZvJNhW09jQmN+9MDKBsR5
         nQ23/ogGzjG4dHUsrKPK0pqcr/9+wZgLn43kIqBpBAyAkwH0uIWa4C7wA3QaQqyU8Rqc
         Mf2Kf/NahL40b5fcZdD1n3AFM1QFDCjP5+aVykAD7br2NSPcoMxPVa2dyJIESRckUk8n
         cKMpzydWXx8/eii1t+2gARz2wFugWo6wPHMWKe5Bx7ZtBam+soxmQUi/N+yDAfOiXeuL
         KovQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNW+l5a0ayP7IxAYY0Afm/FKbRVHBxU+rCuobS1cQdhpzQTslcwE4++FM8HLA7XcJ0M0ZC6uLOy3EeFX0V1xfX5WCltRNWRw2cRz8g9hJxrEM=
X-Gm-Message-State: AOJu0Yw6/Ip1lSRRZpncPOBTZ7opj9NQAfpkefqVOLPqWCURJHA8TXTY
	cmRV2PzQrEzUvt2l7RgNHg0dGXz4exKBJFFeHxwx/dE3rhzqX9I0lPq7SbPCEeniiJA1yU0+Ds/
	F4m53Yhss5rBHeSNUMUc2ugxyWn3Ob1tGfpF7lA==
X-Google-Smtp-Source: AGHT+IF324Ij+0TdHaj23lio+sfs2T6+v3wM2ZIkq1lLEzIDLQ6B8M2LdAqBy5aPp7QJDr8vBzFvnBhEYhGDAHPSbIM=
X-Received: by 2002:a25:abcf:0:b0:dc6:9ea9:8154 with SMTP id
 v73-20020a25abcf000000b00dc69ea98154mr2050724ybi.13.1708804666266; Sat, 24
 Feb 2024 11:57:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240216223245.12273-1-semen.protsenko@linaro.org>
 <20240216223245.12273-12-semen.protsenko@linaro.org> <ce515530-428a-4a21-8c56-5a497cc8130a@linaro.org>
 <CAPLW+4=kpk=Vg=nX-hVxcCS0OttC6xmyUcB005tmX+vtUF9TLA@mail.gmail.com> <c4f7e3cb-db9b-48be-883e-33878d2510e8@linaro.org>
In-Reply-To: <c4f7e3cb-db9b-48be-883e-33878d2510e8@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Sat, 24 Feb 2024 13:57:35 -0600
Message-ID: <CAPLW+4kBHnLnPj0JKvdQ-Bm7DiEJ+_Ob-Cw60=vzwDwbOh4qOA@mail.gmail.com>
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

On Thu, Feb 22, 2024 at 1:47=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 22/02/2024 01:42, Sam Protsenko wrote:
> > On Tue, Feb 20, 2024 at 5:04=E2=80=AFAM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 16/02/2024 23:32, Sam Protsenko wrote:
> >>> Abstract CPU clock registers by keeping their offsets in a dedicated
> >>> chip specific structure to accommodate for oncoming Exynos850 support=
,
> >>> which has different offsets for cluster 0 and cluster 1. This rework
> >>> also makes it possible to use exynos_set_safe_div() for all chips, so
> >>> exynos5433_set_safe_div() is removed here to reduce the code
> >>> duplication.
> >>>
> >>
> >> So that's the answer why you could not use flags anymore - you need an
> >> enum, not a bitmap. Such short explanation should be in previous commi=
ts
> >> justifying moving reg layout to new property.
> >
> > Will do, thanks.
> >
> >>
> >>> No functional change.
> >>>
> >>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> >>> ---
> >>>  drivers/clk/samsung/clk-cpu.c | 156 +++++++++++++++++++-------------=
--
> >>>  1 file changed, 86 insertions(+), 70 deletions(-)
> >>>
> >>> diff --git a/drivers/clk/samsung/clk-cpu.c b/drivers/clk/samsung/clk-=
cpu.c
> >>> index 04394d2166c9..744b609c222d 100644
> >>> --- a/drivers/clk/samsung/clk-cpu.c
> >>> +++ b/drivers/clk/samsung/clk-cpu.c
> >>> @@ -44,12 +44,14 @@ typedef int (*exynos_rate_change_fn_t)(struct clk=
_notifier_data *ndata,
> >>>
> >>>  /**
> >>>   * struct exynos_cpuclk_chip - Chip specific data for CPU clock
> >>> + * @regs: register offsets for CPU related clocks
> >>>   * @pre_rate_cb: callback to run before CPU clock rate change
> >>>   * @post_rate_cb: callback to run after CPU clock rate change
> >>>   */
> >>>  struct exynos_cpuclk_chip {
> >>> -     exynos_rate_change_fn_t pre_rate_cb;
> >>> -     exynos_rate_change_fn_t post_rate_cb;
> >>> +     const void                              * const regs;
> >>
> >> Why this is void?
> >>
> >
> > Different chips can have very different register layout. For example,
> > older Exynos chips usually keep multiple CPU divider ratios in one
> > single register, whereas more modern chips have a dedicated register
> > for each divider clock. Also, old chips usually split divider ratio vs
> > DIV clock status between different registers, but in modern chips they
> > both live in one single register. Having (void *) makes it possible to
> > keep pointers to different structures, and each function for the
> > particular chip can "know" which exactly structure is stored there,
> > casting (void *) to a needed type. Another way to do that would be to
> > have "one-size-fits-all" structure with all possible registers for all
> > possible chips. I don't know, I just didn't like that for a couple of
> > reasons, so decided to go with (void *).
> >
> > I'll add some explanation in the commit message in v2.
>
> Currently the one-size-fits-all seems feasible, even if few fields are
> not matching, so I would prefer to go this approach.
>

Sure, no problem. Will fix it in v3.

> Best regards,
> Krzysztof
>
