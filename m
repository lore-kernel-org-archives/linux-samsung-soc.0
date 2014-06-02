From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] drm/exynos: remove hardware overlays disable from fimd
 probe
Date: Mon, 02 Jun 2014 12:11:44 +0200
Message-ID: <538C4DE0.50801@gmail.com>
References: <1401257471-31994-1-git-send-email-rahul.sharma@samsung.com> <538C3FC4.6090509@samsung.com> <CAPdUM4POJwfe_RyKV+ym=ENgVF+2To0qgS88UGp1ueBD3LH4ig@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f173.google.com ([74.125.82.173]:58535 "EHLO
	mail-we0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752959AbaFBKL7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Jun 2014 06:11:59 -0400
Received: by mail-we0-f173.google.com with SMTP id u57so4870697wes.18
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Jun 2014 03:11:58 -0700 (PDT)
In-Reply-To: <CAPdUM4POJwfe_RyKV+ym=ENgVF+2To0qgS88UGp1ueBD3LH4ig@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "Szyprowski, Marek" <m.szyprowski@samsung.com>

Hi Rahul, Andrzej,

On 02.06.2014 11:42, Rahul Sharma wrote:
> On 2 June 2014 14:41, Andrzej Hajda <a.hajda@samsung.com> wrote:
>> Hi Rahul,
>>
>> On 05/28/2014 08:11 AM, Rahul Sharma wrote:
>>> System hangs when FIMD registers are accessed to disable
>>> hardware overlays. This is because of the clocks which are
>>> not enabled before register access.
>>>
>>> 'Hardware overlay disable' is cleaned from the FIMD probe.
>>>
>>> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
>>
>> This patch causes regression on some exynos4210-universal_c210 devices,
>> everything works expect colors are incorrect - it seems blue component
>> is very dark, almost black.
>>
> 
> Oh.... Sorry for that. I did not see any problem on 5250/5420/5800. I do not
> have setup for 4210. Better we should revert this patch.
> 
> Would you please help me by verifying the following patch on 4210? This
> is an alternate solution to the same problem.
> 
> http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg31426.html
> 
> Thanks Andrej, for bringing it to notice.

I don't see how this patch could introduce such regression, as all the
affected registers seem to be properly reconfigured in fimd_win_commit()
anyway.

IMHO instead of reverting the patch, this issue should be investigated
and fixed properly.

Best regards,
Tomasz
