Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9013CEB92
	for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jul 2026 07:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785311229; cv=none; b=AUsFvp4mdKxJJDgPT+6UefHmmfgyVbFlRumWoM1s6sluHxZT59t0CJZlyYTERouN3TmHXRZQWSZthoG6yAGRN2/kRgcy7IT0Z0nUjXmlIsPMmRz7WgCKodoWWmQmQV0V5Mz9N4kC2KoWy2PhMk+2WYBW5t2ZAlxMJwKlOghRTeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785311229; c=relaxed/simple;
	bh=CnDfjy0gxmr2Cbj6LcfLZcNzLV1wsZsbYNBRZJUebR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kgKCpi/sPIM/Zi4WwlsnC0diFfrIPloi/oosYU/vke3PSyGGj0MbB4Zhs11Q7ps1UBD64+oK9CwDBxZuy4WVoAI6sSA2XCpDUhXXHB6YS3bXJgNZArXcZiYuAgjhM0pAXrEwYvs1BuxPG80pGEiKV7VCc2k45yt9mBnilTJL53s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lvM5t3MM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lvM5t3MM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED1FA1F01558
	for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jul 2026 07:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785311217;
	bh=CnDfjy0gxmr2Cbj6LcfLZcNzLV1wsZsbYNBRZJUebR0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lvM5t3MM6nDk5hVkfEOwRkMdNOBrGPKLRBo6ux+gQ467XT57j/sG+HYxVUCBOA3AW
	 AaycBKXlGzIRFgvne2Pj0MI59TjkQ9+kSOCdU4Ck5CL//eWIJtk57qEg4gK4WS+PMP
	 +i8JWnxi3JnLA2IZjC9EfxIFSFbTG7O7yqztY3BiX80eLoqZKtmroV5O9SIME80hk8
	 xfrzITmVVmOLpfPCLVGnpxDFU6EhDdtrOguvKQdNBBwDQT58CSzAtIQtP1ovJPs1ec
	 941kovFt46XtrOjw2CmXnSS85I5BP384Rfz8YdULHeFVlbD1/iVWggOy67J6m0gqU+
	 c6x64oI6CyJnQ==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39c8dbf4ef0so4923841fa.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jul 2026 00:46:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqDl/h4vE7y8r73EqvsxzLHPTaX9MnWmlZG5TDAKg3pTKRYvqjL4lZpj1peAGazqp78TwFnOsf4yNGYUpBREJBRUg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+TLRtympXzt/Uhmzs11MF4C1KKoRLkUIT4RJPlpnFUJlP35q0
	YlZQhDnsJHoHJ4g3/3yl4nKEzMratZ0cTtHI6gU51YPSKBxVFqn7njqLAwyKiW/AedxiqM0Rmnx
	I7qmx7JZfV0kSA3CY3KJZfkrhxbMhX9A=
X-Received: by 2002:a05:6512:3d28:b0:5b2:b7f2:f7fc with SMTP id
 2adb3069b0e04-5b2d0274201mr1124477e87.59.1785311215686; Wed, 29 Jul 2026
 00:46:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724-zinitix-modes-v1-0-f6df7d86a878@disroot.org>
In-Reply-To: <20260724-zinitix-modes-v1-0-f6df7d86a878@disroot.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 29 Jul 2026 09:46:43 +0200
X-Gmail-Original-Message-ID: <CAD++jLkRsHTL-vy0BcKL80onEocp3Js7UKgx=kKqFn8DEH8H8g@mail.gmail.com>
X-Gm-Features: AUfX_mz6x0cLcw53qb2d4v30_RvCZ1PIlNE2O6iglWvSmm_YIQGxQudd43yM1KA
Message-ID: <CAD++jLkRsHTL-vy0BcKL80onEocp3Js7UKgx=kKqFn8DEH8H8g@mail.gmail.com>
Subject: Re: [PATCH 0/5] Support zinitix touch modes 0 and 1, dt changes to
 Galaxy J6 (j6lte)
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Srba <Michael.Srba@seznam.cz>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 9:24=E2=80=AFPM Kaustabh Chakraborty
<kauschluss@disroot.org> wrote:

> The zinitix family of touchscreens support at least three modes, called
> 0, 1, and 2. At least some digitizers (including, but not limited to
> ZT7548) are able to support multiple modes. Currently, the driver in
> linux supports mode 2 only. This series aims to add support for modes 0
> and 1, accompanied with necessary architectural changes.

I wanted to test the patches on my hardware but didn't find the time,
anyway it all looks fine so it's OK to merge.

Yours,
Linus Walleij
