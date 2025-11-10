Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0082A2F5A2C
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 20:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762808266; cv=none; b=g0v4vEsZw4dOXmHuI8FskW0WDezQ1L4Az7nG9iYDwmtBX+T05BfNl5gsNftXw+KsgOpZQ1dRE39UUCRoiC/EeqbwOi1uWmdeHqmIuNHwhXdYMpLlgXoaUrqUQOSUy/aa+RUJloB5ZBe3P1z2rYt3dm29yF1b0L29elM7JrYHD6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762808266; c=relaxed/simple;
	bh=EMkFach/QW4lYNE6AmvM9HnCCahChKAdwsSK9+U2fRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c1NmWYIpOLiaCTvup+IVzY4SaVBZcnPeGdCum9lqM9wCUGxK8xvRqVEvsQ6Fass+mJysY/eulmJzMvclDMEswNLqYc+URKTZyU/wsff8G6ZE4Nsy26OoY2rVfdD75J4gWoxemFITQLBKdLQ1VQywjWuHxbOF2SOMHsPQrrBozCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NRxCRWZr; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NRxCRWZr"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5943f39bf9dso162635e87.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 12:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762808263; x=1763413063; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mh/JsKiFmpvDenrO2RV6pyacRnngWdajIKt4QMpWgfw=;
        b=NRxCRWZrHXnwtg6qXEtxxQ+QMCxgBV9+plu1durTIcxBiM7+2UXavjPov9hOqOv5mu
         4dVdgTTvswiNadLbAKzX1oJEBfaRz8Ug/SKcCUkbPrQQj9foRQB0z3JHhESku0vxfw+c
         tzC3N/oCcoGD+mq9Z0MwI2/lYUbtoPKWsmretsoyPDUFGqDXa+c0Gwkl6POiEPnflJ7c
         85/rweXlKlreJ//KppqbmBNvZoSAi6peMnSFaCxryGFQPQTJ8PXHyey/qAYvuNCt5GvB
         CefYiSRfPdBmZw0NiYFgBF7zwJQpWc0/CWHnMxzcMDQCmJpBQIWhquvlu25DVS653mNY
         7rQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762808263; x=1763413063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mh/JsKiFmpvDenrO2RV6pyacRnngWdajIKt4QMpWgfw=;
        b=J77r5r0xGPAASrxmtIMhjUDtXP3XI6Ney53RhbVVsYB+UqAZI2vKyoF/rFdL/eJLjA
         +hsxP4ICEdopfIbzuSCKNsKmNO3wW4vFL/IcY28JnWIt5S3QQ+GbDP097U1zPgjOS8to
         9iqWnHFQMHABNzQxMqkQsjw22ewmtR76bXkpi32vf+VlB6Ey1lbBJQEwkOsXIk/OYsyV
         T2SNX4DlTaiYrTd1AVJbLA5QiSMRDJaOR0PfviDO7qZozK/E9Kk/Y1+2ez+KCqqxKAEF
         N4XUD/bhqdhVSapXBsTATulloVGgoa+smxbIFXs/+lExrG6mCUFR0h+bgUM93kQlLP+W
         uPUA==
X-Forwarded-Encrypted: i=1; AJvYcCU2+x0/+wIrtbpUf9mUhT4ZhfyciN1hN+FM/6jghXrT1EyWljAc1po3vxYy1AzRT3fBSwTcFHqAzr3lvt13dpk+7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxAkhDTVhYJuGdgLazSCSE+KRNG7RRmG/iOqPJfBHMh49qS70J
	pMhzL8qDJpCyM8z1ZOU5FVo4gM6LpVyjzapMaZRedupo2jQAslqMJ/CtirY2GCtubZOF3Lf77Sh
	kS113Vm4C8NbGn49//HryGft/3uuhdnVeOe3Dlr/APg==
X-Gm-Gg: ASbGncv9k6pZQTUOU0JgjAKRGlEwZIYEj+TYi8ILlisTsdw3I28ufOg1sYRAXOVKtw7
	lMXTpuXCnyFLRP4zHPSQy0EdV7dUPOq/Lcdhc73Wx8JXQso8dnUBQQM+7+onq6qukMcP172GOqq
	xHq1acrppc5+vPTP3lNS9WmJM/v0Rst9WyuE0OCewIZECxJye9YRvlTREVrw1N/F4lSTsmXQUQt
	4Q3jPQSdOCmslF5W1sTVTl7IsHBiyymSSjKccgLti7ujjL2Cy4dbChsIeyFk5rrw3OdQog=
X-Google-Smtp-Source: AGHT+IFHiFVtHs99mXmuYb2B2m+2rnv0hdsnrgmUGdiZxDbZObBH5hPXt0Fy2L1RfDUF3gekviGcSla2Cs8MXuCvEww=
X-Received: by 2002:a05:6512:31d1:b0:594:5d87:af7f with SMTP id
 2adb3069b0e04-5947459355bmr191945e87.4.1762808263115; Mon, 10 Nov 2025
 12:57:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110202748.10090-2-krzk@kernel.org>
In-Reply-To: <20251110202748.10090-2-krzk@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 10 Nov 2025 21:57:28 +0100
X-Gm-Features: AWmQ_bmB5CQero0WghGpIbdSZsMKfEtwVkS8ALsJg7LOxphzKT9kTeNJBD-rCAM
Message-ID: <CACRpkdYvPS=WDLuUiEovtSsY=3JDqjb+8kKDZK2=FTj4n+qs-g@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: samsung: drivers for v6.19
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 9:27=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:

> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df567=
87:
>
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tag=
s/samsung-pinctrl-6.19
>
> for you to fetch changes up to 3cfc60e09bdc95483875f0b63cfdc23aea67135b:
>
>   pinctrl: samsung: Add ARTPEC-9 SoC specific configuration (2025-10-13 0=
3:02:21 +0200)

Pulled in, nice to see some conclusion of the ARTPEC work.
Thanks for handling the Exynos pin control!

Yours,
Linus Walleij
