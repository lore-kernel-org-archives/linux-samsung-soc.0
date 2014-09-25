From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] ARM: dts: Specify default clocks for Exynos4 FIMC devices
Date: Thu, 25 Sep 2014 20:17:46 +0200
Message-ID: <54245C4A.8050902@samsung.com>
References: <1410367054-30926-1-git-send-email-s.nawrocki@samsung.com>
 <CAD8Lp44n3xArQ-xvZsFdYn13x80Dqv1oCY=dLm1UPxKr8XbyJQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:42800 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753094AbaIYSSC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Sep 2014 14:18:02 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NCG0082FYYOSA10@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 25 Sep 2014 19:20:48 +0100 (BST)
In-reply-to: <CAD8Lp44n3xArQ-xvZsFdYn13x80Dqv1oCY=dLm1UPxKr8XbyJQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Drake <drake@endlessm.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>

On 19/09/14 01:53, Daniel Drake wrote:
> On Wed, Sep 10, 2014 at 10:37 AM, Sylwester Nawrocki
> <s.nawrocki@samsung.com> wrote:
>> The default mux and divider clocks are specified in device tree
>> so that the FIMC devices in Exynos4210 and Exynos4x12 SoCs are
>> clocked from recommended clock source and with maximum supported
>> frequency. If needed these settings could be overrode in board
>> specific dts files, however they are in practice optimal in most
>> cases.
> 
> Another consideration for this patch.
> 
> fimc-core.c already has probe-time code that tries to set the clock
> frequency, using a clock-frequency property in the DT, and falling
> back to a hardcoded value in the driver. Maybe it is best to just set
> the clock rate from one place.

Indeed, thanks for pointing this out. I will submit a patch to remove
the fallback in fimc-core.c. So the driver doesn't touch both: clock
rate and parent setting if 'clock-rates' property is specified in DT.
I think clock-frequency property in the FIMC DT binding should be
deprecated. So the initial parent clock and frequency settings are
handled similarly for all relevant IP blocks, and there is no need
to code such things in each individual driver.

--
Thanks,
Sylwester
