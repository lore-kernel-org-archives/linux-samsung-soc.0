From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH] drm/exynos: remove hardware overlays disable from fimd
 probe
Date: Mon, 02 Jun 2014 12:42:38 +0200
Message-ID: <538C551E.30407@samsung.com>
References: <1401257471-31994-1-git-send-email-rahul.sharma@samsung.com>
 <538C3FC4.6090509@samsung.com>
 <CAPdUM4POJwfe_RyKV+ym=ENgVF+2To0qgS88UGp1ueBD3LH4ig@mail.gmail.com>
 <538C4DE0.50801@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:23655 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752784AbaFBKmn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Jun 2014 06:42:43 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N6J002PLF2RKRA0@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 02 Jun 2014 11:42:27 +0100 (BST)
In-reply-to: <538C4DE0.50801@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>, Rahul Sharma <rahul.sharma@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "Szyprowski, Marek" <m.szyprowski@samsung.com>

On 06/02/2014 12:11 PM, Tomasz Figa wrote:
> Hi Rahul, Andrzej,
> 
> On 02.06.2014 11:42, Rahul Sharma wrote:
>> On 2 June 2014 14:41, Andrzej Hajda <a.hajda@samsung.com> wrote:
>>> Hi Rahul,
>>>
>>> On 05/28/2014 08:11 AM, Rahul Sharma wrote:
>>>> System hangs when FIMD registers are accessed to disable
>>>> hardware overlays. This is because of the clocks which are
>>>> not enabled before register access.
>>>>
>>>> 'Hardware overlay disable' is cleaned from the FIMD probe.
>>>>
>>>> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
>>>
>>> This patch causes regression on some exynos4210-universal_c210 devices,
>>> everything works expect colors are incorrect - it seems blue component
>>> is very dark, almost black.
>>>
>>
>> Oh.... Sorry for that. I did not see any problem on 5250/5420/5800. I do not
>> have setup for 4210. Better we should revert this patch.
>>
>> Would you please help me by verifying the following patch on 4210? This
>> is an alternate solution to the same problem.
>>
>> http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg31426.html
>>
>> Thanks Andrej, for bringing it to notice.
> 
> I don't see how this patch could introduce such regression, as all the
> affected registers seem to be properly reconfigured in fimd_win_commit()
> anyway.
> 
> IMHO instead of reverting the patch, this issue should be investigated
> and fixed properly.
> 
> Best regards,
> Tomasz
> 

I am looking at the problem, it is quite strange as it happens only on
one of two targets I have access to. Anyway it seems that something
should be added to fimd initialization sequence if we want to remove hw
accessing code from probe.

Regards
Andrzej
