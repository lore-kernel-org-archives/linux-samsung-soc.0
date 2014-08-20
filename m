From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2 0/4] Add Exynos4412 based Odroid X2 and U2/U3/U3+ support
Date: Wed, 20 Aug 2014 08:29:42 +0200
Message-ID: <53F44056.5030601@samsung.com>
References: <1403702773-9141-1-git-send-email-m.szyprowski@samsung.com>
 <53B0F6D1.4090006@samsung.com> <53C93FEB.2030507@samsung.com>
 <CAOesGMh-XRpX_U9s-BVE=BuOG-1EMDL+B_Dm1hdm+tcPQA9E-g@mail.gmail.com>
 <CAD8Lp46pY9_+N6M17i4xv71BR_poT2Pfh4cmM0J2jxP96m9sVA@mail.gmail.com>
 <CAOesGMiSTBt8f4WURFjqpxTZGzy7ZSWw_3RTNdBZ6KD_vei2GA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:44675 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750789AbaHTG3q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Aug 2014 02:29:46 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NAL007J4E6A9250@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 20 Aug 2014 07:32:34 +0100 (BST)
In-reply-to: <CAOesGMiSTBt8f4WURFjqpxTZGzy7ZSWw_3RTNdBZ6KD_vei2GA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Daniel Drake <drake@endlessm.com>
Cc: Przemyslaw Marczak <p.marczak@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Kamil Debski <k.debski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tobias Jakobi <Liquid.Acid@gmx.net>

Hello,

On 2014-08-19 22:26, Olof Johansson wrote:
> On Tue, Aug 19, 2014 at 12:54 PM, Daniel Drake <drake@endlessm.com> wrote:
>> On Tue, Aug 19, 2014 at 8:40 PM, Olof Johansson <olof@lixom.net> wrote:
>>> ODROID-U3 has been broken in mainline for quite a while. Have patches
>>> been posted for this already?
>>>
>>> http://arm-soc.lixom.net/bootlogs/mainline/v3.17-rc1/odroidu3-arm-exynos_defconfig.html
>>>   for one of the latest boots that failed.
>> Yes, discussed in the thread titled "[PATCH 1/2] ARM: dts: Enable PMIC
>> interrupts on ODROID"
>> Those patches weren't important for boot at the time of submission,
>> but it looks like something else changed (the max77686 driver?) that
>> makes them now required.
> Excellent, thanks. A bummer we didn't see this earlier, but let's get
> the fix in asap.

I've also posted a fix to MAX77686 driver, which restores v3.16-like 
behavior
of PMIC driver. I hope it will get merged to one of v3.17 rc series.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
