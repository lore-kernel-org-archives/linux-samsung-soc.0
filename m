Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C352D1AB6C8
	for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Apr 2025 21:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744837241; cv=none; b=PJ3yVNYVdW4y7z25YZTGEggUySSET+u3ZJDQVOcJ1bTN93oGDFxC02Y5MZwjX5CvuPoYDz3LPggaT/YUzkz+1l2lAkE7+oLAXSvGCFke7QDu6zVivvlcPksbySKOrzPB0H/1aMh69ByMKAGhk0iKmNfdgy35VqM4+hXERp4pGbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744837241; c=relaxed/simple;
	bh=sXjuke0/1XVuLNfiPlV5GEJxawgB3CfnH2aaqTJFQXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lijhSQKtr8Zb3qmwXAZqy7WBFl90RqEdhwGRDDHj1jZF0TP+d0/O/VG3uajf7CvRNUFK43IDBeKnXq1DLfLkHkR29lwZOhLgoLL90ePvrLsB6azjIz3y4VV0IU82wcHZZL3dJUA4iET8ihdqI5kYcqViaZ2P8RGoAys3fKspapg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dWqyRNDF; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dWqyRNDF"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54addb5a139so111831e87.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Apr 2025 14:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744837238; x=1745442038; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sXjuke0/1XVuLNfiPlV5GEJxawgB3CfnH2aaqTJFQXc=;
        b=dWqyRNDFYNYZG2I79JBccuGjWRO3erl5pZhj+DwBAhF8STFVP569vI2iwgGytANhUb
         14aRWZoWTYnNU6vXOv7fWxukDs/ubORZZnxlDO7xptGNEC+JrvOPHzWM1Bn9/WJXUL1+
         daN+rU9E+bgpTgpn9XReIcqJ8n38gU6W6dPbcDKKK/idfnBpNh2UwovcD14OJlJqlFuC
         DVU52OX31aUkI0N7XuUdJa5Nc0nQzf6BYgMgvoe4kAY2NhjUsneEzBygPL6EcrtGR3ZN
         i1/jDy6NZTKIaBwzSXA290lYBTyPojymexx7us3U12MXqjM69xXInb4Hv78dLpysYKtp
         5srA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744837238; x=1745442038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sXjuke0/1XVuLNfiPlV5GEJxawgB3CfnH2aaqTJFQXc=;
        b=GirQ0ioPqRxx4yIB15Ns8pX0V5jfeEzSaX/ecLPd6soMm8yMwYbc5wRLGitEAKzVPg
         1X+fRu+vzyW1T4IuNn+oHFz5tQB31em4ordPHrAvDYYdXz+Gs3mcUrJeMk610UgXqBAI
         O7UCRifBmZManZhzUZuLWMFejynlvMij5gWgiHI1h8iyWfhvvhU0HPr013m/KmDo+z4i
         hjOJPzTbQ0NQHtl0VcDF2AMeULvqel++JQs+VQ2dNeriVleA8NUBB8A+ar8mClxfIAAX
         bkRRh/DdNIZAyHdsd2tEFv6ar3yTdwXIiv8Rf7vxYQHJMattOpcdIXuJ8tpMR9L5Dj3e
         FKbg==
X-Forwarded-Encrypted: i=1; AJvYcCXBMm5kq/Qm70PPGf72MqGv1gc1S+LSGMc4JvLQDDvi2RIqcqylJaS1Uns0EeHbPoN+5Mjr/dm0cYWUlgqgTQotwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhBCMFaTsHelyA0XmAlYMU+XsK2o5MGdFnxK/fRrFPlCPO+l1J
	lm9E9xoY5ZIoTe5V30+hIQEjv0kkKoNAKVGvzEAuyu52OBSLbXMbesdjDaIbKadaqxAtnS274D2
	I7aAZjpDDV6K+xaYEAwl33ogpcwxmicbsQS8=
X-Gm-Gg: ASbGncvB3lvaEnQ8arF+1BFWy218FZRK+UKztIA1B0ezRduYj2fLEzXPO/Vt71g7ARE
	7Jd//Qt6K96EMWAWf4yY8JMTT7IoC6qgdG1KTj8k2/zwW3zho6s9IL86ZdqJUtw1fW/927qIWOq
	/E1Sg8mH2gfXsnGNr0UEe/QQ==
X-Google-Smtp-Source: AGHT+IG9hAb/RqcUyMjum4adu8+LeKj3lYKNlalqPEWwBfkfUt2vnhzCuPcvV73P/EQrHGM4wuLbO44GnaPBGO/0zi8=
X-Received: by 2002:a05:6512:308c:b0:549:4e79:dd5f with SMTP id
 2adb3069b0e04-54d64aea488mr984588e87.37.1744837237634; Wed, 16 Apr 2025
 14:00:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402233407.2452429-1-willmcvicker@google.com>
 <20250402233407.2452429-7-willmcvicker@google.com> <Z_6OZHYfC0bC5289@mai.linaro.org>
 <CANDhNCodHATboF2=U2tTwdEkEJ+PsfB2F=fbBrs=J1UzZTEX8g@mail.gmail.com>
 <Z_-0nX3Z-DLPjL_j@mai.linaro.org> <CANDhNCr5n+HtHQEqCq0ZxbvX-nC3u9ewJ1_fj0h1gFQZ3nB8iA@mail.gmail.com>
In-Reply-To: <CANDhNCr5n+HtHQEqCq0ZxbvX-nC3u9ewJ1_fj0h1gFQZ3nB8iA@mail.gmail.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 16 Apr 2025 14:00:25 -0700
X-Gm-Features: ATxdqUFzpyQW831S9hdAwTuoas7KRwwuK39VUOIcXhttpaGT_PCdnsoFhEv7ehg
Message-ID: <CANDhNCo-UF7uVWWMPEYyCzT0R7BTHb+uLq4d8ZfxURuk5r2AwQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] clocksource/drivers/exynos_mct: Add module support
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Saravana Kannan <saravanak@google.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Donghoon Yu <hoony.yu@samsung.com>, Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Youngmin Nam <youngmin.nam@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 12:48=E2=80=AFPM John Stultz <jstultz@google.com> w=
rote:
> On Wed, Apr 16, 2025 at 6:46=E2=80=AFAM Daniel Lezcano
> <daniel.lezcano@linaro.org> wrote:
> > So the whole clockevent / clocksource drivers policy would have to be m=
aking
> > impossible to unload a module once it is loaded.
> >
> > Do you have any ideas how to ensure that the converted drivers follow t=
his
> > rule without putting more burden on the maintainer?
>
> Permanent modules just don't have a module_exit() hook, so that is
> pretty easy to look for.
> Obviously, I don't want to add more burden to the maintainership.
>
> From a given clockevent driver (or maybe a function pointer), we could
> check on the registration by calling __module_address(addr) [thanks to
> Sami Tolvanen for pointing that function out to me] on one of the
> function pointers provided, and check that there isn't a module->exit
> pointer.

Saravana also pointed out to me another approach that the irqchip code
uses: macros to populate an owner field with THIS_MODULE so that one
can easily get to the module struct
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/inc=
lude/linux/irqchip.h#n41

thanks
-john
