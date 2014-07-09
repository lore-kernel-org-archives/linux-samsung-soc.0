From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 6/6] pinctrl: samsung: Allow pin value to be initialized
 using pinfunc
Date: Wed, 09 Jul 2014 10:07:22 +0200
Message-ID: <53BCF83A.5000403@gmail.com>
References: <1404315664-3174-1-git-send-email-t.figa@samsung.com>	<1404315664-3174-7-git-send-email-t.figa@samsung.com> <CACRpkdbZXNCHWOK0J2BCKoZN723FwosZQEa2wQHW4KpqX9EvrQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f177.google.com ([74.125.82.177]:45302 "EHLO
	mail-we0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751114AbaGIIHp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Jul 2014 04:07:45 -0400
Received: by mail-we0-f177.google.com with SMTP id u56so7023187wes.22
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Jul 2014 01:07:44 -0700 (PDT)
In-Reply-To: <CACRpkdbZXNCHWOK0J2BCKoZN723FwosZQEa2wQHW4KpqX9EvrQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>



On 09.07.2014 09:35, Linus Walleij wrote:
> On Wed, Jul 2, 2014 at 5:41 PM, Tomasz Figa <t.figa@samsung.com> wrote:
> 
>> This patch extends the range of settings configurable via pinfunc API
>> to cover pin value as well. This allows configuration of default values
>> of pins, which is useful for pins that are not supposed to be used by
>> any dedicated driver, but need certain board-specific setting.
>>
>> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
>> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> 
> Patch applied.

Thanks!

> It always makes me a little bit sad that we didn't get
> generic pin config in place before this driver but now we have to live
> with it.

That's true. :(

Best regards,
Tomasz
