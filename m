From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH v2 12/23] drm/exynos: don't track enabled state at
 exynos_crtc
Date: Fri, 10 Jul 2015 09:47:37 +0900
Message-ID: <559F1629.2060300@samsung.com>
References: <1436192424-18194-1-git-send-email-gustavo@padovan.org>
 <1436192424-18194-13-git-send-email-gustavo@padovan.org>
 <20150706174147.GB7568@phenom.ffwll.local> <559E2C4C.9030603@samsung.com>
 <20150709225600.GA2000@joana>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:53586 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751390AbbGJArb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Jul 2015 20:47:31 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NR8020LDY765G80@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Jul 2015 09:47:30 +0900 (KST)
In-reply-to: <20150709225600.GA2000@joana>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>, Daniel Vetter <daniel@ffwll.ch>, linux-samsung-soc@vger.kernel.org, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>

On 07/10/2015 07:56 AM, Gustavo Padovan wrote:
> 2015-07-09 Joonyoung Shim <jy0922.shim@samsung.com>:
> 
>> +Cc Andrzej,
>>
>> On 07/07/2015 02:41 AM, Daniel Vetter wrote:
>>> On Mon, Jul 06, 2015 at 11:20:13AM -0300, Gustavo Padovan wrote:
>>>> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
>>>>
>>>> struct drm_crtc already stores the enabled state of the crtc
>>>> thus we don't need to replicate enabled in exynos_drm_crtc.
>>>>
>>
>> I think exynos_crtc->enabled can replace flags for power state of each
>> hw driver(e.g. "powered" of mixer driver, "suspended" of fimd driver).
>> Further, we can add other flag bit for instead of using special flag
>> in hw driver like vsync state("int_en" of mixer driver, "irq_flags" of
>> fimd driver.)
> 
> The reason I removed it is because crtc->state->active already stores
> the same information as exynos_crtc->enabled. I think we could rely
> on active as well for mixer powered and suspended.
> 

Then it may need another stuff on struct exynos_crtc if we try to
replace other hw flag like int_en or irq_flags.

Anyway, the reason that you remove it is ok to me now.

Thanks.
