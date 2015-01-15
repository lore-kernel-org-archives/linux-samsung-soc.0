From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2 0/6] Enable HDMI support on Exynos platforms
Date: Thu, 15 Jan 2015 11:06:27 +0100
Message-ID: <54B79123.4090200@samsung.com>
References: <1421141991-15155-1-git-send-email-m.szyprowski@samsung.com>
 <54B68A74.8070405@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:47490 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751470AbbAOKGd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Jan 2015 05:06:33 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NI7004UVQXIOR70@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 15 Jan 2015 10:10:30 +0000 (GMT)
In-reply-to: <54B68A74.8070405@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>

Hello,

On 2015-01-14 16:25, Tobias Jakobi wrote:
> Hello,
>
> I've applied v6 of the HDMI patchset (together with the patches the set
> depends on) onto torvalds/master, but I'm seeing a lot of warnings
> (coming from __clk_{unprepare,disable}) that seem to originate from the
> fimc subsystem.
>
> Since the patchset also changes PM domain handling (which shows up in
> the log as well), I was wondering if this is related?
>
> Full boot log here:
> http://www.math.uni-bielefeld.de/~tjakobi/archive/clk_warnings.txt
>
> That's the tree I'm currently using:
> https://github.com/tobiasjakobi/linux-odroid/commits/odroid-3.19.y
> (maybe I'm missing something here?)
>
>
> With best wishes,
> Tobias
>
> PS: This is on a ODROID-X2.

The issues with FIMC / DRM FIMC are not related to HDMI patches. They will
be handled separately. For the time being simply please disable Exynos IPP
(or Exynos DRM FIMC) feature in your kernel configuration.

I hope that HDMI display works fine for you.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
