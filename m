From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH RESEND] ARM: EXYNOS: no more support non-DT for EXYNOS SoCs
Date: Wed, 10 Apr 2013 15:46:21 +0200
Message-ID: <51656D2D.7060004@samsung.com>
References: <51642dab.e844440a.0ad1.ffffc13f@mx.google.com>
 <310101ce35d7$00e7e000$02b7a000$%kim@samsung.com>
 <516541EB.8080404@samsung.com> <201304101459.07263.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:64847 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752466Ab3DJNqY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Apr 2013 09:46:24 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0ML1007OTKV7GNA0@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 10 Apr 2013 14:46:22 +0100 (BST)
In-reply-to: <201304101459.07263.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Thomas Abraham' <thomas.ab@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Olof Johansson' <olof@lixom.net>

On 04/10/2013 02:59 PM, Arnd Bergmann wrote:
> On Wednesday 10 April 2013, Sylwester Nawrocki wrote:
>> On 04/10/2013 12:34 PM, Kukjin Kim wrote:
>>> Kukjin Kim wrote:
>>>>
>>>> From: Kukjin Kim <kgene.kim@samsung.com>
>>>>
>>>> As we discussed in mailing list, non-DT for EXYNOS SoCs will not be
>>>> supported from v3.10. This patch removes regarding files for non-DT
>>>> including board files.
>>>>
>>>> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
>>
>> It looks OK to me.
> 
> Ok. I am currently rebuilding my exynos multiplatform series on top of the
> branches merged yesterday, but keeping ATAGS support alive there.
> 
> Should I rebase on top of this patch instead?

Hmm, it turns out we are still actively using some boards based on
Exynos4210 EVT0 SoCs. And since it seems unlikely the patches from
Tomasz [1] adding basic DT support for those will get merged for
3.10, it would be a bit inconvenient to remove the ATAGS support
now, leaving Exynos4210 Rev. 0 not supported at all.

Not sure what's others opinion on that, and what would be an advantage
of removing non-dt support for Exynos now, rather than in 3.11, vs. any
possible inconvenience and regressions this could cause.

[1] http://www.spinics.net/lists/arm-kernel/msg235745.html

Thanks,
Sylwester
