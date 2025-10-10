Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2E61F0E32
	for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Oct 2025 00:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760056611; cv=none; b=OMDA3Kx6ZeuIeMs/4LlM0ilIB+YG/4wPdM7tK2s51eKrIvj6Nxkq7jsN3p39ajcGxL9V9bAQMt6mIIXRbLC2ETrCL4iNFLwyuEonjRCA3+PNnadOt2at0oUfl2BdGZEgWVpJskS2Wox/erZIeRRpbrdhSlZj8gULu2iw2TVmKBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760056611; c=relaxed/simple;
	bh=VgIiVYfPPanTe5NtANzBkqzLHFkkV0yvS73sEK/bvBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tpsx90n9V6gpfkzudTY74+8AegG6sJnwK8P3e9LbzJ6qDwIhTF9jllx8mN2OTvt7oO39HyJK/iprgV+mjbTI1nxtRpZcnIA/1GrbV0CUwnvC1FFesPDaORn6tCYYIWAuEcCRQKAnGpaMlV5iZteMhY5AcG+87pHvd/B/LdGScaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rO42QQgp; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rO42QQgp"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-330a4d4359bso1329342a91.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Oct 2025 17:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760056607; x=1760661407; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3uYueVCnhFig6wd4EAi1d6+7+lqgnd7MHxpQ+CybGP0=;
        b=rO42QQgp+37nHbrYxbftDewtXDy7DpYyhJn24Vnh5sH8dXxBj8MCcr1jQhz+jMM09G
         2N+ac3oN+pObcRF2xtEoHqFWero3qJYcZlIQGHzUucOlWhvyOwFelulTr5SmOeyhPRTs
         tS2LAYmYr9i5bPdTuC9skNf9ptAVEEoXTdAmgnYNtcvqZrSAG/ca/s/c+MwEt/f4Ov/N
         gY/SjQPSUMntvOrJm97k6so7VERolXVXUAbUBxryjhlA7m0YEO/S9mmgD9fVLbUNON1s
         prew8aVnuHYdEq4hh3gGqskJOSRWdHBgRQxXbtYZOhJzlDOlDs9VEkhi48blczHoc4qa
         VPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760056607; x=1760661407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3uYueVCnhFig6wd4EAi1d6+7+lqgnd7MHxpQ+CybGP0=;
        b=kr6Dtt5r+B1TkYnlCcDPduIkNUzfRbhurIMsjlPq9kMzxGsFfQaRvsTEBklysDDIin
         nrGh9FTDye2LckXr3luCVh2zy1fD0Ak5Rggl5Klb33UAPXCjkszt/ElgBO2lRuHU+BY2
         gYDGxPqUJwdZC2nlEaJMxexRr6Dw7ydVwlyqchyJnZ+FQd9Bjx3BQAwTn8l4N5lfzo7B
         Ve2ccYll0C2oFir8UmXBz8IlVsxtUvs3ivUmht1p25Ol8IBg0LiShigVo9sFwB3ZQipK
         IGtLywqQxVrpWwj/jRbHsOH7hVpqMlMdsSMlt6hFSE/BkVWQfPdOhdhj23tgPKaMZJRW
         3RtA==
X-Forwarded-Encrypted: i=1; AJvYcCX/9S8FBj1Gv85rPI+SoEi5AS1r4/eaOpVV22+WsdwOq+X4pqYi4X1hILt6xBEO1XaY5cPvd4y74d2Ez5DBKDNrBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxowoYtez972t6b4YLKzsAag3f7kl+e5F6dwEdFAm8yahkgvTYd
	lRKfEsLGfP6QxgYFj9e6i1I+HWpDB8llcTDjoBX+MHbuIMaGhsX1fLesAWXnSN6WjAmY9QRWQFe
	i3WlyEZMGmvEGQF1XgF6BRUvDqdcfOBgMnsSm8F9I
X-Gm-Gg: ASbGnctiIyVKCg0ZJbO4zsoOxtlq4wiywNwo86SBr6/l6KZuRJMObLun/+gkTaeSlfZ
	3OutLsaaHa6wju3lzs6L+iS1rsKfAzxrFtmzOGZtRe0Kp9jX3LKnZ2Utj8JX7ZyghI6uaLfKF3a
	iRSdN71j7Dj5sbKfrdMgFVFtOV21dPULKYWoqI1Dh5jvw8KAvIyZSceeJaKrooxTLzaU2dLS8H3
	PVg3yHiwi2nQ7PaP72I8GCzPl1Y5JCrVF76b70=
X-Google-Smtp-Source: AGHT+IGKjXjPSXyUWNxjvvey/PIj1qEWv3CW3/XJrVZRUI28DQ4Y1brYwXDEUls30Lbe70Hr5PouwmW4vqkFNVZptJA=
X-Received: by 2002:a17:90b:1c0a:b0:32d:e75a:5009 with SMTP id
 98e67ed59e1d1-33b5114d4f2mr13047772a91.1.1760056606410; Thu, 09 Oct 2025
 17:36:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008060000.3136021-1-royluo@google.com> <20251008060000.3136021-2-royluo@google.com>
 <20251008-slider-uncombed-66790ea92ea0@spud> <CA+zupgxnBK_k2X0_KKX9pUMMTwY4VhsyTEEVz6v+__u=2xR8Ow@mail.gmail.com>
 <20251009-lizard-slapstick-4de7dfe2322d@spud>
In-Reply-To: <20251009-lizard-slapstick-4de7dfe2322d@spud>
From: Roy Luo <royluo@google.com>
Date: Thu, 9 Oct 2025 17:36:09 -0700
X-Gm-Features: AS18NWDGN42gjmrB8C6_VuH2yevkuUM_X9h5rPKcbGr2ZgBfcB7UAfagMIfSoXY
Message-ID: <CA+zupgwAXQEuhZUqbjxOC+9HbRG3SQ-_fhEX-49NpfCgqO4BZA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
To: Conor Dooley <conor@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 9, 2025 at 10:13=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Wed, Oct 08, 2025 at 09:40:57PM -0700, Roy Luo wrote:
> > On Wed, Oct 8, 2025 at 1:58=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
> > >
> > > On Wed, Oct 08, 2025 at 05:59:57AM +0000, Roy Luo wrote:
>
> > > > +allOf:
> > > > +  - $ref: snps,dwc3-common.yaml#
> > > > +
> > > > +unevaluatedProperties: false
> > >
> > > So every property from snps,dwc3-common.yaml is valid here, with any =
of
> > > the permitted values?
> >
> > Conor,
> >
> > Appreciate the review.
> > Ack to all the comments, will fix them in the next patch.
> > And yes, every property from snps,dwc3-common.yaml is valid here.
> > You can find more context here [1], essentially the dwc3 glue would be
> > operating on the same platform device as the dwc3 core, hence all
> > properties are allowed.
> >
> > [1] https://lore.kernel.org/all/20250414-dwc3-refactor-v7-0-f015b358722=
d@oss.qualcomm.com/
>
> I find it exceedingly hard to believe that every property from that
> file, with every permitted value, is possible. AFAIU, the tensor g5 is a
> phone chip that's only used in pixel devices, not something that people
> can just buy and integrate into whatever device they feel like. There
> should be a vanishingly small number of possible configurations,
> possibly exactly one configuration. There are dozens of properties in
> the dwc3 common binding, of which at least 10 are for "quirks" or other
> sorts of hardware errata that are not going to be variable from one
> phone to another.

To my knowledge, the properties in snps,dwc3-common.yaml can generally
be categorized into two types:
- Function knobs: These properties translate directly to register writes th=
at
  modify the controller's fundamental behavior. Most quirks fall into this
  category. For example, "snps,gfladj-refclk-lpm-sel-quirk" enables SOF cou=
nter.
- Tunable Values: These properties also map to register writes to influence
  hardware behavior, but they typically adjust performance or interoperabil=
ity
  rather than essential function. While the hardware usually works fine wit=
h
  default settings, these values allow for optimization. For example,
  "tx-fifo-max-num" usually affects data throughput.

For DWC3 hardware errata and workarounds, my understanding is that they
are typically handled within the dwc3 driver, often involving a DWC3 revisi=
on
check (e.g. [1]), instead of in the device tree binding. While you may find
properties related to errata, they generally serve to enable or disable an
existing workaround (e.g. [2]).

For Pixel devices, it's shipped with a preferred configuration, but the har=
dware
is fundamentally capable of supporting other configurations since the prope=
rties
are backed by the SNPS DWC3 IP. Whether that's optimal is a different story=
.
I haven't tried toggling every single property but I'm not aware of any pro=
perty
that obviously does not work on Tensor G5.

I hope this addresses your concern.

[1] https://github.com/torvalds/linux/commit/32a4a135847b1e600c64756b7c7c7a=
91eb2f0aa9
    (sorry I'm unable to find the kernel lore link for this commit)
[2] https://lore.kernel.org/all/1509455515-5992-1-git-send-email-rogerq@ti.=
com/

Regards,
Roy Luo
