Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2210F1A08BC
	for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Jan 2025 09:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737018705; cv=none; b=PfJnTp+Ga5CZdZf/d46hktRFnvla+e2ZC9ld/QSwhydToA8pRq5VRyMCtnx0RLiIne54keIEAFsqZOIx0xBEgckNCAGfCKboCDy0ug3U/4ZtUUR0vlJqiMZUzN5P9KniA9hJYpFLdq9hQsLRNsLTK9vQUHphcO0vPxBMT7hSI60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737018705; c=relaxed/simple;
	bh=ikLFmXKsca9wmfydpauFYhkGfc0pmf34aJ8RvveDKb8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eweFrKSFuSVlqc39D73CTitLc2SXpXvZB+/TycgYLYWXD4n0B9XGiU6DNvABayuORZpWQd1mvZVKMIFI3yVGafZ7Hbkg6PNQizWlGhlOJdWXWm8xaUaizPIU/bii/dHCs9ZxQghUJa7KGns0U6AiNVM5b1kvXzWOkVunbZ93zZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R7Lini91; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R7Lini91"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30036310158so5860651fa.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Jan 2025 01:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737018702; x=1737623502; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ikLFmXKsca9wmfydpauFYhkGfc0pmf34aJ8RvveDKb8=;
        b=R7Lini91NOqPCx9nTryrKGk0ZKryWMwdGLWXYslUq3s+obqpIZXj2mG5Ygtw+SizaH
         UbI0NJNfR4VUnPgKWQy1aHqKfTOgiYyIyDmcHcOfZtPJlxmHc1PCKLeoGvgQagxUlEds
         y1YY3lxW63g21b74hT40CsdsEjMb6pazcq7hfdUj/+iLlX6jfBQEHtiXgKE6B6K/lVE0
         P9TTyWSZb5R2+aqY7ySlTjbgAiJSMnuvvPxfrG9Zxj5CrKpOAE6ASLTEqqmaxl0TMIy9
         1k4CdV0rj5p5h9dAS4EuGFoq+3woxfn/3qIY/pHZCbZpxFim1e6aQLAEzSPOpZkJbGkD
         1U1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737018702; x=1737623502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ikLFmXKsca9wmfydpauFYhkGfc0pmf34aJ8RvveDKb8=;
        b=se2X8rBFyoTgK8nx8Oe2rVITOXktW7AXkm5yjZshLO+Ai4qlrWhXmAH1shvtAZgBqx
         A0GFr7wK/g14imZXr6xQSZuFm15iTVAKThc1hWizITAhZDPuVbEfWJm2IuM+pxCbcPmd
         tYNzLBfH/l/3EUpxG2XpeNFPTaCzOyor0pcQ/+MjW8t2ZS+HTS8HWAuN2yOHDZk7EVAe
         Nkad4F/A3x0PPFuh4K3pJYqrdIVu0jYbA/nGSqrJ56V+DCLmo4yyiB10vijNekHgEkds
         nTpRyrh6qqo/XzlccGRTJhfNn4UiOrHhGhuxYK/xEejWVT/Ypr+LA9O8wit+ZJ554G5S
         uCSg==
X-Forwarded-Encrypted: i=1; AJvYcCVp46lYfCnxns1aMgj079fm8VOmshdiaXNay0dRjyzB/6TY/4f+MeWkgjpUUW9qTbQosHLTiiRoZQgO0HJRv7sazA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGnv935TZrvFA19pQvD3DiyvXW49jXSUQYkRtfv40/aBGo/O8s
	dkLAgNJrmlEWl9+/he9kZf3kuSrbNcZUnVf/OQRplG2Yc61lnZ8sgU4LWQHyXoLaDOrfMD+dDtV
	L8rJNlXlapXyEA9YVrOB1thVuDimjWIEZd1yCWA==
X-Gm-Gg: ASbGncsaPjzS6YwHr267WA/BMTNdldQgkEqDvZFFcQDL/9ZVh0fa22ScDnAThIfA5zD
	J9S+iH8I0bHAPQxry9iCbDYSibszvZnoqjFdm
X-Google-Smtp-Source: AGHT+IGrNyL4WuedbnIHfohMmLOiMsDyLxHxYKbUmK1MCT79/SM2AYsIeC1T5ua5wPDqXM+fDCZ6Rn/6qrHw9NOkVng=
X-Received: by 2002:a05:651c:b0d:b0:306:10d6:28ad with SMTP id
 38308e7fff4ca-30610d62ae0mr55983181fa.8.1737018702223; Thu, 16 Jan 2025
 01:11:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115-arm-cacheinfo-fix-v1-1-5f30eeb4e463@linaro.org>
In-Reply-To: <20250115-arm-cacheinfo-fix-v1-1-5f30eeb4e463@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Jan 2025 10:11:31 +0100
X-Gm-Features: AbW1kvY2Bex2g7NRizUNo-TeBXpa3h2hnqoTmMGAWm_LgIWygats90STWMenwAs
Message-ID: <CACRpkdaEyC_aOLkJDUPw7=0FhBFN4rRfBU4rghm4RfjZhJFP-Q@mail.gmail.com>
Subject: Re: [PATCH] ARM: cacheinfo fix format field mask
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>, Sudeep Holla <sudeep.holla@arm.com>, 
	Ard Biesheuvel <ardb@kernel.org>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 12:10=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:

> Fix C&P error left unnoticed during the reviews. The FORMAT field spans
> over bits 29-31, not 24-27 of the CTR register.
>
> Fixes: a9ff94477836 ("ARM: 9433/2: implement cacheinfo support")
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/linux-arm-msm/01515ea0-c6f0-479f-9da5-764=
d9ee79ed6@samsung.com/
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
