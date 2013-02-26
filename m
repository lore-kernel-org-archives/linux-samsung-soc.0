From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [Suggestion] ARM:S5PV210: version merging compiling issue for
 'struct fimc_source_info'
Date: Tue, 26 Feb 2013 10:50:21 +0100
Message-ID: <512C855D.6090109@samsung.com>
References: <511F50CF.90403@asianux.com>
 <CAH9JG2WS5q4SR8zk5=OC32PHLZ2+ZYva7csyshG7oANacqbCuA@mail.gmail.com>
 <512C5877.7090805@asianux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:34555 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756687Ab3BZJuZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Feb 2013 04:50:25 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MIT00BMBNB1BU60@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 26 Feb 2013 09:50:23 +0000 (GMT)
Received: from [106.116.147.32] by eusync1.samsung.com
 (Oracle Communications Messaging Server 7u4-23.01(7.0.4.23.0) 64bit (built Aug
 10 2011)) with ESMTPA id <0MIT00MZONBY6S60@eusync1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 26 Feb 2013 09:50:23 +0000 (GMT)
In-reply-to: <512C5877.7090805@asianux.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chen Gang <gang.chen@asianux.com>
Cc: Kyungmin Park <kmpark@infradead.org>, "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, Mauro Carvalho Chehab <mchehab@redhat.com>

Hi,

On 02/26/2013 07:38 AM, Chen Gang wrote:
> =E4=BA=8E 2013=E5=B9=B402=E6=9C=8816=E6=97=A5 19:39, Kyungmin Park =E5=
=86=99=E9=81=93:
>> You can find it at recent patch from Arnd.
>=20
>   excuse me, could you please provide more information about it ?
>=20
>   I have checked 2 tags:
>     the next-20130225 tag in git://git.kernel.org/pub/scm/linux/kerne=
l/git/next/linux-next.git
>=20
>       in Feb 1 2013, by Sylwester Nawrocki, Kyungmin Park, Mauro Carv=
alho Chehab
>       git number: 56bc911ac3b94c731db3a6de20258827f1a61c20
>         in include/media/s5p_fimc.h, the structure fimc_source_info i=
s changed.
>         in arch/arm/mach-s5pv210/mach-goni.c, the structure fimc_sour=
ce_info is not changed.
>           still use .bus_type (not use .fimc_bus_type like others).
>=20
>       it seems, the relative members forgot to change it to .fimc_bus=
_type.
>=20
>       did the patch from Arnd still not applied into next tree ?
>=20
>     the v3.8-rc7 tag in git clone git://git.kernel.org/pub/scm/linux/=
kernel/git/kgene/linux-samsung.git
>       it seems no relative changes (change nothing).

No, the fix is not yet in linux-next. I has not been merged through the=
 media
tree and it might take some time until it gets to Linus's tree now. You=
 can use
one of following patches to fix this build break:

http://www.spinics.net/lists/linux-samsung-soc/msg16023.html
https://patchwork.kernel.org/patch/2143211
http://patchwork.linuxtv.org/patch/16892

Kgene, could you push any of these fixes upstream ?


Thanks,
Sylwester
