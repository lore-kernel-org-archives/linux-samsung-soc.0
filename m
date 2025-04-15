Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B378E2820DD
	for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Apr 2025 08:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705752; cv=none; b=KKVWaJz2wfSevFBA6FgHwsClljcrp96Vh8aBxrGl+rWEY1rwPXWDm9ev5hYq0OdnXPVBtSar7zetZnS8bbkTVe8qqyL8giDgfZlCsdhyOPheHvIsRSZDV4dpSzFkaJXd9s3fxi6T3TRRKo2bRmgGWZk6kfm2o7XC73rZ1Or+590=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705752; c=relaxed/simple;
	bh=kbC+rbiQeXAmTKOdQ5ekU8ntNo3bts/iVzbE7GMiRTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jSOdvdT9VpwpcP0UXNJYPAclFRU1/+VeoBb/u32Gg00RtCFcJkHOVYhBlg1PMxYS0xM6A8xpv8Y2daHPiDokOBQcdxpsWZz0FvOk0UEoXf8OOxQAvKvjz88Y//WiUpVcSxwo1upJbAk69jmydTlnEaIPGthaSDzvEo8FprgUxbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x+nM67dS; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x+nM67dS"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30c416cdcc0so47027831fa.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Apr 2025 01:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744705749; x=1745310549; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kbC+rbiQeXAmTKOdQ5ekU8ntNo3bts/iVzbE7GMiRTY=;
        b=x+nM67dSH24BKBD6gI01oiwRKdOyXeKhCywonH5cBtRo/IZj0UNWF7FVoZIJNb0Pzl
         F5XJR7RJ80n3lY79jkPI3tlkI8Duz0UusarNUWrT8ynsvjUabQOgsbMFULZ0o8fnUTGC
         NHMQxTlB7qmQriDnVBwFy6ZAg/O05qUsEIDXm20LWsKrGgAkWV+PIptDxKtvUYCZb5m6
         eawkDQ0aKSDUqIrpvIXzDiVRezeV9x1EMkHr1X6RGplA9bsEqW8Scxxz1twUZDHljDUW
         rgt+g/wfeD0gxVeB2FDryevNZ7X/B+9wSvlVCmlIYFWlDEQzmumrxdwGli+kwHZTmacM
         g+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744705749; x=1745310549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kbC+rbiQeXAmTKOdQ5ekU8ntNo3bts/iVzbE7GMiRTY=;
        b=wpabHhiH/OSiCk5G9HyFwZRSKfFX9isQa340gG1uq/L8SP2Qm+sPFCr++CTA/X+udn
         I+HjLQl7wzjWXfonve5SKBK5r3rJXHcZDpQvC9WPNjxc/HNEAFwJWGlX819BHTUxBNbK
         OiblTGQn4sHqFCJdkvGUHzHZQ2VyBegJMO6FnGOZCm8tE7ca+VF8tjR8ktDk/2UJILNM
         /IXUvaPmI8piwp//ZjJd1VuBr595tgAzI34ERT+kpivRiENirvT7c2OKH0dhTqRb+BSZ
         hNXKCvG5b/SWKmgeuc6M1XuJdYdZGDQ1rSGvmo5PJIKXoabktv/5W+oSHx5mFh5FyMaU
         Y9yA==
X-Forwarded-Encrypted: i=1; AJvYcCX9FRr+JR3F34t7A4Hkab7GNXtwLtGkNfpKFZJHbVEGo/uYlZGd70uwg7yeagg0VtJGtbiL7UJyxO0cKaIjJc8+9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzT/usEyVOq7t5OlSeJQhbncSTXsDmU/+wMXPYI8pDc39tDcA8B
	5/eA9mavCeaCGixBmxfyoYjYr8bHa983g41xlrIeYNSG5JcLpyTTsPJ4AnY7qStv0LMBk4yPCH1
	OTUpofJBW+gjC6EUAtcpVjzp0VWEJL2+guuHFlw==
X-Gm-Gg: ASbGnctvJSEIjRIA8bD2q5bKxqlR8ftROt8rHg452WCs72q3Lxy2qB10i7ktBWGYCz+
	luPVsuOf65XIdJ1aRBs1IFsiUt/VLC5aDWhA1fM0Ch9/1zWcnpFIWMR42EYwe5hpoKy/hWYIExN
	g1PwB3f2+G5DrfxIy9U3ToUw==
X-Google-Smtp-Source: AGHT+IEldvSloEtUxO9vAvr6pIUF6+6mI//GyNNWKS45SYnCGnbYk7X+AjHq8bg3bqosme6qdruAqr1basQdBWgZhUQ=
X-Received: by 2002:a05:651c:30d4:b0:30d:e104:b594 with SMTP id
 38308e7fff4ca-31049aaef6fmr47714041fa.40.1744705748864; Tue, 15 Apr 2025
 01:29:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org> <20250407-gpiochip-set-rv-arm-v1-2-9e4a914c7fd4@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-arm-v1-2-9e4a914c7fd4@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:28:58 +0200
X-Gm-Features: ATxdqUFq-Vl9qhescQDJ20ocPhYf75xWr8mTBKZ04eLcprRDa-HJLgwcNWmq4o0
Message-ID: <CACRpkdYN4wZcnmxjh9KGCa7i_K_hKtzvFgBzywbVAfK46A2fKQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] ARM: sa1100/gpio: use new line value setter callbacks
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
