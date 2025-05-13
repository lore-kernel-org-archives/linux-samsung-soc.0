Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD50034545
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 May 2025 22:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747173769; cv=none; b=bpJJjPlerhdgInYlZdndzn97+w5VxrDTzTAWeJee0/QumsjZec+NM0kVjfXO4JcQnp2uK9xTAHZg6jlzDDbeeUzNbqJsm3nJaR1I6I2hX2H8mQVVdN+jsh2+jRHZV+IQbnmqzOjOaHTiFXsHNeSECiHnrkUC8FzG8RuEsPTEaU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747173769; c=relaxed/simple;
	bh=1EAngaPc7uOdyOtINcBruD+FdbRowx/2Y1slal9XMzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WtSVexZ+fbz+oqYPeKr/9MIiPqMh18FMP0Igmo5BOKwgtiYQs49GOxTuUt81Be+vELCLsabB7E4a7tliRzTf8nR0HeOuqxjAndI6byIrdJew0rS+Udt9PmUlTm8yXnLgpueC39I0+dv1g1Z42GI8aPLEpZhdOpXEBAzFbSnQjqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uGSuCyV6; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uGSuCyV6"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30bfe0d2b6dso58659191fa.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 May 2025 15:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747173766; x=1747778566; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OF3Y7OxM3P8Aw80IWQnBi8AWbTqWJX1OjgpSqEvS6a8=;
        b=uGSuCyV6qvuY4kVmd6bgVP0SGhvTTQEEFv/GDUKXxq49KIt6NY//cl4MMWxM8hGqey
         tLHsas5Rd0KLjqy8fB+tcTCOWK94biaj5HCGCBffyvP/DInryyMUapPHuM2rfKivT/j5
         JckKhAfCSFiIUOc+oGICQqyXuQeroMlgAQK5dylFaPj4g7zUkFluCNAUOv5mcepurwlu
         RyhaBw9uhFspiu+et8C+cys55TAWAD2/vVFnw1mA5pTXcaTVkTlkNr5HpQtUgemW8cio
         /vA7+yde8d6NN2Fk4bdxj2P8yOJOFrMeyzhTKUsgBEUcGfmlyiwUIWkO6tTcHjVXC829
         ajrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747173766; x=1747778566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OF3Y7OxM3P8Aw80IWQnBi8AWbTqWJX1OjgpSqEvS6a8=;
        b=D7ZbcCR0VQmgSOsivIVst5U774JSX7NARwaiIXkUUvtqOBntEEe336cDKQxuzwDRvR
         YdAo5rLoMpJ/cBlNs81ojPYFV5GRBTJnZ8jEOaY6CChzqS1DuctrFE5RIssAQypzTW2l
         8qh/Dzkgga496umFY8B+kVfx65vwe2+NLop9XZBU4E8XGulUD2JLUcfFHMpstE2/4WN9
         i9dCZeV+LEm8R1iomKIv71uQHdHZt4ZChLq+iNvzrk2tYYsxQ3HAsxWOdz7pml9lto9C
         4kxt9G4oxxXqZu1fP70DTxgkFdpluXp0acvNzwV0/mzJIAKunfSE5psAHtKfJN4qB2sd
         VcnA==
X-Forwarded-Encrypted: i=1; AJvYcCVcvvDubhPTvXMQPS7mL9ZRNfFbUPy4IzjD9rR0fluL9qdeuj/nev5ie5L5aH58mXRD2MnGIBgfi5XGewrDpqpNYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKpVeUpar4mJSC2Hbc1TjBkwArEXKFW31cd512PfNxrNseA2+Z
	6iyE1eLnDcGHRAnlznu2hTGrCrDuxs8OdTxqnetgEoeytoy2jyio9bAwGJd+LFaixDJ6Nfju0ib
	lmmVMYNIDE1zS2HhdIfDH6+W7Ect4gfKxM3hWTw==
X-Gm-Gg: ASbGncuAnh6emuuviQe+v5fp40rjx2wCTqY3o/rYxn+zYIbsa4rojaRj2OqF+4KEuif
	uRCloI+0VIeXOFkDCeiBI0TuKlG0JZD7gtX9B8AE7xa0mZUcfBvAwBngRNKSYjlG/Vkqw7YowEH
	QBvKtXj6D56ulhYIcPB8f9d0PSVzU1utYH3g+wz3MyRok=
X-Google-Smtp-Source: AGHT+IFV6oM1huMeF+j8D3av0zRQp+sO6a3WETyY9TcoM8z4D0gAPRxDZ6Iruo7oYj1D+k2aLqn2jGcIPx0XlTck+IM=
X-Received: by 2002:a05:651c:30d3:b0:30d:e104:b67b with SMTP id
 38308e7fff4ca-327ed22688dmr3408491fa.38.1747173765836; Tue, 13 May 2025
 15:02:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513105941.28448-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250513105941.28448-2-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 14 May 2025 00:02:34 +0200
X-Gm-Features: AX0GCFvrX_aqXbESUgpoRHsXNXvkw7MLENgWNexCpBHmO_EVXfh1y4WvP_Nh-o4
Message-ID: <CACRpkda6zzroe3XbPpnrRMqbHcCsiczEQM9JW7c-hwhiV3vtNg@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: samsung: drivers for v6.16
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 12:59=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089a=
c8:
>
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tag=
s/samsung-pinctrl-6.16
>
> for you to fetch changes up to a30692b4f81ba864cf880d57e9cc6cf6278a2943:
>
>   pinctrl: samsung: Add filter selection support for alive bank on gs101 =
(2025-04-08 20:57:51 +0200)

Pulled in!

Thanks Krzysztof!
Linus Walleij
