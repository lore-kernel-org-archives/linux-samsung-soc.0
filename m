From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 1/2] drivers: amba: properly handle devices with power
 domains
Date: Thu, 26 Nov 2015 09:39:03 +0100
Message-ID: <5656C527.8040804@samsung.com>
References: <1448456127-31842-1-git-send-email-m.szyprowski@samsung.com>
 <1448456289-31960-1-git-send-email-m.szyprowski@samsung.com>
 <20151125132458.GL8644@n2100.arm.linux.org.uk> <5655B8F6.1070104@samsung.com>
 <CAPDyKFqTqPijF+Lbq0+a-Gv8CyaAr13JvZPjUN1-GNL5i3-mAw@mail.gmail.com>
 <20151125180953.GN8644@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:38885 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753098AbbKZIjH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Nov 2015 03:39:07 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NYE008YNYP4FN30@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 26 Nov 2015 08:39:04 +0000 (GMT)
In-reply-to: <20151125180953.GN8644@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hello,

On 2015-11-25 19:09, Russell King - ARM Linux wrote:
> On Wed, Nov 25, 2015 at 02:56:10PM +0100, Ulf Hansson wrote:
>> On 25 November 2015 at 14:34, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>>> Is ignoring dev_pm_domain_attach() return value a solution for you?
>> That's probably better than nothing, but I wonder if it in practice
>> will have any effect?
> If the PM domain is down, then trying to tread the ID is likely to oops
> the kernel.

In my case kernel simply hangs (no single message, even when earlyprintk 
is enabled)
instead of oopsing, that's why I've submitted this patch.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
