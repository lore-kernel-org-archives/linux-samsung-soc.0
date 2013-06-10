From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/6] ARM: SAMSUNG: pm: Adjust for pinctrl- and DT-enabled platforms
Date: Mon, 10 Jun 2013 18:13:10 +0200
Message-ID: <CACRpkdYA72YsASjPKPK6+N=okprRyQ5W6N-wUtgZ9c6uWq1a3Q@mail.gmail.com>
References: <1368807872-2601-1-git-send-email-t.figa@samsung.com>
	<1368807872-2601-4-git-send-email-t.figa@samsung.com>
	<62314159.5vrvK4k2Mm@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f44.google.com ([209.85.219.44]:37285 "EHLO
	mail-oa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750769Ab3FJQNL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Jun 2013 12:13:11 -0400
Received: by mail-oa0-f44.google.com with SMTP id l10so483798oag.31
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Jun 2013 09:13:10 -0700 (PDT)
In-Reply-To: <62314159.5vrvK4k2Mm@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>, "arm@kernel.org" <arm@kernel.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Prathyush K <prathyush.k@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

On Mon, Jun 10, 2013 at 4:45 PM, Tomasz Figa <t.figa@samsung.com> wrote:
> On Friday 17 of May 2013 18:24:29 Tomasz Figa wrote:
>> This patch makes legacy code on suspend/resume path being executed
>> conditionally, on non-DT platforms only, to fix suspend/resume of
>> DT-enabled systems, for which the code is inappropriate.
>>
>> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>>  arch/arm/plat-samsung/pm.c | 17 ++++++++++++-----
>>  1 file changed, 12 insertions(+), 5 deletions(-)
>
> It seems like this patch did not make it into 3.10-rc5, while rest of patches
> did, which ended up with suspend/resume still being broken.
>
> What should we do in this case?

I did not apply this patch to the pinctrl tree because it begins
with ARM: but it appears I promised to carry it anyway...

I need an ACK from the ARM SoC people to do that though,
or you can take it through ARM SoC fixes directly.

I would just ask Olof/Arnd to apply it directly as a separate
patch.

Yours,
Linus Walleij
