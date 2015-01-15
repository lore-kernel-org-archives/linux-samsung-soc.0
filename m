From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH v2 0/6] Enable HDMI support on Exynos platforms
Date: Thu, 15 Jan 2015 19:41:56 +0900
Message-ID: <54B79974.5000005@samsung.com>
References: <1421141991-15155-1-git-send-email-m.szyprowski@samsung.com>
 <54B68A74.8070405@math.uni-bielefeld.de> <54B79123.4090200@samsung.com>
 <54B79202.80209@math.uni-bielefeld.de> <54B795D0.9070708@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:26045 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751385AbbAOKll (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Jan 2015 05:41:41 -0500
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NI700GWYSDFF8D0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 15 Jan 2015 19:41:39 +0900 (KST)
In-reply-to: <54B795D0.9070708@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, =?UTF-8?B?IifrjIDsnbjquLAvTW9iaWxlIFMvVyBQbGF0Zm9ybSBMYWIuKO2GteyLoOyXsCk=?= =?UTF-8?B?L0UzKOyCrOybkCkv7IK87ISx7KCE7J6QJyI=?= <inki.dae@samsung.com>

+Cc Inki Dae.

Hi,

On 01/15/2015 07:26 PM, Marek Szyprowski wrote:
> Hello,
> 
> On 2015-01-15 11:10, Tobias Jakobi wrote:
>> Marek Szyprowski wrote: This is on a ODROID-X2.
>>> The issues with FIMC / DRM FIMC are not related to HDMI patches. They will
>>> be handled separately. For the time being simply please disable Exynos IPP
>>> (or Exynos DRM FIMC) feature in your kernel configuration.
>>>
>>> I hope that HDMI display works fine for you.
>> OK, I'll check without FIMC again later this day, but what about the
>> warning (?) from the mixer:
>> exynos-mixer 12c10000.mixer: Unbalanced pm_runtime_enable!
>>
>> Should this go away as well, when I disable the FIMC?
> 
> Well, I also got this warning. It looks that pm_runtime in Exynos DRM got changed
> recently and the bug is somewhere there. We will also check this issue.
> 

I posted a patch to fix it already.

http://www.spinics.net/lists/dri-devel/msg75039.html

Thanks.
