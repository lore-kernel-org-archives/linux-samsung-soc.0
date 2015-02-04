From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH 6/6] drm/exynos: do not copy adjusted mode into mode during
 crtc mode_set
Date: Wed, 04 Feb 2015 11:10:14 +0900
Message-ID: <54D17F86.7020902@samsung.com>
References: <1422016980-23806-1-git-send-email-gustavo@padovan.org>
 <1422016980-23806-6-git-send-email-gustavo@padovan.org>
 <54CB0E40.1020400@samsung.com> <20150130144420.GE30820@joana>
 <54CF035F.2050502@samsung.com> <20150203141618.GB2122@joana>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:56513 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753261AbbBDCKJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Feb 2015 21:10:09 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NJ8009XM60VBD60@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 04 Feb 2015 11:10:07 +0900 (KST)
In-reply-to: <20150203141618.GB2122@joana>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, inki.dae@samsung.com, Daniel Kurtz <djkurtz@chromium.org>

Hi,

On 02/03/2015 11:16 PM, Gustavo Padovan wrote:
> 2015-02-02 Joonyoung Shim <jy0922.shim@samsung.com>:
> 
>> Hi,
>>
>> On 01/30/2015 11:44 PM, Gustavo Padovan wrote:
>>> Hi Joonyoung,
>>>
>>> 2015-01-30 Joonyoung Shim <jy0922.shim@samsung.com>:
>>>
>>>> Hi,
>>>>
>>>> On 01/23/2015 09:43 PM, Gustavo Padovan wrote:
>>>>> From: Daniel Kurtz <djkurtz@chromium.org>
>>>>>
>>>>> The 'mode' is the modeline information which specifies the ideal mode
>>>>> requested by the mode set initiator (usually userspace).
>>>>> The 'adjusted_mode' is the actual hardware mode after all the crtcs
>>>>> and encoders have had a chance to "fix it up".
>>>>>
>>>>> The adjusted_mode starts as a duplicate of the mode in
>>>>> drm_crtc_helper_set_mode(), and gets modified as required.  There is no
>>>>> reason to touch the original requested mode.
>>>>>
>>>>
>>>> Agree, but is there any side effect after this commit? Should we save
>>>> adjusted_mode to other variable and use it?
>>>
>>> I haven't seen any. Tested on peach pi and snow. Do we have any reason to save
>>> it now? I don't we have a user for it now.
>>>
>>
>> Because current codes use values of adjusted_mode in exynos drm hw drivers.
> 
> I fail to see where this happen. adjusted_mode is passed to to the mode_set()
> callback and drivers can use it from there as the hdmi one does for example.
> 

Currently adjusted_mode is copied to &crtc->mode, so after if to use
&crtc->mode is same with to use adjusted_mode.

Thanks.
