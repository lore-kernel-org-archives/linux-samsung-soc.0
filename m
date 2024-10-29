Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAE6187FE0
	for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Oct 2024 10:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730196324; cv=none; b=IIqfiubPUGa2nKZnBmlV8B/G+R6SOj6cCKmXiaKoaxgkDf7TelkL4vQBC2qOokdE7HWaGA9aqA2sG7wA+QBo0nooHzJ/R3qklJ+JdqR0bPnj17BcO69q9EZ0U/KwQXByjs0yQaKZ9VCVSEJxSYhiMbMcmU5B+Wjc22NWp89anFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730196324; c=relaxed/simple;
	bh=AfykAnYLZupGg1fLCVn8uYBy1t/aBOVuyKkPyLQTwRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZINy91ualHaqZg/WSEX17tMi9JvoPnhvpHjBi0x7wHKAuuDxilFy1sLiIm9I/JNjAAKK04lhQDflxsskMu6pXfiAj/ik1P+E8eneggZYHKo1x3T8IEziRGT9JWk5NY3Ery9LMNkTS0xLhbeUQc8rwvZxkmh01SwfwaMIioZEATs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K2SEk6mL; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K2SEk6mL"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539fbbadf83so6740058e87.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Oct 2024 03:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730196320; x=1730801120; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U4RV5zlTOUYZMKhmx1UYpbwnBm/HWX3vXyjwC0A2b/s=;
        b=K2SEk6mLQhmuMGkCEAP/7maZCivDCatMZZU0ZxYlsyNSCCxV0fLDCKM+gL8MAINSJ2
         966UBH/rygUX2pZm0WbB3mljpKcDeRCdmZw4LlSZEntx22jwxiGaUu2+npdSWrjr5O0M
         w7aB/2sw6qdLeI3tUcSjT9pVsah0SfZgpiW4vYMjER0M+6uM6ehds7TRlKSiE6A7uu6T
         +wgKZrlpDVgxRESgyv97l2sbU0mGz5/5nxaAowfDcUV3NMcKpbRf0N5iwNknbvACHYl6
         UHzmgKN9P6l1t1QRjnMJ68S+hAlJbjmdMdmMYtmZUhWF9Ci8VJWcR9ZXK+INm6ZKxyrK
         Aa9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730196320; x=1730801120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U4RV5zlTOUYZMKhmx1UYpbwnBm/HWX3vXyjwC0A2b/s=;
        b=C5vP5XJhx3cajDD+fqHM06Szwxf3BE9TuUBC5zsmrgmS9DWx3wVLrgCXVD4Yz94PXz
         Bgs98i6P64RMocDqLOnFC/2BOeCAaIBjcIN08FDUcl1zDGaEoXL4iJLrXdAtEBesdP96
         fSi+3kE1P+hxtFS5nHFIkVLm+VaL790E2FzXtNIPVd/pk692rbO2LLPL8Qy5QstWIePy
         4wHgdvT9T+rBlDarfu9RSSxGmPMxHsO8T/qqOIbo6ZBrmNpD5CBDgL4Tn0Pw9KapnNN1
         Psl5reEvcckVezd5F5Ch/7aEdRJSJ4oZvGwZgL+V+HTpHXYLIh4G+fjuawqK5Arruw7Z
         svIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhT0OgQmZk7nVckkfo9Go2MzOuEpXcN8PP2umz2hK/KrnLRZY0N4fhcRqrjkN114yCXWTAxvOAmmjLBAERDW+RcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhZvZXQlu5GyeqnzmwGLvaQmsDTpdPE1vY2WHxzUhVgW6ZGotO
	btPKmh+AlXTQv+f4LPNNfdE53u7tUQHATsTZn2ADeFB5YhBmbe1WHSgg5LQjnhlx/1OzXEkR9B7
	tqOKl/w40iqhNnVIQJpcMimGQx9qz89D47OUaHA==
X-Google-Smtp-Source: AGHT+IHRjlZ5hUDjfU+PhK/6e3oqa7R+fo3XhjKnYIjv7VyxU8Q5LEQEqbHbzMAmS4KxgFa0+3jWkOmL3SAGQgEfxvY=
X-Received: by 2002:a05:6512:3c98:b0:536:54e9:3a63 with SMTP id
 2adb3069b0e04-53b34a19727mr5084956e87.49.1730196320370; Tue, 29 Oct 2024
 03:05:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241029074901.18977-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20241029074901.18977-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Oct 2024 11:05:07 +0100
Message-ID: <CACRpkdZCeQFzqbSN_=jX-_406OyxOoLb3b0R5NX3SjacE5JZSQ@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: samsung: drivers for v6.13
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 29, 2024 at 8:49=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758e=
dc:
>
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tag=
s/samsung-pinctrl-6.13
>
> for you to fetch changes up to 6d2dbd4cec8939ad2b813b8052eb12406db528d7:
>
>   pinctrl: samsung: Add Exynos9810 SoC specific data (2024-10-27 21:02:08=
 +0100)

Pulled into the pinctrl tree for v6.13.

Thanks for sorting out the Exynos drivers, excellent work as always Krzyszt=
of!

Yours,
Linus Walleij
