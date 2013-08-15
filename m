From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/4] ARM: S3C24XX: number the dma clocks
Date: Thu, 15 Aug 2013 22:04:14 +0200
Message-ID: <CACRpkdboWnsRRUEEufQY_=x3bWKyZLoWP5G_YvEhtTtZs6BTuw@mail.gmail.com>
References: <201308141359.13872.heiko@sntech.de>
	<201308141359.54473.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:64375 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758889Ab3HOUEO convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Aug 2013 16:04:14 -0400
Received: by mail-ob0-f180.google.com with SMTP id up14so1277367obb.39
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Aug 2013 13:04:14 -0700 (PDT)
In-Reply-To: <201308141359.54473.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Dan Williams <djbw@fb.com>, Vinod Koul <vinod.koul@intel.com>, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On Wed, Aug 14, 2013 at 1:59 PM, Heiko St=FCbner <heiko@sntech.de> wrot=
e:

> Each dma channel has its own clock. The upcoming dma driver wants to
> handle these itself and therefore needs to be able to get the correct
> clock for a channel.
>
> Therefore rename the dma clocks to "dma.X" for s3c2412, s3c2416 and
> s3c2443. This does not change the behaviour for the old dma driver at
> all, as all dma clocks are still always on and not handled by the old
> dma driver at all.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> are always enabled in the original code.
> ---

There is some noise at the end of your commit message.

Yours,
Linus Walleij
