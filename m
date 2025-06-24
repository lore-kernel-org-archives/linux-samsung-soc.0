Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1BD2E764C
	for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jun 2025 19:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750794325; cv=none; b=U7ncFpDKYJs17Kj57/2BMftkVjmolmM9t6Ia8HTA2YlKUHng8R45O5kep/0xEAHXtxdMXrTUI8pF86GvK1ATTFbR56dmIBrFnA6ad33Z3Tiqxa/TBoKarXniPS4Klr8fc1B1ui5+4TI65nZNoxMKFhXjBVGQMy+DMM6UJMza3jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750794325; c=relaxed/simple;
	bh=30oeBRC9xhWE/gLU7A7qEMlCfCO9Q3lAAEFktP0zyns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cCnDUUKRNQ8cK+9NdwaGXINN0mR4Iq0BXMkoJBJoBNunJEGCJ7GRhbjQLykK9hhui6mvOfh22uV7WqLNvw7+VTreySwazMmgFSQwFGpmfJW3SO7F9HU6QzeE40eWMMRzO2pn/OhbseDKkgikQ1QeeOmKTBuZ4rkuIqhnu0g+Wpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hP/jpYyw; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hP/jpYyw"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553dceb345eso6387789e87.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jun 2025 12:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750794320; x=1751399120; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=30oeBRC9xhWE/gLU7A7qEMlCfCO9Q3lAAEFktP0zyns=;
        b=hP/jpYywfPh1JFB9YkQ1vVGg/+/Jg0mkwd74myvKZZ5kOqxrZlk74X8dd5v4JAWT+W
         +TYXXGddhgNvRRrlHEZfCtiWpzzVohLCJYSdrQv43nca7M7Y8hlHjkdIsEXKVEnNig9S
         g3Qxdegcxt2ZpMlqYqxX6wK6qsdDWi4sY8yYnjp9176ycdv/YCb/9ADGmM4Tv0ztjVoh
         eHxZm8FjnMw6nV8tUq0Wft+aCAM4N6QnenxX45+qPmgEJMwpEBuy9tkfduQyaNCz91dB
         BsOiOK9Nj1kxneUmoh+SGxn/EIivLF3v5Uqd0X7jJHYLmY4agFo6qcEyzO1G2SX93Uon
         Yk4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750794320; x=1751399120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=30oeBRC9xhWE/gLU7A7qEMlCfCO9Q3lAAEFktP0zyns=;
        b=Vx1yJXKtLOtE7Ce/z7G7WdaG8thahaFHgjkgyhx07Oihn3L2z+wJNLyPdgcSWk2hvz
         L85xJlyOFfvPMLrDhieC9/4udfdsoO70VZSXsiNN630Vq2tI06ZnBquN6NZ5N54cnqLL
         aY/lyJHGikNT3ZzYn4nguxiTuFOffLKulAi5ozQlxL1+kfG+A9e8+s707g1jbsQLHTZk
         rBxoVeO0dYDOglDMvZBp259mvAB0rcjBok6rW+NltgLsGHOU3iR7QXJVnJjsvfIOvWnO
         BmmfZJWg9lnKjvSW6FzJDIb324f38eAdiUhyuS6tM0slJ7qnETLd1WMdGsA+Ojx1H9fX
         VK5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVhsbiWaGuD1Ml2zHWME5JFbS/EGI0RUeMGZiV30Cnx0YVYX2di2qDQgtJrfQkgZqj7OsAmaJHDYY7rdQrOBcj3xQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFdLZk/g9O9ubLtNQfEeYdUMlfM9QllYgeoS3q7qG4fqSizd4B
	q2r7UMh2rhkTp723TCtyOwl0He9LEeBLoQ8nQ5mbempR5BDY3WEkHK9I4JFrqQvUeMTkL8MIXnJ
	U0xYxAIoVZhGpX8c8+YXSY4qKVHs7ek4ig7bnzIebwA==
X-Gm-Gg: ASbGncv2tzktsFylkyTBaQx3vvoWj1mglbKDK5ZLwkxQEOWtysxNHnuxVKbPdp8Xnol
	13t1y+A06cz6msv1jXIRj2G0jNYJcFviIi8iCsvVoEryNQR6ciFbV/4MaoL+u0DU5LjZAqXDEYb
	3jPSqrrNWlRF/ZwS1+/Dbf+tj/qsuGoA6CS09s67g7etQ=
X-Google-Smtp-Source: AGHT+IGHrdlGkQUWphFDOu9KYoSs8Q372bw5fsoYgco33pNU9fbGTgKUqdcWmtZRyS8Ikc4JU9SHkbRiDX4irW201y0=
X-Received: by 2002:a05:6512:1396:b0:553:2bf7:77be with SMTP id
 2adb3069b0e04-554fdd0ba1dmr50743e87.22.1750794320312; Tue, 24 Jun 2025
 12:45:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org> <20250624-gpio-mmio-pdata-v1-3-a58c72eb556a@linaro.org>
In-Reply-To: <20250624-gpio-mmio-pdata-v1-3-a58c72eb556a@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:45:09 +0200
X-Gm-Features: AX0GCFu6Td3LW-_JOyLEYO7GYkA80dSGig80su6HVwjgXpS6hbnfvwIR-aklY7E
Message-ID: <CACRpkdahd=5cdjL4Je4_PqFmV8dkSuuuRLxdPB0n0-gyFKin4w@mail.gmail.com>
Subject: Re: [PATCH RFT 3/6] mfd: vexpress-sysreg: set-up software nodes for gpio-mmio
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lee Jones <lee@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 3:19=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Replace struct bgpio_pdata - that we plan to remove - with software
> nodes containing properties encoding the same values thatr can now be
> parsed by gpio-mmio.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Neat!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
