From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2 0/7] drm/exynos: add pm runtime support
Date: Fri, 20 Nov 2015 19:59:31 +0900
Message-ID: <564EFD13.7040409@samsung.com>
References: <1446547629-12521-1-git-send-email-inki.dae@samsung.com>
 <564DE209.8030004@osg.samsung.com> <564DE2DB.6050608@osg.samsung.com>
 <564DEFEC.50802@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:47648 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759756AbbKTK7d convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Nov 2015 05:59:33 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NY4002G81775140@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Nov 2015 19:59:31 +0900 (KST)
In-reply-to: <564DEFEC.50802@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@linaro.org>, Tyler Baker <tyler.baker@linaro.org>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi Javier,

2015=EB=85=84 11=EC=9B=94 20=EC=9D=BC 00:51=EC=97=90 Javier Martinez Ca=
nillas =EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> On 11/19/2015 11:55 AM, Javier Martinez Canillas wrote:
>>>>
>>>
>>> This series causes a boot failure on at least an Exynos5800 Peach P=
i
>>> Chromebook (tested myself) and seems to be the cause of other Exyno=
s
>>> boards failing to boot: http://kernelci.org/boot/?exynos&fail
>>>
>>> [snip]
>>>
>>>>   drm/exynos: add pm_runtime to Mixer
>>>>   drm/exynos: add pm_runtime to FIMD
>>>
>>> I had to revert these patches in order to get the machine in a boot=
able
>>> state again, the sha1 hash for these patches in next-20151119 are:
>>>
>>> 045febd5f813 drm/exynos: add pm_runtime to FIMD
>=20
> On a closer look, only reverting the FIMD patch is enough
> to make at least the Exynos5800 Peach Pi to boot again.

Thanks for report.

I assume that the issue is because above patch removed 'suspended' vari=
able
for checking the suspend status in runtime so I revived it.

I'm not sure that the change could resolve the issue. Could you test it
with the change again? I have no Exynos5800 Peach Pi board. :(

=46or this, I pushed it to below exynos-drm/for-next branch,
	https://git.kernel.org/cgit/linux/kernel/git/daeinki/drm-exynos.git/co=
mmit/?h=3Dexynos-drm/for-next&id=3De84f43e2b2c3388694b0b3a58c2c4447f1fb=
ae7c

If the issue is resolved by the change then I will modify other patches=
 for
DECON series. And if really so, there may be a corner case we missed.

Thanks,
Inki Dae

>=20
> Best regards,
>=20
