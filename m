From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH] drm/exynos: fimd: Get signal polarities from device tree
Date: Thu, 06 Jun 2013 13:30:49 +0900
Message-ID: <51B01079.6060701@samsung.com>
References: <1367435169-15025-1-git-send-email-tomasz.figa@gmail.com>
 <20130501200025.GE5763@phenom.ffwll.local> <2077448.BOZFWf0KVq@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:49678 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751917Ab3FFEau (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Jun 2013 00:30:50 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MNY006OEF6X0EE0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Jun 2013 13:30:49 +0900 (KST)
In-reply-to: <2077448.BOZFWf0KVq@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, =?UTF-8?B?IifrjIDsnbjquLAvTW9iaWxlIFMvVw==?= =?UTF-8?B?IFBsYXRmb3JtIExhYi4o7Ya17Iug7JewKS9FMyjsgqzsm5ApL+yCvOyEseyghOyekA==?= =?UTF-8?B?JyI=?= <inki.dae@samsung.com>, Tomasz Figa <t.figa@samsung.com>

On 05/19/2013 08:32 PM, Tomasz Figa wrote:
> Hi,
>
> On Wednesday 01 of May 2013 22:00:25 Daniel Vetter wrote:
>> On Wed, May 01, 2013 at 09:06:09PM +0200, Tomasz Figa wrote:
>>> This patch modifies the driver to perform two stage parsing of video
>>> timings from device tree, to get timing information as struct
>>> videomode, which contains more data than struct fb_videomode.
>>>
>>> Thanks to this change, information about polarity of control signals
>>> (VSYNC, HSYNC, VDEN, VCLK) can be retrieved, in addition to standard
>>> video timings.
>>>
>>> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
>> Since the drm mode struct also contains flags for sync polarity ... why
>> is there no direct of -> drm_mode function? Going through an fb
>> videomode in a kms drm driver looks _really_ backwards to me.
>>
>> Cc'in Dave for the fun of it ;-)
> Struct fb_videomode is what exynos_drm_fimd driver uses internally. Sure
> it should use drm_mode, but this is not really related to this patch,
> because the code added in this patch only fills in the pdata struct, which
> for compatibility reasons (the same structure is used for both fbdev and
> drm drivers) contains struct fb_videomode.
>
> OK, now after having a bit of fun, could we merge this patch to at least
> have usable support of parallel displays using this driver?

I think it's better to use struct display_timings instead of struct
fb_videomode in exynos_drm.

Thanks.
