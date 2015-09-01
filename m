From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 04/14] exynos/fimg2d: check buffer space in g2d_solid_fill()
Date: Tue, 01 Sep 2015 09:41:22 +0900
Message-ID: <55E4F432.1080600@samsung.com>
References: <1440425649-9768-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1440425649-9768-5-git-send-email-tjakobi@math.uni-bielefeld.de>
 <55E45029.40009@samsung.com> <55E4AA97.2070502@math.uni-bielefeld.de>
 <CACvgo51UZ10zQb63yxcUw=7GDp0Zs54atyxJO0xAJeTYzf1GVA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:43935 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752883AbbIAAlX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 31 Aug 2015 20:41:23 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NTZ01V6W38YB290@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 01 Sep 2015 09:41:22 +0900 (KST)
In-reply-to: <CACvgo51UZ10zQb63yxcUw=7GDp0Zs54atyxJO0xAJeTYzf1GVA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Emil Velikov <emil.l.velikov@gmail.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, Joonyoung Shim <jy0922.shim@samsung.com>, gustavo.padovan@collabora.co.uk

On 2015=EB=85=84 09=EC=9B=94 01=EC=9D=BC 04:57, Emil Velikov wrote:
> On 31 August 2015 at 20:27, Tobias Jakobi <tjakobi@math.uni-bielefeld=
=2Ede> wrote:
>> Hello!
>>
>> Inki Dae wrote:
>>> On 2015=EB=85=84 08=EC=9B=94 24=EC=9D=BC 23:13, Tobias Jakobi wrote=
:
>=20
>>>> +    if (g2d_check_space(ctx, 7, 1))
>>>> +            return -ENOSPC;
>>>
>>> You can make 3 and 4 patches to one. These should be same patch.
>> Hmm, so which 3 (respectively 4) patches should be squashed?
>>
> I believe he meant "squash the introduction of the function and its
> uses into a single patch".
>=20
> Not sure how much value that brings, so I'll let you guys decide on
> the bike shed colour :-)

That - including relevant my comments - is just my opinion so no proble=
m
to upstream it as is. This is really trivial.

Thanks,
Inki Dae

>=20
> -Emil
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
