From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 3/6] ARM: SAMSUNG: pm: Adjust for pinctrl- and DT-enabled platforms
Date: Tue, 11 Jun 2013 01:21:59 -0700
Message-ID: <CAOesGMgjnt+T1OEFy15J0-zkHwHyeo3XLyzTGqmozq-t0nm=GQ@mail.gmail.com>
References: <1368807872-2601-1-git-send-email-t.figa@samsung.com>
	<1368807872-2601-4-git-send-email-t.figa@samsung.com>
	<62314159.5vrvK4k2Mm@amdc1227>
	<CACRpkdYA72YsASjPKPK6+N=okprRyQ5W6N-wUtgZ9c6uWq1a3Q@mail.gmail.com>
	<20130611074552.GK6688@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f46.google.com ([209.85.216.46]:53679 "EHLO
	mail-qa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751464Ab3FKIWA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Jun 2013 04:22:00 -0400
Received: by mail-qa0-f46.google.com with SMTP id ih17so2791746qab.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jun 2013 01:21:59 -0700 (PDT)
In-Reply-To: <20130611074552.GK6688@quad.lixom.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tomasz Figa <t.figa@samsung.com>, "arm@kernel.org" <arm@kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, Doug Anderson <dianders@chromium.org>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Prathyush K <prathyush.k@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

On Tue, Jun 11, 2013 at 12:45 AM, Olof Johansson <olof@lixom.net> wrote:
> On Mon, Jun 10, 2013 at 06:13:10PM +0200, Linus Walleij wrote:
>> On Mon, Jun 10, 2013 at 4:45 PM, Tomasz Figa <t.figa@samsung.com> wrote:
>> > On Friday 17 of May 2013 18:24:29 Tomasz Figa wrote:
>> >> This patch makes legacy code on suspend/resume path being executed
>> >> conditionally, on non-DT platforms only, to fix suspend/resume of
>> >> DT-enabled systems, for which the code is inappropriate.
>> >>
>> >> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
>> >> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> >> ---
>> >>  arch/arm/plat-samsung/pm.c | 17 ++++++++++++-----
>> >>  1 file changed, 12 insertions(+), 5 deletions(-)
>> >
>> > It seems like this patch did not make it into 3.10-rc5, while rest of patches
>> > did, which ended up with suspend/resume still being broken.
>> >
>> > What should we do in this case?
>>
>> I did not apply this patch to the pinctrl tree because it begins
>> with ARM: but it appears I promised to carry it anyway...
>>
>> I need an ACK from the ARM SoC people to do that though,
>> or you can take it through ARM SoC fixes directly.
>>
>> I would just ask Olof/Arnd to apply it directly as a separate
>> patch.
>
> It makes sense to take this through arm-soc since it's no longer
> dependent on anything else.
>
> Applied to fixes. Please do follow through with the promised cleanups at some
> point, Tomasz. :-)


Btw, I had to add an include of <linux/of.h> or else all non-DT builds broke...


-Olof
