Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E8F2222BF
	for <linux-samsung-soc@vger.kernel.org>; Mon,  3 Nov 2025 13:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762177807; cv=none; b=FIGSCeuCYATtNl8QpvAcEzfy7mJTTGZ+3KVo7CpYx2QDVCXzm0lOnCzNy9oJlgIxvN3O5vkpBzyX3LHPjhBL+FoOI+7Bk9sPHQKK17kYZINR2etn8nF1hxrgjPZPEgsie862vdd0RFDfuv0GyjxWwOmfuSafqThevd7yjInilz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762177807; c=relaxed/simple;
	bh=TsvnfzRwsbf7wGlFzdjo71TLJrNDdp/a+dRwvaix3co=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jmBIgqmWdiKnr+9E+34Rbj/dKKrcpE6G+S3dpvvHOukzFttJ9Js4ha41d/+SJ97zpDTglXGa5d1ngAvqXg8bAJ9LASyHnF3K62Dd+hB3tUgYqzRoY9p4lJ9Hjs0pXJ8KWndFa6kxEe18kQcQDyuA+QHeygK5fKTYjbw75yk2qJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s50QJ4fx; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s50QJ4fx"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-3d37c1fb05aso1768629fac.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Nov 2025 05:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762177804; x=1762782604; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TsvnfzRwsbf7wGlFzdjo71TLJrNDdp/a+dRwvaix3co=;
        b=s50QJ4fx+PMJ+Rf+UE86QYB9Vmy3XErnLyHATB1i/CC6KG9A86sMAY5v9BDGSyO31J
         9teUFNB1n7pCK+6rpEY3tLe9yRJngDGkQtkhfRGEUPt6Ufzo9Rs8hmYIeYOt4A3IhXAL
         fPH+w2M+6/e0ecbpTM3LTgIW2K6XILgwr+eH7buoQVIFrNPGphqVdmnSjEJphNRXuhf/
         JhPNOSH09Jt2wQXbFvTLVHGCTbZvyMB/Ljg+Ab3QbC+v0v3BgtWN0WWqK7nCt3nMT9f2
         iqGHP2N+aj3WcNpe9HJvKCzniYIS5XL/shOsq8z3oc/QKy7JniMOZ+3my2pB2q6w4KUr
         6Csw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762177804; x=1762782604;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TsvnfzRwsbf7wGlFzdjo71TLJrNDdp/a+dRwvaix3co=;
        b=jqpels+cIXNBJuwFEIJV1IP8K0kjIqIbOHl5O/eLFPn5wns91YJRSMbT8BlWOimFFu
         5mdvHROcRAEu4jF9k/cBhFZwjOgyRBUwzoRMEjGvhD9CClzcXYx8V+zBaXe6CkAkIKAx
         xkSCiv4y+L6csC76TyHJ2HmXEU7Fv9y5l1UoZcGX9cMfa7EuJQCTOhik0U7lLsisXrPu
         Vp7bzTwMN++RUJwvWHL5hja4Zp9hiCdCa2m0mKVGnJ3hMkJOfM6WlQz8qCdv0s2K67Sf
         uYUbxBtojD8oI7vsIdKj58Flw3374ix12c67MsQRCM5GGrZw7zXVR4HoN0GN+t4/cXKm
         msFw==
X-Forwarded-Encrypted: i=1; AJvYcCVIqNTpN5zWJhJLMbNnsPjnxKV7zmoLUgqpbmfhSCin3zELDBIN7P3FTBWxr5PbL1tZl2HtDyEl2fMhwKKalsHiEA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi6idujYXFdXd3JM90XCMNBkH8XZzhMCsYia21p//8XPkUAmIT
	NbxNReYl7u0DjDvNRRaY6/aToEbyHas6tHY8wAJAOyEoc1FF7ZB3CZRuQKJmAWZRC6YsHMUj3My
	yNNrZxeuk6Y7VD9FnJuNdUpNiSQvbRH4M/sveF/Ds5w==
X-Gm-Gg: ASbGncsPLFEtJxnzTXPn61N99CmWyqq4EI87284Em7VP1O3qdVojafXa+8Pn/rJeC6H
	jk36q0ZNouwrBh/snHoDyhbwmIPmuoIcRW7NRp2SbCtsbxm00w+jtWABvxDo4o3hfapxyoCpaxi
	sZEggSlPnjNeO7MmznXEvKyLALkexViQSzpYy5OfcIdrC3nZLN8YmGUgLuuMf7SNQNC48toglSB
	SbQ71Hyd8Ym/SgOnZDI07LdrPFa5lmNrYBrTj+Xc1a8p5OfoEEWTZTPxnHvVPbNMLgoW8br
X-Google-Smtp-Source: AGHT+IEvvbnuEgVymC79WaE8covKlgmCh0NOsdeyracVXZX/SVCozVOiOeq8HhVtYvKE2fZAbBNornSKI+Cu+lra0Ak=
X-Received: by 2002:a05:6870:8e07:b0:337:74c4:8f18 with SMTP id
 586e51a60fabf-3dacc5d1f80mr5149154fac.6.1762177804047; Mon, 03 Nov 2025
 05:50:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251102-automatic-clocks-v3-0-ff10eafe61c8@linaro.org>
 <20251102-automatic-clocks-v3-1-ff10eafe61c8@linaro.org> <20251103-smoky-rustling-bloodhound-7590ce@kuoka>
In-Reply-To: <20251103-smoky-rustling-bloodhound-7590ce@kuoka>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 3 Nov 2025 13:49:53 +0000
X-Gm-Features: AWmQ_blfrAzZoKwokZQZXo0nzPx9hZ0JYCMuGx_l22LwSjR0d1KXfaSrBbDofEM
Message-ID: <CADrjBPpjX_qSehbNkaAG03f=whs09qFzzgNiY3sztk7v0QeCFw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: google,gs101-clock: add
 samsung,sysreg property as required
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Will McVicker <willmcvicker@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thanks for the review feedback!

On Mon, 3 Nov 2025 at 09:41, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Sun, Nov 02, 2025 at 08:27:14PM +0000, Peter Griffin wrote:
> > Each CMU (with the exception of cmu_top) has a corresponding sysreg bank
> > that contains the BUSCOMPONENT_DRCG_EN and MEMCLK registers.
> >
> > If present these registers need to be initialised
>
>
> ... for what exactly? What would happen if this was not initialized?

The BUSCOMPONENT_DRCG_EN register enables dynamic root clock gating of
bus components. So it is related to the automatic clock gating feature
that is being enabled in this series. Things still work without
initializing this register, but the bus components won't be
automatically clock gated leading to increased dynamic power
consumption. Similarly the memclk register enables/disables sram clock
gate. Up until now we've not been initializing the registers as
everything from Linux PoV has been in manual clock gating mode and
until starting to implement this I wasn't aware there were some clock
related registers in the corresponding sysreg. Additionally with
Andre's work enabling power domains it has become clear we should be
saving/restoring these two sysreg clock registers when the power
domain is turned off and on.

> What is the exact justification for ABI break - wasn't this working
> before? Or new feature will not work (thus no ABI break allowed)?

No, automatic clocks and dynamic root clock gating were not working
prior to this series. Currently power domains and system wide
suspend/resume aren't enabled upstream either. As we work on enabling
these features we are finding some things that in an ideal world we
would have known about earlier. Unfortunately it's not so obvious just
from studying the downstream code either as they rely heavily on
CAL-IF layer that has peeks/pokes all over the memory map especially
for power/clock related functionality.

Whilst it is technically an ABI break, I've tried to implement it in a
backwards compatible way (i.e. an old DT without the samsung,sysreg
phandle specified) will just fallback to the current behavior of not
initializing these registers. Things will still work to the extent
they did prior to this series. With a new DT the registers will be
initialized, and dynamic power consumption will be better.

>
> You need to provide rationale and "driver needs to do something" is not
> enough, because everything could be justified that way.

Apologies for not being more verbose in the commit message on the
technical details, hopefully the above helps explain it better.

regards,

Peter
