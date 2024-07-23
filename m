Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EE4155741
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jul 2024 14:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721745890; cv=none; b=nUoQkEwE/bQ83QcQ7ZH3XEutnKUQzVHf7LBfrnW9e83ebmDoOqbCyaTaJCgki1N3IXnn4BV2eEXj/C2uLSVvuXVPnbWPF7jGmTYII/CTFRxfaAawqPcti1hgarG4YL3s4MVyaPv8l3uxpRYTTakVA78H2jvl3uO89YaaJ7p0p6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721745890; c=relaxed/simple;
	bh=/DhszLUQm78wMoJ8KfR7NpJ/TCjeTVmSlYGYshTQDR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PR1yLszPYqpXWuuaJ3stXRh9JaKaCn7imC3WLh2CbuouVbbCNCR2gafATZ0XpfjdemuJbCxYar4ciwHdZmaeCPd/FYII2hTmwE9stpqzHTh92y7SdTttvbKcalpIGbBqUGJfjDT6ZVVxbvVxxqB22aok2UL2VE7Gdus4N4KU/gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wNLoBGfA; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wNLoBGfA"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-65f9e25fffaso59143197b3.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jul 2024 07:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721745888; x=1722350688; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/DhszLUQm78wMoJ8KfR7NpJ/TCjeTVmSlYGYshTQDR4=;
        b=wNLoBGfADIe/jSTAwATqYvqBwNRF6FQQAzIXRfgsRxSE2HG+soZGkdnHP89cNSsVpk
         y7mnNCGneMpwQmwDfANAu6ZwnHf+rdBUpb0/wRwae66U/xyvu1yf3J1/ahTziaYHrPOt
         Kzy4bjq/bOyrGHr/n5HxAmh85T32b04M/J4+sPbeYEMALCEoO2Xgg9alk3Pzm6+4/YHk
         LBJo58HtdvYGL7n6Im/jAfTuUC5wYWdTJVDc8N+k5EhUsYqoM3jmlR0LqeDrH8kU1CL0
         AQ7qdUa3WWkT+LwUprQR80lFn1arsuaBHqHeE7q/gUmPJi9U0SkOz9QELTIkEWa4PTqA
         AEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721745888; x=1722350688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/DhszLUQm78wMoJ8KfR7NpJ/TCjeTVmSlYGYshTQDR4=;
        b=jT+DO54BKkhh4mfcpCQKfx/xvvTqDqLmb3DzbJrSJ4Y4uK8i6Zg/GYL7KsYTV4q5O3
         8ofy2Z5L25QBcEEN4uxStCpubGRo6uNm1x6KFqYqtAEr2d2Ks/4A7kJbPrMV/K4+utpw
         BvQxTSGbxbcgQAR5yk3DJt9mu4WcAyV4LXBlvRePhadlT9PWOqQKdq6aZ37xPohbAqmQ
         qCuZtGlLjFQit5Xg3feU9tqN4ENgxqUdKKVHxPBh8Xkj4cS1agHK7ZTNUCkcUl0JKZWB
         k6nzK1ZDB/qLsuzW4kV8sOgk1OsbAvvLBKF7rbogEyuwZB1kmVHREObgMOGHHLGpI2y+
         Mbmw==
X-Forwarded-Encrypted: i=1; AJvYcCVb4khsRpC0yqRbKSksniU8ueao2VGCH+zT7vpFldhP/nnmBlsneK8rRXZl7fpKanh8jo0gL8Ld94tp68+mJN02Sm+N3f7wprO/reA3LmlMqIs=
X-Gm-Message-State: AOJu0YwkQdY6lkLZIr+IiAyRV2xeHpQ/cEYBafbJE1i7T25C6JblK+be
	Fif2U+1aZkPaDeKpEbG5wxcZOyZlYt6kIL2O0j1vJP2wl9CMSR0Vsoj45uGzqQ3Fwr5gOJBdJpI
	Vw2tb8V++f9HR8mrGnFcgP+6TaZzxrWk/4OvkTw==
X-Google-Smtp-Source: AGHT+IFGjfjFX/FJh03F1MKKrGFIVaAs0XDkGFgTDf72tmLxkemD7JLVTcN+JvnaLeLNBvOdMegKN1zpNtKOUb737uw=
X-Received: by 2002:a05:690c:10c:b0:627:d23a:4505 with SMTP id
 00721157ae682-66ad8309fcfmr141173287b3.3.1721745888405; Tue, 23 Jul 2024
 07:44:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20240723141654eucas1p2deadd470e2ceda1601042dad4acfc17e@eucas1p2.samsung.com>
 <CAPLW+4m0xG5yHOT_ucGdrOhLZvjhga8caqHQZmVH6HHKUnBgkw@mail.gmail.com> <20240723141638.374742-1-m.majewski2@samsung.com>
In-Reply-To: <20240723141638.374742-1-m.majewski2@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 23 Jul 2024 09:44:37 -0500
Message-ID: <CAPLW+4nYfVytXnpDs02QQGms59dL+=pAv7NMNPK6Ymsemmi_cw@mail.gmail.com>
Subject: Re: [PATCH 0/6] Add initial Exynos 850 support to the thermal driver
To: Mateusz Majewski <m.majewski2@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 23, 2024 at 9:16=E2=80=AFAM Mateusz Majewski
<m.majewski2@samsung.com> wrote:
>
> Hi :)
>
> > Thank you for the contribution! Did you by chance test it on any
> > hardware, perhaps on E850-96 board? Just noticed there are no dts
> > changes in this series (or as separate patches). If no -- I'll be glad
> > to assist you on that, if you can share dts definitions for E850-96
> > and the testing instructions with me.
>
> I did test it on our copy of E850-96. I used this for testing:
>

Good to know, thanks for the detailed info, Mateusz! Just wanted to be
sure it was tested properly and my help is not needed. Btw, I'm
curious what is the reason for implementing TMU? Do you have some use
cases where it's needed?
