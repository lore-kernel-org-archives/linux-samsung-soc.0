Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8471781AD2
	for <linux-samsung-soc@vger.kernel.org>; Thu,  2 May 2024 10:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714646503; cv=none; b=trvqnX8dDvhsXcM5pnGIqrE+X5wuDrmvMphSfBO81+FKCQABDkf0VEgGJN2fRCIIpjYhRD+bfHoHRRfUUSTadw7PtbEKw+jo3gKiKTUcEq10buZeWk5dTf9R7tHwfUk0jc9H/O/p4A9p2K8kUadLgxmfjmK6GB7A91jhN4h3OjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714646503; c=relaxed/simple;
	bh=fybXAjqPvBwHdGsxB9/R7j2S7Y+f4bR+tc79wdtF/u0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mH2DP6116vtefcSDgvb8xw1TNPvjhHQxfZ7zdgvHKJyobQq0vtLuyX7ApemYkznS2oSVvNwqK/ljlhVGgb8tgY0LQXTAb0YmQECW1kjSISyaDDieWMTEuYBOzLTV/mIFB4g4/pVKQEkJX3fiX466lIp3NgtjGLrDp6lMi2te+ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v+IhWHE5; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v+IhWHE5"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-41ba1ba55ffso9848905e9.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 May 2024 03:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714646500; x=1715251300; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G67wI1ELxvLHuj4j0MxxzK9klsJgpVHm/gMYk9CvndE=;
        b=v+IhWHE5zU4zTDAEpB3P8xC652+AhWGEWFT2slMtz+HlUqF+9WUVEesdcGrztZuZjN
         pMdmItde4I2yBRyN7mYxVFVzSJvj9VQz0ka5CuH9MutkIMLzbEfieE+X0X0yxz8tN2JH
         reQ1cl4aC+PIaANDiG4/B+BCxaJxxTQ+DCR4HVZquYIUzmkROKpAI6t+FcQzyQvQP28S
         FZ7xeQiKV9zYX4Fzvl5IB5uUpgW5KtvLHBGoHkR7dr3FKWpyog1kgkRD8sqZG2cek8Bn
         HmRbIGTYWiPz/QA1efKc49xrHv/3mxCr+KLZ1vaeRojZhNeUlB9l3W8IHpoBaX+3/IT5
         /3HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714646500; x=1715251300;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G67wI1ELxvLHuj4j0MxxzK9klsJgpVHm/gMYk9CvndE=;
        b=orwFajMRQCaNYELDjZOU//w2UVw/TwkKgVnyzJzTkb5EpDiUbYO3aSrKxDGdVzfT3X
         /TVBBMHQqO+bWspxxhOlfbyBPAHGJG0RuRI80XFzfpNG5XcMShHBOdmqB1lHWfRQkmxL
         VMVEUVnVKmdVFgQAQGMVqc8WY6dmqL7Jmy3fCuu7cOjP96mlfPvtkHxa1gckSC+FqN5y
         gftJVt6jbouwCN+Y7BzuIkv2PW//upJTvQUCIVytR94tFzjn35e6ZFIpJetJ4GcRycHW
         3DphMknHqKDl4SKt2cqDUVGzA+On+q48SXxIA/YJdge2utvX/M2+BU4akFSiQhKYEXqh
         OsoA==
X-Forwarded-Encrypted: i=1; AJvYcCVoE3PygMKcGXCVlTQ2rg+TeQBSWGox2awH73y8Xl0PSyPARP2X4RxLKOvn/yetS3HhJnG8aRnJw/GgIr81O6BVV0BGUTCANVw44dl9UVLPesI=
X-Gm-Message-State: AOJu0YwwdBr81/aOsNPqb9wYiwZbaH9nuPWxzfVqUo9hfheV2wQs134X
	sxGb7GpuHoDB1q59eh+QmD0nwsZHXJT2hO9RZjo7JkUf+rb4sWG9dP5YHo0YtWU=
X-Google-Smtp-Source: AGHT+IGICWXiMH73pNFBB1Q4T+/ozDtwf8xsVzE6i3LV16OwIyRWdmFb9VBHL4esXP/8WIaX18KH8g==
X-Received: by 2002:a05:600c:1c83:b0:41a:4623:7ee9 with SMTP id k3-20020a05600c1c8300b0041a46237ee9mr1843717wms.10.1714646499760;
        Thu, 02 May 2024 03:41:39 -0700 (PDT)
Received: from salami.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id c14-20020adfe70e000000b0034de40673easm957006wrm.74.2024.05.02.03.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 03:41:39 -0700 (PDT)
Message-ID: <c4c73732595b067369a6c8d71508d54358962552.camel@linaro.org>
Subject: Re: [PATCH v3 2/2] pinctrl: samsung: support a bus clock
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij
 <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Peter Griffin
 <peter.griffin@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, Sam Protsenko
	 <semen.protsenko@linaro.org>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 02 May 2024 11:41:37 +0100
In-Reply-To: <9a960401-f41f-4902-bcbd-8f30f318ba98@kernel.org>
References: <20240426-samsung-pinctrl-busclock-v3-0-adb8664b8a7e@linaro.org>
	 <20240426-samsung-pinctrl-busclock-v3-2-adb8664b8a7e@linaro.org>
	 <ea6f17d7-49bf-4a1e-ba3b-757e29221590@linaro.org>
	 <9a960401-f41f-4902-bcbd-8f30f318ba98@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2024-05-02 at 09:46 +0200, Krzysztof Kozlowski wrote:
> On 02/05/2024 09:41, Tudor Ambarus wrote:
> > > =C2=A0
> > > @@ -223,6 +268,13 @@ static void exynos_irq_release_resources(struct =
irq_data *irqd)
> > > =C2=A0	shift =3D irqd->hwirq * bank_type->fld_width[PINCFG_TYPE_FUNC]=
;
> > > =C2=A0	mask =3D (1 << bank_type->fld_width[PINCFG_TYPE_FUNC]) - 1;
> > > =C2=A0
> > > +	if (clk_enable(bank->drvdata->pclk)) {
> > > +		dev_err(bank->gpio_chip.parent,
> > > +			"unable to enable clock for deconfiguring pin %s-%lu\n",
> > > +			bank->name, irqd->hwirq);
> > > +		return;
> >=20
> > but here we just print an error. I guess that for consistency reasons i=
t
> > would be good to follow up with a patch and change the return types of
> > these methods and return the error too when the clock enable fails.
>=20
> That's a release, so usually void callback. The true issue is that we
> expect release to always succeed, I think.
>=20
> This points to issue with this patchset: looks like some patchwork all
> around the places having register accesses. But how do you even expect
> interrupts and pins to work if entire pinctrl block is clock gated?

I was initially thinking the same, but the clock seems to be required for
register access only, interrupts are still being received and triggered
with pclk turned off as per my testing.

Cheers,
Andre'

