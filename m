From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] spi: s3c64xx: let device core setup the default pin configuration
Date: Mon, 15 Apr 2013 10:23:17 -0700
Message-ID: <CAD=FV=V99ucNRuZ3iAb7Eh5XTmWNRVOXqP8af_a6ii98hoV76Q@mail.gmail.com>
References: <1362570130-14084-1-git-send-email-thomas.abraham@linaro.org>
	<CAD=FV=W++WXLOazKR=f6PHdzr=AVOwyT2i=swNtw6yMOJhJgmA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f44.google.com ([209.85.215.44]:34312 "EHLO
	mail-la0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754495Ab3DORXT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Apr 2013 13:23:19 -0400
Received: by mail-la0-f44.google.com with SMTP id fr10so4612398lab.17
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Apr 2013 10:23:17 -0700 (PDT)
In-Reply-To: <CAD=FV=W++WXLOazKR=f6PHdzr=AVOwyT2i=swNtw6yMOJhJgmA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: spi-devel-general@lists.sourceforge.net, Kukjin Kim <kgene.kim@samsung.com>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Patch Tracking <patches@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@secretlab.ca>, Jaswinder Singh <jaswinder.singh@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Thomas Abraham <thomas.abraham@linaro.org>

Mark,

On Mon, Mar 11, 2013 at 10:36 AM, Doug Anderson <dianders@chromium.org> wrote:
> Thomas,
>
> On Wed, Mar 6, 2013 at 3:42 AM, Thomas Abraham
> <thomas.abraham@linaro.org> wrote:
>> With device core now able to setup the default pin configuration,
>> the pin configuration code based on the deprecated Samsung specific
>> gpio bindings is removed.
>>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> ---
>>  .../devicetree/bindings/spi/spi-samsung.txt        |    8 +--
>>  drivers/spi/spi-s3c64xx.c                          |   66 +------------------
>>  2 files changed, 6 insertions(+), 68 deletions(-)

Is this something you would pick up?  It looks like you weren't copied
on the original email thread, unfortunately.

Without this (or some equivalent) patch we can't use the SPI driver on
any SoCs that have switched over to the proper pinmux support.

Thanks!

-Doug
