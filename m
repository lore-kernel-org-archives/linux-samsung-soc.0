Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69EB38A70C
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Jan 2026 15:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768836144; cv=none; b=If/Lz8YSn5WaOsdHcGT5cWHsBGTgp1Ix9ZE+qYxM1ABuhPUdPJslZJgr3sF3xwRPb0EcH8iQ2FlZurFnmeICvd1NH4YMGCaWHU2uGPkCSbqXUC3tyMKZK9q5hDwFwz/hd0P1Twvlv7U+mWjLTORvqcyoBEhzpxLwZ+a8cJwxHek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768836144; c=relaxed/simple;
	bh=RcYbg4piou2Dj/1Hv9hwix15x8CDH6yXA6JynfZrRgo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SaNBUTyB7Pg1Y++xGlbWoh10nfUk68VsmKPmZBRgZnb8Tx9EI1mlBHbXy+cwpCQp3uZdduOvLOc8lRYBgLStFDdq20bkPhVbbOJgIepAfyG5h6XIdOauBisVGcr+jdM6NOqgevYl7YUBbQ5Z+ajuxLnYs4cZfs+ldsU62RIYFeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=siwshHt3; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="siwshHt3"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-81dbc0a99d2so2226911b3a.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Jan 2026 07:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768836142; x=1769440942; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bOLfqWIhNexAHWIet0YvT9M8UoWng/1ht2LzlUGoS5k=;
        b=siwshHt3qTu/sAsNqvVcQN6+nrbtKBmr8tVrQbPNU3xHzh940ttJKBPPgXlk8E/oPi
         mcYIASkTEkMdz7VCXsrUyK7ie6bCpAJefidvtD+qlqvSDJ8JXBcbRBr2y3qsV8FAXfrk
         tVnc4GZtwsAY4JQFmtIHg9pu+Jbmb9R1nyGzjUZTleYtcS8TpkKf+Qtk7oIqpNukCOKx
         arPnDOS4LXyk7Ot0s/fi2ouVZnoBZKrnIpv71lv2QBfdzg2lB2aLnxycAVm2EZ1mAkux
         ATeRkHanPU3QD1JAb6foub8O0YdvX+JeZqahrsx7n5ZgfU7BaJe5Arz0B+1JbzU9Q0oW
         eOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768836142; x=1769440942;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bOLfqWIhNexAHWIet0YvT9M8UoWng/1ht2LzlUGoS5k=;
        b=AcAy2DBIzGxMq47pqRTfNr7GS62s3a+h7tlHb6uiAYEHvPpkQKqyX9PWXNH46ypQu6
         gltCSWuoHfHhnMAo65/gRtXJA1Ffno9p59mzMsgFBq7NZzuPBm9VDpZwSLxsJwJ3K4ld
         xcihATbq5gmVTWEdR8nVKONy27ZBa5v6/HuBALf6i9wexw5RatgoCyhINOHa9GEScKbR
         MlbC+jf71khIM07BmIcYHqSFD3gJBMqm7N+5GHalx1TqPimnkFeugBDNVImIYWPfhDxy
         DuwOQ5XVWrm+BwXG4uSXukdCPe17dB0JtcsTlZmek5nIuc24NQDF6s+fngubzAA/tiAY
         2H/A==
X-Forwarded-Encrypted: i=1; AJvYcCXQdMWQ7RutUIfO8AvoTwOqKNX1IgHu6syqgXko/k+0QZkPngPOGDXGOBb3ZVBYyiVw7iDPWg7/bRwmbnxP3ma9Uw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdd3ZxYSP3RtZn5VIAQMl/7FnyLRsRWJicUeeFYAU4CDHlhLm9
	Rq11WCKdflYdUnYOCz+HKuSIHkwCqmNGsxuiicT/TRib9lLuSWxsg91FxhO7a3XNX3k=
X-Gm-Gg: AY/fxX71m/REXGh21mR4gjY5ylbtL/jLlu+og/lHslhpUPFlLM5pHZ/0ALNAgvSdE5+
	YNiGJs2/q2/GNSudpTsRhilrR9FUtmhG35h8nL680y093EYZ25ldVCtU+mMyY2aBBgMJ5s1HWHq
	1NOdvdbQhrYU/Pe8v1LGJlyl06ctsPJVQuYKkhIYRKPeLfnWOcAluHz8WdV5T1PWhadC+cveJgU
	X93ePcG6KOgaNXSsbLHFvcu/uzDzNASAO7J1PUz1ayNBnXa/3/PuK84hWSEXihZcf437c7n17xZ
	EvijsDxee0F+4TXHgY1qxCjsBiukpSFQ/jY+6IHHNRfTJi/D8pw/gB/MXVNtRZNekeaJDevokEU
	/7sMv5hkuESeajlwFNmPsG1l5y+V45KfBsvP70mkJ56XnPgRTrGOac5Glbzlq/iUqPGydre/GLT
	A6LHMCrTcx1YNMuBh42A==
X-Received: by 2002:a05:6a21:3397:b0:366:1926:1e1d with SMTP id adf61e73a8af0-38dfe590993mr13488970637.4.1768836141975;
        Mon, 19 Jan 2026 07:22:21 -0800 (PST)
Received: from draszik.lan ([212.129.73.116])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf232f00sm9691868a12.2.2026.01.19.07.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 07:22:21 -0800 (PST)
Message-ID: <872f487ab2c5f6c2b1b2d7f7ee3cc26beec7970a.camel@linaro.org>
Subject: Re: [PATCH 3/3] clk: samsung: allow runtime PM with auto clock
 gating
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki	
 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	 <alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, Juan
 Yescas <jyescas@google.com>, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Mon, 19 Jan 2026 15:22:16 +0000
In-Reply-To: <6dde4f443be88d6fc412c08feb3e1f082c088118.camel@linaro.org>
References: 
	<20260109-clk-samsung-autoclk-updates-v1-0-2394dcf242a9@linaro.org>
		 <20260109-clk-samsung-autoclk-updates-v1-3-2394dcf242a9@linaro.org>
		 <dfc3f6ee-08c8-4673-91c2-e9c863105753@kernel.org>
	 <6dde4f443be88d6fc412c08feb3e1f082c088118.camel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-01-19 at 15:00 +0000, Andr=C3=A9 Draszik wrote:
> Hi Krzysztof,
>=20
> On Sat, 2026-01-17 at 20:25 +0100, Krzysztof Kozlowski wrote:
> > On 09/01/2026 18:27, Andr=C3=A9 Draszik wrote:
> > > When automatic clock gating is enabled, runtime PM (RPM) isn't entere=
d
> > > even if enabled for a CMU if a sysreg clock exists and is provided by
> > > this CMU (as is generally the case).
> > >=20
> > > The reason is that this driver acquires a CMU's sysreg registers usin=
g
> > > syscon_regmap_lookup_by_phandle() which ends up preparing the sysreg
> > > clock. Given the sysreg clock is provided by this CMU, this CMU's usa=
ge
> > > count is therefore bumped and RPM can not be entered as this CMU neve=
r
> > > becomes idle.
> > >=20
> > > Switch to using device_node_to_regmap() which doesn't handle resource=
s
> > > (the clock), leaving the CMU's usage count unaffected.
> > >=20
> > > Note1: sysreg clock handling is completely removed with this commit
> >=20
> > I miss where do you remove in this commit the sysreg clock handling?
>=20
> The CMU driver originally used syscon_regmap_lookup_by_phandle() for sysr=
eg,
> which does clk_get() and clk_prepare(), and then implicitly and for each
> register access clk_enable()/disable() for the clock specified in DT for =
the
> (sysreg) node.
>=20
> This commit changes it to using device_node_to_regmap(), which does nothi=
ng
> with the clock (or any other resources). I opted to have the CMU driver s=
till
> do a clk_get(), so that the relationship is still visible, e.g. in
> $debugfs/clk/clk_summary.
>=20
> > > because sysreg register access is only required during suspend/resume=
.
> > > In the runtime suspend case, we would have to enable the clock to rea=
d
> > > the registers, but we can not do that as that would cause a resume of
> > > this driver which is not allowed. This is not a problem because we
> > > would only need to handle the clock manually if automatic clock gatin=
g
> > > wasn't enabled in the first. This code is only relevant if automatic
> > > clock gating is enabled, though.
> > >=20
> > > Fixes: 298fac4f4b96 ("clk: samsung: Implement automatic clock gating =
mode for CMUs")
> > > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > > ---
> > > =C2=A0drivers/clk/samsung/clk.c | 92 ++++++++++++++++++++++++++++++++=
+++------------
> > > =C2=A0drivers/clk/samsung/clk.h |=C2=A0 2 ++
> > > =C2=A02 files changed, 71 insertions(+), 23 deletions(-)
> > >=20
> > > diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
> > > index 9f68f079fd552f8dfb6898dbfb47dec0e84c626c..6515df81fcbc79b90f526=
2843e67575f6a4e0dda 100644
> > > --- a/drivers/clk/samsung/clk.c
> > > +++ b/drivers/clk/samsung/clk.c
> > > @@ -9,11 +9,13 @@
> > > =C2=A0 */
> > > =C2=A0
> > > =C2=A0#include <linux/slab.h>
> > > +#include <linux/clk.h>
> > > =C2=A0#include <linux/clkdev.h>
> > > =C2=A0#include <linux/clk-provider.h>
> > > =C2=A0#include <linux/io.h>
> > > =C2=A0#include <linux/mfd/syscon.h>
> > > =C2=A0#include <linux/mod_devicetable.h>
> > > +#include <linux/of.h>
> > > =C2=A0#include <linux/of_address.h>
> > > =C2=A0#include <linux/regmap.h>
> > > =C2=A0#include <linux/syscore_ops.h>
> > > @@ -489,6 +491,50 @@ void __init samsung_cmu_register_clocks(struct s=
amsung_clk_provider *ctx,
> > > =C2=A0		samsung_clk_register_cpu(ctx, cmu->cpu_clks, cmu->nr_cpu_clks=
);
> > > =C2=A0}
> > > =C2=A0
> > > +static int samsung_get_sysreg_regmap(struct device_node *np,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0 struct samsung_clk_provider *ctx)
> > > +{
> > > +	struct device_node *sysreg_np;
> > > +	struct clk *sysreg_clk;
> > > +	struct regmap *regmap;
> > > +	int ret;
> > > +
> > > +	sysreg_np =3D of_parse_phandle(np, "samsung,sysreg", 0);
> > > +	if (!sysreg_np)
> > > +		return -ENODEV;
> > > +
> > > +	sysreg_clk =3D of_clk_get(sysreg_np, 0);
> >=20
> > I don't think you should be poking clock of some other device. This
> > clearly breaks encapsulation. What sysreg is needs to do to access
> > registers, is only business of sysreg. No other drivers should
> > re-implement this.
>=20
> Similarly, to how other drivers (like UFS and peric/USI) also poke in
> the sysreg region in a similar way, the CMU related parts of sysreg are
> handled in this driver, though, as only the CMU driver knows how to
> configure them based on the gating (auto vs. manual).
>=20
> No separate driver was sysreg was added when this code was introduced.
> The clk_get() used to be part of syscon_regmap_lookup_by_phandle(), and
> I chose to keep only that, as per above.
>=20
> I propose to add an actual sysreg driver once the need arises, then
> this can also move, but for now keeping it here seems straight forward.
>=20
> Is that OK with you?

Forgot to say, I can of course remove all clock related code (clk_get() etc=
).

What do you think? Is that acceptable?


CHeers,
Andre'
