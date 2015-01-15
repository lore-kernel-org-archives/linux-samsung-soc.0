From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: power: reset: add driver for Hardkernel's Odroid boards
Date: Thu, 15 Jan 2015 07:46:50 +0100
Message-ID: <54B7625A.50400@samsung.com>
References: <54B6886D.4070105@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:38786 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751079AbbAOGqy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Jan 2015 01:46:54 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NI700BTGHOVK420@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 15 Jan 2015 06:50:55 +0000 (GMT)
In-reply-to: <54B6886D.4070105@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Hello,

On 2015-01-14 16:17, Tobias Jakobi wrote:
> Hello,
>
> I've applied the two patches of this set onto torvalds/master (together
> with some other patches), but I now encounter an 'internal error' when
> doing a system reboot.
>
> Here's the corresponding part of the kernel log:
> http://www.math.uni-bielefeld.de/~tjakobi/archive/odroid_power_reset.txt

Right. This patch was posted some time ago and reboot handling on ARM SoCs
have been changed recently in v3.19-rc1. I will post an updated version of
this patch soon.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
