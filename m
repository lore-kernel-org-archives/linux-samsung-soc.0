From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 2/6] ARM: EXYNOS: Staticize exynos_subsys
Date: Tue, 15 Apr 2014 14:36:15 +0530
Message-ID: <CAK9yfHxwTo1WPPS7asJOMAVSK5=3ufFrLuB9mYyT8t-CgMxGWg@mail.gmail.com>
References: <1397118296-6846-1-git-send-email-sachin.kamat@linaro.org>
	<1397118296-6846-3-git-send-email-sachin.kamat@linaro.org>
	<534661C7.9090304@samsung.com>
	<CAK9yfHwAM0d5JsrhKGP0gkrjQLxGFE0+oEjv26N5jsFnvYku9A@mail.gmail.com>
	<53468F44.3050109@samsung.com>
	<CAK9yfHw9fga+1kOo5tpW37wskZEQarrABiyZD+SBzBwk1h6DbQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:41247 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750898AbaDOJGP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Apr 2014 05:06:15 -0400
Received: by mail-oa0-f53.google.com with SMTP id j17so10409512oag.40
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Apr 2014 02:06:15 -0700 (PDT)
In-Reply-To: <CAK9yfHw9fga+1kOo5tpW37wskZEQarrABiyZD+SBzBwk1h6DbQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, Kukjin Kim <kgene.kim@samsung.com>

Hi Tomasz,

On 10 April 2014 18:05, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> On 10 April 2014 18:02, Tomasz Figa <t.figa@samsung.com> wrote:
>> On 10.04.2014 11:22, Sachin Kamat wrote:
>>>
>>> Hi Tomasz,
>>>
>>> On 10 April 2014 14:47, Tomasz Figa <t.figa@samsung.com> wrote:
<snip>
>> Hmm, I don't see why it could break anything as I can't find any users of
>> it. Anyway I just tested removing this code on Exynos4412-trats2 board and
>> didn't find any problems.
>
> Thanks for testing. Let me check at my end on other boards and if it
> doesn't cause
> any problem, will remove this.

Tested after removing this code on various boards and there doesn't
seem to be any
problems. Will re-send with this change.

-- 
With warm regards,
Sachin
