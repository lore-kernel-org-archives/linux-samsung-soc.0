Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CF93B388A
	for <linux-samsung-soc@vger.kernel.org>; Fri, 29 May 2026 20:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780084963; cv=none; b=LMNYvN68JwJJuMxG+oYNmVr4ohXtk4fUrdkoZXAlHrVUoGUSadB6Fc5C/weFiS4l4n+Gq/R/FdOT03V3fw5ZffEIuRvUQ8CzShUU5LNyD6QseyhQv7cE97DdY0MKWa4wJL+uAce+D+6EMF8CvbmNtrdxKsHoRKvqxjwiKBYvdL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780084963; c=relaxed/simple;
	bh=3IoDhb3udmXxflS3dgrcLv1niGYnHXK5D0HgB/kdlyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mTy+fIY/hdycdxYfiiAWLlJjWFKbfieRP0RuRonRXa0xm2pIzVBa6draXvrSIz7zvm2EXXZ/uXNaSog8qTPnhG5UG3Uvy0lUzr4kdd5qLkLQt1R8UPlaMff7Mk8nalor+pwQfITtMBrBb14roCLu7VzajL4MPM6weASXqbdtTMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZlarIqBW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZlarIqBW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C77B1F0089E
	for <linux-samsung-soc@vger.kernel.org>; Fri, 29 May 2026 20:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780084962;
	bh=3IoDhb3udmXxflS3dgrcLv1niGYnHXK5D0HgB/kdlyQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZlarIqBWtLGcGIdM2D5odT8h71DAweyXa2Y8k8pHd+US5FR+kmMo4PR1UpJNcqvFg
	 VsgUHFWdn6XOxhXICNF2Xx14atl22crYlJdj5NRdZJV697Waap41kNM2wxjUwuCVoD
	 cF9nHEh3l6C7hOV3bcoKpd3Phk/uMm9STgYb1lPP9CqsUIAu4Tz6swP2sZyeRkXpvr
	 Wyswhck/JhJ6KMfL5aylsDFOQZR/rDcHZ0xNk6Sk9bFthDpNMBQ1fSMj24UmIyuIec
	 IMFoJjRJKa8KSF3mxA1yAZB9XS+aLT4J+Q9uwgQrZ7cEkmToNsbDEnF++twcZDkQlD
	 x8jvjunZ2l9Cw==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38e8292423fso99731091fa.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 May 2026 13:02:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8hDrUjHal9RDVFiYCnc1RpSXIIQ9Y9ktzHPdsHbI1njyqjZiTuawXq+EXQzAbba3tPkErg+b+CJ8/ouXQGWKDm7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb5WuYy1TosAo0eZ65vmyS3j7G3SV4bPUDZF54310uuiW2G+TL
	UozXnyYUqEpsKgH7+z6XJhecRI/zWE9PcKOJxROYdGzJDv7e5tpIkXpYHZHKQ07Hv4HJx7dQGRN
	WSTZOno1+BEl7UuL2MuduNSX5guotkZo=
X-Received: by 2002:a05:6512:110f:b0:5a4:19df:db1 with SMTP id
 2adb3069b0e04-5aa607bdf2dmr472223e87.15.1780084961397; Fri, 29 May 2026
 13:02:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260527-samsung-pinctrl-maintainer-v1-1-bcebada27279@linaro.org>
In-Reply-To: <20260527-samsung-pinctrl-maintainer-v1-1-bcebada27279@linaro.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 29 May 2026 22:02:29 +0200
X-Gmail-Original-Message-ID: <CAD++jL=ci76uJRi3miCeK=b_niFfpbjB596UvHhBVWLXPSvtXQ@mail.gmail.com>
X-Gm-Features: AVHnY4II6mWwzs5HHtPCKUO6QCDuwfRP29kXe_FIpHNftdTxNbG5xf6Bwi9pi9A
Message-ID: <CAD++jL=ci76uJRi3miCeK=b_niFfpbjB596UvHhBVWLXPSvtXQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add myself as co-maintainer for Samsung
 pinctrl drivers
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 11:09=E2=80=AFPM Peter Griffin <peter.griffin@linar=
o.org> wrote:

> As Google Tensor gs101 is based off a Samsung Exynos design I've been
> working on the Samsung pinctrl drivers and have an interest in helping
> maintain this code.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Patch applied!

Will go into 7.2-rc1 in order to not annoy Linus (the big penguin).

Yours,
Linus Walleij
