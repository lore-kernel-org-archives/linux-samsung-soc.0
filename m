From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: Arndale boot broken in -next
Date: Mon, 21 Oct 2013 16:09:17 +0530
Message-ID: <CAHbNUh0qRjwk3EfZM1dZxbF5NOQCVOfDST8tS+X1R0MjD3Feiw@mail.gmail.com>
References: <20131019163545.GB2443@sirena.org.uk>
	<CAHbNUh2WLphNT3JCVdDFd=6AjCvROh-wCtgJhWv-q5b7q17vZw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f50.google.com ([74.125.82.50]:58864 "EHLO
	mail-wg0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752933Ab3JUKjT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Oct 2013 06:39:19 -0400
Received: by mail-wg0-f50.google.com with SMTP id n12so6296583wgh.17
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Oct 2013 03:39:18 -0700 (PDT)
In-Reply-To: <CAHbNUh2WLphNT3JCVdDFd=6AjCvROh-wCtgJhWv-q5b7q17vZw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linaro-kernel@lists.linaro.org, Stephen Boyd <sboyd@codeaurora.org>

On 21 October 2013 15:50, Tushar Behera <tushar.behera@linaro.org> wrote:
> On 19 October 2013 22:05, Mark Brown <broonie@kernel.org> wrote:
>> Hi,
>>
>> I've not yet had a chance to bisect this but it appears that Arndale
>> boot has broken for me recently in -next; I'm getting absolutely no
>> serial output at all afther the bootloader hands off to Linux so no
>> useful diagnostics.  Is this a known issue?
>>
>
> On next-20131018, bisect points to following commit.
>
> commit 65cd4f6c99c1170bd0114dbd71b978012ea44d28
> Author: Stephen Boyd <sboyd@codeaurora.org>
> Date:   Thu Jul 18 16:21:18 2013 -0700
> Subject: arch_timer: Move to generic sched_clock framework
>
>

I had missed this e-mail thread till now, where the issue is being
already discussed. [1]

[1] http://www.spinics.net/lists/linux-arm-msm/msg07218.html

-- 
Tushar Behera
