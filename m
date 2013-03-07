From: =?UTF-8?B?6rmA7Iq57Jqw?= <sw0312.kim@samsung.com>
Subject: Re: [PATCH RFC] drm/exynos: hdmi: move hdmiphy related code to	hdmiphy
 driver
Date: Thu, 07 Mar 2013 11:44:34 +0900
Message-ID: <5137FF12.3070808@samsung.com>
References: <1361971327-7459-1-git-send-email-rahul.sharma@samsung.com>
 <CAOw6vbLp1d8X6oKsbTVa0_5DqtFJATaM6-qt_+O+RO8y3uH2WQ@mail.gmail.com>
 <CAPdUM4Ox0VtLDf=sv7WwL-RnHsYetzcJKA5ew_3bSsR-pGuVUQ@mail.gmail.com>
Reply-To: sw0312.kim@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:62584 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753454Ab3CGCoh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Mar 2013 21:44:37 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MJ900DDFRMCDG60@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 Mar 2013 11:44:36 +0900 (KST)
In-reply-to: <CAPdUM4Ox0VtLDf=sv7WwL-RnHsYetzcJKA5ew_3bSsR-pGuVUQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <r.sh.open@gmail.com>
Cc: Sean Paul <seanpaul@google.com>, linux-samsung-soc@vger.kernel.org, sunil joshi <joshi@samsung.com>, dri-devel@lists.freedesktop.org, Rahul Sharma <rahul.sharma@samsung.com>, sw0312.kim@samsung.com



On 2013=EB=85=84 03=EC=9B=94 04=EC=9D=BC 23:05, Rahul Sharma wrote:
> Thanks Sean,
>=20
> On Wed, Feb 27, 2013 at 9:47 PM, Sean Paul <seanpaul@google.com> wrot=
e:
>> On Wed, Feb 27, 2013 at 8:22 AM, Rahul Sharma <rahul.sharma@samsung.=
com> wrote:
>>> Right now hdmiphy operations and configs are kept inside hdmi drive=
r. hdmiphy related
>>> code is tightly coupled with hdmi ip driver. Physicaly they are dif=
ferent devices and
>>
>> s/Physicaly/Physically/
>>
>>> should be instantiated independently.
>>>
>>> In terms of versions/mapping/configurations Hdmi and hdmiphy are in=
dependent of each
>>> other. It is preferred to isolate them and maintained independently=
=2E
>>>
>>> This implementations is tested for:
>>> 1) Resolutions supported by exynos4 and 5 hdmi.
>>> 2) Runtime PM and S2R scenarions for exynos5.
>>>
>>
>> I don't like the idea of spawning off yet another driver in here. It
>> adds more globals, more suspend/resume ordering issues, and more
>> implicit dependencies. I understand, however, that this is the Chose=
n
>> Way for the exynos driver, so I will save my rant.
>>
>=20
> I agree to it. splitting phy to a new driver will complicate the powe=
r related
> scenarios. But in upcoming SoC,s, Phy is changing considerably in ter=
ms of
> config values, mapping (i2c/platform bus) etc. Handling this diversit=
y
> inside hdmi driver is complicating it with unrelated changes.

Basically, I agree with the idea to split hdmiphy from hdmi. And it
seems that already existing hdmiphy i2c device is just reused and
hdmiphy_power_on is reorganized to hdmiphy dpms operation: even calling
flow of power operations is reordered.

But I'm not sure exynos_hdmiphy_driver_register() really need to be
called from exynos_drm_init() of exynos_drm_drv.c. IMO, it is enough to
call exynos_hdmiphy_driver_register() from hdmi_probe() because hdmiphy
is only used from hdmi.

Thanks and Regards,
- Seung-Woo Kim

>=20
> I have tested this RFC for Runtime PM / S2R. But if we see any major =
roadblock
> we should re-factor this by explicitly calling power related callback=
s
> of mixer, phy,
> hdmi drivers in a required order. We can call them from exynos-drm-hd=
mi plf
> device. AFAIR something like this is already in place in chrome-kerne=
l.
>=20
>> I've made some comments below.
>>
>>> This patch is dependent on
>>> http://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg3473=
3.html
>>> http://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg3486=
1.html
>>> http://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg3486=
2.html
>>>
>>> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
>>> ---
>>> It is based on exynos-drm-next-todo branch at
>>> git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.gi=
t
>>>
>>>  drivers/gpu/drm/exynos/exynos_drm_drv.c  |   8 +
>>>  drivers/gpu/drm/exynos/exynos_drm_drv.h  |   6 +
>>>  drivers/gpu/drm/exynos/exynos_drm_hdmi.c |  58 ++-
>>>  drivers/gpu/drm/exynos/exynos_drm_hdmi.h |  11 +
>>>  drivers/gpu/drm/exynos/exynos_hdmi.c     | 375 ++-----------------=
-
>>>  drivers/gpu/drm/exynos/exynos_hdmi.h     |   1 -
>>>  drivers/gpu/drm/exynos/exynos_hdmiphy.c  | 586 +++++++++++++++++++=
+++++++++++-
>>>  drivers/gpu/drm/exynos/regs-hdmiphy.h    |  61 ++++
>>>  8 files changed, 738 insertions(+), 368 deletions(-)
>>>  create mode 100644 drivers/gpu/drm/exynos/regs-hdmiphy.h
>>>

<snip>

--=20
Seung-Woo Kim
Samsung Software R&D Center
--
