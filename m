From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] ARM: S3C24XX: handle s3c2412 eints using new infrastructure
Date: Fri, 15 Feb 2013 15:48:52 +0100
Message-ID: <CACRpkdZ5dxyXhrNUJDEzPoDOGRn_50ZuaHW4ZpguSyApQvh7hw@mail.gmail.com>
References: <201302120102.03511.heiko@sntech.de>
	<201302120105.45608.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ia0-f174.google.com ([209.85.210.174]:40974 "EHLO
	mail-ia0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933067Ab3BOOsx convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 Feb 2013 09:48:53 -0500
Received: by mail-ia0-f174.google.com with SMTP id o25so3344531iad.33
        for <linux-samsung-soc@vger.kernel.org>; Fri, 15 Feb 2013 06:48:52 -0800 (PST)
In-Reply-To: <201302120105.45608.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Thomas Abraham <thomas.abraham@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Grant Likely <grant.likely@secretlab.ca>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Tue, Feb 12, 2013 at 1:05 AM, Heiko St=FCbner <heiko@sntech.de> wrot=
e:

> The s3c2412 handles the eints 0 to 3 different than all the other SoC=
s
> of the 24xx range. These eints must be acked and masked in the regula=
r
> bits as well as the bits 0 to 3 of the eint registers, which are unus=
ed
> on the other SoCs.
>
> This of course can be realized using the new infrastructure with the
> eint bits in the main register being the parent interrupts of the
> same bits in the eint register.
>
> The s3c2412 therefore gets its own IRQ_EINT0 to 4 constants that
> reside in the newly created gap before IRQ_EINT4. gpio-samsung, as th=
e
> only user of these is modified to return the correct values when
> handling gpio_to_irq requests on s3c2412 based machines.
>
> Due to lack of hardware this is compile tested only, but should
> hopefully work as intended.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

We definately need an ACK from some Samsung maintainer for
this patch...

Yours,
Linus Walleij
