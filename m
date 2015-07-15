From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [RFC] ARM: EXYNOS: reset KFC cores when cpu is up
Date: Wed, 15 Jul 2015 12:42:30 +0900
Message-ID: <55A5D6A6.8080604@samsung.com>
References: <1436924213-29732-1-git-send-email-parkch98@gmail.com>
 <55A5BB5A.2040807@samsung.com>
 <CAPTzV16VFu_0BN1xpuki3gN3btB-zFwuj+A8ibza14JKqaXXfA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:43528 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750996AbbGODme (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Jul 2015 23:42:34 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NRI00BCOFMVAL50@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 15 Jul 2015 04:42:31 +0100 (BST)
In-reply-to: <CAPTzV16VFu_0BN1xpuki3gN3btB-zFwuj+A8ibza14JKqaXXfA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: chanho61.park@samsung.com
Cc: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Kevin Hilman <khilman@kernel.org>, Heesub Shin <heesub.shin@samsung.com>, Mauro Ribeiro <mauro.ribeiro@hardkernel.com>, Abhilash Kesavan <a.kesavan@samsung.com>, Przemyslaw Marczak <p.marczak@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

On 15.07.2015 11:31, Chanho Park wrote:
> Hi,
> 
> On Wed, Jul 15, 2015 at 10:46 AM, Krzysztof Kozlowski
> <k.kozlowski@samsung.com> wrote:
>> On 15.07.2015 10:36, Chanho Park wrote:
>>> The cpu booting of exynos5422 has been still broken since we discussed
>>> it in last year[1]. I found this resetting codes from odroid-xu3 kernel of
>>> hardkernel, it could help to boot 8 cores well. This patch need to have
>>> more test like STR and other SoC especially exynos5800 which is variant
>>> of exynos5422. If this patch is broken on exynos5800, I'll find another
>>> way to check exynos5422.
>>>
>>> This patch is top of my previous exynos5422 cpu ordering patch[2] and
>>> need to enable CONFIG_EXYNOS5420_MCPM=y
>>
>> 1. Why the ordering patch is required? It seems unrelated...
> 
> Because it related with my booting log :)
> 
>> 2. I tried this already (as in vendor sources from
>> opensource.samsung.com) and it did not help on my Odroid. Are you sure
>> that this patch solely fixes the problem?
> 
> If you turned on CONFIG_DEBUG_LL, you'll need Joonyoung's patch to
> correct uart address of exynos5422.
> http://www.spinics.net/lists/linux-samsung-soc/msg37318.html

I mean that you don't need anything else to fix the problem? I'll give
it a try later on my board but I was quite sure that I checked this
before :) .

Best regards,
Krzysztof
