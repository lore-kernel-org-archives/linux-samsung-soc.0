Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAAC3064BC
	for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Sep 2025 12:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757678596; cv=none; b=CC/hTgzYaS/8oP2p+u78VZ7t4FVe4sebFmd20bZ6x5mBv7Xv1qyN4j+REIub7ADQPxK8dvXSS1QA7bbcT5VeKq7dPONCg2C/8KYv1E0D80gncDuvsCtOeFTZVc9he4R1BOkg6vvvegTLJ9SN2luNYsFFNpKfShzxEKwuxIa3HbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757678596; c=relaxed/simple;
	bh=QVperRnHEJSGJPTmM6KVvWxpKyHPxQzH/drJR08pJQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dPfF6Yt7uwsMcvRcrqCWmpFTDvaSaovEPs581RJJpeiufDU8CSKSGypvH5goNTsMAVmYc2Pubq8wI7MfWXT9Iui6mINJkoHUxTfExZDaqRsdg1OJdaH0LGQC8x3m4+3i28o99+1vnfJUiSlZwglMvNbkz8z01SfFy9Tbz57R1jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DL4/ihgf; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DL4/ihgf"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-560880bb751so1818963e87.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Sep 2025 05:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757678592; x=1758283392; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0PdFHKIGbwFEvO78k7VYipO5DNz3mTKctmHS0mOU/VI=;
        b=DL4/ihgfFFXwIRBDN6byjzagNqLkh6HN+KEtNsE5XF3GAIey8uj/hdG7u9iRH5pUrg
         gWHhGaL+Ykdw4rYmVdMYI6leNkBKlLrFjG/1x2rQkFpUAQ6Z3CkS11dReuW9O4AmVMlt
         ASL49h+4ZOzl+GtpEKbGODW3bjM7/2AuiTCL8lmnLbTssR8bW/hIoQ9PMrwaz01dAjRh
         SXPjN2aeV8ms/mb3CGu0aM0/ZupGivEdLqnLPrCsOyVJuW9XV8g/VhgxyWMaAuU2PpfE
         PZu3gHqsfIk4TLuF+bXwa89ifMHGc2Ndloe1sLqoc4tXbclcSngtOEcCjhm2JwvqnjCR
         trsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757678592; x=1758283392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0PdFHKIGbwFEvO78k7VYipO5DNz3mTKctmHS0mOU/VI=;
        b=FAUFRhOdVdcV9iwu2M4OX9mc9AOjqW+l8TyutX+X5P3/uBTlcbtcO9ItPa5Myo1gVg
         ErsbrjDvaFpZ7rCtPUt2hjJlWc5MpAwbeDz+hsq7mrFOb2/qB1qRygIjSltpmgwei8TO
         3cwmlVnb7HPDW4nXpK+EAQHt31WqlG/jnQILu+K+CdVnDNEUe+wJYTrmOTz22EIdo1gB
         Wcq5RtWpS365KiqwVRBuu/BpR3pT8z4fMcgFMbaFpYM9jtBr4RETAhcrpfi9dmqyJiV8
         8LA+TTpEwLlxAsRtCo2ETNHus/AvLxPrJG22P/ASVDI7L/LWm4evlFpvdOqKe1duUf1S
         l6Qg==
X-Forwarded-Encrypted: i=1; AJvYcCVAZhIlpGbZ5MpWJ4f4LvzuiPuRFA9f/pQn0Yv1i8HtMJ7VkqAmCe+gRAGES/X57RukLHdjAjSUwFnxXW+DpmbaRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Q1ez6yGe9w4rDDM1TvgvAygrA+j2Nuv9qTDHF1DcZs/j3DRi
	LRv2dW2pGS4XcWcfSJNmaPTkToyGLd060ZjiGjWejWJXJWWFYNO1YnQHrw8oXWeq5jZrdw24ITW
	bILpxk2fo5dBguUdzk4h8nu8ce0r2O3CpL8QPbPtPPg==
X-Gm-Gg: ASbGncux6gtFWYAKCM07S6fKjr74oJMiHmPxSaLIYey8/bqehYZDrRtRL0WxEr+f9nb
	ULxJ6sK6zyc+xb7MW6fUzqanBqVeZHTNOqt8z3D2y013Uqk22Nrkj8t9n7cMJ6Mdw7K9ZDoUXxK
	ipb7eCFqwvTCOE7aNtnddF4hJTuUQ7Fq4muXei4pHYnTnzOt2Drj1CUG0ulkA97jphRUfEviaSH
	pt9F+I=
X-Google-Smtp-Source: AGHT+IGSZOlTW8CCLhnbl5TBUxb6BdFbzV6+OuHe7/KsFBuH3oWJWnilJXYkrdME2jw+G6yIQ8lGS/eJCMYe6xHrNns=
X-Received: by 2002:ac2:4e0e:0:b0:55f:493c:ba2b with SMTP id
 2adb3069b0e04-57051f3c661mr692236e87.49.1757678592231; Fri, 12 Sep 2025
 05:03:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909181841.102103-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250909181841.102103-2-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 12 Sep 2025 14:03:00 +0200
X-Gm-Features: Ac12FXwqQ4S6LsJ5ISymFmSoLLy-PySRhoETtxxqmtEpkSI7Fd-SoneEsLrhhRs
Message-ID: <CACRpkdZAt2n2gd7TuwRiBzUwjKy-LH=d7EYC7hg=j753UxKQYg@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: samsung: drivers for v6.18
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 9, 2025 at 8:18=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d5=
85:
>
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tag=
s/samsung-pinctrl-6.18
>
> for you to fetch changes up to d37db94b078197ec4be1cadebbfd7bf144e3c5e4:
>
>   dt-bindings: pinctrl: samsung: Drop S3C2410 (2025-09-02 12:31:25 +0200)

Pulled in, thanks for taking care of the Samsung drivers!

Yours,
Linus Walleij
