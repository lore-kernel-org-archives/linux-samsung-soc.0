From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2 0/7] drm/exynos: add pm runtime support
Date: Fri, 20 Nov 2015 13:23:13 -0300
Message-ID: <564F48F1.9070205@osg.samsung.com>
References: <1446547629-12521-1-git-send-email-inki.dae@samsung.com>
 <564DE209.8030004@osg.samsung.com> <564DE2DB.6050608@osg.samsung.com>
 <564DEFEC.50802@osg.samsung.com> <564EFD13.7040409@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:38090 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759269AbbKTQXU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Nov 2015 11:23:20 -0500
In-Reply-To: <564EFD13.7040409@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@linaro.org>, Tyler Baker <tyler.baker@linaro.org>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hello Inki,

On 11/20/2015 07:59 AM, Inki Dae wrote:
> Hi Javier,
>=20
> 2015=EB=85=84 11=EC=9B=94 20=EC=9D=BC 00:51=EC=97=90 Javier Martinez =
Canillas =EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
>> On 11/19/2015 11:55 AM, Javier Martinez Canillas wrote:
>>>>>
>>>>
>>>> This series causes a boot failure on at least an Exynos5800 Peach =
Pi
>>>> Chromebook (tested myself) and seems to be the cause of other Exyn=
os
>>>> boards failing to boot: http://kernelci.org/boot/?exynos&fail
>>>>
>>>> [snip]
>>>>
>>>>>   drm/exynos: add pm_runtime to Mixer
>>>>>   drm/exynos: add pm_runtime to FIMD
>>>>
>>>> I had to revert these patches in order to get the machine in a boo=
table
>>>> state again, the sha1 hash for these patches in next-20151119 are:
>>>>
>>>> 045febd5f813 drm/exynos: add pm_runtime to FIMD
>>
>> On a closer look, only reverting the FIMD patch is enough
>> to make at least the Exynos5800 Peach Pi to boot again.
>=20
> Thanks for report.
>

Thanks to you for the quick answer and providing a fix.
=20
> I assume that the issue is because above patch removed 'suspended' va=
riable
> for checking the suspend status in runtime so I revived it.
>

It seems your assumption was correct...
=20
> I'm not sure that the change could resolve the issue. Could you test =
it
> with the change again? I have no Exynos5800 Peach Pi board. :(
>=20
> For this, I pushed it to below exynos-drm/for-next branch,
> 	https://git.kernel.org/cgit/linux/kernel/git/daeinki/drm-exynos.git/=
commit/?h=3Dexynos-drm/for-next&id=3De84f43e2b2c3388694b0b3a58c2c4447f1=
fbae7c
>=20
> If the issue is resolved by the change then I will modify other patch=
es for
> DECON series. And if really so, there may be a corner case we missed.
>

=2E.. since I reverted the offending commit and cherry-picked the one
in your for-next branch and the machine booted again.
=20
> Thanks,
> Inki Dae
>=20

Best regards,
--=20
Javier Martinez Canillas
Open Source Group
Samsung Research America
