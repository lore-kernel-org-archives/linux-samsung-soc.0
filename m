Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4173208
	for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Oct 2025 06:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759733566; cv=none; b=T4oAbf+4iKarNmYF5PgayAXzvPnsiwKt7sxK+kmjbqjH5Eb01pkQhQ1ABtNl5tc2wmcDnCI8lOBSAqU0J+3m8DJL5hDFt+xFPg56MKkVZv5uVVXEy+YHKr2EBprpNnFlwuVPEHtPKEBa3u9c9JZzMIGCdEOOTF7ugW2+mbZMKxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759733566; c=relaxed/simple;
	bh=HXmc7QpSTt9ZosNT5x1nSeoE8ULcpihYGG51Sy2vopY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kRJWhHJos9T2JjVrf3KGUdA72VHjxU8z6OYNQ+Dcfn1IWh/xJDPqiQJBplZ5sgJwHxBtM0A2jWrlg8KK843vFfFTjA6+A1ngJ0p9c51frWgVYX6u2Wtcg8NaMJ28dT5sxqhZnevz6hDa9lI9fuKAUArqMDv/ckluJ0WRWNPF2AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kXHwNrEB; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kXHwNrEB"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6398ff5fbd3so1563077a12.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 05 Oct 2025 23:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759733562; x=1760338362; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HXmc7QpSTt9ZosNT5x1nSeoE8ULcpihYGG51Sy2vopY=;
        b=kXHwNrEBamhLVSJBRnPQ7KGz5OINhghCavCed1EbBkoIm4RVA7eFF9Aij7IxEGssxh
         mgCguwfeb6I2xLrnnkAs8Ly2591QB6CMOYP20WmADzW7KwLqSJqJEFZxwzJC9BvLgRax
         OO8XnJf95IizJPMMHJ4QrWvZUlaTCKOz8F5wWlFYexaTVBpM9FAs5CeEuEB0XXmGgd/w
         LfZwg/3baUnzS6G7AsTEIpmFQcQUw1K0uX0aRlDjDd5efc7ou/2Bul3ngY2s9518P42V
         nMtVE51KHtbE1nm60fjYyD1kVXdMN58ALPWEOO7TtN1IEkZ0EWzeq1VCHY2NH4cCQz+c
         LvSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759733562; x=1760338362;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HXmc7QpSTt9ZosNT5x1nSeoE8ULcpihYGG51Sy2vopY=;
        b=rCIe275/1kTWxTqX4EiTe4b5nSQkqHkm1ps+1oupzBjy5QWwELLVZp9wCLGgxiPhD+
         ZIMVnG2KLQGZiCaoLJYjNkQYE07B0DAjlKtMg+JDX25pf2LSURjtyCmYde0eRE+S9ti3
         E6oMXe6Cc7o9oyA6qaQWKUDHjkGtEWLEmCu1bestmBaqx4zcPTRu8kELWovLIuOh1ncE
         sf0GbKP3D4wfVDcFME4LGblXz2Ts/ydDXl2ztiyiJA+lKpzLjwuTowCtPN/ngoXeQgEa
         444m1MigtK2pY4lXAPyUsi7BEVt1dqjtVUMSgPRpOK/Ue71JubyWpjc5RFl1ixKCtF5P
         RTSg==
X-Forwarded-Encrypted: i=1; AJvYcCXzMKLNEJEFydOw8m3Btk75T/Wkl4f+5UggHWflyHs5LggFPlb6+gFXx1/q9PxAMVa81lVGk/KhHczuv27g2Q7hNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwldpuPZcgEiTCzUdQhxakV1RKQ9nNXonLRJBtExlauwHwpXW8t
	PbXmsz8KiB7ERrHd9ukX5vRRZzPQ/mHswllWySAljKlIHM2XKCVmLfiVtBOGCs9FSxI=
X-Gm-Gg: ASbGnctH+MObvi/912+mx4MzzG+OgsjVwDN159m5SMzRHZS6PQTjxdHzPz0erSPSdcn
	fGoNO7rwruaYqzSr+RNzAZOW1OB58Ttbqbp/pDxRGFnSw3ivc1R7FGsoUNjldPautFThGH7ULfl
	kt3s39yIGE8GMU+Clat1d0RPTk7HCfgR44qw8k9BQPrBYSkFKUofCOyfNosnbaVarGT9/y8exHG
	u0paQRqInihkzSINoasqyo1TVrs32TEb8dLXjsIpxYOojjFgzMwF3nPJo5VN3SYF9Ez9F7gtKQW
	o4NPOZldftFjSzbrwGpKKQGNqJWRJaJ3i8i8uCBo19VnFZmj4vTUPjxxTdoG7JyO+n4zQhHLwq/
	qeH9Z1rt4t3lnEFSMYIlezo+q7CwRo9puWYGhPbDswK2DyzqoAyVcPFm1bBUcu9Cj
X-Google-Smtp-Source: AGHT+IFH+Nm6t/KLP6g5tq5oQKi62aAAd8k2tFyYYm8tKkws1sxOeiOGOYBNadAisWD6RX0oCu0zaA==
X-Received: by 2002:a17:907:3f0a:b0:b45:60ad:daff with SMTP id a640c23a62f3a-b49c214c03fmr1480542166b.28.1759733561787;
        Sun, 05 Oct 2025 23:52:41 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173b03sm1058949066b.84.2025.10.05.23.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 23:52:41 -0700 (PDT)
Message-ID: <949da0fec08f09bd6b70b14f3361f4a4584b42c3.camel@linaro.org>
Subject: Re: [PATCH 2/3] soc: samsung: exynos-pmu: move some gs101 related
 code into new file
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>,  Peter Griffin <peter.griffin@linaro.org>, Tudor
 Ambarus <tudor.ambarus@linaro.org>, Will McVicker	
 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 06 Oct 2025 07:52:40 +0100
In-Reply-To: <CAPLW+4=+efttfgj9gMSGpv2sjhJQ7whtoCuitK+Ku4U7hzE+1A@mail.gmail.com>
References: <20251002-gs101-pmu-regmap-tables-v1-0-1f96f0920eb3@linaro.org>
	 <20251002-gs101-pmu-regmap-tables-v1-2-1f96f0920eb3@linaro.org>
	 <CAPLW+4=+efttfgj9gMSGpv2sjhJQ7whtoCuitK+Ku4U7hzE+1A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Sam,

On Fri, 2025-10-03 at 12:55 -0500, Sam Protsenko wrote:
> On Thu, Oct 2, 2025 at 5:33=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@=
linaro.org> wrote:
> >=20
> > To avoid cluttering common code, move most of the gs101 code into a new
> > file, gs101-pmu.c
> >=20
> > More code is going to be added for gs101 - having it all in one file
> > helps keeping the common code (file) more readable.
> >=20
>=20
> Maybe add "no functional change" note for refactoring/cleanup patches lik=
e this.

Sure


[...]

> >=20
> > diff --git a/drivers/soc/samsung/exynos-pmu.h b/drivers/soc/samsung/exy=
nos-pmu.h
> > index 113149ed32c88a09b075be82050c26970e4c0620..fe11adc4f6ac8fc8bce228d=
5852deaff7c438221 100644
> > --- a/drivers/soc/samsung/exynos-pmu.h
> > +++ b/drivers/soc/samsung/exynos-pmu.h
> > @@ -44,7 +44,14 @@ extern const struct exynos_pmu_data exynos4412_pmu_d=
ata;
> > =C2=A0extern const struct exynos_pmu_data exynos5250_pmu_data;
> > =C2=A0extern const struct exynos_pmu_data exynos5420_pmu_data;
> > =C2=A0#endif
> > +extern const struct exynos_pmu_data gs101_pmu_data;
> >=20
> > =C2=A0extern void pmu_raw_writel(u32 val, u32 offset);
> > =C2=A0extern u32 pmu_raw_readl(u32 offset);
> > +
> > +int tensor_sec_reg_write(void *context, unsigned int reg, unsigned int=
 val);
> > +int tensor_sec_reg_read(void *context, unsigned int reg, unsigned int =
*val);
> > +int tensor_sec_update_bits(void *ctx, unsigned int reg, unsigned int m=
ask,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 unsigned int val);
>=20
> Nitpick: just noticed the inconsistency between context/ctx wording
> usage in above function arguments.

Interesting... I'll fix it as part of the move.

>=20
> > +
> > =C2=A0#endif /* __EXYNOS_PMU_H */
> > diff --git a/drivers/soc/samsung/gs101-pmu.c b/drivers/soc/samsung/gs10=
1-pmu.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..b5a535822ec830b751e36a3=
3121e2a03ef2ebcb2
> > --- /dev/null
> > +++ b/drivers/soc/samsung/gs101-pmu.c
> > @@ -0,0 +1,141 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +//
> > +// Copyright 2025 Linaro Ltd.
> > +//
> > +// GS101 PMU (Power Management Unit) support
> > +
>=20
> AFAIR headers like these should be made using multi-line comments (not
> talking about SPDX part). Or is it the latest fashion trends in
> kernel?

Depends on subsystem, but multi-line for most. Here I went with existing st=
yle for
the PMU-related files, though.

Cheers,
Andre'
