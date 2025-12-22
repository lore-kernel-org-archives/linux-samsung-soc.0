Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5331B3043C8
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Dec 2025 10:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766398860; cv=none; b=izOH3lWs482+ukHPmESxqTo7GbwwcBCOjyoxqDWrubAEEmaCfF0/punUzjosm5ILArY5NJVSJW/r59GLZfPb6U5ziCIh9WPRK6BS1xSjvICduV6XguvqpmmZ49ap0R7cuBHyM/mTDIa2Q1gregH5+MJDrzFpDwZ9jqBfZZ3Wc+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766398860; c=relaxed/simple;
	bh=IGX6q1EwizBQuQDLpaywg7mzFMLwjK5EiQRcSXh1QdI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WM4IH66sDplZrp3taisaL518iGl0S5pJ9vV8965XlwkT+MG9RsnAcbGl2RqrP6pC9E95c4ovjQB1GHBvjrueq2NwLwXKRvopfx2RLcmemJ21XKiS/2NV+KoDuEWn1gGRhH5tjKij4RAjPznPK9W7LwTavMFL/QjUlDkrj7UzJPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZlW+lxbk; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZlW+lxbk"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64b608ffca7so4538094a12.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Dec 2025 02:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766398857; x=1767003657; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IGX6q1EwizBQuQDLpaywg7mzFMLwjK5EiQRcSXh1QdI=;
        b=ZlW+lxbkZJmLBU5QhW+NN5Bii7GuAYKJPGGLTYJOzeafotfrNPrd+ui4Rq90VcrVIB
         /BeKYPGOm9BOtoJyi19L1ZzazcVejpUP6JvUl7I/Buf0PNx6yKmCrBZZHCNpIoVZFpQz
         B0UgAQDPmQO+FAlizpdVVQn+CTaF5oPh3BNKzAfcpaYwuQVg9Dahwm4Wrx7tMGyfEfEY
         UvT0OdMGiqwPjITGRla3Jwzyovy87mWzR1kYs5BmXyNbaW/PjR2dGLwBgDTMIXWuyT0D
         AgPx0efbB2H1TGoCRCBQXbCJOB4baxk8enI8ClSibuVvDV9EVzeijoj9Zp0vL032p2YH
         wnDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766398857; x=1767003657;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IGX6q1EwizBQuQDLpaywg7mzFMLwjK5EiQRcSXh1QdI=;
        b=Q5b1eWfFuqDfC9ejfrVjMnldhLXwdoB4DV93RG9l4hhawM7fthgRa/DMeiUeUNvR+/
         L3JZwIsSER6f7Uoy7o2+Tazv/8qqrRfVDr2P/mW6lLb+WO9hU+FPBPRVJAn57S3jec9j
         LdOZG29UMv6F6Wy2qXejlL3uNqRupjhjTmOoJ4XyobnImAJiH68w8t2/tbYib6E5KW/L
         iOLYOk3AZtEyWw1GYdHP4Ro8S/0wc4GuBFH3Hk5lg/CsyONlMTJ10W2VyMuEDT+1GAq9
         uqYaX82IXnNJA7QYTSpMLozYQMV+GbZwCZzt52CLg2G2p8WmDcXL57hdsLL5VNw1KQX3
         lCjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUtPPh5cXQXIy5S+y/8Yy7+5oklnw/x+MEmxaZozIKKeXCT3WcYZ4xbOAo9uyVgZrvRub9cAtkpvRY1D2qOzerkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCVE4AD+wZO92oe66qu1cNWSO/euIVrrWuyWTcDDLLyWt8EgwV
	CSpugha3KQiNyWXAUpU0XL8NbYGAAHJ6+poeiLw/XC90/f5QDHLxab7lfhtvxy/dxRzZC93uIj+
	RzgaxGcVkcHmanqg5vq/uWQxUXruDSPKm6lWEGtSkQ+KVOusw4EAe5Ss=
X-Gm-Gg: AY/fxX5AU6EKTYPgi0vyL6uIs8rSxmMTOq6w0EHEyU9gRQAOnpQtSj9qHw7PsrLaUnh
	rcXJZAtk07NTgFfwT2PK4FIbnWiA4sIh6AMXB2S12Fkd4381T/iVGQ/HspRgHedvafX6kJO3frb
	q17MmGZpah2YVrN3TY826vMlSxIGXjmT0flyf38Aj3HYNBNuORFwjQi19U8xinHxqjAcBVhvmZ9
	llLa9ZFF7A54fZJgZD994GHzpLausAML4pcih7wUl2locHmo42GFDL7jxdYZG4USTWC8w==
X-Google-Smtp-Source: AGHT+IEqXEGu9cvltqcnQjyMesMjaoRtKgOECBN5qmN3T1OJaLoUGgTcyks/ZkPJRdcjfHofOWpRzwLbozye182dWTE=
X-Received: by 2002:a05:6402:3591:b0:64c:69e6:ad64 with SMTP id
 4fb4d7f45d1cf-64c69e6b268mr7653426a12.24.1766398856513; Mon, 22 Dec 2025
 02:20:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251220-automatic-clocks-v6-0-36c2f276a135@linaro.org>
 <20251220-automatic-clocks-v6-1-36c2f276a135@linaro.org> <215eb434-683f-4cf2-9bcd-0860991ae23e@kernel.org>
 <CADrjBPoWcONhJJdCeovkwQ9Oha+t+dpHY_ohKPV7BQS1tougGw@mail.gmail.com> <d7a749e2-1d00-459f-adbb-0841190b7849@kernel.org>
In-Reply-To: <d7a749e2-1d00-459f-adbb-0841190b7849@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 22 Dec 2025 10:20:44 +0000
X-Gm-Features: AQt7F2okhEmetfhP-OZXD27I-iFbBBEDggeAe_X29tbibS3bKuDBCabzrOTR_5o
Message-ID: <CADrjBPpv9OB5zjsE=+dUyZCz2xSs6XXWkpbK2qbFAdUyTaXXhQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: clock: google,gs101-clock: add
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

On Mon, 22 Dec 2025 at 09:53, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 22/12/2025 10:39, Peter Griffin wrote:
> > Hi Krzysztof,
> >
> > On Sun, 21 Dec 2025 at 13:26, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>
> >> On 20/12/2025 10:05, Peter Griffin wrote:
> >>> Each CMU (with the exception of cmu_top) has a corresponding sysreg bank
> >>> that contains the BUSCOMPONENT_DRCG_EN and optional MEMCLK registers.
> >>> The BUSCOMPONENT_DRCG_EN register enables dynamic root clock gating of
> >>> bus components and MEMCLK gates the sram clock.
> >>>
> >>> Now the clock driver supports automatic clock mode, to fully enable dynamic
> >>> root clock gating it is required to configure these registers. Update the
> >>> bindings documentation so that all CMUs (with the exception of
> >>> gs101-cmu-top) have samsung,sysreg as a required property.
> >>>
> >>> Note this is NOT an ABI break, as if the property isn't specified the
> >>> clock driver will fallback to the current behaviour of not initializing
> >>> the registers. The system still boots, but bus components won't benefit
> >>> from dynamic root clock gating and dynamic power will be higher (which has
> >>> been the case until now anyway).
> >>>
> >>> Additionally update the DT example to included the correct CMU size as
> >>> registers in that region are used for automatic clock mode.
> >>>
> >>> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> >>> ---
> >>> Changes in v5:
> >>> - Invert the test for google,gs101-cmu-top (Andre)
> >>>
> >>
> >>
> >> <form letter>
> >> This is a friendly reminder during the review process.
> >>
> >> It looks like you received a tag and forgot to add it.
> >>
> >> If you do not know the process, here is a short explanation:
> >> Please add Acked-by/Reviewed-by/Tested-by tags when posting new versions
> >> of patchset, under or above your Signed-off-by tag, unless patch changed
> >> significantly (e.g. new properties added to the DT bindings). Tag is
> >> "received", when provided in a message replied to you on the mailing
> >> list. Tools like b4 can help here. However, there's no need to repost
> >> patches *only* to add the tags. The upstream maintainer will do that for
> >> tags received on the version they apply.
> >>
> >> Please read:
> >> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
> >>
> >> If a tag was not added on purpose, please state why and what changed.
> >> </form letter>
> >
> > Apologies, your tag should have been added.... got kind of sidetracked
> > bisecting the linux-next regression with the serial console and then
> > forgot to apply it.
>
> I think it was more than one tag, so I decided not to look for them.
> Please send v7 with all tags collected.

Sure, will resend shortly.

Peter
