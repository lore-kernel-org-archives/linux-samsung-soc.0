From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH 2/3] ARM: S5PV210: Add init code of audio to Goni and
 Aquila board
Date: Thu, 14 Oct 2010 10:13:23 +0900
Message-ID: <AANLkTimqBgUuVzhV84HKGUygNB2raebrgTrEeKnd3uQc@mail.gmail.com>
References: <4CA5623B.5030405@samsung.com>
	<003701cb6b37$4c106fb0$e4314f10$%kim@samsung.com>
	<AANLkTimwNprWtZiMnAt2-fYGwRySs-mbxxh-TYSqh=f6@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:40258 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751187Ab0JNBN1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Oct 2010 21:13:27 -0400
Received: by wyb28 with SMTP id 28so1652415wyb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Oct 2010 18:13:26 -0700 (PDT)
In-Reply-To: <AANLkTimwNprWtZiMnAt2-fYGwRySs-mbxxh-TYSqh=f6@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Joonyoung Shim <jy0922.shim@samsung.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Chanwoo Choi <cw00.choi@samsung.com>, Myungjoo Ham <myungjoo.ham@samsung.com>, Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Liam Girdwood <lrg@slimlogic.co.uk>

On Thu, Oct 14, 2010 at 10:07 AM, Jassi Brar <jassisinghbrar@gmail.com> wrote:
> On Thu, Oct 14, 2010 at 9:32 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
>> Chanwoo Choi wrote:
>>>
>>> This patch add initializtion code of audio and I2S platform drivers
>>> to Goni and Aquila board.
>
> GONI and AQUILA are mostly similar devices with different CPUs.
> I have already merged the ASoC machine drivers for them into one.
> Maybe you could compress code for other susystems as well ?
It's not exactly. GPIO pins are different.

Thank you,
Kyungmin Park
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
