From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2 11/11] drm/exynos: remove struct exynos_drm_encoder layer
Date: Fri, 07 Aug 2015 22:22:41 +0900
Message-ID: <55C4B121.7070200@samsung.com>
References: <1438817060-22164-10-git-send-email-gustavo@padovan.org>
 <1438867908-18975-1-git-send-email-gustavo@padovan.org>
 <1438867908-18975-2-git-send-email-gustavo@padovan.org>
 <55C49B8A.4090009@samsung.com>
 <CAKMK7uFsh=PN0Mvb2kzBsDZr-ZhDnbJqcWHLr3_sagETZ+xUhg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:51564 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753039AbbHGNWo convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Aug 2015 09:22:44 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NSP00S09RTULBA0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 07 Aug 2015 22:22:42 +0900 (KST)
In-reply-to: <CAKMK7uFsh=PN0Mvb2kzBsDZr-ZhDnbJqcWHLr3_sagETZ+xUhg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, dri-devel <dri-devel@lists.freedesktop.org>

Hi Daniel,

On 2015=EB=85=84 08=EC=9B=94 07=EC=9D=BC 21:28, Daniel Vetter wrote:
> On Fri, Aug 7, 2015 at 1:50 PM, Inki Dae <inki.dae@samsung.com> wrote=
:
>>
>> Booting is locked up here. This patch looks good to me so I tried to
>> find why locked up and I found the booting is locked up as soon as
>> console_lock function is called. Can you and other guys look into th=
is
>> issue?
>=20
> It's not locked up, you simply won't see any dmesg output after that.
> Use Archit's Kconfig support in drm-misc to disable fbdev emulation
> and try again.

I didn't really look into this patch series. I will check it with this
patch series next week and give Acked-by to you.

Thanks,
Inki Dae

> -Daniel
>=20
