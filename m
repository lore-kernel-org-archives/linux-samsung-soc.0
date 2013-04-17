From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4] pinctrl: Add pinctrl-s3c24xx driver
Date: Wed, 17 Apr 2013 17:20:48 +0200
Message-ID: <CACRpkdYaKpDtWM5N1NNnWch5m+KYB-2HQgNNddTYiiF1pQ4S_A@mail.gmail.com>
References: <201304140138.40142.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f179.google.com ([209.85.223.179]:42845 "EHLO
	mail-ie0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752415Ab3DQPUt convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Apr 2013 11:20:49 -0400
Received: by mail-ie0-f179.google.com with SMTP id 16so2014172iea.38
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Apr 2013 08:20:49 -0700 (PDT)
In-Reply-To: <201304140138.40142.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>

On Sun, Apr 14, 2013 at 1:38 AM, Heiko St=FCbner <heiko@sntech.de> wrot=
e:

> The s3c24xx pins follow a similar pattern as the other Samsung SoCs a=
nd
> can therefore reuse the already introduced infrastructure.
>
> The s3c24xx SoCs have one design oddity in that the first 4 external
> interrupts do not reside in the eint pending register but in the main
> interrupt controller instead. We solve this by forwarding the externa=
l
> interrupt from the main controller into the irq domain of the pin ban=
k.
> The masking/acking of these interrupts is handled in the same way.
>
> Furthermore the S3C2412/2413 SoCs contain another oddity in that they
> keep the same 4 eints in the main interrupt controller and eintpend
> register and requiring ack operations to happen in both. This is solv=
ed
> by using different compatible properties for the wakeup eint node whi=
ch
> set a property accordingly.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

Looking good, Acked-by: Linus Walleij <linus.walleij@linaro.org>

I prefer this:

#include <linux/bitops.h>

int foo =3D BIT(7);

over

int foo =3D (1 << 7);

But no big deal.

Are you taking this through the Samsung tree?

Yours,
Linus Walleij
