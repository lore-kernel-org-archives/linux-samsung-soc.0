Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088411DA31F
	for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Apr 2025 21:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744753888; cv=none; b=RheCGE1Ur6ELfznh27SqNKLRjaAsGKs/F1X6SNE4sjWp4uor3mQM/P8z48/HsO9KfsE3UCxxUUB9+A/Ucx/SQYxUlPt+1bajWYO1zNcz/m6ocT/1rAVDZJuNRRz1k3464JeDCXYCtUqbGoxnWfySzxjYwdBANBxHepJNtJ1WN2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744753888; c=relaxed/simple;
	bh=BwwVBqU1xH3J/i7cD3gzKhhoW2NAKEVI5RSNlNZdiig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=scdGROfTGI5Q5N/VcYOC/H/hnf78Cfz0ruyVqJOWBsGzXHC7OhUDCo8HdwV8PO+g5eteexL7bz6H4upXWRLY0xrqjCqSaxPh2jmUxBScC4ybSKDv50rDCrAvNcKep7YTwYBFeJhWyXlIA4LZHonDCYELPfo4u+V3FmaVKTctMKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HUhbFJ0E; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HUhbFJ0E"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3105ef2a06cso30679211fa.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Apr 2025 14:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744753883; x=1745358683; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwwVBqU1xH3J/i7cD3gzKhhoW2NAKEVI5RSNlNZdiig=;
        b=HUhbFJ0EVgzw1JsV9pm9Cc1a7Qy1xFsoE8Gnuh/wFUrKa2+UXZ9YQzps6EZOlUOx4R
         s/g51R5dpSXXqKBtTOcKzKux2bOUJWU2LQxR/89OPQ/ZHcbuVR3Oa0NmdrtFF35EzyVm
         +XUrITtmXkRhgcP6+SL9x8Yb3n2BPOLqB0treIDbWPla/1z5VIhS3g29/LE+tpRDXLL3
         zBNNO+IbDfqRPb/W1f4fXqg4wuBIwg3ED9z/Cji5hnCx/ZZog22jqIQu7plazGZZwHiR
         NxQDxCAMfIFZ45jxGAob1NIF6zy5d19sAi4en9KQFXtU7afVFZpum4IkJm33OHzURx3t
         HWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744753883; x=1745358683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BwwVBqU1xH3J/i7cD3gzKhhoW2NAKEVI5RSNlNZdiig=;
        b=Mk+9uCGCgIfwuvBdhFJKLrbdrUyAaYQ5KBIEP75fhU4OYYHcHViKpZ+mH8+Ftk0aXv
         YuzETP3js+Cp0YfAabz3wb+5xomyDXGDcc3bEPhyNZlJjsgHCXQ6fgUMiupASRbYjVgD
         k9ZavGW8fmdziHphzw+vock5wSompOBQ4U0kUrH0ekC4PEaom3HGgH43pmTJ9OOIqmNH
         HnylBNezLaeXnj1LPP/2El7y/Lb5yGVzwSfx6G6nX7W9YbDgNWCfLhbktIhS+pT5BASy
         uKTES45m2erO7EvnC5aGVCaz9l4dk/Je5r053pkUaMYskAeL/Y9kiBtv8YkPmvJjJr75
         FdwA==
X-Forwarded-Encrypted: i=1; AJvYcCVbf9umxUfkZit05Cxuq00UYggIC82lFO21Axrc0pHQxFINeuKoQvaXmjCYqxBeBxXAigI+P/Zq1qDVVdCnY1BFFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgMD4xl/l4Us6Ud6TK6v5/pftr6mpSu5YMAXBT75pGo5e/T7k0
	GDUJNqDhVvWoteRaMqKbeMP8Qt5eNlU+Seih9RSobzYijVoSGirnkD5cN7kiHLbGwzlj3liuyZ7
	CyfOZlgR02WXKLO89t+CHrX4IETXJ3ReFY8MTaA==
X-Gm-Gg: ASbGncs0mtY1f//gBv64OHjGLtublkonn0TL61XAGzLHYeOzdd+1XQVWJXMhkTO5nEE
	6kt2GPnmw9oQRzfMjCyOImWAnRq7hZG2wEZKZ7+Vj65DZTQ4d0yUbmJmwMoNkIGVRFx8nQLCykB
	cO40ysK34VaH5oDJNrud9Iuw==
X-Google-Smtp-Source: AGHT+IE+SjMha/CZz83kfgX1i08yjyxNG7eptNKiSQYYkbVSYeq+ymUtDU3Y1AnfUH+BRzKuxxYHdlUfXnhngPqHcSw=
X-Received: by 2002:a05:651c:312c:b0:30b:d656:1485 with SMTP id
 38308e7fff4ca-3107c317096mr2201201fa.32.1744753882880; Tue, 15 Apr 2025
 14:51:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 23:51:11 +0200
X-Gm-Features: ATxdqUEmiDJHa2dZ5KaNyPxwhMUIOlqcAcBjWah7Z2DVmgltPvawf3gtS-j978M
Message-ID: <CACRpkdZ9Qiw0f=BVpCjOj_28=eHcMEO+UXcXaqb_o_2-YSYMrQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] ARM: convert board-file GPIO chips to using new value setters
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

> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all ARM board-file level controllers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
