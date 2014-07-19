From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [GIT PULL] Samsung fixes-4 for v3.16
Date: Sat, 19 Jul 2014 09:43:32 +0900
Message-ID: <53C9BF34.2030903@samsung.com>
References: <53C9AF23.6030007@samsung.com> <CAOesGMgt50Ut8qv+ifDHoSQCBV4NNu-tx6B_t=T7D5SHVx0XMg@mail.gmail.com> <53C9B952.6010000@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f170.google.com ([209.85.192.170]:59397 "EHLO
	mail-pd0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751530AbaGSAnk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Jul 2014 20:43:40 -0400
Received: by mail-pd0-f170.google.com with SMTP id g10so5917152pdj.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Jul 2014 17:43:39 -0700 (PDT)
In-Reply-To: <53C9B952.6010000@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Olof Johansson <olof@lixom.net>, "arm@kernel.org" <arm@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>

On 07/19/14 09:18, Kukjin Kim wrote:
> On 07/19/14 09:12, Olof Johansson wrote:
>> On Fri, Jul 18, 2014 at 4:34 PM, Kukjin Kim<kgene.kim@samsung.com> wrote:
>>> Hi,
>>>
>>> This is a regression for v3.16 so please take this in -rc.
>>>
>>> Thanks,
>>> Kukjin
>>>
>>> The following changes since commit
>>> 1795cd9b3a91d4b5473c97f491d63892442212ab:
>>>
>>> Linux 3.16-rc5 (2014-07-13 14:04:33 -0700)
>>>
>>> are available in the git repository at:
>>>
>>> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
>>> tags/samsung-fixes-4
>>>
>>> for you to fetch changes up to 4e3a498d6fc438d8c203c51aadc6ca8fb47b0577:
>>>
>>> ARM: EXYNOS: Fix core ID used by platsmp and hotplug code (2014-07-16
>>> 02:59:18 +0900)
>>
>> This is based on a newer branch than our current fixes. So I've cherry
>> picked the patch instead of merged the branch -- if you have the
>> branch in linux-next you should remove it.
>>
> OK, I will.
>
BTW, other pm related branches in my tree have dependencies with the 
change so I just reverted that in my -next.

If any problems, please let me know.

Thanks,
Kukjin
