Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906D11F0E36
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Apr 2025 23:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743637931; cv=none; b=mrFFIa92F/g1iIPa7uiyzVJUT7xAyTcAHt/CxOY3newXtF8t8WTi6bBhtTXHbSJSSCGgGBaYDz9GXKrXia4fL4a+ZVY41FSJFNaA1pGhtnQgrK4M+j+C1JwJq9sxlxqCTkBNdh0Xipeix/F8JsvAugZpGIeiutZEzhmn0IhaqBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743637931; c=relaxed/simple;
	bh=jMLyU6i1wwQTrBMKiV8dfyZD/y9tvNEeMglIXxnMzwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E3qwSM4rg6ckyZESMLE5vjhQMMglGZDzHBWqimK3DbJ5W76PDWcaQo9UtVhjJ5nykX3ksZZXO9KEvP/g58hwjMRNVdixqp3H951tRjcPCLX4hYnJyBuWQ0taf2+DPj1Jexi+XNYL/RU1C+7vkeM0vxP/+RSKiVMhGvjPk72YJnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FLX+Ktmb; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FLX+Ktmb"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30bfc8faef9so3170351fa.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Apr 2025 16:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743637928; x=1744242728; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZY8otkMYxUzAC1QwZ9rYHNq5MXftY+mTN4XwBPSLJk=;
        b=FLX+KtmbffTRczIrxBTVM58L3T2qwstq/D0tdJEq6WjT60z99cBmqzOm5RSMo9uyXm
         YGWHO/Do10lnM/1qNsr9G+Sp+TS36zaDeWRc6MIUIpH9oHMo1AZLTgqlDuvjA8KOkTN7
         zxUyfqDvP6GAlly1c9r7kEinHVyhA2tRP+BdQjeqjOKgAhjmfmPVK4Vo/5nlhy9+x6Pp
         UqvBDHgge3eM+mK01oK8ice/4Faem4dIkeeR7oGIgkgKifOYdilD7GVy7V3Qrh2/ZzL3
         zYZbTEM8bT+z2utPNQIPwSZZARMNxusK2LFS1hiMFAw0WqUchnN37H3gxoD5Eh8rIxyw
         +7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743637928; x=1744242728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QZY8otkMYxUzAC1QwZ9rYHNq5MXftY+mTN4XwBPSLJk=;
        b=XIrmLxIZ3MBCL23zhkyAltzcE41VQV3izIAsGFJ+Jp0hMwCfe/OXa+L0vZV0ckc72o
         qPdiS5t6ptGcy0N1GA0MQcLo4BnqnMBBp7ugqnL71QcI3sF+rkrq3aUvYcLtiBkID2ZZ
         HR3hhSXu0JI/4iDsEzxEjRbqNAgiUtoUSdG9dZEQVLYT90OpkeSaoJf53lo/BXgigkBn
         m1iWTBNFi0BpWGuEkbxmw72NK+7dHn5UFrgQ9F5gGXJK+HgBdbXMwW3TDF8FrrLgmHf0
         BKcVWBrZAiJKAa2utgMozbWC3PA6y2YP3vwNdE+HOFu6dd8VAC6zVhoAZchMRyYt+Mxw
         1B1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWykRYsHdueApQ6H9OUolJo4QjzJd0eiC/ep9PTQC4sfLwtqGR5KuKLe0VEGr6LXqZDKn5GGnFXY8Alk300j+EqHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKuLRmeEsh25m3D6JBwxLcmPzLp8QSJQa4S2lGxCTyWRX0+RVw
	h77Wr+8hljXIET1FbpzIdaxJQyihS96KrPYe/DJ2x/pQ9dsyKAhqNKPgPlGMJDJUdaVkABRiDBz
	Do+rguH/9Rn20CKAGFBwZN0Myt5Mzmt894jk=
X-Gm-Gg: ASbGncsiaOOde6zOwD+VchMHGqduO4VfhkOhwDDjLy+ujHo1OsQJneVaUCNoAJ21WU2
	9v9wDGIXMeBlwaKooGiAKv8YJe1o9QpWaSRwpauKxWPNHMe27LbXlycUILSf3S+bL3E9iZG/Jyc
	MiuFpfIHFYcvhZnASdGjjie7yWUllnrBV6iAr3zt+lEvIN0KdDLrC7F3Q=
X-Google-Smtp-Source: AGHT+IHlbF+Rcpq4SNzQqBS7VAxDQsrV3ZwngjWYjf5S0S28hVedbHbtxlbFZnmwmOWaFBpWoJrxhCkIAdvd/qI3WYE=
X-Received: by 2002:a2e:a817:0:b0:30d:62c1:3bdd with SMTP id
 38308e7fff4ca-30f0213b687mr1914151fa.23.1743637927467; Wed, 02 Apr 2025
 16:52:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402233407.2452429-1-willmcvicker@google.com> <20250402233407.2452429-3-willmcvicker@google.com>
In-Reply-To: <20250402233407.2452429-3-willmcvicker@google.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 2 Apr 2025 16:51:55 -0700
X-Gm-Features: AQ5f1JpHnrRyIgSkaS_9jCoC0VsbpgZrv9QWyrsHr40oDXAIBk4dIsCvT_HYCMU
Message-ID: <CANDhNCpGxedaxjZ=6Trai3exbQGf7WRJUeTC1jqoHOhup2mNLg@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] clocksource/drivers/exynos_mct: Don't register as
 a sched_clock on arm64
To: Will McVicker <willmcvicker@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan <saravanak@google.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Youngmin Nam <youngmin.nam@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 4:34=E2=80=AFPM 'Will McVicker' via kernel-team
<kernel-team@android.com> wrote:
>
> To use the MCT as a sched_clock, the timer value has to be accessed vi
> an MCT register which is extremely slow. To improve performance on Arm64
> SoCs, use the Arm architected timer as the default clocksource. Note, we

Nit:  sched_clock is sort of separate from the "default clocksource",
and after this patch we still register MCT as a clocksource, so this
doesn't sound quite right.

I'd probably reword this slightly to:
"The MCT register is unfortunately very slow to access, but importantly
does not halt in the c2 idle state.  So for ARM64, we can improve
performance by not registering the MCT for sched_clock, allowing the
system to use the faster ARM architected timer for sched_clock instead.

The MCT is still registered as a clocksource, and a clockevent in order
to be a wakeup source for the arch_timer to exit the "c2" idle state.

Since ARM32 SoCs don't have an architected timer, the MCT must continue
to be used for sched_clock. Detailed discussion on this topic can be
found at [1]. "

> can't completely disable the MCT on Arm64 since it needs to be used as
> the wakeup source for the arch_timer to exit the "c2" idle state.
>
> Since ARM SoCs don't have an architectured timer, the MCT will continue
> to be the default clocksource. Detailed discussion on this topic can be
> found at [1].
>
> [1] https://lore.kernel.org/linux-samsung-soc/1400188079-21832-1-git-send=
-email-chirantan@chromium.org/
>
> Signed-off-by: Donghoon Yu <hoony.yu@samsung.com>
> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> [Original commit from https://android.googlesource.com/kernel/gs/+/630817=
f7080e92c5e0216095ff52f6eb8dd00727
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>

Otherwise, looks good.
Acked-by: John Stultz <jstultz@google.com>

thanks
-john
