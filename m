Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AADA275AE6
	for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Jul 2025 10:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753438883; cv=none; b=Q3mSrf9Vp7gMmYZsC8uCmXhJO6RzyiTuB6sIbdS4TSSTuD7DigWLmJD0IPOdKwOkewGvEtacQZUx3JG5Ee+LQZdEIAigjPtfg3jAkvqVRnjw37wFIQhrTwrEbedGn64k7naOTcbUyVM4l9OJjl/CW92HXqkAGQAELFANmBpyzPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753438883; c=relaxed/simple;
	bh=+nA4DaK0/FsPZxdvRCZ9nWnPFwYeZBxMRceQvfp25tg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sgCZqje3m9v8rz/CHZh7J5mXbUX9+YXn6oND0IAtiHp8RLn7nlSIXiWhRygd6HX+7VbSj5kTH+HVb+dMr3uQUREnCkDHPv9BqCxuz8SXzjruZtlT9XLaSmwRQjgQ9UpopT958Apuoo3GrYRklvNuteQLqAQy6/usM6Ozjmuk5Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j/JVX9PJ; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j/JVX9PJ"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-30174a93186so1390851fac.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Jul 2025 03:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753438881; x=1754043681; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h+W8o1tXdHgTSySdRh3T8J3kSRDgzM5YrIz/Xilyxtc=;
        b=j/JVX9PJJZ3mbgrExwJKkSI3Jjl20phaESIeI/kAyej7eZjKmpHIY5qvEfq0z8KWTm
         WT8xv8OYgnJQqpVz1ZaURWZdXPaEr+GPM2rC4i9ntUIENvnrwnhrlim7y1JJBRzwXnEu
         PJJcOFaTA9e+N+KRVXZFQfVqhMrr/RlJeuAgpiQNCwx9kFFAk7pef0LKfYK7fuv+ihGD
         F9YILw8d0dwUJUAcjDuYA728nbwbTKmcDKKPbEK7bTye1Ir6fjHCMh5MFaH+heBlIIkJ
         TpEuTD2psyv8v/ia89tx3exifLMD0Q38/cbyQdsiKTZSz5nS3EAMR5VT6GboOafwgUN+
         jkig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753438881; x=1754043681;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h+W8o1tXdHgTSySdRh3T8J3kSRDgzM5YrIz/Xilyxtc=;
        b=GMSpPjXgkr4uyYZ6YNi3R8wtHKtz+TFVFbjLm8BuJ0pwkE0S6Ifi7NQ+7vADm+65Rb
         rJGiSMv44m92CgpamNy8gHiCYhDxBgO1YNbBqTwetgg7hZcp8MFXoTzNuKiA44bjb017
         Fpqg1EWrKRGN+m7M6RTIe4N8gkGAbanlcyif7RxToUbLCoYdWly+OIrQzvMEs6VoL5EG
         YmbcbOaIFRBEilfw2ITrvCnjDxml8eudvq1fqWH5lPsS0SShJtLkLxq7+n4Itt4lw3iu
         XCpirgcsshOlvvMrP+1JQkqRXAY9Sw4z5KS4aprt+CChe20wzU3zDAaSR7i6vm0VqQAq
         DGsw==
X-Forwarded-Encrypted: i=1; AJvYcCXby20Bix2lYQqyPG5P0DNSVE31SCwjocZswe4AZSaYo6aCrAspxZJkUtKb5zsUECnl3rgLxH04IBQoFwCB1rGi4g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb940ecd4ku6OSacRUfCM0hmzoRfop2Du42w9bRhW7pEwdJ40L
	15szxoMrT989zuScuRJpTtSCgpMlirepOW/I98W1R2MChagREEZwNmqaZfk/xAYdnAAL4oSZADG
	5Eg3wPWEYXtSgrrMZ9cLxV7zN5WH923UfMBdPGqRbjQ==
X-Gm-Gg: ASbGnctVfKfm4JUuTUPxYmnWWuB2WcTYIYUC8GwvESAqEndAAFIu+qO9G+EyROBwnNB
	82FzOhXznKepuy3Yf8VFQOhr5hTNp+qEH+nifO3Dj6r8Wx1/LVhhjax0Tp/7ujqiJZ5k2e0bZ/u
	7XOoEeRL0IOmG3mPri4uM0LMaUZ4/q17e3FC5Hek8W+h/PEP6lPp/qLuBrZCUSSRZVmV1QsroHF
	zvIlbCG
X-Google-Smtp-Source: AGHT+IF4IPPeqGE8IrCql8xlUV+MwQLcQZYEPRKBMxQR/S2iO04ByExRiRrPSmHU2qswauG+HfoP94tz8CGpjmGBGP0=
X-Received: by 2002:a05:6870:b98:b0:2bc:7e72:2110 with SMTP id
 586e51a60fabf-30701d11d29mr708886fac.13.1753438880979; Fri, 25 Jul 2025
 03:21:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703-phy-notify-pmstate-v2-0-fc1690439117@linaro.org>
 <20250703-phy-notify-pmstate-v2-1-fc1690439117@linaro.org>
 <e2lhm237c3xtbdjux2wuesq5fwu7nky3w7oq2fnsgn2pqcg5kh@xhxktriooyes>
 <aICKM-ebp9SMAkZ_@vaman> <yaz4ozb55t3pkwd2gj4l4d2hdspdcsqjm2dfsux7lfdxy6lxjl@uae2qz2vjo64>
In-Reply-To: <yaz4ozb55t3pkwd2gj4l4d2hdspdcsqjm2dfsux7lfdxy6lxjl@uae2qz2vjo64>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 25 Jul 2025 11:21:10 +0100
X-Gm-Features: Ac12FXxv6c8kZOcLBybYFZLsdsetcBPXWMr6v-O5jaqEZC0sK8Rly_5B_kDSrns
Message-ID: <CADrjBPpE0ab3MD6tAS-JQns1HaPfmngRhixkUpqqAfj_2D5nmw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] phy: add new phy_notify_pmstate() api
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, kernel-team@android.com, 
	William Mcvicker <willmcvicker@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Vinod, Mani & Neil,

Thanks a lot for the valuable review feedback.

On Wed, 23 Jul 2025 at 09:04, Manivannan Sadhasivam <mani@kernel.org> wrote:
>
> On Wed, Jul 23, 2025 at 12:37:31PM GMT, Vinod Koul wrote:
> > On 22-07-25, 22:04, Manivannan Sadhasivam wrote:
> > > On Thu, Jul 03, 2025 at 02:03:22PM GMT, Peter Griffin wrote:
> > > > Add a new phy_notify_pmstate() api that notifies and configures a phy for a
> > > > given PM link state transition.
> > > >
> > > > This is intended to be by phy drivers which need to do some runtime
> > > > configuration of parameters during the transition that can't be handled by
> > > > phy_calibrate() or phy_power_{on|off}().
> > > >
> > > > The first usage of this API is in the Samsung UFS phy that needs to issue
> > > > some register writes when entering and exiting the hibernate link state.
> > > >
> > > > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > > > ---
> > > >  drivers/phy/phy-core.c  | 25 +++++++++++++++++++++++++
> > > >  include/linux/phy/phy.h | 25 +++++++++++++++++++++++++
> > > >  2 files changed, 50 insertions(+)
> > > >
> > > > diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> > > > index 04a5a34e7a950ae94fae915673c25d476fc071c1..0b29bc2c709890d7fc27d1480a35cda6a826fd30 100644
> > > > --- a/drivers/phy/phy-core.c
> > > > +++ b/drivers/phy/phy-core.c
> > > > @@ -520,6 +520,31 @@ int phy_notify_disconnect(struct phy *phy, int port)
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(phy_notify_disconnect);
> > > >
> > > > +/**
> > > > + * phy_notify_pmstate() - phy link state notification
> > >
> > > 'pmstate' doesn't correspond to 'link state'. So how about,
> > > phy_notify_link_state()?
> > >
> > > s/phy/PHY (here and below)

will fix

> > >
> > > > + * @phy: the phy returned by phy_get()
> > > > + * @state: the link state
> > > > + *
> > > > + * Notify the phy of some PM link state transition. Used to notify and
> > >
> > > Link state change is common for the PHY. So remove 'PM'.
> >
> > Is it really link or phy state?

I think it is likely both link and phy state.

Looking at the wording in section '9.5 Hibernate' in mipi unipro 1.8
spec we have phrases such as

9.5 Hibernate "Hibernate is a UniPro state in which the PHY is in the
HIBERNATE_STATE, and the UniPro stack keeps only a minimal set of
features active."

9.5 Figure 99 describes Link hibernation where one Device, typically a
Host Device, initiates Link hibernation with a peer Device.

9.5.1.2 The local PA Layer receives this request and places the M-PHY
Link into hibernate using the PACP protocol (detailed description of
PACP protocol can be found in Section 5.7.7). Once the PA Layer has
successfully hibernated the M-PHY Link, subsequent layers of the local
and peer
UniPro stack (L4 to L2) shall be hibernated by the DME by sending a
<layer-identifer>_LM_HIBERNATE_ENTER.req SAP primitive to the
respective layers.

> >
>
> This is a bit of ambiguity. But as per the spec, Hibern8 is the low power state
> of the M-PHY and Unipro controller.
>
> Maybe, phy_notify_state()?
>

phy_notify_state() seems like a good name. It might be better suited
for other peripherals as well rather than narrowing it with link_state
or pmstate.

Vinod, any thoughts on your preferred name?

> > >

> > > > + * configure the phy accordingly.
> > > > + *
> > > > + * Returns: %0 if successful, a negative error code otherwise
> > > > + */
> > > > +int phy_notify_pmstate(struct phy *phy, enum phy_linkstate state)
> > >
> > > I think you need to use 'int state' and let drivers pass their own link state
> > > values. You cannot have generic link states across all peripherals.
> >
> > I would avoid that, people start overloading this if we let it keep
> > open! I would like to avoid the api -(ab)use
> >
>
> Then we will end up with peripheral specific enums in include/linux/phy/phy.h.
> If you are OK with that, fine with me.

Ok I'll add peripheral specific enums to include/linux/phy/phy.h in
the next version.

Thanks,

Peter
