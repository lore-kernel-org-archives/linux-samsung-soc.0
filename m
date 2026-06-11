Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B40E3B3C11
	for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Jun 2026 07:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781161882; cv=pass; b=NFLNSaEmTesj+Ht//nY0G25v907rN1YJpbnIF2KQGvSEG+4N8byipQVeAfbUgf4NGm1yRJAjf9IuLo8cgxI1u614FFukER6g8HHXEKwsSYEnD2ZtioeNPnOvC3woHGhZdCEdR1tJB4HTADki9bD4wlYivEs/O/lLsSCzZHnV3TU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781161882; c=relaxed/simple;
	bh=A+vjY9UePGm++PcxVZs5XDA+KliAt9XGKyHV2kvhaX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uYZOKIKFbSKtf/H86i+qm43IfiL3nsGeNgcxsEZStINZYYvsmeKfcAht8d8LG5JSXeY+B5Z3/dEzeeQKw1+9Cy+bGRwx5UWwYoqesIhRr638ccjNcKGMxmnfCtR2eXEy10Qk54ZN3ZWsqcSB9aRpBZLDdeV2AEeh44YhFILWh/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wE3yK/b0; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wE3yK/b0"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-69170548d0eso7518264a12.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Jun 2026 00:11:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781161879; cv=none;
        d=google.com; s=arc-20240605;
        b=IGC2cNq3cqRhYx++F5oVFG5kjZ6jGXXhSUSXZOlwGClZXHKfuEOcZCE2DqxVUwSsi0
         E7S/wP0VrWduoZpIWzmQJJE5nJkHRGe3+kZjfjhukAw/dJ8C35kVmEgKFZUUipBFc59g
         1mlhm/ZGmiRj0VI8bxhEbMCY8WLSfCAILswpCo8tjvhTc99jR7wlwHJ4rAdbzSEasbkX
         FCPDYh4AjjcA8GarMZVQlGtmmTu7YYdcAt6Khj9XdVDi3buvhTUjoHMUN+cpnIJQPm+Z
         XnXpf3dKRGwAL1md/WHV4MRluW1vrZlKIzA/NUMkVLlKEniE/N/G75Pe0wXZm1leN6aq
         5C6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=f/de9C39QdWQLV5Q6hT47S1phWBZwegbTCNZx8KIleQ=;
        fh=LZc5S1Dftyl+vQ78i9znJ6HNbXt5tXyXIYRBELKGJIk=;
        b=NSy5CazU0PEXfWWau5X9NLAgTILezMzmnSW3BtUkU7PxVbAr2WBg2azkmcqbLKtO6g
         eYHIalXw0qE9m34wkQd8alXk9SVMLCHj7wKhxMAGt/YSSiNVc7EjjP77RzQAZWNCkFfH
         lryQv8z+tRMly+tUCslyjwu2AI8YyZ7thaIZnLuEgYwsjwJUdZe9AziXEVX5woRQgXFg
         4JcOum4uj0nB0oy3YHjfbarZoM5f39j/fbfE+LQE+MRC88jskPwQSnsybWuvryF/zoMt
         CWeUVCoPsq3jfqFTQXBBNIzdzpKXKjOmJer4Egl/HU6epcgByxtLgrj00+OW/K57fxXy
         DmaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781161879; x=1781766679; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f/de9C39QdWQLV5Q6hT47S1phWBZwegbTCNZx8KIleQ=;
        b=wE3yK/b0YoexmPEmKXgpFzlJcsfRs3aITD+EWWRh2bt2RPjzi5bqo2qjU/5dCTRRv+
         L1mvmhmN9eF6xctowNtD6Qv+8qX3XP9Yi5XYLJ6ADW3aP6SATT5Xlqk2u+iXh6gsYK89
         i67FI6iyM84EUceCD0SUpa9/pXYE82dMJSgNXEdEDXbDP79m8oYouDt2u6XCWoeU4KbJ
         ZLljcWg3oHa+Lr3rPVn3OE8NVmWizJ8xNr/KZIOxAqhE5eZ8PKpIp5EL5zUFguFHo7/T
         XnKrbAAh6lOi+fUEfEi01nFcIC4AgkRIMFryGzz7wM5xAwbNKYWnCWumGNWEo3AjlEg3
         DTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781161879; x=1781766679;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/de9C39QdWQLV5Q6hT47S1phWBZwegbTCNZx8KIleQ=;
        b=nCRxNqNOFJ3n6xJ03H+X5mFVZ9zhnyIxLaUw407YZnNuNLnDBU9NMOQDD0G/Zwc4Fs
         Og7gjBiRU/9TpvLCsnstg2l6Or5zjBKVuz5Vc9CqxMt50/606FiVQbEASeFF1KecS3Ha
         MX5UPTrcM3iZ8x3uxbWPvyKWAenBIS0qVEPKN5isuTFel4wk/B01M4XeVx9Ex4FGPkFa
         ZUt1IJPHvNCi01tbPb7ddQtBeCh4p6n10ljKIFMfLBTYHLOuGvnvTmtzddSpwmkx0N5Y
         C74s85WKS9gQiMGeP3vubyW8/CvAlc6U5qIQqEAqtcfURzn3y2tdGkzul3NpNcIs3e85
         T+ig==
X-Forwarded-Encrypted: i=1; AFNElJ/8vqQpe3FkpQ2N9NDu1fomIsIh2RGUAwNVeIWg3CdS0KwmK6f2+BEd00M/rM7wRnE+nDEaJW9Xpoz3Ng8QfBaLow==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEXeSjQJ3WvpUnVl9FAlYxUgqXwYOKSw6ZsOj6toQGIYSOnynp
	/YZ58eG9h9I02Tz32vw99a2hgVHTrYv81swznmS8AzKptBKHHjHAlihrhUwgXTOrp8De0b2Snjp
	cG1x/2frJqo8cq4581rxyfCqMJrwH/JBuqKOnzU7qWQ==
X-Gm-Gg: Acq92OHANB09lTnpJXcrqshO6/CgS/RiVX0KpDj8KMWEBYZqI5WMbYtZ/fYNdms08Dz
	8L9CQ/hCdfPHgUzBsdAoK/uIaoNu5ak6tL9jvoQdfGQR2EFZaL0LVPyAuc2JFO8sSg9ND88XxTF
	T6AzAR+Pdp7kV/UwvtKKDhFNtx3q+3aFEWrMVj6QCnO5s/21sH+5cf6GTnkYSHoS/syDWk0Fd0X
	IELqCRgSyUdZ+Dmd754iqtzb2rdu1Sctkumnjt1qqtAoaBTj6KQ21zO+2QQcjc8z2QMrrrIHb10
	HOBRNK5zfJE1YKc+JXJWqoH7ydqLL+HRNBb2C9hAwM9RsFU2ro46
X-Received: by 2002:a05:6402:520d:b0:689:c099:ef99 with SMTP id
 4fb4d7f45d1cf-6930e2e85ddmr662846a12.22.1781161879564; Thu, 11 Jun 2026
 00:11:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260531175932.32171-1-ebiggers@kernel.org> <CADrjBPo3BpSk49oasf_9g06xrBMkw+NiKo10xDKjWr8sJ+Zc-Q@mail.gmail.com>
 <20260610183902.GA1158828@google.com>
In-Reply-To: <20260610183902.GA1158828@google.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 11 Jun 2026 08:11:06 +0100
X-Gm-Features: AVVi8CdK6eYIPK8G4aFqD8lMifZVhDYEkmKnIKOnCa2_bel3Ygx-BiVfzt5sLyg
Message-ID: <CADrjBPoVFCb4rTze4mQhdQ0=FJmhpFiET0GCRBx9FaGs9DsrDA@mail.gmail.com>
Subject: Re: [PATCH] crypto: exynos-rng - Remove exynos-rng driver
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Eric,

On Wed, 10 Jun 2026 at 19:39, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Wed, Jun 10, 2026 at 03:46:54PM +0100, Peter Griffin wrote:
> > Hi Eric,
> >
> > On Sun, 31 May 2026 at 19:02, Eric Biggers <ebiggers@kernel.org> wrote:
> > >
> > > This driver has no purpose.  It doesn't feed into the Linux RNG, nor
> > > does it implement the hwrng interface.  It is accessible only via the
> > > "rng" algorithm type of AF_ALG, which isn't used in practice.  Everyone
> > > uses either the Linux RNG, or rarely /dev/hwrng.
> > >
> > > Moreover, this is a PRNG whose only source of entropy is the 160-bit
> > > seed the user passes in.  So this can be used only by a user who already
> > > has a source of cryptographically secure random numbers, such as
> > > /dev/random.  Which they can, and do, just use in the first place.
> > >
> > > Just remove this driver.  There's no need to keep useless code around.
> > >
> > > Note that the other crypto_rng drivers in drivers/crypto/ are similarly
> > > unused and are being removed too.  This commit just handles exynos-rng.
> > >
> > > Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> > > ---
> >
> > If the driver is being removed, should the binding documentation for
> > this driver not also be deleted (see
> > Documentation/devicetree/bindings/rng/samsung,exynos4-rng.yaml)?
> >
> > Peter
>
> In other discussions I've been told that devicetree bindings are
> hardware descriptions that should still exist even if there is no
> driver.  It doesn't make a lot of sense, but it seems to be what the
> devicetree people want.  I expect there would be objections to removing
> this binding.

Ok thanks for confirming.

Peter.
