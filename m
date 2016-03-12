From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 1/5] hwrng: exynos - Hide PM functions with __maybe_unused
Date: Sat, 12 Mar 2016 13:55:20 +0900
Message-ID: <CAJKOXPd00gaPwAmXL7+_nX16QD-K9zoHcf0Y3oGx6UEh0USXOQ@mail.gmail.com>
References: <1457682562-21219-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f195.google.com ([209.85.214.195]:35304 "EHLO
	mail-ob0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750926AbcCLEzV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Mar 2016 23:55:21 -0500
In-Reply-To: <1457682562-21219-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, Kukjin Kim <kgene@kernel.org>, linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>

2016-03-11 16:49 GMT+09:00 Krzysztof Kozlowski <k.kozlowski@samsung.com=
>:
> Replace ifdef with __maybe_unused to silence compiler warning on when
> SUSPEND=3Dn and PM=3Dy:
>
> drivers/char/hw_random/exynos-rng.c:166:12: warning: =E2=80=98exynos_=
rng_suspend=E2=80=99 defined but not used [-Wunused-function]
>  static int exynos_rng_suspend(struct device *dev)
>             ^
> drivers/char/hw_random/exynos-rng.c:171:12: warning: =E2=80=98exynos_=
rng_resume=E2=80=99 defined but not used [-Wunused-function]
>  static int exynos_rng_resume(struct device *dev)
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  drivers/char/hw_random/exynos-rng.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>

Patch can be dropped, Arnd sent the same some days before.

Best regards,
Krzysztof
