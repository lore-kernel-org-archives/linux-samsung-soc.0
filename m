From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 0/7] drm/exynos: clean ups
Date: Fri, 13 Mar 2015 11:33:22 +0900
Message-ID: <55024C72.2070006@samsung.com>
References: <1424352158-728-1-git-send-email-gustavo@padovan.org>
 <5501A5DD.1040707@samsung.com> <20150312184543.GB1708@joana>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:32620 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752465AbbCMCdZ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Mar 2015 22:33:25 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NL400GLBPRN3M00@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 13 Mar 2015 11:33:23 +0900 (KST)
In-reply-to: <20150312184543.GB1708@joana>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Cc: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com

On 2015=EB=85=84 03=EC=9B=94 13=EC=9D=BC 03:45, Gustavo Padovan wrote:
> 2015-03-12 Inki Dae <inki.dae@samsung.com>:
>=20
>> On 2015=EB=85=84 02=EC=9B=94 19=EC=9D=BC 22:22, Gustavo Padovan wrot=
e:
>>> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
>>>
>>> Hi,
>>>
>>> Here goes some clean ups to the exynos drivers. The main clean ups =
is
>>> the presetting and zpos making the property immutable and the remov=
al
>>> of *_win_data structures.
>>
>> With your cleanup patch set, the plane test doesn't work. Have you e=
ver
>> tested plane feature with modetest application?
>>
>> I typed like below and it looks like no problem but I cannot see
>> anything on Panel except for cute four penguins.
>>
>> # modetest -P 29:100x100+0+0
>> trying to open device 'i915'...failed.
>> trying to open device 'radeon'...failed.
>> trying to open device 'nouveau'...failed.
>> trying to open device 'vmwgfx'...failed.
>> trying to open device 'omapdrm'...failed.
>> trying to open device 'exynos'...success.
>> testing 100x100@XR24 overlay plane 25
>>
>> And for two plane test,
>>
>> # modetest -P 29:100x100+0+0 -P 29:100x100+0+100
>> trying to open device 'i915'...failed.
>> trying to open device 'radeon'...failed.
>> trying to open device 'nouveau'...failed.
>> trying to open device 'vmwgfx'...failed.
>> trying to open device 'omapdrm'...failed.
>> trying to open device 'exynos'...success.
>> testing 100x100@XR24 overlay plane 25
>> testing 100x100@XR24 overlay plane 26
>>
>> Still no screen.
>=20
> Well, I did some more testing and even without my patches I can't see=
 a plane
> on the screen. Running only on exynos-drm-next also doesn't work so i=
t is not
> something that my patches introduced, it is already a bug upstream.
> I'm using a snow for testing.

It's strange. I can see a semicircular small box on the screen without
your patch set, and that works well on not only exynos-drm-next but als=
o
exynos-drm-fixes. I'm using a trarts2 board based on Exynos4412 SoC.

Could anyone check the plane test with modetest for double-check?

Thanks,
Inki Dae

>=20
> 	Gustavo
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
