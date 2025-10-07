Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3D221ADCB
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Oct 2025 19:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759864030; cv=none; b=bnN9X0CgDr88drLd5c58Xddg7+sJsPPbYnJZFEFbcLJ/pjn7ebaR+V/IdyEV5paOGc/DgY1onBookMKYfwLHywLAsTk2oMAG9Cn5nr3TJyE7JOCjULJwpXatZLMRC0i6dHa3DmVNa7TFzcbX2hT+PGSdPzFR4TxV0Pz9oCMMgvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759864030; c=relaxed/simple;
	bh=oW4P1sn0WRvjSmxNJBgf4iF9/kJoF6IXu574tDnahP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GivC9x3vIXhV5T5XK02usbqnjoLae6fCR0bHCfbmaWG53N0Ob94MS8V7r5qCWtlTTXY7oZlSCayqlBtiIlvrhW5xC+1tLCrTUQdVj5rbZI5/RVNuuiQOTKvWmjc5N6HBOdSX0044PLeZrnYCCoAuwy6QDcZWJyXT9vf13C8tf6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VynVlLQz; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VynVlLQz"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-6352c8b683eso8548004d50.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Oct 2025 12:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759864026; x=1760468826; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7iUti3RModmlHi7jtpIcdt26BPjskgCGc5piTAZQzxA=;
        b=VynVlLQztGZVyIckPrhuQJ++lotTVbgQFIvI1wrUd18F61wEJ1s1HChMnFKOJAdl9f
         XZmUCUJS64DSwV2wBstrKLf9ckM+78R6kXVjvhQ+if9bDs51iW6u9xs8/3eskZc45Vxt
         PGYzi6dekcFrcDKUef1zdOXn4IdExMTnj4/N5MP9bI2KLjftrGpYxwLs3ScPEGMNJlp+
         pZGIvQP+QGhsRuVroF46sjVTd4mOdCdwjUO/hc1BiH7+mlJ75D84tnxIJTAr5/7AIeSK
         V/YgG+SlxFifFkDLjb+x9tmklqbGw+G+cjU/E5N7x1QkPhbc5p9QmnOl21uuUTNri/0x
         tp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759864026; x=1760468826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7iUti3RModmlHi7jtpIcdt26BPjskgCGc5piTAZQzxA=;
        b=ZQu2As7kZFvb0cIZ8TV/NRV5joociu6B+T5f4RVKGL3QbQ9M8AUfncr3tcOD+DBmSK
         FdST8VCrsLK8PEZ8l0YfLaZcevr2+YCVAyFkp5PIjodlnYbbqWk2UQgB9l502nYX4g3c
         f/r3M8ePPStxHL9i6UrGEc/evFAdWKyHhpCavNr+JJLqGSZTzPjf/rowgUMwdciwkA4A
         t8MU0l/FUWfBNrSVlWhWzBDinujBmp3jmATWdwTWbQnQbleUHXem1x+VWACdfNK8qiOu
         9jUIQl5UgGe7aHb9dPUWfQ7lnJGmdRztpuJwqQJHTo7opbo/MA8vtPGk8zU5RNhtCpjN
         yG4A==
X-Forwarded-Encrypted: i=1; AJvYcCUaC6TpsmWhEGBr3Z9RnsKxw97+crcuzjxzvyIo/J1R7kKTRIh+2QCC4ERgCyk0rz18/JDIvplbRZXAXWVqvsGbFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIACLR+aQw8q/6DnBbr7gHjzB0n5ifT4U3H7qpVn1nAVxu5RAZ
	BKwnniymgWOPN/7JXMeM6aXmAafba0we8vO5tdqEeO9pmbGn41flZAVt/QfOH5aUtdGYrw+PqJy
	zZemGrLIvFRTTdkwaewAdN0JJDgfQ/dSrW9uwDoabwQ==
X-Gm-Gg: ASbGnctNcRZkHXlA0J2WaohEGfAZzkDQciALRaIzP2VElEQLeVRe5Aj0OoZPrRBy1T+
	MVGR/0PHEi/lS843LAOhewqsVVwrxtqrY8RRVTGOcFt8SaTwHCOCCqz6tLsHg4rVImOrbFFEL2R
	/3uXo6TncuMcn/XN6mQ75MysUE3P/9hpnlm3jQsHL/nPO0aPdbwLz1eJJWHVk6hr3CoJ/FH1h4M
	o5YYhfud4To11/EXpBJ4Y292Ak+NoMWdQ==
X-Google-Smtp-Source: AGHT+IHGabCWkJ+CSgQuNpDDGJm5CBq1o8eRFzjGkU0N7AFW1WICocRBQKTnUVXzNlv6ZZDS/IDRlDvAToOZJFwsXgE=
X-Received: by 2002:a53:c64b:0:b0:629:ec90:c446 with SMTP id
 956f58d0204a3-63ccb8240e3mr675987d50.12.1759864025589; Tue, 07 Oct 2025
 12:07:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251002-gs101-pmu-regmap-tables-v1-0-1f96f0920eb3@linaro.org>
 <20251002-gs101-pmu-regmap-tables-v1-3-1f96f0920eb3@linaro.org>
 <CAPLW+4nvuGd8AoDKK1VdF2pabCHzjgYHRJkYrcncRt4s=qt8Dw@mail.gmail.com> <2c36d66dc3eaf8f0f9778dd6a1d45806e7d9bcdd.camel@linaro.org>
In-Reply-To: <2c36d66dc3eaf8f0f9778dd6a1d45806e7d9bcdd.camel@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 7 Oct 2025 14:06:54 -0500
X-Gm-Features: AS18NWBO7FvM4SL8eDmLZftkdQk-t8hGwCLxZkF8ye__N3jbcGABazPA6EkFfAk
Message-ID: <CAPLW+4mmbtFvdyijMQ+xG1S_FQeZyHt+cYJgycWTmpsnNNmamg@mail.gmail.com>
Subject: Re: [PATCH 3/3] soc: samsung: gs101-pmu: implement access tables for
 read and write
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 6, 2025 at 2:06=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@li=
naro.org> wrote:
>
> On Fri, 2025-10-03 at 13:24 -0500, Sam Protsenko wrote:
> > On Thu, Oct 2, 2025 at 5:33=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszi=
k@linaro.org> wrote:
> > >
> > > Accessing non-existent PMU registers causes an SError, halting the
> > > system.
> > >
> > > Implement read and write access tables for the gs101-PMU to specify
> > > which registers are read- and/or writable to avoid that SError.
> > >
> > > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> >
> > I think having "Fixes:" tag would be justified here?
>
> I decided against, because IMHO it's not a bug fix as such, it's a new fe=
ature.
> >
>
> > > ---
> > > Note there are checkpatch warnings 'Macros with complex values should
> > > be enclosed in parentheses' and 'Macro argument reuse' for macros lik=
e
> > > CLUSTER_CPU_RANGE(). Since they are used in an initialiser, the only
> > > way to get rid of the warnings is to avoid the macros and duplicate a=
ll
> > > the related register ranges I believe, which I'd rather not due to th=
e
> > > sheer amount of similar blocks.
> > > ---
> > >  drivers/soc/samsung/gs101-pmu.c             | 306 ++++++++++++++++++=
++++++-
> > >  include/linux/soc/samsung/exynos-regs-pmu.h | 343 ++++++++++++++++++=
+++++++++-
> > >  2 files changed, 640 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/drivers/soc/samsung/gs101-pmu.c b/drivers/soc/samsung/gs=
101-pmu.c
> > > index b5a535822ec830b751e36a33121e2a03ef2ebcb2..5be1cbfa58c95e466bbdf=
954923f324f74460783 100644
> > > --- a/drivers/soc/samsung/gs101-pmu.c
> > > +++ b/drivers/soc/samsung/gs101-pmu.c
> > > @@ -8,6 +8,7 @@
> > >  #include <linux/array_size.h>
> > >  #include <linux/soc/samsung/exynos-pmu.h>
> > >  #include <linux/soc/samsung/exynos-regs-pmu.h>
> > > +#include <linux/regmap.h>
> >
> > If you decide to add this line to exynos-pmu.h (as I commented in the
> > preceding patch), it can then be omitted here.
> >
> > >
> > >  #include "exynos-pmu.h"
> > >
> > > @@ -19,9 +20,312 @@
> > >  #define TENSOR_PMUREG_WRITE            1
> > >  #define TENSOR_PMUREG_RMW              2
>
> [...]
>
> > > +#define CLUSTER_NONCPU_RANGE(cl)                                    =
   \
> > > +       regmap_reg_range(GS101_CLUSTER_NONCPU_IN(cl),                =
   \
> > > +                        GS101_CLUSTER_NONCPU_IN(cl)),               =
   \
> > > +       regmap_reg_range(GS101_CLUSTER_NONCPU_INT_IN(cl),            =
   \
> > > +                        GS101_CLUSTER_NONCPU_INT_IN(cl)),           =
   \
> > > +       regmap_reg_range(GS101_CLUSTER_NONCPU_DUALRAIL_CTRL_IN(cl),  =
   \
> > > +                        GS101_CLUSTER_NONCPU_DUALRAIL_CTRL_IN(cl))
> > > +
> > > +       CLUSTER_NONCPU_RANGE(0),
> > > +       CLUSTER_NONCPU_RANGE(1),
> > > +       CLUSTER_NONCPU_RANGE(2),
> > > +       regmap_reg_range(GS101_CLUSTER_NONCPU_INT_EN(2),
> > > +                        GS101_CLUSTER_NONCPU_INT_DIR(2)),
> > > +#undef CLUSTER_NONCPU_RANGE
> > > +
> > > +#define SUBBLK_RANGE(blk)                                           =
   \
> >
> > Reusing the same names for different macros seems a bit confusing. But
> > that might be just a matter of my taste, so no strong opinion.
>
> And I OTOH explicitly picked the same name because it's the same block, j=
ust
> for r/o instead of r/w :-)
>
> [...]
>
> >
> > That's quite an extensive list of registers! Does this PMU driver
> > really have to cover all of those?
>
> That's what all Samsung PMU drivers do, it's the PMU region after all. Al=
so,
> in the gs101 case, only the PMU driver knows how to do the secure access:=
 Various
> other drivers have references to this PMU regmap, e.g. phy drivers for is=
olation
> (USB & UFS) and upcoming PD driver will do too. We don't want to reimplem=
ent
> secure access in all of those.
>

Ok, thanks for explaining this.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

> Cheers,
> Andre'
