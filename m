From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 5/6] Samsung PM updates for v3.15
Date: Mon, 10 Mar 2014 19:52:01 -0700
Message-ID: <CAOesGMiYJa7uM21ot_h6mGRTQX+HLcOsmTjk78WS0KZD6=piyw@mail.gmail.com>
References: <8259832.260591393840570438.JavaMail.weblogic@epml16>
	<20140309183523.GD22881@quad.lixom.net>
	<531CFA28.9020600@gmail.com>
	<CAOesGMiqhVk6JYhx=4446E1ZFWy7CrQNsjp8U6jf_De8FzidFw@mail.gmail.com>
	<01d001cf3ccc$39f339b0$add9ad10$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f49.google.com ([209.85.216.49]:50340 "EHLO
	mail-qa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752801AbaCKCwC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Mar 2014 22:52:02 -0400
Received: by mail-qa0-f49.google.com with SMTP id j7so430057qaq.36
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Mar 2014 19:52:01 -0700 (PDT)
In-Reply-To: <01d001cf3ccc$39f339b0$add9ad10$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>, "arm@kernel.org" <arm@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Mon, Mar 10, 2014 at 6:50 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Olof Johansson wrote:
>>
>> >> Hi,
>> >>
>> >> I don't see a single cc or acked-by line from Mike Turquette here. I'll
>> >> hold
>> >> off until he's had a chance to take a look at these ones; I suspect
>> >> they'll be
>> >> fine since it's mostly code refactoring though.
>> >
>> >
>> > I guess I should have ACKed them too, but it felt kind of strange to ACK
>> my
>> > own patches. ;)
>> >
>> > Anyway, for all samsung-clk patches:
>> >
>> > Acked-by: Tomasz Figa <t.figa@samsung.com>
>>
>> Yeah, self-acking doesn't make much sense. :)
>>
>> I'm mostly worried about patches touching other subsystems without the
>> other maintainer being aware of it or having reviewed them. As I said,
>> these mostly look like refactorings but it's still good habit.
>>
> OK, agreed, I think Mike knew about that though. Let's wait for Mike's
> response.
>
> BTW, should I sort out the branch again if Mike gives ack on that?

If I hear from Mike that he's OK with it then I can merge it, no need to rebase.


-Olof
