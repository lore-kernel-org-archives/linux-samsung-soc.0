Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CAB2080D0
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Mar 2025 10:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742292673; cv=none; b=ASFNlBT0Dt14qm5Wk8JRDSwudDqlGThVt6Ac2LnNB/PcedMw5W/WgMTasOnrHfGAw9CwkPPDmx56FhDaM5XmKMczE5QhYtDGswIugtGrxLIWXbxlPJyA3vSkbch1/kdOuFIazmEdtuo75/f2XItECNlnd+T4htMUeHxPLMncv3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742292673; c=relaxed/simple;
	bh=yKQqeVn0btUdtS+qPzT5gdetvTkb3UZO+pyG1ZeZ+mo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bz4gLnqbB+TiDf6Tna83phcuKxpiB1Pbx/NUCYLT9rpBNHRSLtE2JMElGKjvWOW1Oq+UaLs/UjoeuiDxoXljoBVKHiJMuotNu/xrsWsBqRKa0x2H66kVi2rvFDfl8Uk0TDEgjGddybs7vanSyYKf/fKfcseoaLA0aJa1sLYokC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UXikAOnb; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UXikAOnb"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5498c742661so5970494e87.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Mar 2025 03:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742292669; x=1742897469; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qVUpvtTBLHRQ7RrqjSGWWvP5ToHEThWrbkH7ADEWZ7k=;
        b=UXikAOnbm8TH+gFEHGyCBEvUGM/HaqI6axbdWnHLn3fyHyBj9MoFp9LMdEq6pirp9X
         x6kOfOqeediFjUcwlkumwAklWCmmXh3A7Cy11obEaf0AEhcqLAdP+o6nP1rFkyKejdjz
         UIoq8tsWfsTz9xaJPRV1LEUp8ARev/47Id7BQtooL/c5eX+otuZUqBCSCcbK1Y8o+Yau
         unW0JUcBVa7UK23weMWrk68j5p24dBoeRgzqXj4VXf58Y2DxeLFT0HbQLc688Nlje4L+
         QsLG09iy37qXf4xU89EiJsNwX6Tlhx5TAogG6gtb8AiPIeapfNDp/e+zHufjFmcEKzyq
         /7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742292669; x=1742897469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qVUpvtTBLHRQ7RrqjSGWWvP5ToHEThWrbkH7ADEWZ7k=;
        b=EFbkFeWZNiOP/dmIDXv9VQMegFNYlztVwrZfrE91ARiO9cJV0ipejpjUaWeAOpmRJK
         YKKBapIBUynzs0LcvA1o21HF24oBDnG3Q4f1TbYSdBBA666sLHu3mxt58/HVZBVaV5vk
         wvpLlw1Ofav6L8mMvfJGrV1yB2e2BjSQrOuta5AwVMbI51/3gAeFZYdeE/a1yhqZuNnJ
         LYWtSDp4enK8fggambFd+qyHoYCWAnTDqoK5AcFQFY2ycBGAl4YiMejZQRA94sGcohK0
         geHG5vpLjtDuSLMbXzqw/1KIf1ez/BsG1L83anggowI2vMWwZIrBER49Me8cgcbonreT
         i/8A==
X-Forwarded-Encrypted: i=1; AJvYcCWE9DPMYnkr8qR6Ig/lEXUxPgQYUH/lYtrghc2QbATjvX1J8QG9HnMfV2f6CYtlFxIGJ42dGytb4Kl5eH/3/uV+4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzowXSokDVQkTmKZYgcNWP8FBrR5+KO7LzPEpFfYzRmJ7usFy1u
	UkVvPtJvVbgdtQa8ylf90+9bmL4QiQq35v53bOgTxI0drnoULZ9PQAW4OV++eWydOoG4inYQ0ME
	sqBSektkd1+1se5LxlhMdjRCAJMS3f3T93odAwg==
X-Gm-Gg: ASbGncssLQ4/OXq7DxPsgIKXrfr7wXir0pKownEwERAsGBHiAIbCM4aVvqayDBfUWm2
	AmUDeQcJn5Dn8FhFusVNGiH9ahONe5Y63ISawRtZxh+WRkcVICjkEctvhWvh/9eTVmsWrIkRDeK
	9LZN5fRNoooPju9bOVCYEb7vZkfw==
X-Google-Smtp-Source: AGHT+IGaqrncYYUr4sfyRfLFzOEWIoUn1i0mOansd4z1qNbCCAzVBUKQPVLdXhHFFByp6tsLCBEDJwkAWjabnBVbVpk=
X-Received: by 2002:a05:6512:3b99:b0:549:b0f3:439f with SMTP id
 2adb3069b0e04-54a03ba664emr2114093e87.25.1742292668868; Tue, 18 Mar 2025
 03:11:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250316143108.17045-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250316143108.17045-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Mar 2025 11:10:57 +0100
X-Gm-Features: AQ5f1JpKJfFS7YVV371lRPx1Y2xc562AW9pLo6dBt2VW6OJo1Hlc7eGeR9sMzjI
Message-ID: <CACRpkdac0zZtB=85Y+Fu=TYwf9qTjNog90-P4SBjQ-oB7X5Vag@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: samsung: drivers for v6.15
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 16, 2025 at 3:31=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f0=
5b:
>
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tag=
s/samsung-pinctrl-6.15
>
> for you to fetch changes up to 701d0e910955627734917c3587258aa7e73068bb:
>
>   pinctrl: samsung: add support for eint_fltcon_offset (2025-03-11 20:37:=
29 +0100)

Pulled in, thanks for taking care of the Samsung drivers!

Yours,
Linus Walleij
