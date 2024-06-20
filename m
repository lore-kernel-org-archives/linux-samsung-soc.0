Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF07823DC
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jun 2024 21:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718919561; cv=none; b=hgHH7cZpUIhb9w/zGDMBO0A7/A82Pd3FZn9O3I4pagCtL7zY83O+4mHy7C6EZsilJZTPW8FySyrn4/CdbkZBdOzF3cJOc8YUXu8G7UxRsv8M13J3d5XvDPW7i9N65weqxgnuAmFfNi/xJvd/XATVOkKAh3ShI+qDrAOK6ELVr2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718919561; c=relaxed/simple;
	bh=GzGqxe0BB5cRnb5zU6DvWVaR1aOl5IzW/euKFXuh1E0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ax6k+Gd1p+vRz/e8H5jzw1wzSubV5r0rbmzXsTxYH245oNdVaGdQF3cdVCeSKMR8TwIonqAP/h2AzxVsA1dv4JzenjqgZPBH8igZuJZRt5y9mzHPHNO+/TwkEfIx8FTXNYX7gco1cX5YHePiVE5O4KYCXILIqNQoIuVNmjOC7ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kqGEMqoW; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kqGEMqoW"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-63ba688bdc9so13724667b3.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jun 2024 14:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718919559; x=1719524359; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CG5oVmRocYyy3IzJSCKu3dOBsS/cU690fmgDh0CQkVQ=;
        b=kqGEMqoW3PEdQQxo3+RVPAUtcYP8w+GzX/WxhyfKzh4XD56AIfE1g9rF+PUvWHr2jU
         9hG0gjbQeu+Xw2cuG+XC425Xj/glzOGfpQXaIXNBXNGrKYA0IoqbKNaYpss9gi10D9Hm
         ws/C1cAwpaYauBXQVeZZ13bUBnCB+JvaB5HxVhuBLqvo+2mTA8eqnjPihIn1tZ6MwqfL
         8v7JwPfmQ1UgNTjikIrbbqA7Cr1RgkVksgOQnlh0XfDxuwbRgis9X/GK7F8sLLZ0Mdys
         CZvOAkWEjyYqBh7zb+7jxV1uFtHX6TavTKStkbn8SfaaUOpuEIFkxCx0n8olDx83CqGw
         Dwxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718919559; x=1719524359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CG5oVmRocYyy3IzJSCKu3dOBsS/cU690fmgDh0CQkVQ=;
        b=MmxMiQX9cCXWSaL809yvUFWDohiajf1Z5X6nEo13p/6Relo4AwOA9Bax6Mry6RhWTd
         w+9Dt/gO6O3BwkGSRcutv97Mw/SrUd6xFwLea/n4BXnaS3YglA/0EylQ1M5pT2Kxz1QN
         DTGZRzjdY9sKTgPlIvWzFiqHBrCOxkwkip4PcmB7WEc8rQQJHaGFOAEYVC9Kw4VboAn/
         u+isMR5prFojBwkQ4A2VmNG+kpuP0nvCnziKXtDt1rtmxA64khMvaMsCWxExOD3A9V7P
         VL41Eb/so+oZ//yzCTXIHXSkNj0juMp+XUX6fdy06UynOryhwkPjnq6ujeYvYfv8D13C
         WiIw==
X-Forwarded-Encrypted: i=1; AJvYcCX1TjaCM1XqPoDoYVD/zF9vA/gVBu8vc63oD6a7L9dSrd2TuamWZ5Nh1pWxSGgMMPx2LIO7kczum8SqatYzWk9M08PjiSFjEIuF2qKWV3FqBGg=
X-Gm-Message-State: AOJu0YzykufZLpvaFT9LVFNB9qft6hZHFBWY/1GY2goGKuLy2p8XBOtG
	i5GXVQ95sXyGx5f2/Ii+T44vE1Qw21CdLGJqeg63hYymHKnJYFCQ3NXxBFpyLqs9UGgsHzbMvGH
	512qBqsQAT7Z+Oh5BsapmWfahYWYPMUNyV2q5nA==
X-Google-Smtp-Source: AGHT+IHtwKXc9VjTxwTjE1WQPqo/nzCzyNk2L1W9UPMvQvq0zqX89g/JasxRk6Xfq7E9/GsSNsXqFPYAW5GA/xFzOvE=
X-Received: by 2002:a81:9186:0:b0:63c:416e:fc96 with SMTP id
 00721157ae682-63c416f1988mr33324357b3.24.1718919558585; Thu, 20 Jun 2024
 14:39:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20240620134610eucas1p2fbcd7218bc220bf568ea117acf2f4781@eucas1p2.samsung.com>
 <20240618204523.9563-6-semen.protsenko@linaro.org> <oypijdbk3vu3qd.fsf%l.stelmach@samsung.com>
In-Reply-To: <oypijdbk3vu3qd.fsf%l.stelmach@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 20 Jun 2024 16:39:07 -0500
Message-ID: <CAPLW+4n52gHBcMA3EN7faJUj-7pQNLM=UEiEBL4jT9iWQkkKfw@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] hwrng: exynos: Add SMC based TRNG operation
To: Lukasz Stelmach <l.stelmach@samsung.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Anand Moon <linux.amoon@gmail.com>, 
	Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 8:46=E2=80=AFAM Lukasz Stelmach <l.stelmach@samsung=
.com> wrote:
>
> It was <2024-06-18 wto 15:45>, when Sam Protsenko wrote:
> > On some Exynos chips like Exynos850 the access to Security Sub System
> > (SSS) registers is protected with TrustZone, and therefore only possibl=
e
> > from EL3 monitor software. The Linux kernel is running in EL1, so the
> > only way for the driver to obtain TRNG data is via SMC calls to EL3
> > monitor. Implement such SMC operation and use it when EXYNOS_SMC flag i=
s
> > set in the corresponding chip driver data.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> > Changes in v2:
> >   - Used the "reversed Christmas tree" style in the variable declaratio=
n
> >     block in exynos_trng_do_read_smc()
> >   - Renamed .quirks to .flags in the driver structure
> >   - Added Krzysztof's R-b tag
> >
> >  drivers/char/hw_random/exynos-trng.c | 133 +++++++++++++++++++++++++--
> >  1 file changed, 123 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/char/hw_random/exynos-trng.c b/drivers/char/hw_ran=
dom/exynos-trng.c
> > index 99a0b271ffb7..497d6018c6ba 100644
> > --- a/drivers/char/hw_random/exynos-trng.c
> > +++ b/drivers/char/hw_random/exynos-trng.c
> > @@ -10,6 +10,7 @@
> >   * Krzysztof Koz=C5=82owski <krzk@kernel.org>
> >   */
>
> [...]
>
> > +static int exynos_trng_init_smc(struct hwrng *rng)
> > +{
> > +     struct arm_smccc_res res;
> > +
> > +     arm_smccc_smc(SMC_CMD_RANDOM, HWRNG_INIT, 0, 0, 0, 0, 0, 0, &res)=
;
> > +     if (res.a0 !=3D HWRNG_RET_OK)
> > +             return -EIO;
> > +
> > +     return 0;
> > +}
> > +
>
> Does this driver requiers some vendor-specifig bootloading code?
> I am testing the code on a WinLink E850-96 board booted with the
> upstream u-boot and it fails during init (res0.a is -1).
>

This series was only tested (and works fine) with LittleKernel based
bootloader [1]. It's officially recommended and the only feature
complete bootloader at the moment. And you are right, the reason why
TRNG probe fails when you boot the kernel from U-Boot is that the LDFW
(Loadable Firmware) loading is not implemented in U-Boot right now,
which makes HWRNG_INIT SMC command fail and return -1. In fact, I'm
adding LDFW loading in U-Boot right now and expect it to be ready in 1
week or so. For now, can you please check with LK [1] instead? I'm
happy to help if you have any related questions.

> [    1.883413] exynos-trng 12081400.rng: Could not register hwrng device
> [    1.893394] exynos-trng 12081400.rng: probe with driver exynos-trng fa=
iled with error -5
>
> If an additional code outside the kernel is required for this to run,
> then maybe the error message should reflect that.
>

Good idea! Will send v3 soon, with proper error message added.

Thanks!

[1] https://gitlab.com/Linaro/96boards/e850-96/lk

> Kind regards,
> --
> =C5=81ukasz Stelmach
> Samsung R&D Institute Poland
> Samsung Electronics
