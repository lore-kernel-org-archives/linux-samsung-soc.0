Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCCE47ACC9
	for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jul 2026 23:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785454501; cv=none; b=YoB3p2lSpwztwqm9zR9T8UTFkrBuY3V5k+QYux1l68j5KP1U3jfmKifBo9g+p3g1O7RhbfXF06U52qJg/Plej8sqzzhw7ZHiarV3DmnqevCWPIgA81DStG5LEAPjBs/AeFxARewkDkB0GuyoLWWNIs/yChRN4r+6AyiD8ptDY2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785454501; c=relaxed/simple;
	bh=utT5GH8JwJmVzB+0txH3Mifzm/70gcqs7ugOLa5BO/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uZmdDE6f8uTqmzwXncQXuKjM5dvJpMCAk9GFNIxy+zLhc4E+RHQ1dMD2rmn+xHfKJAw5nlSVNEO0/CVhiONKEbIcpPeItFQ9++zEeNmbBdEiWXUp60gz2ov/u4Ti+XO56opuVj820avj2FhwyrlXerBVl2Rwxmv65u0RiCRc/FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VQfHBkdN; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VQfHBkdN"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5c2c0e261aeso143034e0c.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jul 2026 16:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785454498; x=1786059298; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N7GFN5YpwDEZAtAP3vleYwkuNsvwAGPeTkmkPSkEkzs=;
        b=VQfHBkdNKjKUDf0MG1/8Q4V+0baxVxOi+IrQn2BH8Hn8Iphk01UT7Iq9S6ucvYKTYL
         p2n9UvdMErXxl4/lXJkgL2aY++JjMjyx/24isjXt+Lp/MRI6+ALPx3XWDv0tlyA9x2mt
         FNRQk/sMv/ibKhlX5UGC0vJ2jWv0LHWsGlFoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785454498; x=1786059298;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N7GFN5YpwDEZAtAP3vleYwkuNsvwAGPeTkmkPSkEkzs=;
        b=ZUo7Zr1x7sxhM/9vhAvfg4ViQ/LhsIoaK+z5/v/81VxEHd21O4yxiqakPQEnJ+xsuW
         TMYYS5jzivmc2/n1g0mtX216Wx3Fl0+h5mSMEX2DiTyvDCsRK8H+hckGGRh5xV/xa5IT
         SzIE23qRtGFpwdt1pj2pBHNzepESrRNdG70sQ32L058urLb+vpMry5mNRQYX878aDRzy
         LvZH9cD6j6HQY5FBWVuuUXHO8eAzOKeU+SIHpMFmniG+OJ2jLWqlA04PXD4Dkv3rGXwD
         K2oHr6OlXxtAMFdU7UjxkupnWNpHiLDBEV/ijJYDuI4Ol01aHMQ3u0lMmp7U2EKSXAKI
         dnmg==
X-Forwarded-Encrypted: i=1; AHgh+RqoYPZOMvrt9XDiHYWofY/7E6O9X4ACSZPJ5yp4vj2Es6AJV25MdRAEn5Z/Rrui/vQRM+h2T36RiFp/sP62iJUvOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBLhbcYjbZXV/mpPbLBamZreowRMUFoAy9Fv7uFZyqqi1afoWq
	lGqwiPApO/yHHRy+wkOQ0yCduIGkIpCvgYNQs20sj/uHmFS+MOIyYJo00MmQ5+IYwmT90ZGZbuO
	xKHA=
X-Gm-Gg: AR+sD10XPZcqdTlCAdnTOkwrmwdkx24y32riy2KHFnbEAk/N8IrfOjZX6/7h46/ykHm
	+ozpuLPv/rC6IxJaQ05qKL5IksEoUDDDP1bIptoQnljya08eNzCwvTnsi2aY4fgZqjtv9taQHZZ
	htQm6x0FHhJKNe7UkolHJhdH5xdSVOm4MNSwyjBYuf+liGe+mnv2bd3qFmG8q1tDZGIED/Ubm5u
	fzh9gy2+AYoq4t0HERAbGUhLNHgan0kNSLhWTf9vpTtUXkM8g4PsazeMMACEzE7xx6z8/kcVcVG
	pRCZb5AxALgm+pZdrZmke1gbUtrphEzfG0/aUz7P2BBZhuto1/2Y48SD9B8VNpaecJXnempq3vg
	xNbdmnYJ+c1pgfsF7+eTecxZd5sUdX5KvA6NgOAOd9Umzx0R8rlRInmTYXjAHkYioOOdtK4h6GB
	ZigisJW/GRXChVH+N3xwf6uF8QW5EwcYylB8MdQrpWSbXX9HnHTnLDKAkPxWl8XzapmXZQvneHo
	aIuOzY7ZkbMH5BMA1Ehf8kdOks=
X-Received: by 2002:a05:6122:3d06:b0:5bd:86ac:a847 with SMTP id 71dfb90a1353d-5c36603c111mr1510472e0c.6.1785454498064;
        Thu, 30 Jul 2026 16:34:58 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-977cdb56d1fsm2250130241.7.2026.07.30.16.34.53
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 16:34:55 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-738bcf9a573so132544137.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jul 2026 16:34:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrYjXLfJES6yDfa7VGeEHGd+cFVxZ0+2O5EQ70qRnJVBWgYbEH0bNf9Kn06bN+FKVs4KO8luKMZPNq5H7tTMC5M9w==@vger.kernel.org
X-Received: by 2002:a05:6102:511f:b0:745:78d4:4856 with SMTP id
 ada2fe7eead31-7574e1d5298mr1438306137.7.1785454492526; Thu, 30 Jul 2026
 16:34:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-5-3abae9717feb@linaro.org>
In-Reply-To: <20260722-contrib-pg-pixel10-initial-dts-v2-5-3abae9717feb@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Jul 2026 16:34:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WWpswZ0LbZzpj6RcyRxYps1Ht8+w2TYTviTw4bo80KZg@mail.gmail.com>
X-Gm-Features: AUfX_mxnuq3KCnn0XeSL1ZB4QNLigMdFRjElx75voPzjUsE6soU8Kl1B5ccPok8
Message-ID: <CAD=FV=WWpswZ0LbZzpj6RcyRxYps1Ht8+w2TYTviTw4bo80KZg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] arm64: defconfig: enable Tensor G5 SoC family
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, 
	soc@lists.linux.dev, Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
	Brian Norris <briannorris@google.com>, William McVicker <willmcvicker@google.com>, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 22, 2026 at 2:56=E2=80=AFAM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> Enable the Google Tensor G5 (Laguna) SoC family in the arm64
> defconfig. This SoC family is found in Pixel 10 and later phones.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)

In case having a tag helps:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
