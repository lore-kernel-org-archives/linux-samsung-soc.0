From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH 0/7] drm/exynos/hdmi: refactoring/cleanup patches
Date: Mon, 13 Jul 2015 20:20:29 +0200
Message-ID: <55A4016D.2000204@math.uni-bielefeld.de>
References: <1436452092-20757-1-git-send-email-a.hajda@samsung.com> <55A2907E.9000507@math.uni-bielefeld.de> <55A361BF.8030904@samsung.com> <55A37F0C.7030907@math.uni-bielefeld.de> <55A385DA.8040805@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:50035 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751671AbbGMSUc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Jul 2015 14:20:32 -0400
In-Reply-To: <55A385DA.8040805@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org

Hello!


Andrzej Hajda wrote:
> On 07/13/2015 11:04 AM, Tobias Jakobi wrote:
>> Hello,
>>
>> Andrzej Hajda wrote:
>>> Hi Tobias,
>>>
>>> On 07/12/2015 06:06 PM, Tobias Jakobi wrote:
>>>> Hello Andrzej!
>>>>
>>>> Just some small comments.
>>>>
>>>> It seems like linux-samsung-soc wasn't put into Cc for '[PATCH RESEND
>>>> 0/6] drm/exynos: HDMI related fixes' (even though this series was),
>>>> maybe you should also forward the other series to this list.
>>> Yes, I forgot about it.
>>>
>>>> This series doesn't apply cleanly when 'drm/exynos: HDMI related fixes'
>>>> is applied. E.g. the 'powered' boolean was removed by that series, but
>>>> here in patch 2/7 ('drm/exynos/hdmi: Simplify HPD gpio handling') it's
>>>> still there.
>>> 'drm/exynos: HDMI related fixes' removes powered field from
>>> mixer driver, and powered field in the patch 2/7 is from hdmi driver.
>>> So they should not interfere and for sure they do not interfere in my local git :)
>>> Have you any warning when you tried to apply those patches.
>> yes of course, otherwise I wouldn't point this out. The specific hunks
>> just fail.
>>
>> Which is kinda obvious:
>>> @@ -186,7 +186,6 @@  struct hdmi_context {
>>>  	struct drm_device		*drm_dev;
>>>  	struct drm_connector		connector;
>>>  	struct drm_encoder		*encoder;
>>> -	bool				hpd;
>>>  	bool				powered;
>>>  	bool				dvi_mode;
>>>  	struct mutex			hdmi_mutex;
>> This doesn't apply when 'powered' is no longer ther.
> 
> I have this field still present in my tree which is build of following components:
> - current exynos-drm-next,
> - drm/exynos: HDMI related fixes,
> - this patchset
> 
> Could you show me exactly which patch removes this field?
> 
> As I mentioned one patch removes similar field from mixer driver, but not from hdmi.
You're right, looks like I'm mixing up fields from mixer and hdmi. Hmm,
now I'm confused -- I did have some problems applying the patches, but
with this now ruled out I can't really recall anything else that may
have caused this.

Guess I have to repeat the steps. So until further notice, just
disregard everything I said! *g*


With best wishes,
Tobias




> 
> Regards
> Andrzej
> 
> 
>>
>>
>>
>> With best wishes,
>> Tobias
>>
>>>> I also noticed that some of the patches ('drm/exynos/hdmi: remove
>>>> private lock code') clash with Gustavo's latest cleanup series [1]. E.g.
>>>> your patch 3/7 ('drm/exynos/hdmi: remove private lock code') touches
>>>> hdmi_commit() which was removed by Gustavo. Maybe you should coordinate
>>>> things with him?
>>> This is always problematic :) I can try to rebase my patches on Gustavo's
>>> if necessary. Gustavo, Inki what is your opinion?
>>>
>>> Regards
>>> Andrzej
>>>
>>>>
>>>> With best wishes,
>>>> Tobias
>>>>
>>>>
>>>> [1] http://www.spinics.net/lists/linux-samsung-soc/msg45787.html
>>>>
>>>>
>>>> Andrzej Hajda wrote:
>>>>> Hi Inki, Joonyoung,
>>>>>
>>>>> These patches removes obsolete and old structures, to simplify further
>>>>> development. They should not change behavior of the driver.
>>>>>
>>>>> The patchset is based on exynos-drm-next plus my HDMI related fixes [1].
>>>>>
>>>>> The patchset was tested on Universal and Odroid U3.
>>>>>
>>>>> [1]: http://permalink.gmane.org/gmane.comp.video.dri.devel/132348
>>>>>
>>>>> Regards
>>>>> Andrzej
>>>>>
>>>>>
>>>>> Andrzej Hajda (7):
>>>>>   drm/exynos/hdmi: remove old platform data code
>>>>>   drm/exynos/hdmi: Simplify HPD gpio handling
>>>>>   drm/exynos/hdmi: remove private lock code
>>>>>   drm/exynos/hdmi: add driver data pointer to private context
>>>>>   drm/exynos/hdmi: remove redundant configuration fields
>>>>>   drm/exynos/hdmi: remove hdmi_v13_conf struct
>>>>>   drm/exynos/hdmi: remove hdmi_v14_conf struct
>>>>>
>>>>>  drivers/gpu/drm/exynos/exynos_hdmi.c | 860 ++++++++++-------------------------
>>>>>  1 file changed, 245 insertions(+), 615 deletions(-)
>>>>>
>>
> 
