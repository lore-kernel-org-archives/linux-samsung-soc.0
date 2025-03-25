Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6652C13A26D
	for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Mar 2025 10:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742897721; cv=none; b=qgNt1zmzCcYgXVliZuBU6i0GJDuCNPExvwqA0sQKbl6Wo+titMgUBLK0p6yu1CXp+d+zopJgHYYtc0Uk+gGY7YTVVKd5FrIJO6YzIFIWGV4mQkCAXgMCM5u18Mryaku5HZpYnlR5t6YlzmpQf5qrC8oJIU3KJnQY2TZSh2P2A74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742897721; c=relaxed/simple;
	bh=HIiymNtPWSmafw/vlEzUs3yK38VavdvhdwhqdM6/8zU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WoXC+jaOMIVtkkAjsAeuETV5stRSW3fBgu8RvHV1obmeYBMg2veMbcT+fIz9auDV7qjrMPoGs3fbsdGM2f/u9Xk1lGt4vjXJ67BajZLXD+8YNYcDkSP8L4yGjAUy4t92oHy0uM7/PlN7v7eSFRbzUKfaSV2qJBsSBQy637+c5a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wnYS7xt9; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wnYS7xt9"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so32578855e9.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Mar 2025 03:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742897718; x=1743502518; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HIiymNtPWSmafw/vlEzUs3yK38VavdvhdwhqdM6/8zU=;
        b=wnYS7xt9skdjDZQardDs2MX4RWd/7Hz9oiEZT71HZULshe31/PUfeGxOaqom3RvRcv
         3uZ2N//AJ0pJ9xWlMM3dk9Na+ZJjhJH6E7NQ+ITtCh0Tayc6E+jHNYg6yhmdzqq6GtfZ
         MNKd2pfpghNQ1KKV08/0aYkVI1tNNVXpWgFY+alSftJ3hCtQFIfq0sOc+ld8K62N/LcB
         B66AsZ2cHsZ788XHRgU+yzFAvesxAqw6q6PTWvIZCx1MdFHBQa4jQv+AtBLJrZv8cKt7
         ntaLLQ0qkcDp4RSybC6nYBRzuYpR1Va/4FUXGWECQhDmbUnxueHf21eghbk7yKMiiKYF
         RZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742897718; x=1743502518;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HIiymNtPWSmafw/vlEzUs3yK38VavdvhdwhqdM6/8zU=;
        b=ZEgnPnFOPCEMan2mAPtGHkMeQ8LMaKTjk2RreMdrBicCWmADnAjnZ/xub95Ho619Gv
         +D/hD7vwa7qhvbTJWP+HqxlCOOsCq5/KKjQ8ksVPHND2qfxb8jFYXDDhWbJdTDey4AIX
         W3WN8zIKUlIURcwI38/LaazT0mnkGQS7s2EkNM5A51a4EpAnoyj6Rg+PRYWrSomps5WS
         60IYeScm7bn7SvCpYEWozug4PX1ivnHXdoC5Sx8wswODmyHzy5pISyJ4SwKLafAHQWPk
         Aubq+bwI8GdW0mxSw+ODq6cd8hjcZHUNbld/bH3txPftdQuCOg1V5yQ3LNi+hlveoU6I
         Ssiw==
X-Forwarded-Encrypted: i=1; AJvYcCVcF0fwty+hKMy0xdAx5jcE6Jg20TGCLZG/t8ckCqrp5lxmTkoGv4GcxBHES9/6Tcetfe5AwCVf1eiRoQjA4FS13g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6RYxDFyqRHb3vHkWpVHvFOsN7Kc20Mr648ulGdxu/gO59ESHE
	gstu/JOLZiIBRe4boU7KpkTEm3dg9VZ/cnTaS7OInyT1Z7Kl2RWrk6tFAp+tRao=
X-Gm-Gg: ASbGnctY35gsstiOWbIt8tJDoRTzza4ERNdwudXpEu7y0MV7yyWG0BFoiiFZCUlVJUQ
	EUibxQUv9VPCry0guqrG5SNZl1Ry1zdnjkvJbtYQewlbX/jtJmXn+VZN+hMis7NOQXQFxuIx5lJ
	4v6wGH3h65fBSqO/NzBqbCiFBKDDuKEHr4ax8D29KM+IkdIjMGJtVIoswX9dBFOBBi5kZtSAecN
	gtLive++46ZF3SXjrzK0XLsSN9+rWtS2jun6+XXIMNolCilMCtR0+LPWVGqa1diPEJmZBoRPraI
	BT1P+G8GlzwLt8hEYzF7FfRlL7oCrfxg4AX8/GiV+4ZOHhbTRw==
X-Google-Smtp-Source: AGHT+IFw2/pNQ5VlOB5j+GWsibTCWxrlkUBFFVpMfhBQZ4qA20RXRLBX1Zd3wl5pSv2Zad5KMtYTBw==
X-Received: by 2002:a05:600c:1f10:b0:43c:e2dd:98ea with SMTP id 5b1f17b1804b1-43d5a32ce3amr105676265e9.22.1742897717551;
        Tue, 25 Mar 2025 03:15:17 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd9ec84sm144043865e9.26.2025.03.25.03.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 03:15:17 -0700 (PDT)
Message-ID: <48c082ffbb6eaa75eacbf3c7cbf0e4caec441bfc.camel@linaro.org>
Subject: Re: [PATCH v3 0/2] firmware: exynos-acpm: allow use during system
 shutdown
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski
	 <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Will McVicker
	 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Date: Tue, 25 Mar 2025 10:15:16 +0000
In-Reply-To: <20250325-acpm-atomic-v3-0-c66aae7df925@linaro.org>
References: <20250325-acpm-atomic-v3-0-c66aae7df925@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-03-25 at 09:46 +0000, Andr=C3=A9 Draszik wrote:
> One user of this ACPM driver is a PMIC driver that needs to communicate
> with the PMIC during late system shutdown [1] and at that time we are
> not allowed to sleep anymore.
>=20
> This series address this by switching the code to using udelay() in the
> specific case of system shutdown. This approach was inspired by I2C's
> i2c_in_atomic_xfer_mode(), which has to deal with a similar corner
> case.

Looks like I forgot to update the paragraph here. As of v3, we
now use udelay() unconditionally, instead of the fragile approach
inspired by I2C, as suggested by Krzysztof.

A.

>=20
> Link: https://lore.kernel.org/all/20250323-s2mpg10-v1-29-d08943702707@lin=
aro.org/=C2=A0[1]
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
> Changes in v3:
> - switch to unconditional udelay() (Krzysztof)
> - Link to v2: https://lore.kernel.org/r/20250324-acpm-atomic-v2-0-7d87746=
e1765@linaro.org
>=20
> Changes in v2:
> - add missing ktime.h include
> - switch to ktime_before() instead of !ktime_after()
> - add link to user requiring this change to cover letter
> - collect Tudor's Rb
> - Link to v1: https://lore.kernel.org/r/20250321-acpm-atomic-v1-0-fb887bd=
e7e61@linaro.org
>=20
> ---
> Andr=C3=A9 Draszik (2):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 firmware: exynos-acpm: use ktime APIs for =
timeout detection
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 firmware: exynos-acpm: allow use during sy=
stem shutdown
>=20
> =C2=A0drivers/firmware/samsung/exynos-acpm.c | 16 ++++++++--------
> =C2=A01 file changed, 8 insertions(+), 8 deletions(-)
> ---
> base-commit: 9388ec571cb1adba59d1cded2300eeb11827679c
> change-id: 20250321-acpm-atomic-033775b051ef
>=20
> Best regards,

