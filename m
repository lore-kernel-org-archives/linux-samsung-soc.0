From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [GIT PULL 5/6] Samsung PM updates for v3.15
Date: Mon, 17 Mar 2014 19:09:54 +0100
Message-ID: <53273A72.2080402@samsung.com>
References: <8259832.260591393840570438.JavaMail.weblogic@epml16>
 <20140309183523.GD22881@quad.lixom.net> <531CFA28.9020600@gmail.com>
 <CAOesGMiqhVk6JYhx=4446E1ZFWy7CrQNsjp8U6jf_De8FzidFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:62755 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755535AbaCQSKA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Mar 2014 14:10:00 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N2L00GY1EGL6500@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Mar 2014 18:09:57 +0000 (GMT)
In-reply-to: <CAOesGMiqhVk6JYhx=4446E1ZFWy7CrQNsjp8U6jf_De8FzidFw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: Olof Johansson <olof@lixom.net>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "arm@kernel.org" <arm@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>, "khilman@linaro.org" <khilman@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hi Mike,

On 10.03.2014 01:08, Olof Johansson wrote:
> On Sun, Mar 9, 2014 at 4:32 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
>> On 09.03.2014 19:35, Olof Johansson wrote:
>>>
>>> On Mon, Mar 03, 2014 at 09:56:11AM +0000, Kukjin Kim wrote:
>>>>
>>>> The following changes since commit
>>>> 38dbfb59d1175ef458d006556061adeaa8751b72:
>>>>
>>>>     Linus 3.14-rc1 (2014-02-02 16:42:13 -0800)
>>>>
>>>> are available in the git repository at:
>>>>
>>>>     http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
>>>> tags/samsung-pm-1
>>>>
>>>> for you to fetch changes up to e11d919e4aa2009077e3e4f829ff991d37adca61:
>>>>
>>>>     ARM: EXYNOS: Drop legacy Exynos4 clock suspend/resume code (2014-02-14
>>>> 08:16:01 +0900)
>>>
>>>
>>> Hi,
>>>
>>> I don't see a single cc or acked-by line from Mike Turquette here. I'll
>>> hold
>>> off until he's had a chance to take a look at these ones; I suspect
>>> they'll be
>>> fine since it's mostly code refactoring though.
>>
>>
>> I guess I should have ACKed them too, but it felt kind of strange to ACK my
>> own patches. ;)
>>
>> Anyway, for all samsung-clk patches:
>>
>> Acked-by: Tomasz Figa <t.figa@samsung.com>
>
> Yeah, self-acking doesn't make much sense. :)
>
> I'm mostly worried about patches touching other subsystems without the
> other maintainer being aware of it or having reviewed them. As I said,
> these mostly look like refactorings but it's still good habit.

May we get your ACK for this? I hope it's not too late already to have 
them merged for 3.15.

Best regards,
Tomasz
