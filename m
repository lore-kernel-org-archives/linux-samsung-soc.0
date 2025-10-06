Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342DB44C63
	for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Oct 2025 07:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759734393; cv=none; b=BWv3/xKhZtXbiicpePWOH+G3WYw7HNEQpQP4wCMCvRjm7/UbfUqXm39icEC5+t7/G8Jm6UFBXr4uNY38kfrsybnJv18yb9A2Rsh8NyvDlz41jw1FDf+txml451NQaoHcJrhXTOT46B6hp1OKajzenPaZIfB2+ye4Y6LI0aeEGYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759734393; c=relaxed/simple;
	bh=HuSzaxHt2WjkCZsaacpzvkRWkgXa3kCzT0kK4JkGdSQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RC3YX1MkcXp3Ewxo2tPDfmlXFyzDVqFzA/oswIxMisC0Q7rjTjxeNMS6KPm0Zi1C3fDoDkoBtgK2JFb+AmwUXA7htzMJI6wIDSO39GSdj7qMqSTNQ6Aj6IV8t+20A5ExX4aDZ30kvSDK0Vvxlw0hrHGc1JeH7fL8pxGk4gVDf7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BTUcyQnz; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BTUcyQnz"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6398ff5fbd3so1586627a12.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Oct 2025 00:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759734388; x=1760339188; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HuSzaxHt2WjkCZsaacpzvkRWkgXa3kCzT0kK4JkGdSQ=;
        b=BTUcyQnznnE+AdUY6t3QIMXfZj1KZzeTrK8xnPrV7cjZcnlOE/25NQ8vXKjZ3rF+iN
         nIfH2T5PBOLrd/t8DJkaX/vWKfIF7hUXoX3K/rzI1mCOPZXXpX+uJh4UvXx8K/vG4ZZL
         sTb03P0wcYXa1UPX6AzrbrOHeGtQxWNvJoO1fmqAyYJPVNSXRFqOObSCWwkt4ZPHnrk+
         Vg4vBEqlzaeMtBbFWz4FpdWVcOOyPrhNOv1uF5knJkyiGBUdHw5meYOVm4KlNeQPa6Ia
         TlQ/nmsJQ7mHfIP7VdTxipYaQr1FxIYrfV4qA9xNmuBp+Yb/jlAe+ZSM5FhBQExZDU1j
         8O4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759734388; x=1760339188;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HuSzaxHt2WjkCZsaacpzvkRWkgXa3kCzT0kK4JkGdSQ=;
        b=FN7MDqDsXUQ/qEg1726d0BOQzmOvCWcXI4b4FlKBr7mTOZUDOs4lJR6bb5ej5lABa7
         0XbyL+QALxA5NvImEq8ozYgTB56+lY2AQ9iUAGSEoN75+XPiXJFKLAqDFvZEZC8IICTw
         3DWHsLuYb9GXTK8TfIFv3dtb6lUyAuN4mhd5RXNaqX4/21LS0WbF1EPb1UfyOTgG9nC6
         p+XPG1N7hfEVE4h85+61wQTsXJzexXMf4djNmb2j7P34lV4wwZBLPVgnWmAr4UtZCN9R
         vwWcuOZkcrg48P6tfjz7d2Xy39s1DM1lpiNCjY6SEb1nz+zz+ubPoQIckL++wSIY9haH
         EkpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPmtKKawqV4K2f62s28VBqYymXWph4ACDuMGOx8kj05Ky8tKozjWdiFBFIDfjJW6TKBYXE/tYg2II4Vj4R6dtGTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeCViJeGO9KHgMtamasrG8ti5TdnuhIIq+7pGy/VeUiO+uk2IM
	lNBUvZGYEZb1oAoIfb+hIeODUFSttqyVByKk4l0gMl9eO+ozX6rgRuNPm6GA0ROy1SI=
X-Gm-Gg: ASbGnctfEejvVKYB5WMZl6vLdzYmOQNMOYDxIKBVibskm+13vHpPQE/ZXWjVYpyeat9
	+YmBlGit/T2xHfe2xfBNO6FzhYggj264njelaTYlpBuYxUtq93CpFIMLPu5Cd2deDV3HQdC5/Yt
	3Y3A73KdnRjKg8Fc9tQnRvdysd8IaMA7mc8qLEGGPTurACyNQEam3ux4dQzCbqkMbJfuPPifKgu
	x7amWAR+PBodiN3nV3ly0YcXiAZD0bgTf8bxkuCfqGOA0TxSnvmX7bUGnNP7TdMyY0287ys+OUz
	OzbGYkRt7kxhexR28bPWBqKcMWT4sHt+vQtqtSZtT2ClE05GQ0MdRsjfw7OchXD+pEK0Bji3Kko
	j9F+dewvv2xH6OJYxICGwfRt4pCyru3YO9qL3cHydxvBU4vgvhSNFk3Sa763brBin
X-Google-Smtp-Source: AGHT+IEwbtOWhrJkM+5+XAaKyLXT4+RAoqahDvyQ66RfyOQrQ4PJvtBnJFcYl5rm+NOF2Nq60WjVQA==
X-Received: by 2002:a05:6402:1e90:b0:636:67c8:59d8 with SMTP id 4fb4d7f45d1cf-63934900291mr11938562a12.13.1759734388488;
        Mon, 06 Oct 2025 00:06:28 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-637881000besm9623517a12.23.2025.10.06.00.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 00:06:28 -0700 (PDT)
Message-ID: <2c36d66dc3eaf8f0f9778dd6a1d45806e7d9bcdd.camel@linaro.org>
Subject: Re: [PATCH 3/3] soc: samsung: gs101-pmu: implement access tables
 for read and write
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>,  Peter Griffin <peter.griffin@linaro.org>, Tudor
 Ambarus <tudor.ambarus@linaro.org>, Will McVicker	
 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 06 Oct 2025 08:06:26 +0100
In-Reply-To: <CAPLW+4nvuGd8AoDKK1VdF2pabCHzjgYHRJkYrcncRt4s=qt8Dw@mail.gmail.com>
References: <20251002-gs101-pmu-regmap-tables-v1-0-1f96f0920eb3@linaro.org>
	 <20251002-gs101-pmu-regmap-tables-v1-3-1f96f0920eb3@linaro.org>
	 <CAPLW+4nvuGd8AoDKK1VdF2pabCHzjgYHRJkYrcncRt4s=qt8Dw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-10-03 at 13:24 -0500, Sam Protsenko wrote:
> On Thu, Oct 2, 2025 at 5:33=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@=
linaro.org> wrote:
> >=20
> > Accessing non-existent PMU registers causes an SError, halting the
> > system.
> >=20
> > Implement read and write access tables for the gs101-PMU to specify
> > which registers are read- and/or writable to avoid that SError.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>=20
> I think having "Fixes:" tag would be justified here?

I decided against, because IMHO it's not a bug fix as such, it's a new feat=
ure.
>=20

> > ---
> > Note there are checkpatch warnings 'Macros with complex values should
> > be enclosed in parentheses' and 'Macro argument reuse' for macros like
> > CLUSTER_CPU_RANGE(). Since they are used in an initialiser, the only
> > way to get rid of the warnings is to avoid the macros and duplicate all
> > the related register ranges I believe, which I'd rather not due to the
> > sheer amount of similar blocks.
> > ---
> > =C2=A0drivers/soc/samsung/gs101-pmu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 306 ++++++++++++++++++++++++-
> > =C2=A0include/linux/soc/samsung/exynos-regs-pmu.h | 343 +++++++++++++++=
++++++++++++-
> > =C2=A02 files changed, 640 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/drivers/soc/samsung/gs101-pmu.c b/drivers/soc/samsung/gs10=
1-pmu.c
> > index b5a535822ec830b751e36a33121e2a03ef2ebcb2..5be1cbfa58c95e466bbdf95=
4923f324f74460783 100644
> > --- a/drivers/soc/samsung/gs101-pmu.c
> > +++ b/drivers/soc/samsung/gs101-pmu.c
> > @@ -8,6 +8,7 @@
> > =C2=A0#include <linux/array_size.h>
> > =C2=A0#include <linux/soc/samsung/exynos-pmu.h>
> > =C2=A0#include <linux/soc/samsung/exynos-regs-pmu.h>
> > +#include <linux/regmap.h>
>=20
> If you decide to add this line to exynos-pmu.h (as I commented in the
> preceding patch), it can then be omitted here.
>=20
> >=20
> > =C2=A0#include "exynos-pmu.h"
> >=20
> > @@ -19,9 +20,312 @@
> > =C2=A0#define TENSOR_PMUREG_WRITE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1
> > =C2=A0#define TENSOR_PMUREG_RMW=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2

[...]

> > +#define CLUSTER_NONCPU_RANGE(cl)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regmap_reg_range(GS101_CLUSTER_NO=
NCPU_IN(cl),=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GS101=
_CLUSTER_NONCPU_IN(cl)),=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regmap_reg_range(GS101_CLUSTER_NO=
NCPU_INT_IN(cl),=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GS101=
_CLUSTER_NONCPU_INT_IN(cl)),=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regmap_reg_range(GS101_CLUSTER_NO=
NCPU_DUALRAIL_CTRL_IN(cl),=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GS101=
_CLUSTER_NONCPU_DUALRAIL_CTRL_IN(cl))
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CLUSTER_NONCPU_RANGE(0),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CLUSTER_NONCPU_RANGE(1),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CLUSTER_NONCPU_RANGE(2),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regmap_reg_range(GS101_CLUSTER_NO=
NCPU_INT_EN(2),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GS101=
_CLUSTER_NONCPU_INT_DIR(2)),
> > +#undef CLUSTER_NONCPU_RANGE
> > +
> > +#define SUBBLK_RANGE(blk)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 \
>=20
> Reusing the same names for different macros seems a bit confusing. But
> that might be just a matter of my taste, so no strong opinion.

And I OTOH explicitly picked the same name because it's the same block, jus=
t
for r/o instead of r/w :-)

[...]

>=20
> That's quite an extensive list of registers! Does this PMU driver
> really have to cover all of those?

That's what all Samsung PMU drivers do, it's the PMU region after all.=C2=
=A0Also,
in the gs101 case, only the PMU driver knows how to do the secure access:=
=C2=A0Various
other drivers have references to this PMU regmap, e.g. phy drivers for isol=
ation
(USB & UFS) and upcoming PD driver will do too. We don't want to reimplemen=
t
secure access in all of those.

Cheers,
Andre'
