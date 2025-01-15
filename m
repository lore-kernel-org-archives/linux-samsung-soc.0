Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D676943ACB;
	Wed, 15 Jan 2025 17:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736961766; cv=none; b=l60jAMsO4O70SHWbH2ZjPoLX8ccphVI/IhTeN7UHeHhskmVB9B67Pa1mWlKZ+GaY44heg4De/yet5j3Fplk9TcxNd4Cucb5PTs01pVbfwmb+tg6p/HSL2cESlXLm5gDEWTMlN2S/yYe2DulKWunPeY4LFmeGA0Fi4Bor0GY2RVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736961766; c=relaxed/simple;
	bh=3g5AOy/56S9wuiDS19QWAL/hiIZqXqvvyJXaDWR6DRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZEa7wESfjuBYVI/lS+jdIncq/VHOzXE3+JpSQwzKegmGgt3dUZwCdYR6jMP2+OK1SK8RF657BCGc5i+QjBBqAX+SAPzjB9pTiQcThYyscJk5ov4AAW6DCOfr7KbgYZg3TWZLhEOJz87MVOn0aL2YU/ZaDF7XcPwBpqTO5Qjh6KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EHdfILg7; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EHdfILg7"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2aa179a8791so20412fac.1;
        Wed, 15 Jan 2025 09:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736961764; x=1737566564; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5UG7QxVR++WRdYY+/35YW2yLibbafgum8u029E2OUk=;
        b=EHdfILg7wDslWAEPMTOZgjaqMFSy5PaFHDgUjkLby3DAXSYX+bD/b5jTep6UDQsRCP
         S1EkZAC8Fa+JUlr2sZRgKbfvL2jA1EF4//xCsiNJp1ku6iB1dcnsLBBCINEu3De+oAvh
         U6BPn9vK9G4LDEruIb5Kll4umXoCrxBsSXsc28P53WHaBDWo6ISQrklj5W1HEgfRQ7lu
         +N2UJgHTiy/dn7PchYE2Lw2zQP/wlJ1cbtRz+i8dlRnpYsV7sGYgHKkb2VFkwbkrvSd7
         znQY2RXWAcGSAmGP9FnfL8jaecnmPYxMFXDrKOQrjm2WpE91IUUbiRIPhKZ6txH/o6ew
         fIqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736961764; x=1737566564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u5UG7QxVR++WRdYY+/35YW2yLibbafgum8u029E2OUk=;
        b=SPfpug/W/qB/NpSb8uPMk7wXHISRop9YXkqmoOdHFeZT9NM/iCWfjR9errWcgLt7fl
         BE/MKD3SFY1QuJ64JYqQIGMXeG5h0TuZqWxH+4xtsRWBWOcBfqyA75cHBrbmEjiw51+4
         1aJZoOMhJkwahwcerkts8yHPtNC1n86vloEJaaq84vhK+D6hbeu2jqYVKeQ7EKSgb6Nx
         PLSKijG+YcYOD8KkQTvUvagTUJIrPEyIK6ZkWgVauV5oGkeMlLgwrliFCcyPrHHCzt/b
         nMyXX4af5/Eqx1O8Ek4yiM4kzHIndEF2GPMZeKAZWSRb2PvObZ1LDox0cr6XLtoKGMOC
         1SIA==
X-Forwarded-Encrypted: i=1; AJvYcCU6ZrEVvtPP8AYrPKKYndco8x/QJ47OZIgNBB7KVOBeI5Q3Uj6JFAk8CW+ZSMQCowgACI09JUmUxZBOMPmb@vger.kernel.org, AJvYcCUIlcpotARV7v+pW1eVWM/wZ6j6BCjEzQ9z/xpLoDhofhTAITgMyq4gRM5PM8PHchLRxA064V+PM+rB@vger.kernel.org, AJvYcCVg3yt3NqVXzZXAff0pslS1T9b41vS05Ty0T7uS57AXYlUToOhwErGnLJmr73KMN1vzzLn3CTsVREK3GXV3PZfBG7s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJvo3GIGehyAzf+0DoBFKJpYC0+HeFPuN4ctIkqs+Yeb4jcYkZ
	NGgp0H6V5MeLXAShSZBrxGRPGMIlVrnmNdaqmcZspdojJUHw13LT4gt2ychHUBft6SRzeoJVW5S
	X4FtrfV7Gr5Wxd2VBAM7sVLqQaOLtinvj
X-Gm-Gg: ASbGncsfYVaktWK3IUN68ENlG1LVC13kEDG6da1snbgAFl431mfIGjJhT+1dP9SPQFW
	7wMKmjswJJ+8NPYo+Wr6jFa7fTlwvkdElK2HIv28=
X-Google-Smtp-Source: AGHT+IHTdiOgOQ8loJ8iUlob993v8iSy5RRS4v9nUw0JLwCAvYfy9EWLVKdFgVIWtMBC+CDkgbJDOHm0KeGaXielf2s=
X-Received: by 2002:a05:6871:d28b:b0:29e:255e:9540 with SMTP id
 586e51a60fabf-2aa069ac21dmr18581926fac.35.1736961763883; Wed, 15 Jan 2025
 09:22:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115-acpm-v4-upstream-mbox-v7-0-948e09fcb5f2@linaro.org>
In-Reply-To: <20250115-acpm-v4-upstream-mbox-v7-0-948e09fcb5f2@linaro.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Wed, 15 Jan 2025 11:22:32 -0600
X-Gm-Features: AbW1kvYjzVhFBXbtTBnJQ6T6zBUhDMPTiScx8oqCLHH6G7qIWKMnlkm5RSVwuPk
Message-ID: <CABb+yY0+L0c_si3uHcmBQgwN-JWkb6ZzEDN0zk2Y6q1r+xnhEw@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] mailbox: add Samsung Exynos driver
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org, 
	peter.griffin@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
	daniel.lezcano@linaro.org, vincent.guittot@linaro.org, ulf.hansson@linaro.org, 
	arnd@arndb.de, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 8:18=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
> Hi,
>
> Now that the channel identifiers are passed through 'void *data' in
> send_data(), the clients now depend on the message format introduced in
> include/linux/mailbox/exynos-message.h. If Jassi finds this set fine,
> then he shall provide either an immutable tag so that Krzysztof uses it
> if applying the ACPM interface driver, or to ACK this set and let Krzyszt=
of
> queue it.
>
   v6  =3D>  11 files changed, 366 insertions(+), 2 deletions(-)
   v7  =3D>    6 files changed, 268 insertions(+)

Awesome! we have far fewer changes and no new api added.
I will queue the driver.

Cheers!
