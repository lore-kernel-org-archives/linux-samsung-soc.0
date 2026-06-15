Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220733BCD10
	for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Jun 2026 07:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781508101; cv=none; b=guvsOpFKcoRfuU5aXOBTgTC59WAxIbQXiSWeaL4S6ZNA8yF/umL9t8Lqow5AUAcoDawdGfkZ3HEj5EmC/Cxa2hyKux3uLQ01K2lWvESsWoo5hEMmTyVyMfnUUr/0b6QkINxBuOae3j3MGkJyFWnLTv041+Z5CJ/c9BVHa7PAUlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781508101; c=relaxed/simple;
	bh=wFk3WSarX0Njnh7YRTSK1ZdWCnt/6yjij1YP/Df67/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ln8zmRZt9foULXTPwt+MHlhFisJV3cr08/rH/V+PbaHM9OCC/aReo6+kq1E0rjeIoEz0kPXpPn2U0scYp6qkD3fbPIBBRp9LgbvYFbPJfRbIe4/NoNRHWe77Rppql75psVNdGy3zcn0sSyJBZKzEiOo4sAamGqh66p4PPJtP0q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HO1wvBOC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HO1wvBOC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C69161F00A3E
	for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Jun 2026 07:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781508098;
	bh=08JCdW+/vtLD0uTGxd5LViEw6cH0BUoM8kUufyIZZMY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HO1wvBOCocjwYu0PIRWFQI5h3b7dd1A+xB+FxAzHQDOnaPtOPvUoL8zepNE5261x0
	 FFheIScAVyNDLyLLmhW+kXodhjR6VL6PvgDtTeKh58mRsU7jYrkqG0e2+Li6hr3lH9
	 xXBMiX4QD6K3+jwCN5m37SdJUcp7FvzHQsqQi8WiHtYsObH7ZGg/j3b7pXqgHGU/5b
	 JGmsxTTs7ayByexDPcTu/W9mljAXJcYCPRl6y0Gb2i3pyU6h43mmAChlEihEpwh+3V
	 jibRpN63Pg3AelPC4opvITs/OOLdgHJmB50QorIffZu9Cpsxn6OAy7BBJK986hejKc
	 DW+vS8mwP0+Xg==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aa7a70c0aaso2655731e87.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Jun 2026 00:21:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8d/K884/ZbHPoJ5w1FeDxrVhhpUi9m5+Nk+XZueDAIJbLlwcLvAnGFmC6ukp7lEK6RVE1WVNBtGa0kYyjzWxvcRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOuxYxLSeyJX+fgX53t0hExb06n+ZGXHdUFOhNb4fp0+b3BahY
	OqzqiYGJ08ukVOSpfMsTBw0BLy6gSXrqHj+grBQVSDxDpFrIoiZYboiGF1wRMSvGdwG9Ob6XAS9
	MSer057FuwD6WXxglAEqgCYRER9Ql46U=
X-Received: by 2002:a05:6512:203:b0:5aa:7374:1365 with SMTP id
 2adb3069b0e04-5ad2db6ed6dmr2405039e87.32.1781508097589; Mon, 15 Jun 2026
 00:21:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260612161148epcas5p33904df90bd840d20a6db05622aaa28b8@epcas5p3.samsung.com>
 <20260612163020.411761-1-alim.akhtar@samsung.com> <20260612163020.411761-6-alim.akhtar@samsung.com>
In-Reply-To: <20260612163020.411761-6-alim.akhtar@samsung.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 15 Jun 2026 09:21:25 +0200
X-Gmail-Original-Message-ID: <CAD++jL=mQUJCqVyqK746UdkZCsO+2oeO1MCQM4F-_pSOfpuQuA@mail.gmail.com>
X-Gm-Features: AVVi8Ce39W7wwxGNC9dJL1kDKsgpGECByaIRuL2i0ERLKK_9NmouzTKtM6dIZLk
Message-ID: <CAD++jL=mQUJCqVyqK746UdkZCsO+2oeO1MCQM4F-_pSOfpuQuA@mail.gmail.com>
Subject: Re: [PATCH 5/5] MAINTAINERS: Add entry for Samsung Exynos8855 SoC
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: krzk@kernel.org, peter.griffin@linaro.org, robh@kernel.org, 
	conor+dt@kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, hajun.sung@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alim,

On Fri, Jun 12, 2026 at 6:11=E2=80=AFPM Alim Akhtar <alim.akhtar@samsung.co=
m> wrote:

> Add maintainers entry for the Samsung Exynos8855 SoC based platforms
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
(...)
> +SAMSUNG EXYNOS8855 SoC SUPPORT
> +M:     Alim Akhtar <alim.akhtar@samsung.com>
> +L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribe=
rs)
> +L:     linux-samsung-soc@vger.kernel.org
> +S:     Maintained
> +F:     arch/arm64/boot/dts/exynos/exynos8855*

If you really want to single out a single platform like this (and I don't e=
ven
know if that is a good idea... how do you keep the big picture in mind?)
you should probably want to also add a wildcard for all the
8855 device tree files.

Yours,
Linus Walleij
