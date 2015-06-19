From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v10 00/17] drm/exynos: atomic modesetting support
Date: Fri, 19 Jun 2015 21:20:26 +0900
Message-ID: <5584090A.3080307@samsung.com>
References: <1433171095-23773-1-git-send-email-gustavo@padovan.org>
 <557E6C19.7070103@samsung.com> <20150616203549.GA1598@joana>
 <55816F60.4020307@samsung.com> <20150617143308.GB1598@joana>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:60720 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751868AbbFSMU3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Jun 2015 08:20:29 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NQ601IFIYA3LX30@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Jun 2015 21:20:27 +0900 (KST)
In-reply-to: <20150617143308.GB1598@joana>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

On 2015=EB=85=84 06=EC=9B=94 17=EC=9D=BC 23:33, Gustavo Padovan wrote:
> Hi Inki,
>=20
> 2015-06-17 Inki Dae <inki.dae@samsung.com>:
>=20
>> Hi Gustavo,
>>
>> On 2015=EB=85=84 06=EC=9B=94 17=EC=9D=BC 05:35, Gustavo Padovan wrot=
e:
>>> HI Inki,
>>>
>>> 2015-06-15 Inki Dae <inki.dae@samsung.com>:
>>>
>>>> Hi Gustavo,
>>>>
>>>> On 2015=EB=85=84 06=EC=9B=94 02=EC=9D=BC 00:04, Gustavo Padovan wr=
ote:
>>>>> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
>>>>>
>>>>> Hi,
>>>>>
>>>>> Here goes the full support for atomic modesetting on exynos. I've
>>>>> split the patches in the various phases of atomic support.
>>>>>
>>>>> v2: fixes comments by Joonyoung
>>>>>         - remove unused var in patch 09
>>>>>         - use ->disable instead of outdated ->dpms in hdmi code
>>>>>         - remove WARN_ON from crtc enable/disable
>>>>>
>>>>> v3: fixes comment by Joonyoung
>>>>>         - move the removal of drm_helper_disable_unused_functions=
() to
>>>>>         separated patch
>>>>>
>>>>> v4: add patches that remove unnecessary calls to disable_plane()
>>>>>
>>>>> v5: fixes NULL CRTC crash on planes updates (reported by Inki and=
 Tobias)
>>>>>
>>>>> v6: rebase on latest exynos_drm_next
>>>>>
>>>>> v7: fix comments by Joonyoung
>>>>>         - fix two checkpatch errors
>>>>>         - remove extra crtc->commit() call
>>>>>         - check for null fb on exynos_check_plane()
>>>>>
>>>>> v8: fix comments by Joonyoung
>>>>>         - fix merge error
>>>>>         - move drm_crtc_vblank_get to the commit that introduces =
atomic pageflip
>>>>>         - remove .prepare() in the apropiated patch
>>>>>         - add a new patch to move exynos_drm_crtc_disable()
>>>>>
>>>>> v9:  * fix comments by Joonyoung
>>>>>         - also remove encoder .prepare()
>>>>>         - do not shift exynos_update_plane() parameters
>>>>>         - remove unused .mode_set() and .mode_set_base()
>>>>>      * add specific exynos .atomic_commit()
>>>>>      * add split of exynos_crtc->ops->dpms() into enable() and di=
sable()
>>>>>      * add other atomic clean ups
>>>>>
>>>>> v10: * fix comments by Joonyoung
>>>>> 	- add more comments on exynos_atomic_commit()
>>>>> 	- make exynos_crtc's .enable and .disable void
>>>>
>>>> I found out one issue that refresh rate gets low with display exte=
nsion
>>>> mode test.
>>>>
>>>> I tested it with two crtc drivers - vidi and fimd on Trats2 board.=
 Here
>>>> is how to test it,
>>>>
>>>> #echo 1 > /sys/devices/platform/exynos-drm-vidi/connection
>>>> # modetest -M exynos -v -s 31@29:720x1280 -s 23@21:640x480
>>>> setting mode 720x1280-60Hz@XR24 on connectors 31, crtc 29
>>>> setting mode 640x480-75Hz@XR24 on connectors 23, crtc 21
>>>> freq: 20.00Hz
>>>> freq: 20.00Hz
>>>>
>>>> As you can see, refresh rate is 20.
>>>>
>>>> Below is the result without atomic patch series,
>>>> # modetest -M exynos -v -s 31@29:720x1280 -s 23@21:640x480
>>>> setting mode 720x1280-60Hz@XR24 on connectors 31, crtc 29
>>>> setting mode 640x480-75Hz@XR24 on connectors 23, crtc 21
>>>> freq: 60.18Hz
>>>> freq: 49.09Hz
>>>>
>>>> I can see 60Hz for FIMD and 49Hz for vidi.
>>>
>>> I gave this a try and figured out that this might be a vidi specifi=
c
>>> problem. If I try VIDI and FIMD I get the same results as you but w=
ith
>>> Mixer and FIMD(the setup I actually use to test) everything works f=
ine.
>>
>> Hm... Did Mixer and FIMD combination really work correctly with
>> extension mode?
>=20
> Yes.
>=20
> collabora@singularity:~$ modetest -M exynos -s 31:1920x1080 -v -s
> 25:1366x768
> setting mode 1920x1080-60Hz@XR24 on connectors 31, crtc 29
> setting mode 1366x768-60Hz@XR24 on connectors 25, crtc 23
> freq: 55.82Hz
> freq: 55.38Hz
> freq: 55.30Hz
> freq: 55.38Hz
> freq: 55.30Hz
> freq: 55.38Hz
> freq: 55.30Hz
> freq: 55.38Hz
> freq: 55.30Hz
> freq: 55.38Hz

Your patch series had one bug that the vblank operation was duplicated.
As you may know, the page flip operation already contains vblank
functionality but your patch made atomic_commit callback wait for the
completion of vblank again.

See the below patch I posted,
[PATCH] drm/exynos: do not wait for vblank at atomic operation

That was why I asked for that mixer and fimd combination worked
correctly with extension mode. Don't you think above frequency is
strange? The frequency should be 60Hz, not 55Hz.

We would need to enhance the atomic feature for Exynos drm later.
Current atomic feature doesn't really do atomic operation, and is
required for more cleanups. Anyway, I have already merged it and will
have a pull-request soon.

Thanks for your contributions,
Inki Dae

>=20
>>
>>> So somehow my patches caused a regression on vidi that I'm still
>>> ivestigating.
>>
>> I think this issue is because page flip operations are performed in
>> atomic: if I see correctly, when page flip is requested by modetest,=
 the
>> call flow is as follows,
>>
>> drm_atomic_helper_page_flip
>> 	drm_atomic_async_commit
>> 		exynos_atomic_commit
>> 			...
>> 			drm_atomic_helper_wait_for_vblanks
>> 			...
>>
>> However, the function, drm_atomic_helper_wait_for_vblanks called by
>> exynos_atomic_commit, waits for the vblank completion of each crtc
>> driver . See wait_event_timeout function call in
>> drm_atomic_helper_wait_for_vblanks function.
>>
>> This means that a page flip request of a crtc driver cannot be perfo=
rmed
>> until the vblank completion of another crtc driver. I think you shou=
ld
>> have implemented exynos_atomic_commit function asynchronously, not
>> synchronously like you did. So it seems that this function should be
>> re-implemented.
>=20
> I have a patch for it already. I'll resend a v2 of my last series.=20
>=20
>>
>> If my analysis is correct and you cannot post the change set within =
this
>> week, I'm not sure whether the atomic patch series should go to
>> mainline. Anyway, I will decide it and have a pull-request at the en=
d of
>> this week at least.
>=20
> We have about 3 months to fix this, until v4.2 is out, not one week. =
And
> it is working for FIMD and Mixer.
>=20
> 	Gustavo
>=20
