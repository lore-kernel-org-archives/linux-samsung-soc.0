Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CA6279358
	for <linux-samsung-soc@vger.kernel.org>; Fri,  2 Jan 2026 10:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767348555; cv=none; b=bJG2EBOMP6JRiwDQJHYR4vAwl1wlzZkuTJIMJ0vZwXES/zUCx+YSVriAoatVydURz9/h8NjmBEw+DEkJaTFsiAlw3WO4OQgvp3T/35+SnKLOfCNrW/J1I67oqhgTxesasD0GHX3cftT6+jgzhNguZHkfVD+AfRl2wfgMXQygOxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767348555; c=relaxed/simple;
	bh=GaHqVjch9Pej6BXtAbKP8uif5ywRSBxpXWA45dof1TI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YmAZrNRwjsXvULnlz03jaSFk6oMD7pAa25vvq6CP/MUOt2R+ZxYzUEAE0KhW2reKcctWPJfVZSVAvpHRjc3+ddl5qEJ1+Ho9FKz8i/s/iGzVV/N+D+6lrMFhEWKx7MNzZH3vw9omaCOEVEYik0Ma52t0LpHlPytREva35kkG5Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nEz+dDZ+; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nEz+dDZ+"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5957c929a5eso17217380e87.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 02 Jan 2026 02:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1767348552; x=1767953352; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quKKpi291Ij61ZouqUEp6jzReIm02EqX1LBuWIaBPAU=;
        b=nEz+dDZ+xn7FOKOtE8DWpI7CBqC9i9tJw8GT6flQwWdrGEVes+u27FEvrcKYy8jEm1
         NwHTig0xdmNWO9RgeakOW8CqBgIiMMTu3y36bgvX9uULP2MQORIoGjeDJt0eNRq17M4W
         h66hRtKHLLYc+eo9KqvrTkPEHBYy42PHGD0M8vIbAl1JX4PXrqCwjn3rR9PBWD50agy0
         bTTvW1ZbiGsmIm/ORRZ09zYIZvJ2lcqxo3XOlu6OR9WUAgam/sWosJN3FSdvXB1R89gY
         PY0inAusQvVlo017LUIiqZUJfdaZPOvQbqXtE3IOoaZgtavLjW7r2ic/prYhHJAuTG6c
         /ZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767348552; x=1767953352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=quKKpi291Ij61ZouqUEp6jzReIm02EqX1LBuWIaBPAU=;
        b=Gw81Wcbj8Iqx9LzXuhZXdsZkByK7mlXF01PWj5XpN3pIoqS8YpWh+EyqJqklf9j24u
         hwmE2YfION7/6Q2MMBuDNIoEQIlQOV5le8gJnj9Oe+zEcFns90+UcnXmaD4viR8VZMo7
         FTOb7vN2VyylOrylL0rjhmyZqR3UWc+VKF6pjOKZ/hXFkSRclu9OfGxJVB6TjbM+XPsX
         AuHmIx73ffHKfe57gavAn3kqSb2WCxwhE6SxKL4ej81n2g9554xTlRhh6Me/IK5XJGRb
         xNKPFedQlJpx78FaUX0Zh+ru63tFyL/Qqkq6psSFkn2kDQkZCTRfs90EoYr1AzPRXniX
         eidw==
X-Forwarded-Encrypted: i=1; AJvYcCXWP7NIdc6sIUtnGEN0gFSDKoFBmGwbZafGirtxCUq6qkwnj4PQ7/OlWEcuXE8cz8M9/UUSJEB3SlJCLc6lGXJZYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxW4UgQAgqUguU7Sd477QAQtRlVVG3zI0PEzqX7DJMQMiv1os+A
	J0Uv4iv66RpG7MOvESJODN5iN6iMAi1UC9NYJqCO2O17DDipLBwMaEEGGoL/ieX8csaeYiEvZbm
	IX/qVsh1IlQWW2hV/yopJh6qX7CQ6z8LJWWaA49QsSQ==
X-Gm-Gg: AY/fxX6za0E9aM6S4Bk/IG8zemHTiAzWahCXsP3nNHy98zgrZaLuo0Ik4YB5T7WYRIj
	FO2Mu+VDy4W0mRj0zRFqfhFVkdeEX2ZUSlmQ/5g3AiYz2OAAzZvr/OYn0zhCZQwHe/VyVDP1HiH
	qLan0BjBFs0/zIig6QZjm+9fbYUalEkTtlVf4mk+fF/GGoqT3JHzZqchsY9FLbrgR2d9ejR9tpu
	RY1q+XmdjrorQLzpNSweqUHLx6gatVfA5kl7h5gTTE3kmqMsKxfDbITvEHMmuyKDbrKsxp2hb1U
	lPGt41Cb72ewkRpyfGxwwXCA3KU=
X-Google-Smtp-Source: AGHT+IHjSaOFOUMR11HrjYKQvXUIGVNogKo3uPHeE0VNpzsZZVoUCwXVx0TOIv6UbnLc4tYDAoC6CU2AMhhsN5fF6ic=
X-Received: by 2002:a05:6512:b0f:b0:595:82d7:a275 with SMTP id
 2adb3069b0e04-59a17d4f8d4mr13173122e87.37.1767348550994; Fri, 02 Jan 2026
 02:09:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251227-s2mpg1x-regulators-v5-0-0c04b360b4c9@linaro.org> <20251227-s2mpg1x-regulators-v5-20-0c04b360b4c9@linaro.org>
In-Reply-To: <20251227-s2mpg1x-regulators-v5-20-0c04b360b4c9@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 2 Jan 2026 11:08:57 +0100
X-Gm-Features: AQt7F2r17Srt20LVLe2RDqwU3JWhUJkE2UjKhFxeZxdb3Gpm1SvqBNl8ICy9QX4
Message-ID: <CAMRc=Mcn4MN5Mp-7avR1fVn=V1HFCimM5FM8jx4bXvCpjjVzNg@mail.gmail.com>
Subject: Re: [PATCH v5 20/21] regulator: s2mps11: more descriptive gpio
 consumer name
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 27, 2025 at 1:24=E2=80=AFPM Andr=C3=A9 Draszik <andre.draszik@l=
inaro.org> wrote:
>
> Currently, GPIOs claimed by this driver for external rail control
> all show up with "s2mps11-regulator" as consumer, which is not
> very informative.
>
> Switch to using the regulator name via desc->name instead, using the
> device name as fallback.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
>  drivers/regulator/s2mps11.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
> index f068b795ab51845bddac84eca08be0efdcf4f164..178a032c0dc192874118906ae=
e45441a1bbd8515 100644
> --- a/drivers/regulator/s2mps11.c
> +++ b/drivers/regulator/s2mps11.c
> @@ -362,7 +362,8 @@ static int s2mps11_of_parse_gpiod(struct device_node =
*np,
>         ena_gpiod =3D fwnode_gpiod_get_index(of_fwnode_handle(np), con_id=
, 0,
>                                            GPIOD_OUT_HIGH |
>                                            GPIOD_FLAGS_BIT_NONEXCLUSIVE,
> -                                          "s2mps11-regulator");
> +                                          desc->name
> +                                          ? : dev_name(config->dev));
>         if (IS_ERR(ena_gpiod)) {
>                 ret =3D PTR_ERR(ena_gpiod);
>
>
> --
> 2.52.0.351.gbe84eed79e-goog
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
