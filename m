Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0342C3745
	for <linux-samsung-soc@vger.kernel.org>; Fri,  2 Jan 2026 10:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767349209; cv=none; b=Sgax2Ne0cI3045nrFk6VXz2TmcrwgjL6vV+HvwzJMuHrCIWCDCSN1sSDcjs5oRD38hhv9ouk/aoEWIu6jWPfzlE+MzvtwFoh+QEAZqgqv6qJ/SI64Nq5Z558l0OhQtFp8bwrRV2fO3H8zce+Jb42/loXOvvc6qL6VInELdqQqNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767349209; c=relaxed/simple;
	bh=WFRLXXrWG5laFAL8o5x1rIAE1Mvd39kt6b0GYzsOmMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TZoQjp6azVunczCteix58UviAy18WOwyGyoZynbT0jvniPklE4g10QWKIpnxJjWapqvMV+A2+OKr2nSo+sD5++oQVO0FvI6CnDCIvfHHa4wERHTmAXSqrBTQVyIlHSNvb+lhUjAzk++BRSBQEhebZaPS9hlx53/qE0nkbcJlHS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=H3KKYNCl; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="H3KKYNCl"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-37d056f5703so90536771fa.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 02 Jan 2026 02:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1767349206; x=1767954006; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFRLXXrWG5laFAL8o5x1rIAE1Mvd39kt6b0GYzsOmMY=;
        b=H3KKYNCldhDnZvb9Qw/IYM7cuwKJrlsHZGb00vImbQ10vOEEfz84ROHwhICX8y5Gn3
         m+empeRMs/DCpGXaY/SXhMzDUstI9sbhm0CBCkKxcCnlt/51/qWGp0qoGor5Ui8KbHVU
         ykkU6r+KWPqh10sshiJNJ1ZYkeVJrsDdKjBLptDM1x6fwfpSZ/O0FAne28XN+399GPkb
         WIMbBrCf/FJwKwIEjONLCVT1YZCg2KvdWF/YyV2w8ied6aBa9zBZr83imFFB4Pi+bR33
         7ky9SVyKxfRVg9RBLYBV0QMjvb8ox5bgQUGu9GkKF2TAfbn2mutoGwHwghGH2RXjMhJy
         paEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767349206; x=1767954006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WFRLXXrWG5laFAL8o5x1rIAE1Mvd39kt6b0GYzsOmMY=;
        b=qmO7zpE7B0YDR0nlONi3+R3JVxhjVg22yeN1w2NxNmQRCUD+xeYLUjX8LewmcKpksa
         NKlkeYMdKu0pKeQxHk+wjO83ykcXjdPPllsnocYw+sFSn1EvsGVnV8H9iFImJfdK9gL8
         76Jxo6Qc5zVWBTIwockBUZLIDr/qrjhGKzVoh9kMErSjulHI6nmXjtiDumkf9K0S7qWj
         QPuEJzoSEI6pOJU/tWs6Zwt3MiqOuQKzRxo09Btdj5zNy3w0ZEmJLBqnU/nqk57zzMi7
         bvkHBVWN2/JHGJ65tk74XTiFiRTpoI+bougdlvcSaEyA5f+BEAV4RaAjc6KKdlXvZ+YS
         8y7Q==
X-Forwarded-Encrypted: i=1; AJvYcCW1rwhylIeGVgWu+4G4J71bOaAGShpQIdRYFVSA7TOzYVcofGeciEkTr8bvavkCq/ivz5PO3k77Yb+Jc989rNdlvw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuaa/gAziA27c+s4OrM4AzuFZqLeBqciFaon/ZX2TGXt3e5yXW
	uYQIgR5VRMmCXMXMNvEeG63+dbuvjCghJtrh4WV33eOZgJvk2Dyb/xwWLTtK8P4e+DV/Ns6+veG
	6WcIJ+/fQIGzXB+SjNqx4cScFIbF13NS2+FbQ54FjyQ==
X-Gm-Gg: AY/fxX4ZKeqn1TKBv7p8/g3d4hJvay6lfriT0p6MXXn5kbnrSPYKPLhY9xPFzBbstSF
	UsQt6CrUYjFbop/3bZj+mkHklPfHPTzQGLZdqhOdkalOnX8Vqa1paXAypNDrtHp9lVAaCrL65f3
	WxtnZJekxPnXFMlHi+yemTTpHfWTpQ+J6Sm/QbYYvztYJEWz8Nmpzd6wXRwEstI0M9XiB60zdqW
	/n5GacVzmmyAtdOz2Hn2r9R7LfJneCwFtyDYrqWbLBb19NT6RPiz4/YNFfmUEXaZB5dsPqxLoQh
	b/u59Qjp+XXOnSeRGJtXa3RmAUbYJ7pdY6I8Hg==
X-Google-Smtp-Source: AGHT+IFTrNnAEzvneaNdkZRQ0grp032lEIuBA9cgcvyb1zEx7XlupkDM8pVGx6rm9ItHKSNq5q1wSSdpG4U4SEDh1SM=
X-Received: by 2002:a05:651c:1b96:b0:37b:90fb:9caf with SMTP id
 38308e7fff4ca-3812169eee6mr123154701fa.41.1767349205784; Fri, 02 Jan 2026
 02:20:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251227-s2mpg1x-regulators-v5-0-0c04b360b4c9@linaro.org> <20251227-s2mpg1x-regulators-v5-21-0c04b360b4c9@linaro.org>
In-Reply-To: <20251227-s2mpg1x-regulators-v5-21-0c04b360b4c9@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 2 Jan 2026 11:19:54 +0100
X-Gm-Features: AQt7F2oHMGc2bHvrlqFMv9ZOlJeQnJLO04A4hnwhyHf0_SEQbbpjY_L-KGXAL_o
Message-ID: <CAMRc=Meu6-5569rMcV0zf2V+Sz_QZgShoEhmhw41k6fczULcoA@mail.gmail.com>
Subject: Re: [PATCH v5 21/21] regulator: s2mps11: enable-gpios is optional on s2mpg1x
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
> For s2mpg1x, enable-gpios is optional, but when not given, the driver
> is complaining quite verbosely about the missing property.
>
> Refactor the code slightly to avoid printing those messages to the
> kernel log in that case.
>

I don't get the point of this - you added this function in the same
series, why can't it be done right the first time it's implemented?

Bart
