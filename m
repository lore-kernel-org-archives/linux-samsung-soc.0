Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EC53ACEE2
	for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Aug 2026 21:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786052089; cv=none; b=ErmNz0yQMHcccznCyZFqtEYe34UFdXdMuvFDE4hnlBllalwX+xpLg89hWiG9sYJ+re18szXqsSVvdk3oaaIY4spENu45Vte0lxv92xQE2I1GC1Rkz8uyMyRsnfu8jGSIda21pdmKRnZo5+Xc0/nYR0jwcdF9m8neaEk+igFlHlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786052089; c=relaxed/simple;
	bh=pog4xoUC7Tc3PkeqFvTAXaZ6ibInE/ovsISPzhII0xA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ym1fXipI72oPwywqMzWXcWU4yTHmYxdk4hBtuuEPYRszUqefM1Zh0UaQaJFzdXOpw7+n8e2KpRq/D1/kjilg4pHRo7WtXmWLF0OedpgrPa9bg3mlp91ciqXsBfe18Po1dCxFsTC+5K+ISj1zyeDWNmnvp8mXqqCLmDgS88mPvD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iJTzlJhb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iJTzlJhb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 142441F000E9
	for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Aug 2026 21:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786052088;
	bh=Yd3/JGFOLcwsntjnEW68DdLA+DfDMzDlmqW2hw1f6Ps=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iJTzlJhbojz3frHzPcS3w4gCJFD9Op/dChir1U2xKyB4YudPzCIa9X8cxbOl6UE+J
	 HBk3fJ2UkPyuemlV/x218xtO+jzTz/SJ2m3hObzNdVX0X9bahpjHRCW3Qmre96o8Vm
	 SSFWmH6ErcuI5rTSDdO5OGP8GNbW3c8i5Jjj2N5DDpCZv8CwcwCbubkXKC0vAq/2Lm
	 Scrym3qRkzk9nGeV3pnyP3G5F0VdZ1DvMX9hA4z1ECMn/jCftUaV61h3zip4sG20If
	 yNUbF46BG2xbnNVdlE1S7Yh3d3Ed2ewr9oi1+ouJ9UZwKUlGDMgTVIZN33yQRYzzE0
	 6ENgX6g8++bzA==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b2a3166398so2641119e87.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Aug 2026 14:34:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpQUZJLuJ3zdDdKbG2gIQ1gdxTsS05gk3wjWEiEGg8HAekXoDDMZqykpehFEDP5GEmcy1ohR/Z8Vv+gtsyb0goYLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRat2MQYbK7J1IGL4wubKfei6tWh8mpMWA2Wf4RUI2uLlXvOdg
	7NZIlB36iSqFBL5lLpmo001RPYhJFhuCKRunMd65zl9Ei1YLkBo1Eulj9dXZPrw7dujoV08Y8fD
	3oQC6RFIN9FRcK7ntd4XM8jXuKJHW3vs=
X-Received: by 2002:a05:6512:3e17:b0:5ae:c454:3746 with SMTP id
 2adb3069b0e04-5b303b7e6abmr655632e87.43.1786052086882; Thu, 06 Aug 2026
 14:34:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806083728.351824-2-krzk@kernel.org>
In-Reply-To: <20260806083728.351824-2-krzk@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 6 Aug 2026 23:34:34 +0200
X-Gmail-Original-Message-ID: <CAD++jLmY=zd9ro5OzD5HK_GBxEBRbJu73dO9ZZ796R2xpL81zA@mail.gmail.com>
X-Gm-Features: AUfX_mzPSVfj4FuEYELOQ9M6R4lntnhq47DsZWQZZdv6ADv_yISTJYNWs_ln1h4
Message-ID: <CAD++jLmY=zd9ro5OzD5HK_GBxEBRbJu73dO9ZZ796R2xpL81zA@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: samsung: for v7.3 (second try)
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 6, 2026 at 10:37=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:


> Second try - in the previous I had still the old email:
> https://lore.kernel.org/all/20260806082831.350285-2-krzk@kernel.org/
> Same contents.
>
> Best regards,
> Krzysztof
>
>
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e524917774=
82:
>
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

Pulled in, thanks!

Yours,
Linus Walleij
