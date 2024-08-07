Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170501B9B20
	for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Aug 2024 11:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723029457; cv=none; b=V77Unr51w70lBm3YRUbyKdRduRmyl1uYfLr+exppy+0xAi0bSb07z6VpvDWK9zMX2i3SApFVzNAUnXtYG15fkuWHMEnLT+x0ENBna38p0ev8130Gg6DRSCLpOmgVO0tpTrngbCcimPOqfd6wzz7O2q/BTyzJnstfi7eUspvST6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723029457; c=relaxed/simple;
	bh=yFZfnIIZNy81/zF1j/wi9hJhWAUXJzjhPkiUHNQ7Wfk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jw7IvGURwJbEYezVfbzujtJfXZwdzPHivZzxB1a2YEqVtwXY8zMzkGg3kny4m2ge0Q58dhBdCmJ05PKXuar4w8xBCe7hKee0gAk0cIVzbD7EuR889Qb4L3/LA+gCW6/qRDuD73yFSKoiyWvW4jbYnd3AlS+NRWgQ/CRR6RPyJKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rumyRgdY; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rumyRgdY"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f032cb782dso15419221fa.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Aug 2024 04:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723029453; x=1723634253; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yFZfnIIZNy81/zF1j/wi9hJhWAUXJzjhPkiUHNQ7Wfk=;
        b=rumyRgdYjOME48AbBSjp7yhh9YTqaS+oOlWbUGUmZRsrwkl4NeFsQG1+tyWsNOUoPL
         wx2EIw2a6AUnzh5/ioyJ2/AXgTbTAsIWmCXJFrZnVajNb1rRwh/hXAF5YEEN3tr1NGfL
         PouaFttjGaXs4/iN1msuhfFuda+XNIhhz+RsTGhveAL1fY7NRD//d/6c8AoezaaRQLeu
         3VFF8/3Q4qSIXwlNq2Q85Dr9Z0djQ011WIZxpFKPxwy9NA3QNy1FPLWpD/hlzcEcIj5H
         buHe6ttbRCgBNQY4DHgXZld51vszHI53akuZKKR+LUHeCNeHxoUb+rgN4Yx1lLdsCrNj
         56Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723029453; x=1723634253;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yFZfnIIZNy81/zF1j/wi9hJhWAUXJzjhPkiUHNQ7Wfk=;
        b=khSaXRiN60pMB0TEsDGPvp3xeDc5MpNGH53tqOZbeufamb/qmZHr9YG36FcEztILio
         sRo1xDdd9dsctMel267gOgTBiQ1gPijRy6eL204XtedhUnT49Sop7LDkj1kg+4CIqJ7o
         DvFGTct1sbr33TfVoI5U+mH0Vn1L5ieT9hu+f7Iznefqd/PWKk4RN+jUqf3+sZ3KDAZC
         U1EPiqsrqSJOBdTILUV1wwBAaKi1B1SY3tH5RsfvFIA+8qX0im59HG8DpeyKIkCYrOiq
         y9f98DbNgynA9pG7KYREmhvbPiVRc1KIMaDIcYpttp1EBZrn3jyg0Z972VU6O5zlD3ya
         nEyw==
X-Forwarded-Encrypted: i=1; AJvYcCV2/eToFOn+MrV53nbb/eTOLdlVV5yt9tlsCecB7+IX8/u/aoFy1hfU4OWqFWA0n+r0hVAI5ekhCO9xU1gIr4qufzspOgX6RCe0nvDNYgBUJ2A=
X-Gm-Message-State: AOJu0YziD7ynDsZn47xTjKKKRWjRFF5RGzGwI8HXjYLmE+AeUivJHpWl
	Lw8MDGVlFSAKdqe1NHUvLpcUCgBZSRgFeojcgyLORAMfSrqP24XUVykVqnBVZm0=
X-Google-Smtp-Source: AGHT+IFfokbTfiz3cEaEz9zIyLPTh26PV7jtIRgBmVbuOcTQFlwYQExnV7O+buVk4alISzfzQORRdw==
X-Received: by 2002:a2e:8609:0:b0:2ef:2c4b:b799 with SMTP id 38308e7fff4ca-2f15aabccc8mr130526341fa.28.1723029453010;
        Wed, 07 Aug 2024 04:17:33 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42905802023sm24343105e9.37.2024.08.07.04.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 04:17:32 -0700 (PDT)
Message-ID: <71e73974d0c3ce99e46ed85a42742a8d46e53c73.camel@linaro.org>
Subject: Re: [PATCH 0/2] tty: serial: samsung_tty: simple cleanups
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>,  Jiri Slaby <jirislaby@kernel.org>, Peter
 Griffin <peter.griffin@linaro.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org
Date: Wed, 07 Aug 2024 12:17:31 +0100
In-Reply-To: <2024080714-spongy-wannabe-7a9e@gregkh>
References: <20240806-samsung-tty-cleanup-v1-0-a68d3abf31fe@linaro.org>
	 <2024080714-spongy-wannabe-7a9e@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2024-08-07 at 13:09 +0200, Greg Kroah-Hartman wrote:
> On Tue, Aug 06, 2024 at 04:29:44PM +0100, Andr=C3=A9 Draszik wrote:
> > While looking through the samsung tty driver, I've spotted a few things=
 that
> > can be simplified by removing unused function arguments and by avoiding=
 some
> > duplicated variables and casting.
> >=20
> > There are no functional changes here.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > Andr=C3=A9 Draszik (2):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tty: serial: samsung_tty: drop unused ar=
gument to irq handlers
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tty: serial: samsung_tty: cast the inter=
rupt's void *id just once
>=20
> This series blows up the build for me, are you sure you tested it?
>=20
> drivers/tty/serial/samsung_tty.c: In function =E2=80=98s3c64xx_serial_han=
dle_irq=E2=80=99:
> drivers/tty/serial/samsung_tty.c:948:45: error: passing argument 1 of =E2=
=80=98s3c24xx_serial_rx_irq=E2=80=99 discards =E2=80=98const=E2=80=99 quali=
fier from pointer
> target type [-Werror=3Ddiscarded-qualifiers]
> =C2=A0 948 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D s3c24xx_serial_rx_irq(ourport)=
;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ^~~~~~~
> drivers/tty/serial/samsung_tty.c:856:68: note: expected =E2=80=98struct s=
3c24xx_uart_port *=E2=80=99 but argument is of type =E2=80=98const struct
> s3c24xx_uart_port *=E2=80=99
>=20
> And so on...

Odd, I did test this, yes. Not sure why I don't get these, let me check.

Cheers,
Andre'

