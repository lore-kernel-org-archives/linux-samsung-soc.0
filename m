From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos: remove hardware overlays disable from fimd
 probe
Date: Mon, 09 Jun 2014 13:13:40 +0900
Message-ID: <53953474.7080902@samsung.com>
References: <1401257471-31994-1-git-send-email-rahul.sharma@samsung.com>
 <538C3FC4.6090509@samsung.com>
 <CAPdUM4POJwfe_RyKV+ym=ENgVF+2To0qgS88UGp1ueBD3LH4ig@mail.gmail.com>
 <538C4DE0.50801@gmail.com> <538C551E.30407@samsung.com>
 <538C64A7.50900@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:26248 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750979AbaFIENn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Jun 2014 00:13:43 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N6V00EMMVQTQV50@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 09 Jun 2014 13:13:41 +0900 (KST)
In-reply-to: <538C64A7.50900@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Rahul Sharma <rahul.sharma@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "Szyprowski, Marek" <m.szyprowski@samsung.com>

On 2014=EB=85=84 06=EC=9B=94 02=EC=9D=BC 20:48, Andrzej Hajda wrote:
> On 06/02/2014 12:42 PM, Andrzej Hajda wrote:
>> On 06/02/2014 12:11 PM, Tomasz Figa wrote:
>>> Hi Rahul, Andrzej,
>>>
>>> On 02.06.2014 11:42, Rahul Sharma wrote:
>>>> On 2 June 2014 14:41, Andrzej Hajda <a.hajda@samsung.com> wrote:
>>>>> Hi Rahul,
>>>>>
>>>>> On 05/28/2014 08:11 AM, Rahul Sharma wrote:
>>>>>> System hangs when FIMD registers are accessed to disable
>>>>>> hardware overlays. This is because of the clocks which are
>>>>>> not enabled before register access.
>>>>>>
>>>>>> 'Hardware overlay disable' is cleaned from the FIMD probe.
>>>>>>
>>>>>> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
>>>>>
>>>>> This patch causes regression on some exynos4210-universal_c210 de=
vices,
>>>>> everything works expect colors are incorrect - it seems blue comp=
onent
>>>>> is very dark, almost black.
>>>>>
>>>>
>>>> Oh.... Sorry for that. I did not see any problem on 5250/5420/5800=
=2E I do not
>>>> have setup for 4210. Better we should revert this patch.
>>>>
>>>> Would you please help me by verifying the following patch on 4210?=
 This
>>>> is an alternate solution to the same problem.
>>>>
>>>> http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg3=
1426.html
>>>>
>>>> Thanks Andrej, for bringing it to notice.
>>>
>>> I don't see how this patch could introduce such regression, as all =
the
>>> affected registers seem to be properly reconfigured in fimd_win_com=
mit()
>>> anyway.
>>>
>>> IMHO instead of reverting the patch, this issue should be investiga=
ted
>>> and fixed properly.
>>>
>>> Best regards,
>>> Tomasz
>>>
>>
>> I am looking at the problem, it is quite strange as it happens only =
on
>> one of two targets I have access to. Anyway it seems that something
>> should be added to fimd initialization sequence if we want to remove=
 hw
>> accessing code from probe.
>=20
> The problem is that fimd does not clear unused windows.
> Simple patch which helps:
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index 2ec634f..b58fce2 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -741,6 +741,8 @@ static void fimd_apply(struct exynos_drm_manager =
*mgr)
>                 win_data =3D &ctx->win_data[i];
>                 if (win_data->enabled)
>                         fimd_win_commit(mgr, i);
> +               else
> +                       fimd_win_disable(mgr, i);
>         }
>=20
>         fimd_commit(mgr);
>=20
> But I am not fully familiar with window management code, so I do not
> know if it does not breaks other stuff.

It looks good to me. Can you post it?

Thanks,
Inki Dae

>=20
> Regards
> Andrzej
>=20
>>
>> Regards
>> Andrzej
>>
>=20
>=20
