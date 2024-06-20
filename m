Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E92285952
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jun 2024 21:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718920324; cv=none; b=lmn7r/qb0q2MkbwSBSx47v6dVeWjIIP2Rq2JZIalTnjrNzpDk90jNZAT1/BmAvmWdg/9WOt3FNpA98R2sWyMaTQADP/U+Nh4J6KszvQX/t5uPuSySY6Dkp4Na1TXOiW/BlR5lT+7EFFEuxvyO/cFliAmP9oV8HKd5Rrxc6qgqeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718920324; c=relaxed/simple;
	bh=IDGHQeVi/J99Ud0h98ztO9JyZxnoDSj89IWh+m4Qijg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mBbcEmkzcq8ageVBp9oY4pklAlR+hfPtw/PpAmdl7mJOkGNI5F2WGWVVL/hm5wZOouBMON76Sdq5mMbYLD2FSmA0n2xuI94IMSvEEBVHKtjfVsU/LADszPYANvFcorJOG6wo+8RG4cFSyCUqrHQNRQrrvtck0gqSdTyOmFEqk24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D5auG+h1; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D5auG+h1"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e02b605bca2so1870856276.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jun 2024 14:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718920320; x=1719525120; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S5TRSOhA8iGH1R60np2uoqVbWEYsCAZsWtQBh11sRns=;
        b=D5auG+h1GKzv+9RcwYa7bi/7IqQ9PufT+M1bZ5jJ2jm25xD1SoHBYNHVt4B2YPfNWG
         W0HJ7bITl0TLbsuGpcL0nb+8+gHnqhYAc6lQ66X8oPIWhbbb5vO/hS+jWwx3UzGWM2FA
         11TzlXpd0h4gTvV0DuxXzYiYbD24/YE4hxV+krecm98YrRlCsbrL9JgvXT16Wt2Qwngo
         98kPBvu17nx+rWyqptx+2UdDOch2+wE80gc56bBdAjHwP/7H7yj/qwPOpTjgdzcPxyce
         m9Nz8gEituRbOP9RWaSI5orXOtD7uba/+3N2Nah6FKRe6rHTOAu7cjMyVs+GcjF6fnVR
         /FNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718920320; x=1719525120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S5TRSOhA8iGH1R60np2uoqVbWEYsCAZsWtQBh11sRns=;
        b=bcne5RptOn6MVC2R4sey9LAYQywWdYFSStKFNkdKiMRWKzldlh0vET5ff88zHakIXb
         hCtycWHE00763SSyq/Pp2Lc/YGeIoIK4t56Bs5AryfrhJ60uG9zolXEiikrAN59RiZP8
         b2yoF/uyWkXDyldrh5bOodpiUgi8W0EkGUbL3Slg33gNyg0wJZZVu0fc/dx1EC619MHt
         Qz6fURfzw34ieGF+XKX57Ds7KvrZEc7Mij8jAf+AewQYOU7dRfISII6dvzwhfNopOLHl
         96/Fd/IHOZnQwCvfnYH7SK6/ysPzgoqrS/YRDnP1z3sNoRN6TubeHUM4lOfoSPeJFBjE
         0Jfw==
X-Forwarded-Encrypted: i=1; AJvYcCVFFezMLj6SOCPz27hP4rRDGzJePZ1sUwByJXbizARv9uJahJ5cza9OMvwQd4tnm1F/yzt4VsmMuL/guWYGPAO9TvB17chk88uzdsJrKSrKk8o=
X-Gm-Message-State: AOJu0YxGdMAaJLUBlIrIrDsSO0KhdVhHrejB5hPC8F5jCvLQ4G2BNyy0
	0f0oog2QZvMTf33GK5MzGWo7CqSkdAONtsw3PvH7hp1oda76Yy0Dvl391DoNjMRbl2ffd9Vp6+A
	esmiHuX60nr2juFpPz5njjGgeadCTlFi+mdjCnA==
X-Google-Smtp-Source: AGHT+IFWhs1oHnCwYtIqEUDb3GYs2ctlTMeXUy+SHit8M9zRZ1POT9JRHWWKif58A0sP7XezyP4BsfWsLr49BttIR4Y=
X-Received: by 2002:a25:800b:0:b0:e02:bc74:522f with SMTP id
 3f1490d57ef6-e02bc7454f5mr5257999276.30.1718920320565; Thu, 20 Jun 2024
 14:52:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240618204523.9563-1-semen.protsenko@linaro.org>
 <20240618204523.9563-8-semen.protsenko@linaro.org> <6e4e78f7-9d94-4c4e-9098-02522dee29a2@kernel.org>
In-Reply-To: <6e4e78f7-9d94-4c4e-9098-02522dee29a2@kernel.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 20 Jun 2024 16:51:49 -0500
Message-ID: <CAPLW+4n_x9dBwuSOyAn4fNA61vHPRCSMVzTs3p3Oa94NCOhDFQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] arm64: dts: exynos850: Enable TRNG
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Anand Moon <linux.amoon@gmail.com>, Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-samsung-soc@vger.kernel.org, linux-crypto@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 2:31=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 18/06/2024 22:45, Sam Protsenko wrote:
> > Add True Random Number Generator (TRNG) node to Exynos850 SoC dtsi.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> > Changes in v2:
> >   - (no changes)
> >
>
> That's a patch for Samsung soc. I'll take it once binding is accepted.
> If you send any new version of the patchset, please do not include DTS,
> so the crypto maintainer could apply entire set easier.
>

Thanks, Krzysztof! I'm going to send v3 soon, so I'll remove this
patch from the series.

> Best regards,
> Krzysztof
>
