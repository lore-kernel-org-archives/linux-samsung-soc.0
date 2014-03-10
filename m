From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 5/6] Samsung PM updates for v3.15
Date: Sun, 9 Mar 2014 17:08:28 -0700
Message-ID: <CAOesGMiqhVk6JYhx=4446E1ZFWy7CrQNsjp8U6jf_De8FzidFw@mail.gmail.com>
References: <8259832.260591393840570438.JavaMail.weblogic@epml16>
	<20140309183523.GD22881@quad.lixom.net>
	<531CFA28.9020600@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f180.google.com ([209.85.216.180]:51298 "EHLO
	mail-qc0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751846AbaCJAI3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 9 Mar 2014 20:08:29 -0400
Received: by mail-qc0-f180.google.com with SMTP id x3so6918674qcv.25
        for <linux-samsung-soc@vger.kernel.org>; Sun, 09 Mar 2014 17:08:28 -0700 (PDT)
In-Reply-To: <531CFA28.9020600@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>, "arm@kernel.org" <arm@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>, "khilman@linaro.org" <khilman@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Sun, Mar 9, 2014 at 4:32 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> On 09.03.2014 19:35, Olof Johansson wrote:
>>
>> On Mon, Mar 03, 2014 at 09:56:11AM +0000, Kukjin Kim wrote:
>>>
>>> The following changes since commit
>>> 38dbfb59d1175ef458d006556061adeaa8751b72:
>>>
>>>    Linus 3.14-rc1 (2014-02-02 16:42:13 -0800)
>>>
>>> are available in the git repository at:
>>>
>>>    http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
>>> tags/samsung-pm-1
>>>
>>> for you to fetch changes up to e11d919e4aa2009077e3e4f829ff991d37adca61:
>>>
>>>    ARM: EXYNOS: Drop legacy Exynos4 clock suspend/resume code (2014-02-14
>>> 08:16:01 +0900)
>>
>>
>> Hi,
>>
>> I don't see a single cc or acked-by line from Mike Turquette here. I'll
>> hold
>> off until he's had a chance to take a look at these ones; I suspect
>> they'll be
>> fine since it's mostly code refactoring though.
>
>
> I guess I should have ACKed them too, but it felt kind of strange to ACK my
> own patches. ;)
>
> Anyway, for all samsung-clk patches:
>
> Acked-by: Tomasz Figa <t.figa@samsung.com>

Yeah, self-acking doesn't make much sense. :)

I'm mostly worried about patches touching other subsystems without the
other maintainer being aware of it or having reviewed them. As I said,
these mostly look like refactorings but it's still good habit.


-Olof
