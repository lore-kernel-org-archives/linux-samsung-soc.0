From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 0/3] drm/exynos: Allow module to be autoloaded
Date: Mon, 28 Jul 2014 23:17:01 +0900
Message-ID: <53D65B5D.1060505@samsung.com>
References: <1405715801-5325-1-git-send-email-sjoerd.simons@collabora.co.uk>
 <53CC82AC.9060301@samsung.com> <1405925419.7527.17.camel@dusk>
 <1406536246.15871.6.camel@dusk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:27575 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752505AbaG1ORE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jul 2014 10:17:04 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N9F00C4VECDWZC0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 28 Jul 2014 23:17:02 +0900 (KST)
In-reply-to: <1406536246.15871.6.camel@dusk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org

On 2014=EB=85=84 07=EC=9B=94 28=EC=9D=BC 17:30, Sjoerd Simons wrote:
> Hey Inki,
>=20
> On Mon, 2014-07-21 at 08:50 +0200, Sjoerd Simons wrote:
>> Hey Inki,
>>
>> On Mon, 2014-07-21 at 12:02 +0900, Inki Dae wrote:
>>> On 2014=EB=85=84 07=EC=9B=94 19=EC=9D=BC 05:36, Sjoerd Simons wrote=
:
>>>> The exynos DRM module currently is not automatically loaded when b=
uild as a
>>>> module. This is due to the simple fact that it doesn't have any
>>>> MODULE_DEVICE_TABLE entries whatsoever... Most of these were remov=
ed previously
>>>> as it wasn't possible at the time to have multiple calls to MODULE=
_DEVICE_TABLE
>>>> in one module, however commit 21bdd17b21b45ea solved that.
>>>>
>>>> The first two patches revert the previous removals of MODULE_DEVIC=
E_TABLE
>>>> calls, while the last one adds calls for the remaining OF match ta=
bles without a
>>>> MODULE_DEVICE_TABLE call.
>>
>>> Exynos drm follows single-driver model. So each usb driver of Exyno=
s drm
>>> wouldn't need its own MODULE_DEVICE_TABLE.
>>
>> Strictly speaking you're right, for module autoloading to work the
>> module just needs to have one that matches. So in principle all othe=
r
>> entries are redundant.
>>
>> However for exynos drm there does not seem to be one main device whi=
ch
>> is guaranteed to always be present which can be used to key the modu=
le
>> autoloading of. So you still need seperate MODULE_DEVICE_TABLE entri=
es
>> for all the various subdrivers to ensure autoloading actually happen=
s,
>> especially since the various subdrivers can be seperately enabled
>> at build time.=20
>=20
> Been about a week since this last mail. If you have any suggestions o=
n a
> better approach or on how to move this forward, i'd be very grateful =
to
> hear as i think i've addressed your original comment on the set in th=
e
> previous reply?

Sorry for late,

I don't see why Exynos drm driver should be auto-loaded module. I think
all devices covered by Exynos drm framework are not hot-plugged. Maybe
there is my missing point. So can you explain why Exynos drm driver
should be auto-loaded module?

Thanks,
Inki Dae

>=20
