From: Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: Re: linux-next: origen build failed at drivers/pinctrl/pinctrl-exynos.c
Date: Wed, 19 Jun 2013 11:57:15 +0530
Message-ID: <CA+G9fYtZX2Bad+Wfds1jnvGX+7yW2zvaVJ5UiuDqzOWQE7W__Q@mail.gmail.com>
References: <CA+G9fYu3_-RZxFyRENuqJvzsM=YToT7PG+5fUytMzhsFu3=z7g@mail.gmail.com>
	<CAOesGMhL7P350yPkxEKAZ+FS9X6QMFL+4gv5dCRBCW8rwQBB0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:42376 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751089Ab3FSG1Q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Jun 2013 02:27:16 -0400
Received: by mail-oa0-f53.google.com with SMTP id k14so6008364oag.40
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2013 23:27:15 -0700 (PDT)
In-Reply-To: <CAOesGMhL7P350yPkxEKAZ+FS9X6QMFL+4gv5dCRBCW8rwQBB0g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Tomasz Figa <t.figa@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd.bergmann@linaro.org>, Doug Anderson <dianders@chromium.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Milosz Wasilewski <milosz.wasilewski@linaro.org>

Hi Olof,

I will give you Kernel head commit ID of linux-next.
Thanks for the feedback.

Best regards
Naresh Kamboju

On 18 June 2013 22:33, Olof Johansson <olof@lixom.net> wrote:
> Hi,
>
>
> On Tue, Jun 18, 2013 at 9:19 AM, Naresh Kamboju
> <naresh.kamboju@linaro.org> wrote:
>> Hi,
>>
>> linux-next branch failed to build origen build
>>
>> defconfig: exynos_defconfig
>
> This was broken yesterday and fixed today. Getting linux-next build
> error reports that are 24+ hours old isn't very useful, unfortunately.
>
> It'd also be convenient if you supplied the "git describe" version
> number of the source tree in these reports, so it'd be trivial to find
> out by glancing at the report, instead of going to the build log.
>
> (Besides that, thanks for the bug report!)
>
>
> -Olof
