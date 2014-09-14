From: Thomas Abraham <ta.omasab@gmail.com>
Subject: Re: [PATCH 00/14] Support 64bit Cortex A57 based Exynos7 SoC
Date: Sun, 14 Sep 2014 19:15:14 +0530
Message-ID: <CAJuA9ahjdZw23CyEJBO8wwypR0QCf=4+QXB1LXUSzc5rRoDe_w@mail.gmail.com>
References: <1409132660-1898-1-git-send-email-ch.naveen@samsung.com>
	<53FDC25A.2010806@samsung.com>
	<54142324.600@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f42.google.com ([209.85.215.42]:59653 "EHLO
	mail-la0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752441AbaINNpQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 14 Sep 2014 09:45:16 -0400
In-Reply-To: <54142324.600@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, catalin.marinas@arm.com, naveenkrishna.ch@gmail.com, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, cpgs@samsung.com

Hi Tomasz,

On Sat, Sep 13, 2014 at 4:27 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> On 27.08.2014 13:34, Tomasz Figa wrote:
>> Hi Naveen,
>>
>> On 27.08.2014 11:44, Naveen Krishna Chatradhi wrote:
>>> This patchset supports new Exynos7 Samsung SoC based on Cortex-A57.
>>> Exynos7 is a System-On-Chip (SoC) that is based on 64-bit
>>> ARMv8 RISC processor.
>>
>> A general issue with this series is that it introduces a very generic
>> name for a very specific single SoC. We remember exactly the same cases
>> for Exynos4 (original name used for Exynos5250) and Exynos5 (Exynos5250)
>> and we should have learned that it is better to use a specific name
>> first and only then try to make things common if it turns out to be
>> appropriate.
>
> Any comments on this?

The name of the SoC is Exynos7 and so all these patches are using
Exynos7 in dt compatible string and file names. If there are any
variants of Exynos7 SoC in future, support those variants will be
based on what is already merged for Exynos7 SoC. There is no specific
generalization targeted in this series by using Exynos7 name.

Thanks,
Thomas.

> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
