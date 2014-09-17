From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH] drm/exynos: fix plane-framebuffer linkage
Date: Wed, 17 Sep 2014 16:44:13 +0900
Message-ID: <54193BCD.3090003@samsung.com>
References: <1410807137-8323-1-git-send-email-drake@endlessm.com>
 <20140916063501.GT4740@phenom.ffwll.local> <54192BB1.8060606@samsung.com>
 <54192EF0.5000705@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:17994 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751888AbaIQHoR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Sep 2014 03:44:17 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NC1009IBC5NBG60@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 17 Sep 2014 16:44:11 +0900 (KST)
In-reply-to: <54192EF0.5000705@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Daniel Drake <drake@endlessm.com>, sw0312.kim@samsung.com, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org

Hi,

On 09/17/2014 03:49 PM, Inki Dae wrote:
> On 2014=EB=85=84 09=EC=9B=94 17=EC=9D=BC 15:35, Andrzej Hajda wrote:
>> Hi,
>>
>> On 09/16/2014 08:35 AM, Daniel Vetter wrote:
>>> On Mon, Sep 15, 2014 at 12:52:17PM -0600, Daniel Drake wrote:
>>>> Pageflipping currently causes some inconsistencies that lead to
>>>> crashes. Just run an app that causes a CRTC pageflip in a raw X se=
ssion
>>>> and check that it exits cleanly and can be restarted - you'll see
>>>> crashes like:
>>>>  Unable to handle kernel NULL pointer dereference at virtual addre=
ss 00000334
>>>>  PC is at exynos_drm_crtc_plane_commit+0x20/0x40
>>>>  LR is at exynos_drm_crtc_plane_commit+0x20/0x40
>>>>  [<c03749b4>] (exynos_drm_crtc_plane_commit) from [<c03741bc>] (ex=
ynos_drm_crtc_commit+0x44/0x70)
>>>>  [<c03741bc>] (exynos_drm_crtc_commit) from [<c03743a0>] (exynos_d=
rm_crtc_mode_set_commit.isra.2+0xb4/0xc4)
>>>>  [<c03743a0>] (exynos_drm_crtc_mode_set_commit.isra.2) from [<c037=
44f4>] (exynos_drm_crtc_page_flip+0x140/0x1a8)
>>>>  [<c03744f4>] (exynos_drm_crtc_page_flip) from [<c036b20c>] (drm_m=
ode_page_flip_ioctl+0x224/0x2dc)
>>>>  [<c036b20c>] (drm_mode_page_flip_ioctl) from [<c035c324>] (drm_io=
ctl+0x338/0x4fc)
>>>>
>>>> These crashes happen because drm_plane_force_disable has previousl=
y set
>>>> plane->crtc to NULL.
>>>>
>>>> When drm_mode_page_flip_ioctl() is used to flip another framebuffe=
r
>>>> onto the primary plane, crtc->primary->fb is correctly updated (th=
is is
>>>> a virtual plane created by plane_helper), but plane->fb is not (th=
is
>>>> plane is the real one, created by exynos_drm_crtc_create).
>>>>
>>>> We then come to handle rmfb of the backbuffer, which the "real" pr=
imary
>>>> plane is incorrectly pointing at. So drm_framebuffer_remove() deci=
des that
>>>> the buffer is actually active on a plane and force-disables the pl=
ane.
>>>>
>>>> Ensuring that plane->fb is kept up-to-date solves that issue, but
>>>> exposes a reference counting problem. Now we see crashes when rmfb=
 is
>>>> called on the front-buffer, because the rmfb code expects to drop =
3
>>>> references here, and there are only 2.
>>>>
>>>> That can be fixed by adopting the reference management found in om=
apdrm:
>>>> Framebuffer references are not taken directly in crtc mode_set con=
text,
>>>> but rather in the context of updating the plane, which also covers
>>>> flips. Like omapdrm we also unreference the old framebuffer here.
>>>>
>>>> Signed-off-by: Daniel Drake <drake@endlessm.com>
>>> This sounds very much like exynos should switch to universal planes=
 so
>>> that the fake primary plane created by the helpers doesn't get in t=
he way.
>>> And for chips which already use planes for everything internally th=
is
>>> shouldn't be a lot more than a few lines.
>>> -Daniel
>>
>> The patch proposed here of course supersedes my patch fixing fb refc=
ounting.
>> But the best solution is to get rid of virtual plane as Daniel Vette=
r
>> stated.
>> Daniel (Drake of course :) ) do you want to prepare patch switching =
to
>> universal planes?
>> Maybe other volunteers? If not I can try to do it, as it seems quite
>> straightforward.
>=20
> I think you can do it and you would be a right person to do it.
>=20
> Thanks,
> Inki Dae
>=20
>>
>> Regards
>> Andrzej
>>
>>>> ---
>>>>  drivers/gpu/drm/exynos/exynos_drm_crtc.c  | 12 ++----------
>>>>  drivers/gpu/drm/exynos/exynos_drm_plane.c |  8 ++++++++
>>>>  2 files changed, 10 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gp=
u/drm/exynos/exynos_drm_crtc.c
>>>> index b68e58f..7aa9dee 100644
>>>> --- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
>>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
>>>> @@ -140,16 +140,8 @@ exynos_drm_crtc_mode_set(struct drm_crtc *crt=
c, struct drm_display_mode *mode,
>>>>  	if (manager->ops->mode_set)
>>>>  		manager->ops->mode_set(manager, &crtc->mode);
>>>> =20
>>>> -	ret =3D exynos_plane_mode_set(plane, crtc, crtc->primary->fb, 0,=
 0, crtc_w, crtc_h,
>>>> -				    x, y, crtc_w, crtc_h);
>>>> -	if (ret)
>>>> -		return ret;
>>>> -
>>>> -	plane->crtc =3D crtc;
>>>> -	plane->fb =3D crtc->primary->fb;
>>>> -	drm_framebuffer_reference(plane->fb);

It's problem to add this from commit 25c8b5c3048cb6c98d402ca8d4735ccf91=
0f727c.
Chip specific drm driver internally doesn't have to care fb reference c=
ount if
there is no special case. We should have switched to universal plane at=
 that
time.

Thanks.

>>>> -
>>>> -	return 0;
>>>> +	return exynos_plane_mode_set(plane, crtc, crtc->primary->fb, 0, =
0,
>>>> +				     crtc_w, crtc_h, x, y, crtc_w, crtc_h);
>>>>  }
>>>> =20
>>>>  static int exynos_drm_crtc_mode_set_commit(struct drm_crtc *crtc,=
 int x, int y,
>>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/g=
pu/drm/exynos/exynos_drm_plane.c
>>>> index 8371cbd..df27e35 100644
>>>> --- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
>>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
>>>> @@ -139,6 +139,14 @@ int exynos_plane_mode_set(struct drm_plane *p=
lane, struct drm_crtc *crtc,
>>>>  			overlay->crtc_x, overlay->crtc_y,
>>>>  			overlay->crtc_width, overlay->crtc_height);
>>>> =20
>>>> +	if (plane->fb)
>>>> +		drm_framebuffer_unreference(plane->fb);
>>>> +
>>>> +	drm_framebuffer_reference(fb);
>>>> +
>>>> +	plane->fb =3D fb;
>>>> +	plane->crtc =3D crtc;
>>>> +
>>>>  	exynos_drm_crtc_plane_mode_set(crtc, overlay);
>>>> =20
>>>>  	return 0;
>>>> --=20
>>>> 1.9.1
>>>>
>>>> _______________________________________________
>>>> dri-devel mailing list
>>>> dri-devel@lists.freedesktop.org
>>>> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-sams=
ung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>=20
>=20
