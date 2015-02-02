From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH 3/6] drm/exynos: Remove exynos_plane_dpms() call with no
 effect
Date: Mon, 02 Feb 2015 13:32:22 +0900
Message-ID: <54CEFDD6.9010801@samsung.com>
References: <1422016980-23806-1-git-send-email-gustavo@padovan.org>
 <1422016980-23806-3-git-send-email-gustavo@padovan.org>
 <54CAE878.7030805@samsung.com> <20150130143625.GC30820@joana>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:20865 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754756AbbBBEcT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 1 Feb 2015 23:32:19 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NJ4008WSN9T1AD0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 02 Feb 2015 13:32:18 +0900 (KST)
In-reply-to: <20150130143625.GC30820@joana>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, dri-devel@lists.freedesktop.org, =?UTF-8?B?IifrjIDsnbjquLAvTW9iaWxlIFMvVw==?= =?UTF-8?B?IFBsYXRmb3JtIExhYi4o7Ya17Iug7JewKS9FMyjsgqzsm5ApL+yCvOyEseyghOyekA==?= =?UTF-8?B?JyI=?= <inki.dae@samsung.com>

On 01/30/2015 11:36 PM, Gustavo Padovan wrote:
> 2015-01-30 Joonyoung Shim <jy0922.shim@samsung.com>:
> 
>> +Cc Inki,
>>
>> Hi,
>>
>> On 01/23/2015 09:42 PM, Gustavo Padovan wrote:
>>> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
>>>
>>> exynos_plane_dpms(DRM_MODE_DPMS_ON) calls the win_enable()'s callback
>>> from the underlying layer. However neither one of these layers implement
>>> win_enable() - FIMD, Mixer and VIDI. Thus the call to exynos_plane_dpms()
>>> is pointless.
>>>

Yes, this can be useful in api aspect later.

>>
>> No, it needs for pair with DRM_MODE_DPMS_OFF case.
> 
> It is a stub call. exynos_plane_dpms(DRM_MODE_DPMS_ON) only calls
> exynos_crtc->ops->win_enable() however neither FIMD, VIDI or Mixer implements
> win_enable(). So it has no effect and we can remove this call safely.
> 

No, we can stop to set duplication by enabled flag of struct
exynos_drm_plane, that's why keep fair. Currently the plane is not
disabled actually when disable the plane after setplane without below
link patch.

http://www.spinics.net/lists/dri-devel/msg76143.html

Thanks.
