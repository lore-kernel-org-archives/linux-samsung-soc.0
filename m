Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC6F378D9C
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Jan 2026 15:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768834862; cv=none; b=VCjPgqnpR0a/R2CaIXFnfroP0RyJ3YUvEdQBTvvybxvJ4IApOthpb1psm00LiApwgDqJmVhWsW5KuC/UnQtFUBPba+b4WWOoa1PRn1j2+icDZESghr476l1vvoyziE+tEc6PXXpxSzVIvO6Kf/B7+HmpKTAnHhaj+mQJmZnhGKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768834862; c=relaxed/simple;
	bh=5wSZP/vmyBOxdNy+Q5ghdgNb3wVebVWpShAvVAYA4xY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kgkhQmxBWKUiQeo0X5Hq1mmjC1B+XZBVwRWuAcVERp/zQIQbU2R+rV9TxIwxBLEYjmjJQut65VMtie/suAdH43kqVdwYjJPBwPGS/VcaPujdhjWCX7nNZjHxoe1jlFn21qvufvvHnvC8Hg8oFm+3TNF8ia9fJoM5WqDSA+F6QVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lBRWCCb6; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lBRWCCb6"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-81ecbdfdcebso2620239b3a.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Jan 2026 07:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768834860; x=1769439660; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2IbXNhWIbZbrbqZXRIFNlWrdzKYdRYk3QnEEbv0798c=;
        b=lBRWCCb6sMvcs4LD+jxBqFfLO9FkIZUEUWqeaDS7MkPKacE6hGFhNUiyGt4Xd4ZI77
         FevWy8R+jpjXkFTaefPxKw7EtqM/RdOBdDRhZX27zm+aPyYKjPSPlY9eb5wHPhCzwLVD
         CFy9LwbXzzaLAaywRtN3A83xjhIP6nQuAE800wdckc2lKLjvnHPTjJ64uy1Z5AUqDnTo
         UrM94hfhC/YWklIjZMp2Oeaa9bKzamxXqkuraV29e5uotcSL/rnYLeoh1C/jLqH/jdk2
         BNu+1ILgU/jf1tlwRUqpm+TMceqvFyrhOUJeUmls4h3M+EcUk5khDjtTosiIvi7eJlQ6
         IQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768834860; x=1769439660;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2IbXNhWIbZbrbqZXRIFNlWrdzKYdRYk3QnEEbv0798c=;
        b=lB8MBzMqdryrlnHFbfw8K2ZychZuTH+RhV/RXWxFpE9z108ZAdUiVLsu7crYBJ1dxz
         TC3cFqZ1UboWF/uXr9O2fuIKx4Vg4UtriePHj++dYU6LyLZMABMjT+iL9+J72MdZyikf
         a7L5FB1AZZNAix2fY0gtT6446HlfWThG7kQi+lXaeVLP9Qt7DpxQf1k0Alm/+h1k9RBN
         +RmTvtCOhrZNNgUhiaKDQ/p+OQXUS7RKgd+MBT9uqSNApn+zWtTxaee1knT6Ryr90h2B
         k3CimwAqHfxP5oFirEez407kZYfdyk1byqbnmrutuhnpJjEt2a7JHtWCOk1B1CNgCChx
         PkzA==
X-Forwarded-Encrypted: i=1; AJvYcCWO2thIaFJ0+Egyreje1Q//Yt2as4VfazwZdh1tjzFjX2p5njzjKes8qtYKP1AOqNEfpHAqOo1LCYUxZRkUtA9s8A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyda8r4zCjBrD95XNCe7RbzxXZfHs7oQczD2ghnoJS9h33leQPz
	YJYbcLZqhwQtaVWkbrwBBECkIoBglA6S856j7sy9OhdFKQtrYDH65gpLBAhfNlGnkrE=
X-Gm-Gg: AY/fxX4me5zotAav49ZcGrNCVL5JtURiAD6jyQ94uvIKglM3BLD89vK/PZOLi3JBBce
	tghBU5IOYh6QQFIqQJZsMijud/6sR+5UBKBjrAvHCPqu+cGQUNJMzBv6ymT3aHn/6qQv5Hb+WIu
	fVATIUy6NC/2rcvwW9r+RLB9C0+xh55203lc+gxKXxMWTAfvPQVGmUM3n79Hg85MeMDWJB56vyz
	zYtQpJAEuZudPBghDj3K+7fkEolyujjnoEPMDPbu1ym1NScoxQJ2nlhwEqvoyeQWX9y+fBc9iPP
	dPu9SU14XNi9TfYJBlY7FvfJDNx02wJX9Aj6AC3XENJaB5FCf6bwT8Q13i82PoFlh7BJh47mdun
	hVsCOVXcxE3YEGzI9mLlIfjZNos9GexculH3klHGcN2UFJv7JTEZC3IAO4ch+xHFnrvD1iuOqec
	HxhgYM6V7/3rNxEJuJKg==
X-Received: by 2002:a05:6a21:1505:b0:38d:fad1:cf2a with SMTP id adf61e73a8af0-38e00bb969bmr10563241637.13.1768834858332;
        Mon, 19 Jan 2026 07:00:58 -0800 (PST)
Received: from draszik.lan ([212.129.73.116])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf130f1csm9530167a12.0.2026.01.19.07.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 07:00:57 -0800 (PST)
Message-ID: <6dde4f443be88d6fc412c08feb3e1f082c088118.camel@linaro.org>
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
Date: Mon, 19 Jan 2026 15:00:53 +0000
In-Reply-To: <dfc3f6ee-08c8-4673-91c2-e9c863105753@kernel.org>
References: 
	<20260109-clk-samsung-autoclk-updates-v1-0-2394dcf242a9@linaro.org>
	 <20260109-clk-samsung-autoclk-updates-v1-3-2394dcf242a9@linaro.org>
	 <dfc3f6ee-08c8-4673-91c2-e9c863105753@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

On Sat, 2026-01-17 at 20:25 +0100, Krzysztof Kozlowski wrote:
> On 09/01/2026 18:27, Andr=C3=A9 Draszik wrote:
> > When automatic clock gating is enabled, runtime PM (RPM) isn't entered
> > even if enabled for a CMU if a sysreg clock exists and is provided by
> > this CMU (as is generally the case).
> >=20
> > The reason is that this driver acquires a CMU's sysreg registers using
> > syscon_regmap_lookup_by_phandle() which ends up preparing the sysreg
> > clock. Given the sysreg clock is provided by this CMU, this CMU's usage
> > count is therefore bumped and RPM can not be entered as this CMU never
> > becomes idle.
> >=20
> > Switch to using device_node_to_regmap() which doesn't handle resources
> > (the clock), leaving the CMU's usage count unaffected.
> >=20
> > Note1: sysreg clock handling is completely removed with this commit
>=20
> I miss where do you remove in this commit the sysreg clock handling?

The CMU driver originally used syscon_regmap_lookup_by_phandle() for sysreg=
,
which does clk_get() and clk_prepare(), and then implicitly and for each
register access clk_enable()/disable() for the clock specified in DT for th=
e
(sysreg) node.

This commit changes it to using device_node_to_regmap(), which does nothing
with the clock (or any other resources). I opted to have the CMU driver sti=
ll
do a clk_get(), so that the relationship is still visible, e.g. in
$debugfs/clk/clk_summary.

> > because sysreg register access is only required during suspend/resume.
> > In the runtime suspend case, we would have to enable the clock to read
> > the registers, but we can not do that as that would cause a resume of
> > this driver which is not allowed. This is not a problem because we
> > would only need to handle the clock manually if automatic clock gating
> > wasn't enabled in the first. This code is only relevant if automatic
> > clock gating is enabled, though.
> >=20
> > Fixes: 298fac4f4b96 ("clk: samsung: Implement automatic clock gating mo=
de for CMUs")
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > =C2=A0drivers/clk/samsung/clk.c | 92 ++++++++++++++++++++++++++++++++++=
+------------
> > =C2=A0drivers/clk/samsung/clk.h |=C2=A0 2 ++
> > =C2=A02 files changed, 71 insertions(+), 23 deletions(-)
> >=20
> > diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
> > index 9f68f079fd552f8dfb6898dbfb47dec0e84c626c..6515df81fcbc79b90f52628=
43e67575f6a4e0dda 100644
> > --- a/drivers/clk/samsung/clk.c
> > +++ b/drivers/clk/samsung/clk.c
> > @@ -9,11 +9,13 @@
> > =C2=A0 */
> > =C2=A0
> > =C2=A0#include <linux/slab.h>
> > +#include <linux/clk.h>
> > =C2=A0#include <linux/clkdev.h>
> > =C2=A0#include <linux/clk-provider.h>
> > =C2=A0#include <linux/io.h>
> > =C2=A0#include <linux/mfd/syscon.h>
> > =C2=A0#include <linux/mod_devicetable.h>
> > +#include <linux/of.h>
> > =C2=A0#include <linux/of_address.h>
> > =C2=A0#include <linux/regmap.h>
> > =C2=A0#include <linux/syscore_ops.h>
> > @@ -489,6 +491,50 @@ void __init samsung_cmu_register_clocks(struct sam=
sung_clk_provider *ctx,
> > =C2=A0		samsung_clk_register_cpu(ctx, cmu->cpu_clks, cmu->nr_cpu_clks);
> > =C2=A0}
> > =C2=A0
> > +static int samsung_get_sysreg_regmap(struct device_node *np,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 struct samsung_clk_provider *ctx)
> > +{
> > +	struct device_node *sysreg_np;
> > +	struct clk *sysreg_clk;
> > +	struct regmap *regmap;
> > +	int ret;
> > +
> > +	sysreg_np =3D of_parse_phandle(np, "samsung,sysreg", 0);
> > +	if (!sysreg_np)
> > +		return -ENODEV;
> > +
> > +	sysreg_clk =3D of_clk_get(sysreg_np, 0);
>=20
> I don't think you should be poking clock of some other device. This
> clearly breaks encapsulation. What sysreg is needs to do to access
> registers, is only business of sysreg. No other drivers should
> re-implement this.

Similarly, to how other drivers (like UFS and peric/USI) also poke in
the sysreg region in a similar way, the CMU related parts of sysreg are
handled in this driver, though, as only the CMU driver knows how to
configure them based on the gating (auto vs. manual).

No separate driver was sysreg was added when this code was introduced.
The clk_get() used to be part of syscon_regmap_lookup_by_phandle(), and
I chose to keep only that, as per above.

I propose to add an actual sysreg driver once the need arises, then
this can also move, but for now keeping it here seems straight forward.

Is that OK with you?

Cheers,
Andre'
