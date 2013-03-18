From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] ARM: SAMSUNG: Set clock parent if provided
Date: Mon, 18 Mar 2013 10:31:33 +0100
Message-ID: <5146DEF5.1070608@samsung.com>
References: <1362634301-9706-1-git-send-email-shaik.ameer@samsung.com>
 <5138B3BA.9040303@samsung.com>
 <CAOD6ATqK5crLc2nzz1rf856Lw48j2hOw_YRpjS4y8g7OzaLgSQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:64801 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752796Ab3CRJbh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Mar 2013 05:31:37 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MJU001KMNL0HA90@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 18 Mar 2013 09:31:36 +0000 (GMT)
Received: from [106.116.147.32] by eusync4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MJU00KVYNSNL990@eusync4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 18 Mar 2013 09:31:36 +0000 (GMT)
In-reply-to: <CAOD6ATqK5crLc2nzz1rf856Lw48j2hOw_YRpjS4y8g7OzaLgSQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Shaik Ameer Basha <shaik.samsung@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

Hi Shaik,

On 03/15/2013 10:00 AM, Shaik Ameer Basha wrote:
> On Thu, Mar 7, 2013 at 9:05 PM, Sylwester Nawrocki
> <s.nawrocki@samsung.com> wrote:
...
>> May I ask what do you need this for ? This code won't be used for
>> Exynos4 and Exynos5 SoCs starting from 3.10. And it is going to be
>> removed once other platforms are converted to the new Samsung clocks
>> driver.
> 
> I had some issues in exynos5 with out this implementation.
> But yes... you are right, once we move to common clock framework (CCF)
> we don't require this change, as CCF doesn't use this (for exynos 4/5).
> 
> What about all old non-dt based platforms?
> Cant they use this change until they move to DT and CCF?

I have nothing against the patch, I was just curious if you need
it for the new SOCs where the new clocks driver is supposed to be used.
Of course other Samsung platforms could switch to CCF before having
support for the device tree.

Regards,
Sylwester
