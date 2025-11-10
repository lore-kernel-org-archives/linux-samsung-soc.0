Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B395C30FC19
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 12:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762779185; cv=none; b=TAJSXBZLsVLEulAymlQOUDbb9tvFwxJ3cSgILjpJ4p5tL3Kj+lz0VD8rRtBN6q0rr6ifEVUiFHQT2zJWdTyUPepktFvxNWNYcrFUuitMh0ad4DVeP6naHEK5FqRAqXd0Ir7McDOT0kwR//cWCfpwQgDFmLd33gnF/C533oCogf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762779185; c=relaxed/simple;
	bh=lajD8QJElBkHp+szQMp4lvfntXaq7B2csoiFGrMzr/8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UAeBq+OmvgFVYTOAnJ6lukbn9oXHZm+v7wqn0QyWPxd1ytStWZ4wMhjL0M/WCHbcvu8XnP6pHMKQuPgHcK3SObPIb0i/pSVxAo2Lx5AZewbPzM/YfhcqCo0sklNzlgNby58+OpO6eFjI9Kvmt7xM4rku2Je/lfTdfiNeV5O+zFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pHAuyUbP; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pHAuyUbP"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-653652a4256so1308017eaf.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 04:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762779183; x=1763383983; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lajD8QJElBkHp+szQMp4lvfntXaq7B2csoiFGrMzr/8=;
        b=pHAuyUbPTRgXF6gAyhV8JVy7+EDCorUsZr9eGAo/TITyvpDhI1fXmNQU5oIzJlPQtl
         +Tq+4arshPmQNek2fkonRGxqSqJYlhxpZ1TRy2SsyMwL6dwDtkkTIjCWJ6S9Nfq1C8xt
         X5cSR6XyI+b+5nZSLyX9rqdq5a9VBpVp5BBIQQfnEX9fitosoxpIz24ADV3KXortYbl8
         yxDdW1OYcSBH61IUagKk5zW4GjE5fxgf/hXxSJzyK8jVYPtsYf80RDMPb6WyaXfoJ5MV
         a9Ku5JpyQZA66zbTkcPvsvG2WtvhaKtwRN4H80iw8QP9yYbSpIrk5Tl84oQF2a0gEG3i
         8eOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762779183; x=1763383983;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lajD8QJElBkHp+szQMp4lvfntXaq7B2csoiFGrMzr/8=;
        b=AL/j39ih4kJpfDnyqFwrnilIO10L6czrDe4CF+oj2JuaAwKlPgo9YZbQ2rlmsB/A7s
         wrfKGECM6Bt25KnLpSfl0JA0QKSXt3F6kfDdotD/XKYfnzUDMw4ib/t9l4g9OchB+f6G
         GMsPx0cwrDissi0C0PXf95KZfshK9Dco7EglsFY7nnyaqEdluBqU883Dv4Sh4ZAPkPgL
         Q1GhLcGSWwh2LkYZTkV9uNmIVfIFa31UL3BA/qvsEqJ5qzr0W0PLDzjKas6ha4DWkuA0
         mgTLTfHHk1BUBBSo82FSYPiYWzm/l+HN31P5E92uWJ7buxI3Yu9vfkju6f6YrkCy4Kam
         QYuw==
X-Forwarded-Encrypted: i=1; AJvYcCWE59Eo59NnB3I/+N4yL45ZrE7Md1HiTdfkYdGXdlrSeCyxFkNQIlvbG27n95KstqM5Qnq94XLKb7TpVtLZ6vkxQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyU41FojNhpWge6phfgBVXGPWKY3SJ1Ks0LPgB7uSUIFiBfAsgI
	KfZ46R1zbaJ2+PklPrtZtw5CfFCvAm55W7K+/tJ6F1EEw8+87v6QOJfxHLDKz2vx/qVIHeiY6qH
	toIYkc4zhdGavPcnMeqZbLEw5aAsIDQk/JGmwMyTBvA==
X-Gm-Gg: ASbGncsFrc0HF/2rsV6KntgnxCD8utHsJgEp+CwDOftTHHMMgbmso147KqcJCnWwlFJ
	x9BFLIwOQ+x7drANfCxbjcWhR6xJEaYz/3iFqyqtMeL9vprlTkCxB4vtXff2Vuj2nKpSXSZ1kw0
	bbOqDpMhJyKD1pc1ivxlhv2kBUSVSPaR9A334JJdiyHgCnVSE55B8Ta9cZfvDfT08gZTay9VqyW
	rv4t8/oj9bPJseLeL6NpE8NYp2TXHaAuYGoaeyaI6plDm3mrRSBWcuNOCug
X-Google-Smtp-Source: AGHT+IHaOc9Hf++xJ77n1T9F3eaANxA6a255QvjbOAcsfDAumQrnMbLyVAX5itd8dNhL35m/2iP5WQb/9KW6fxXbd5k=
X-Received: by 2002:a05:6871:60c:b0:3d2:fddc:862c with SMTP id
 586e51a60fabf-3e7c2452b4cmr4340908fac.7.1762779182758; Mon, 10 Nov 2025
 04:53:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251102-automatic-clocks-v3-0-ff10eafe61c8@linaro.org>
 <20251102-automatic-clocks-v3-1-ff10eafe61c8@linaro.org> <20251103-smoky-rustling-bloodhound-7590ce@kuoka>
 <CADrjBPpjX_qSehbNkaAG03f=whs09qFzzgNiY3sztk7v0QeCFw@mail.gmail.com> <20251104-enthusiastic-cream-gibbon-0e7b88@kuoka>
In-Reply-To: <20251104-enthusiastic-cream-gibbon-0e7b88@kuoka>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 10 Nov 2025 12:52:51 +0000
X-Gm-Features: AWmQ_bmYJGLwRqlUrf73Sc1rVwj8QxtUbwqaYUkACotkTBe74SIkf0KWHru_6Ms
Message-ID: <CADrjBPpGt3qBGucF1COWZT=OZ+8ithg6=-QefhKUiW4tkC=KrA@mail.gmail.com>
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

On Tue, 4 Nov 2025 at 08:11, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Mon, Nov 03, 2025 at 01:49:53PM +0000, Peter Griffin wrote:
> > Hi Krzysztof,
> >
> > Thanks for the review feedback!
> >
> > On Mon, 3 Nov 2025 at 09:41, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > >
> > > On Sun, Nov 02, 2025 at 08:27:14PM +0000, Peter Griffin wrote:
> > > > Each CMU (with the exception of cmu_top) has a corresponding sysreg bank
> > > > that contains the BUSCOMPONENT_DRCG_EN and MEMCLK registers.
> > > >
> > > > If present these registers need to be initialised
> > >
> > >
> > > ... for what exactly? What would happen if this was not initialized?
> >
> > The BUSCOMPONENT_DRCG_EN register enables dynamic root clock gating of
> > bus components. So it is related to the automatic clock gating feature
> > that is being enabled in this series. Things still work without
> > initializing this register, but the bus components won't be
> > automatically clock gated leading to increased dynamic power
> > consumption. Similarly the memclk register enables/disables sram clock
> > gate. Up until now we've not been initializing the registers as
> > everything from Linux PoV has been in manual clock gating mode and
> > until starting to implement this I wasn't aware there were some clock
> > related registers in the corresponding sysreg. Additionally with
> > Andre's work enabling power domains it has become clear we should be
> > saving/restoring these two sysreg clock registers when the power
> > domain is turned off and on.
> >
> > > What is the exact justification for ABI break - wasn't this working
> > > before? Or new feature will not work (thus no ABI break allowed)?
> >
> > No, automatic clocks and dynamic root clock gating were not working
> > prior to this series. Currently power domains and system wide
> > suspend/resume aren't enabled upstream either. As we work on enabling
> > these features we are finding some things that in an ideal world we
> > would have known about earlier. Unfortunately it's not so obvious just
> > from studying the downstream code either as they rely heavily on
> > CAL-IF layer that has peeks/pokes all over the memory map especially
> > for power/clock related functionality.
> >
> > Whilst it is technically an ABI break, I've tried to implement it in a
> > backwards compatible way (i.e. an old DT without the samsung,sysreg
> > phandle specified) will just fallback to the current behavior of not
> > initializing these registers. Things will still work to the extent
> > they did prior to this series. With a new DT the registers will be
> > initialized, and dynamic power consumption will be better.
>
> So explain that this is needed for proper and complete power management
> solution on this SoC, however that is not an ABI break because Linux
> driver will be stil backwards compatible.

I'll send a new version shortly with an updated commit message like you suggest.

Thanks,

Peter.
