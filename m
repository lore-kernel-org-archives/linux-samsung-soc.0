From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 10/14] exynos/fimg2d: remove default case from
 g2d_get_blend_op()
Date: Tue, 01 Sep 2015 09:39:22 +0900
Message-ID: <55E4F3BA.4010709@samsung.com>
References: <1440425649-9768-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1440425649-9768-11-git-send-email-tjakobi@math.uni-bielefeld.de>
 <55E455D7.8060101@samsung.com>
 <CACvgo52p=ymGzgjA5YHBmQbYEJ_Xowj40=a=2EindKnyoYPk2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:49830 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752574AbbIAAjY convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 31 Aug 2015 20:39:24 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NTZ01VZC35MB280@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 01 Sep 2015 09:39:22 +0900 (KST)
In-reply-to: <CACvgo52p=ymGzgjA5YHBmQbYEJ_Xowj40=a=2EindKnyoYPk2A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, Joonyoung Shim <jy0922.shim@samsung.com>, gustavo.padovan@collabora.co.uk

On 2015=EB=85=84 09=EC=9B=94 01=EC=9D=BC 03:53, Emil Velikov wrote:
> On 31 August 2015 at 14:25, Inki Dae <inki.dae@samsung.com> wrote:
>> On 2015=EB=85=84 08=EC=9B=94 24=EC=9D=BC 23:14, Tobias Jakobi wrote:
>>> We now validate the blending mode via g2d_validate_mode()
>>> prior to feeding it to g2d_get_blend_op().
>>>
>>> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>>> ---
>>>  exynos/exynos_fimg2d.c | 5 -----
>>>  1 file changed, 5 deletions(-)
>>>
>>> diff --git a/exynos/exynos_fimg2d.c b/exynos/exynos_fimg2d.c
>>> index 4274a94..d708e91 100644
>>> --- a/exynos/exynos_fimg2d.c
>>> +++ b/exynos/exynos_fimg2d.c
>>> @@ -91,11 +91,6 @@ static unsigned int g2d_get_blend_op(enum e_g2d_=
op op)
>>>               SET_BF(val, G2D_COEFF_MODE_SRC_ALPHA, 0, 0, 0,
>>>                               G2D_COEFF_MODE_SRC_ALPHA, 1, 0, 0);
>>>               break;
>>> -     default:
>>> -             fprintf(stderr, "Not support operation(%d).\n", op);
>>> -             SET_BF(val, G2D_COEFF_MODE_ONE, 0, 0, 0, G2D_COEFF_MO=
DE_ZERO,
>>> -                             0, 0, 0);
>>> -             break;
>>
>> With this, how about changing above switch and case statement to if
>> statement?
>>
> Out of curiosity: why is if/else statement preferred - won't it make
> things longer/harder to read (there are 11 cases here) ?

Just looks strange to me switch and case statement has no default
statement. This is just my opinion and trivial.

Thanks,
Inki Dae

>=20
> Cheers,
> Emil
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
