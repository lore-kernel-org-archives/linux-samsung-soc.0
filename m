From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2 0/6] Enable HDMI support on Exynos platforms
Date: Thu, 15 Jan 2015 11:26:24 +0100
Message-ID: <54B795D0.9070708@samsung.com>
References: <1421141991-15155-1-git-send-email-m.szyprowski@samsung.com>
 <54B68A74.8070405@math.uni-bielefeld.de> <54B79123.4090200@samsung.com>
 <54B79202.80209@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:52454 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751392AbbAOK02 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Jan 2015 05:26:28 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NI700INGRUXIB90@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 15 Jan 2015 10:30:33 +0000 (GMT)
In-reply-to: <54B79202.80209@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>

Hello,

On 2015-01-15 11:10, Tobias Jakobi wrote:
> Marek Szyprowski wrote: This is on a ODROID-X2.
>> The issues with FIMC / DRM FIMC are not related to HDMI patches. They will
>> be handled separately. For the time being simply please disable Exynos IPP
>> (or Exynos DRM FIMC) feature in your kernel configuration.
>>
>> I hope that HDMI display works fine for you.
> OK, I'll check without FIMC again later this day, but what about the
> warning (?) from the mixer:
> exynos-mixer 12c10000.mixer: Unbalanced pm_runtime_enable!
>
> Should this go away as well, when I disable the FIMC?

Well, I also got this warning. It looks that pm_runtime in Exynos DRM 
got changed
recently and the bug is somewhere there. We will also check this issue.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
