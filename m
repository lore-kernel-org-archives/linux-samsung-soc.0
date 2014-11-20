From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [RFC PATCH v3 1/4] drm/exynos: make kms drivers to be independent
 drivers
Date: Thu, 20 Nov 2014 23:10:24 +0900
Message-ID: <546DF650.4030302@samsung.com>
References: <1416479088-29371-1-git-send-email-inki.dae@samsung.com>
 <1416479088-29371-2-git-send-email-inki.dae@samsung.com>
 <546DEA66.8010605@samsung.com> <546DF329.20201@samsung.com>
 <CABxcv=msvOkbzZdh3xQ-GUZVioNuLhX_QixCDP8MMs1d3fc4Rg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:48311 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751257AbaKTOKZ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Nov 2014 09:10:25 -0500
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NFC005K4CPC1O00@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Nov 2014 23:10:24 +0900 (KST)
In-reply-to: <CABxcv=msvOkbzZdh3xQ-GUZVioNuLhX_QixCDP8MMs1d3fc4Rg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>

Hi Javier,

On 2014=EB=85=84 11=EC=9B=94 20=EC=9D=BC 23:06, Javier Martinez Canilla=
s wrote:
> Hello Inki,
>=20
> On Thu, Nov 20, 2014 at 2:56 PM, Inki Dae <inki.dae@samsung.com> wrot=
e:
>>> If you try to build exynosdrm as module you will receive errors due=
 to
>>> multiple definitions of init_module, ie module_init/module_*_driver
>>> macros can be used once per module.
>>
>> Ah, right. we had ever tried same way before but failed in same prob=
lem.
>> I didn't realize that. Anyway, I will try to find out a better way. =
I'd
>> really like to remove all register codes of sub drivers from
>> exynos_drm_drv somehow.
>>
>=20
> Maybe as an immediate fix we can move the platform driver registratio=
n
> out of probe as suggested by Andrzej?
>=20
> I posted an RFC patch a couple of days ago [0] that fixes both the
> deadlock and the infinite loop bug so it would be great if you can
> review/test so I can post a proper patch.

=46antastical timing.:) I gave you a same opinion almost simultaneous.
Check your email thread.

Thanks,
Inki Dae

>=20
> And then we can look how to better refactor the exynos drm driver.
>=20
> Best regards,
> Javier
>=20
> [0]: http://www.spinics.net/lists/linux-samsung-soc/msg39106.html
>=20
