Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113C127B51C
	for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Apr 2025 08:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705739; cv=none; b=JigyIY5TlJXZfHW/24ycP9LyNKYV0Vn1jAU3epQ4NCXG3KwLZilJ8KnZhZG+m9LGbpkGwcXSA6RPdYFY8JgmfIrEfANHE/lCja9+JmA6iSNxAfxHtAn+66sXF6UsSoOpghQxjIf+25GJWhmg4uCDi+AnKFMbhq0FMmCdcainhaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705739; c=relaxed/simple;
	bh=kbC+rbiQeXAmTKOdQ5ekU8ntNo3bts/iVzbE7GMiRTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sU5PNdAVWy+kHRKrXyIBg5qr1blHHZicAkAdsGP0M+qF/A/jfawFw5uPuYdr6Ch02q1yZHNIV9+dFvHDPk5r3zTjBJ7LDJP2oEVuD5uDzv6vfnGHxJ+NFR/lRU+9M8arLTiGlIeu3srvTRgoZMWz+qnUCtHrvqXWMcFge1sW8iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l2Nxzd/d; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l2Nxzd/d"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54b10594812so6143461e87.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Apr 2025 01:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744705735; x=1745310535; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kbC+rbiQeXAmTKOdQ5ekU8ntNo3bts/iVzbE7GMiRTY=;
        b=l2Nxzd/doT8Rqhxa6oEYVZxmArAkE1Ihc/bsrDpV1OlOPMbDCkYxTj/Q82bHjMu+M2
         1ZRD/sOcbxOlDVFP+q2//Ez51ZI9VBtkCCM49gbherZHwCEGP6QjmGWgaaBmoCkC+bQH
         eXnAAHthvnZJYS+3i9SaJnqbbyO2YZwCFoR7mFxZW8DzUS3RxRF9SK0PzuAou68XV9A2
         IJeFW4K4vPOyXcbunAQA5u+fQKthtXS6A90JieFkSP2c+44DMc2r1LnSd06Of4pY8PuI
         Ag2pAQ895bDyfXn/41dstcjPKtBbkGAM7cN47kXYnnc1BA8FTmaW+dM5YmiYHo4BZYm9
         SIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744705735; x=1745310535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kbC+rbiQeXAmTKOdQ5ekU8ntNo3bts/iVzbE7GMiRTY=;
        b=bRF1FrvR9tGkt9cs/1foshDur/P7I/ie1zDNgeYjsTbQ3tBDbly7DKRpptMP+Ql0VU
         eoE3GHRGCAtV8e33u/XBiZ6sQgG0NBoyJBBVrJmU1gLj431Fv6ZfC2ROEOcZalCcIPM9
         txFqHEpf+v4EAMDUxd+mvzgcidRLY8zVvbNmi7RLhaHDuvJsqwEPh8fgyD2a0dJWWfC8
         B1S84DRAVgzw6g0/iJiT5e5Jmd3GNOUlq6dfwK9KiljprHSTtk4mxKhQhVrUi2mY6WVE
         Ghs8wj7hQ9YAGf1d5M95nL2uNBASx9yD6MMJnXka9YW5UaECLxYZSUc9MflHbEIrrkED
         SgUw==
X-Forwarded-Encrypted: i=1; AJvYcCX5iM9HYeSw4Gng4vrewsALIh9ZRi85UB8TeSxRFgvNaPKkDqy0trEe2aT2eem9bTVaPtMFb8qIwGpg8RAjj7Pa4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKRjxQ4zNGEKSjGRGKTUlBhZMJRN7Va5c48Qpu2TpYygRwcYgs
	/L8+f704YyzBZog+ydJRgKOD6s6f2R7ayEOqDlvWv8Er9w9XwTlMc9mFNw/xac9B+EX4fM6SFeL
	gvxSEi28lYGeGG3ocSJBeCS563tIEwV6UOUi9hQ==
X-Gm-Gg: ASbGnctaDNFUCvCmYQiZCZ8A78dEdsP0g/Rmd+k0moendGB+uAkaRGIHvVtW5igXvUc
	2xuORM19ioW0dyckZ7/btx5drHygkqHW1oHVO2XNh4f5vaeMqYrf0XCkh05VQem1VxGKu5o2qmN
	gVxBQIeEC8juW1mlAPhN+rJQ==
X-Google-Smtp-Source: AGHT+IEBR/Eqg1kLWWGKh12iJhnCpJzO1zCgcGoecoiMf/umaHeT6TJC5jiC6GTZwtMV/nPtynCgaCpBpVXSKQksMUI=
X-Received: by 2002:a05:6512:3f12:b0:549:5802:b32d with SMTP id
 2adb3069b0e04-54d4528b940mr5354403e87.3.1744705735088; Tue, 15 Apr 2025
 01:28:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org> <20250407-gpiochip-set-rv-arm-v1-3-9e4a914c7fd4@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-arm-v1-3-9e4a914c7fd4@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:28:43 +0200
X-Gm-Features: ATxdqUF6Upkgm7Rf-JBAXjYSrKlpy1hvmNwsxlcKu33EviWPUC1nvmMY22JHIys
Message-ID: <CACRpkdYbcbcbLz5K4H=dKdGfao68LgacASLnVF-bSYAsmhL6iw@mail.gmail.com>
Subject: Re: [PATCH 3/4] ARM: scoop/gpio: use new line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Russell King <linux@armlinux.org.uk>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 9:09=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
