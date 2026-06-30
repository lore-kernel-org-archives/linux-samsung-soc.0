Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAE53FA5CB
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jun 2026 11:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782819165; cv=pass; b=F+ES5ZwOhhdd2BatBJ9Hhn1sNyATMqFeEIMh6UTxP3CPtvCkEremTHFEJQoKX0djSpJQFf/MS+NVnvwc6dUtliithX9ey4Sc4KZ39Gyk/dXlSmz5pDCCdn1r6i0rOmEbuRRRn/fkuZq8Ogluqs5vhOssYkIMofToY6bC0wHPQnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782819165; c=relaxed/simple;
	bh=Ml3S2a0ZylulO8bEdZQM280rooBXFC/9alJktHHXtFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B3BLaJ80KY1GC050P1SiDzj5aYzVbMCwutLEYPyljPVfKoh4SqiCdji7mo/FdDLVc22W/800i1MJIuR5hFnw3RBBYc8uwo4LbaSvFkX5wALqnOX9iabiEysDjUN5n97LXBTXcBVsx1b9VQ3uLN5T5gmCb5yIgw8eFi6ts4J2meo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OAdrWwk7; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OAdrWwk7"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6984169c126so6196980a12.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jun 2026 04:32:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782819162; cv=none;
        d=google.com; s=arc-20260327;
        b=GJmgx75useyMiphCfcRf4grJk2fcZgcJDZVVFmAh3YjZGm3/rDnMOjhkDx9vLUMHIi
         1ywzh6Ola+J4jV+cGQT8WMSfdmZf5XhnBGf+Ez+Zrso1TAYEmSD5PDvxwxs4HQ9JK357
         YovrfyW3f2WMqnPbYo6EK6bXaWBxiIJjtjx0742fA4E8mcj6uqFD6pzEJtwojwo+IWa7
         yv1YIqDcC+93yEmWmn4SXM2ezVoAyVwygaITVOpjoOzttX9ZGBabIhNju+UH2zm/lATK
         BGJA1y79lEdGKjKXqiyyk9aqm5RreyGK3vJEXfQFTKehWq21ea9yIuaYZlMFXrkAg8qf
         MCJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ml3S2a0ZylulO8bEdZQM280rooBXFC/9alJktHHXtFE=;
        fh=fYG8gzL6+5gXww387M27HL+dtHLjydkjsiUdX2muCV4=;
        b=kNw8zTLaFaUflLEXsy8+LuWlhR6Jd1dyNGvMjU3JRT3HIpbZe/s4FbQHYXgtsA0tFg
         CbgQved202oxfthzaIq8tFd/hpmnJJbUr0rcN4RfWCK/e6U4/2+oFVduaUWzt9O9oizq
         YEhPpSmztO0/uVQDEBajElSenpHAkMKbZeNJGboys9zAWop+Y/PdMJFy3Hn+wa5XxyZa
         Fee0AAucH6T1D8r8Um4Xiytjc7OiqHUcqm47bP2ppQmV5HX87k9p/Op2Q1CYVz1QDAax
         W48g+s5m1JKMfhX5hJsn8rNFOsVLcxDZ7wdOStBMw8cPuDfWm7ymZJdacnloY0TiAwLH
         mkAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782819162; x=1783423962; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ml3S2a0ZylulO8bEdZQM280rooBXFC/9alJktHHXtFE=;
        b=OAdrWwk7io5oRt1D+wBZo4XxKyRYhbS6Ga+h5k2kXwFfqO2AeuIuDEj0LSUzB9GBmO
         f0rD+mCzMfVr47ERrP4WOeHPDWE/5OvIxMOsExToiiXTfSzyUgBu/61t+i9xws+p/AKT
         SYputwV7kGbe5rmLIH4scSfPzUWmuuqHCZERoVqhuDXB62mou9SO+wABdItAa2iWKIRI
         L8lwHW6D/oGFXhSUkpJBpAQQIrqk5TyXnlQoiyExM5w1EPfb/qXpapYY+oZyfDL3MZ5z
         86VTfAf9aNOPluWsB+ZmlpXGGFTNsavi7owG0emKIdizUY8N7QWz+V2GRUgXVCPTXKjv
         Hs0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782819162; x=1783423962;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ml3S2a0ZylulO8bEdZQM280rooBXFC/9alJktHHXtFE=;
        b=ceKoOMy55AMS5pBfpEE+TqyhhtGZf7FwnD82pKFxF2/DIqcRS1moP5ckPGExl3HXsL
         v9FQEGMdJDoIGE9KLuvEXouvsDp6b8QOxs/ZoueD6vFaz2C1rJUqAXx03wftLmL1emPs
         +P54Hz/5DHmMZ/usekZPN02og+8SVbASIRq8phNjZ4TSbEZuiH/0QCqke9YQnvpaQ/f6
         qNHTTfPYfV9BXXyq4oEw/FUiQfTjX8lxZ9NoonKY40SXmFoPpeVFMonpznzrYJSn7Gge
         7bosM6VIR9HK7gFRBZizG5jrQoXBVkWFGs/Wd5L4XhHOt0go76JN+xXijuaPk5BKqVdr
         sm5A==
X-Forwarded-Encrypted: i=1; AHgh+Rq+cpJlSRGhMOX/Qnv2Uy3wCXwNJsc5X9WkCb12DYaxiZAU7GMiJfOYtQqWCl0R4lCV+qbW+rGnODM9CTUvHDQzSg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0gZRlOd0yTr5zjQNrS1zCMlK/xEwy39Tns+uTnb+5aVZhsyVO
	FmDUCOp/Iyqy7RC/pgEkyj3aihyXBQkOHois0TVVrsr4HOV8qUzc9E1FmmvkubjZOMFNsQnS5pl
	R8tb+0SIMahdJgnIJsTI9sZrUOvbPLvxRbb0xVykVCA==
X-Gm-Gg: AfdE7cnJq8gRHbb8WJphPW0i6oe2KniAgnuSu9aw4nGLUlptSIbOSZUFV1yNWUbxXfr
	0zxZbO8s/uhIL4c4zfzT0bJUDYnAf4HZPV9uaUs0kyKmv0yg8OZWBINpwNaExPIqnkEeCU6CfNI
	K8UQpnLto9JINcSSzRW8beMuHHrVrPy28XWFGDWJ8kpEeWYcga73m3ggcaSFhSF0qdLNoZVHWGo
	TMMKarT/Cz+PgyKnaLoHVlZlhjFuEWjKG3hh6liHK2VeUl6wLPG97cumzgfcb+pDoIabY15Q1v7
	931DFBZ9f8XN56YRLLxLSHusbi/yVg==
X-Received: by 2002:a05:6402:51c8:b0:698:3b7c:7e36 with SMTP id
 4fb4d7f45d1cf-698878ad389mr184057a12.32.1782819162077; Tue, 30 Jun 2026
 04:32:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260613-exynos990-peris-fix-v3-v3-0-2b230db78ae4@gmail.com>
 <20260613-exynos990-peris-fix-v3-v3-3-2b230db78ae4@gmail.com>
 <CGME20260629123246epcas5p2aab9da9ef417274bb0b70f74c386f7b4@epcas5p2.samsung.com>
 <CADrjBPpNQd6WgwVo-a3Mz74d1EptPm9D9BisLEmoFRsdUb3izw@mail.gmail.com>
 <0f1e01dd0844$01190c40$034b24c0$@samsung.com> <CADrjBPoZ4G09WGC_b59YWq3_EfTaPFyp0dD7VizKLYBW_eFk+A@mail.gmail.com>
 <b035916c-e985-4acf-930b-bb74814ae748@kernel.org>
In-Reply-To: <b035916c-e985-4acf-930b-bb74814ae748@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 30 Jun 2026 12:32:30 +0100
X-Gm-Features: AVVi8CcNxlc8aBvVUsFvxwtw-6b-XjIoK93AeruSemmptuSvFy4q0u1JGeOhNoM
Message-ID: <CADrjBPrG7bo1i6YcxuwNKnYmKF=d-MXXMWSNdu+KfF7hhqQMXg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] clk: samsung: exynos990: Fix PERIS gate clock parents
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Denzeel Oliva <wachiturroxd150@gmail.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Tue, 30 Jun 2026 at 12:12, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 30/06/2026 13:02, Peter Griffin wrote:
> > Hi Alim,
> >
> > On Tue, 30 Jun 2026 at 04:53, Alim Akhtar <alim.akhtar@samsung.com> wrote:
> >>
> >>
> >>
> >>> -----Original Message-----
> >>> From: Peter Griffin <peter.griffin@linaro.org>
> >>> Sent: Monday, June 29, 2026 6:02 PM
> >>> To: Denzeel Oliva <wachiturroxd150@gmail.com>
> >>> Cc: Krzysztof Kozlowski <krzk@kernel.org>; Sylwester Nawrocki
> >>> <s.nawrocki@samsung.com>; Chanwoo Choi <cw00.choi@samsung.com>;
> >>> Alim Akhtar <alim.akhtar@samsung.com>; Michael Turquette
> >>> <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; Brian
> >>> Masney <bmasney@redhat.com>; Rob Herring <robh@kernel.org>; Conor
> >>> Dooley <conor+dt@kernel.org>; linux-samsung-soc@vger.kernel.org; linux-
> >>> clk@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-
> >>> kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> >>> Subject: Re: [PATCH v3 3/3] clk: samsung: exynos990: Fix PERIS gate clock
> >>> parents
> >>>
> >>> Hi Krysztof & Denzeel,
> >>>
> >>> On Sat, 13 Jun 2026 at 13:36, Denzeel Oliva <wachiturroxd150@gmail.com>
> >>> wrote:
> >>>>
> >>>> Correct eight PERIS gate clock parents to match the hardware clock
> >>>> tree and reorder the GIC mux parents so mout_peris_bus_user is the
> >>>> default source.
> >>>>
> >>>> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> >>>> ---
> >>>
> >>> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> >>>
> >>> @Krysztof: I was thinking, maybe we should establish a new rule/best
> >>> practice for Samsung clock upstream submissions whereby patch
> >>> contributors should link to the downstream cal-if code for the SoC after the --
> >>> - line. That would make reviewing the patches' correctness a bit easier, as the
> >>> downstream cal-if code would be readily available to the reviewer.
> >>>
> >> We can leave this choice to the reviewer if they want to refer to downstream cal-if code.
> >
> > Generally I would like to, but I also don't have time to hunt around
> > the internet for a downstream kernel tree. My rationale was that the
> > submitter is most likely to know where the downstream code is, and is
> > likely using it for the upstream clock implementation. So, linking to
> > it as part of the submission should hopefully be fairly easy.
> >
> > If it is a Samsung SoC for which no public code is available that's
> > fine. I didn't intend this to be a hard requirement: "you can't
> > upstream x,y,z unless you link to the cal-if code". I meant it more as
> > "best practice/guidance"; if the cal-if code is publicly available,
> > linking to it would be a useful reference for reviewers.
>
> cal-if as vendor tree? Some contributors just base their work on
> downstream GPL-compliance dumps from opensource.samsung.com, so not sure
> how that link would work.

Urgh, I see. My suggestion kind of assumed the downstream vendor tree
had been pushed to a public Git repository, similar to how Google used
to push their gs101 sources, for example:
https://android.googlesource.com/kernel/google-modules/raviole-device/+/refs/heads/android-gs-raviole-mainline/drivers/soc/google/cal-if/

A link to a tarball for sure isn't as easy to just click through and
take a look which is what I was hoping to achieve. Thanks for the link
though, maybe that will come in useful at some point.

Peter
