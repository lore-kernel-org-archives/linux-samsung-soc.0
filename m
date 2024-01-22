Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E8E23B0
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jan 2024 02:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705890867; cv=none; b=kgImOMjJ569Egr87bv9PD16ZqcM1pkdDITiFlb9eYAZ6aqmIUMQW7CjWRuF4pdFJweZfeB+AX5f0YGHUXSZH9BvKnG4Dd1w2ZvLJhgamqa/9g1fDIIrEPc1F5x2hsQcdG5WdcOM5/HzmS5muODy5O9Xz9V/QVLtttlEdWZHBeu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705890867; c=relaxed/simple;
	bh=Jc1vxH9oElnpYYtlCK7aPj6/1Y2UfDuvd4ovdGY5mNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gse6G1Y5jhUx6aT+GKR99eDZjApEoETGV3GRQs3APC08gN4Rz/6nwti78kX8o0nPw6uh1EXZ1btGxR64XfjpSiFGs0O90968GcT7yi6ljvb4HSEuYLyVi8oddze6vSxVElw4ZbT9aZOhu5vSrnLGhTCH0i+B3dr7A3GOLBtmssg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wSy0ow6p; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wSy0ow6p"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d71cb97937so12743605ad.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Jan 2024 18:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705890865; x=1706495665; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vE1OY1qe3mhwG3BkJPXvoUEM/xApQQR5+v8JigF8XJ4=;
        b=wSy0ow6pMBG1PJ96oGCgB0n7d951I/MC6wwoexJbX7kXQ8yudJDjb0Qml6M/1bfIg6
         7jBQMRxasA0efHXw0Q3iEXInc8LGUQ8ANIwEUoF7mC2O3eR8sejIjKsYc0cEmzJyiV5z
         aT1QjyB52rKR5JYzrggAgOT1jSMgdLMQY56pbBOwHAA3sVt4+HhKOOlz1qa+4KUFcPK7
         jed5mRU1vVvtQqvYZ8ul7otOHL5r9/xXGscQ1OCUF8B8FzRmefP8xk4WFiTFspLZstRE
         h05LER4ZyhkBrY5linJ8UhF1CS5x0AtkQ6OiBVQW/93oYmjV1OgajXbVfKr4fK+KGU0z
         ZFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705890865; x=1706495665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vE1OY1qe3mhwG3BkJPXvoUEM/xApQQR5+v8JigF8XJ4=;
        b=lwwKEZf98G+CB7vt+ZD22VxUF5sDdETYBEqhr4GyKBhyopP3d8/ESAkcrBjWSYMg13
         UIyJNHXS2OY5XAlYOSSMbBVC4rN6Nji9Mf6pVVwFYLVavuzwLcpzIXG7A7Wvzit0cR17
         gjb0F+Xaf3sX9VSdp/hwPkG3vwQAp4WvUUNlIzJfdnCkE1BmC+jg40+yOw8mlYnJ3k9y
         Q8eIAgxS8FoBGUE5KpzgG9DaPN0+MXd18M9bZ/q2tzE+sFZHBHZFjLlELwZObO5edrlc
         LeFaI7s6daerb7LcY1rmoK8pN32kg+MQU1GnGiWQOz+GlTfXtiforMUco8XIwASgoDb0
         rMqQ==
X-Gm-Message-State: AOJu0YzP26RaLkQXWntgP+2b0R/p0xKaPWnjdrTpsL6Vuqkkw73Lb98p
	/SdU8X1IQcoKOSgnoO2u+CBc2swV2KJXnwZBaiKiXpT8h7m/QlKl59leCRnyrkRsqefwHoIiaT9
	ekM0oNZ+vuwsA2dzdR+I6T2D4SRAkQqARGt/DPA==
X-Google-Smtp-Source: AGHT+IHCreYFnEMtKrczTac/Lwewh8HBY/ndr1dl8NJfk9RxD/OaoribK0R4KjkkTDzQC+jMTlk16xwW4YFwr8oPLcw=
X-Received: by 2002:a17:90a:d082:b0:290:620d:b432 with SMTP id
 k2-20020a17090ad08200b00290620db432mr738532pju.41.1705890865679; Sun, 21 Jan
 2024 18:34:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240120170001.3356-1-semen.protsenko@linaro.org>
 <k5ih3vurmzrirgfzy62r5nezm2sxp3zf2qa2bhzowybthkvduv@wjywn55v5hmj>
 <CAPLW+4nJKt4xNxXbqQ=c5rXCEau56Xd9ocNKqcuHLo7+-CH8-g@mail.gmail.com> <gmj7lfno4qcxwk7qimnsnostvjah72fbgcstcykly6nkzqrtjo@2ck2ny3ifqqw>
In-Reply-To: <gmj7lfno4qcxwk7qimnsnostvjah72fbgcstcykly6nkzqrtjo@2ck2ny3ifqqw>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Sun, 21 Jan 2024 20:34:14 -0600
Message-ID: <CAPLW+4m-GPmF6w=Dgb_WbJ0B2ynRSRRC+ijY4Zym5i5BJe4eBw@mail.gmail.com>
Subject: Re: [PATCH] spi: s3c64xx: Extract FIFO depth calculation to a
 dedicated macro
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 21, 2024 at 5:27=E2=80=AFPM Andi Shyti <andi.shyti@kernel.org> =
wrote:
>
> Hi Sam,
>
> On Sun, Jan 21, 2024 at 04:11:21PM -0600, Sam Protsenko wrote:
> > On Sun, Jan 21, 2024 at 2:24=E2=80=AFPM Andi Shyti <andi.shyti@kernel.o=
rg> wrote:
> > >
> > > Hi Sam,
> > >
> > > >       void __iomem *regs =3D sdd->regs;
> > > >       unsigned long val =3D 1;
> > > >       u32 status;
> > > > -
> > > > -     /* max fifo depth available */
> > > > -     u32 max_fifo =3D (FIFO_LVL_MASK(sdd) >> 1) + 1;
> > > > +     u32 max_fifo =3D FIFO_DEPTH(sdd);
> > >
> > > Why have you removed the comment? Perhaps you could place it on
> > > the side in order to remove that awful space.
> > >
> >
> > The fact that `max_fifo' contains max FIFO depth is already coded in
> > the variable name itself. And with that new FIFO_DEPTH() macro, it
> > would be basically stating the same thing the third time on the same
> > string. Thought the removal of that comment only made the code easier
> > to read. If you think I should bring the comment back, please let me
> > know and I'll send v2.
>
> No, that's fine... you have a point here :-)
>

Thanks for the review! :)

> Andi
