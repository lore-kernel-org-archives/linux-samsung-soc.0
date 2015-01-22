From: Seung-Woo Kim <sw0312.kim@samsung.com>
Subject: Re: drm: exynos: mixer: fix using usleep() in atomic context
Date: Thu, 22 Jan 2015 16:47:25 +0900
Message-ID: <54C0AB0D.9090209@samsung.com>
References: <1417307725-5975-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1417307725-5975-2-git-send-email-tjakobi@math.uni-bielefeld.de>
 <20141201155447.GE11943@ulmo.nvidia.com>
 <7454d0630d95195d41c3906637e223af@math.uni-bielefeld.de>
 <20141217075433.GA2814@ulmo>
 <CAAQKjZMu=CwXZdUdo505ZLn+eWRPzMwXMJ3zmo0kT+Dji2y33Q@mail.gmail.com>
 <54C02C4F.4080307@math.uni-bielefeld.de>
Reply-To: sw0312.kim@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:10995 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750915AbbAVHrW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Jan 2015 02:47:22 -0500
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NIK005WPIYWWX60@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 22 Jan 2015 16:47:20 +0900 (KST)
In-reply-to: <54C02C4F.4080307@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: Inki Dae <inki.dae@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, Seung-Woo Kim <sw0312.kim@samsung.com>

Hello,

On 2015=EB=85=84 01=EC=9B=94 22=EC=9D=BC 07:46, Tobias Jakobi wrote:
> Hello!
>=20
>=20
> Inki Dae wrote:
>> The use of spin lock, reg_slock, has been used for a long time and w=
e
>> hadn't some cleanups to spin lock codes so far. The spin lock is als=
o
>> used in here and there of mixer driver. And at least, it seems that
>> the use of spin lock isn't required in mixer_win_reset. I don't see
>> any atomic contexts in mixer module except interrupt handler.
>>
>> To Seung-Woo,
>> I know that you referred to mixer codes of v4l2 based mixer driver. =
So
>> was the spin lock used in origin v4l2 driver? or Is there any reason
>> that you used the spin lock?

The spinlock usage was originated from Tomasz Stanislawski's s5p-tv.

>>
>> Anyway, we will have some testing to check hdmi and mixer drivers
>> without spin lock. So we will remove or replace it with mutex if
>> needed.
>>
>> Thanks,
>> Inki Dae
>=20
> So it's some weeks later and as far as I can see there has been no
> changes to the spinlock usage. Wouldn't it be better to apply this pa=
tch
> _now_ (since the use of 'usleep_range' is just plain wrong while unde=
r
> spinlock). When the spinlock setup gets cleaned up later, then we can
> always change back to 'usleep_range' again.
>=20
> Any thoughts?

In s5p-tv, same patch is already applied by Tomasz, so I agree to apply
this patch also.

Best Regards,
- Seung-Woo Kim

>=20
> With best wishes,
> Tobias
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Seung-Woo Kim
Samsung Software R&D Center
--
