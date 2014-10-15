From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos: fix vblank handling during dpms off
Date: Wed, 15 Oct 2014 14:32:38 +0900
Message-ID: <543E06F6.7020606@samsung.com>
References: <542B9A0E.7020206@samsung.com>
 <1412151287-12845-1-git-send-email-a.hajda@samsung.com>
 <542D13CC.5000304@samsung.com> <542D2E7C.1020904@samsung.com>
 <5437D39A.60603@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:50425 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751039AbaJOFcl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Oct 2014 01:32:41 -0400
In-reply-to: <5437D39A.60603@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene.kim@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On 2014=EB=85=84 10=EC=9B=94 10=EC=9D=BC 21:39, Andrzej Hajda wrote:
> On 10/02/2014 12:52 PM, Inki Dae wrote:
>> On 2014=EB=85=84 10=EC=9B=94 02=EC=9D=BC 17:58, Joonyoung Shim wrote=
:
>>> Hi Andrzej,
>>>
>>> On 10/01/2014 05:14 PM, Andrzej Hajda wrote:
>>>> The patch disables vblanks during dpms off only if pagefilp has
>>>> not been finished. It also replaces drm_vblank_off with drm_crtc_v=
blank_put.
>>>> It fixes issue with page_flip ioctl not being able to acquire vbla=
nk counter.
>>> This problem isn't related with pageflip, it just causes from
>>> 7ffd7a68511c710b84db3548a1997fd2625f580a commit (drm: Always reject
>>> drm_vblank_get() after drm_vblank_off()).
>>>
>>> We need to use drm_vblank_on() as a counterpart to drm_vblank_off()
>>> after the commit .
>>>
>>> How about below patch?
>> Thanks you Joonyoung and Andrzej,
>>
>> drm_vblank_on/off() are legacy api so it would be better to use
>> drm_vblank_crtc_on/off functions instead.
>>
>> And drm_vblank_crtc_off() makes sure that the latest vblank frame co=
unt
>> is stored and restored by drm_vblank_crtc_on() again. So my opinion =
is,
>>
>> static void exynos_drm_crtc_dpms(struct drm_crtc *crtc, int mode)
>> {
>> 	[snip]
>>
>> 	if (mode > DRM_MODE_DPMS_ON) {
>> 		/* wait for the completion of page flip. */
>> 		if (!wait_event_timeout(exynos_crtc->pending_flip_queue,
>> 				!atomic_read(&exynos_crtc->pending_flip),
>> 				HZ/20))
>> 			atomic_set(&exynos_crtc->pending_flip, 0);
>> 		drm_crtc_vblank_off(crtc);		//<- store the latest vblank frame cou=
nt.
>> 	} else {
>> 		drm_crtc_vblank_on(crtc);		//<- restore the vblank frame count.
>> 	}
>>
>> 	[snip]
>> }
>>
>>
>> Tested and worked well with above patch. How about it?
>>
>>
>=20
> drm_crtc_vblank_on should be called after dpms on, otherwise it can f=
ail enabling vblank. I have provided
> full explanation in my other email [1].
> You can modify your patch or just use the one provided in [1].

I will just merge your patch set after review and test. :)

Thanks,
Inki Dae

>=20
> [1]: http://permalink.gmane.org/gmane.comp.video.dri.devel/116152
>=20
> Regards
> Andrzej
>=20
>=20
