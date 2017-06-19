From: Shuah Khan <shuahkhan@gmail.com>
Subject: Re: [PATCH] drm/exynos: dsi: do not try to find bridge
Date: Mon, 19 Jun 2017 07:52:42 -0600
Message-ID: <CAKocOOOB7+xprVeqChj2qKL82bXLqowkJ86pww4ePmRFs46OSA@mail.gmail.com>
References: <CGME20170616075016epcas5p34938dd82d07390a03e7690f1634e9229@epcas5p3.samsung.com>
 <1497599415-4327-1-git-send-email-inki.dae@samsung.com> <CAKocOOM9RZkYvHOtrBXQeT7S=zCx4PY5QRJ-NXkp-GSvioMuZg@mail.gmail.com>
 <7c884e71-9da3-2106-07e4-b0a717cbad66@osg.samsung.com> <59473315.5040802@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:36661 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750733AbdFSNwn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 19 Jun 2017 09:52:43 -0400
Received: by mail-oi0-f68.google.com with SMTP id g14so9150876oib.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Jun 2017 06:52:43 -0700 (PDT)
In-Reply-To: <59473315.5040802@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Shuah Khan <shuahkh@osg.samsung.com>, dri-devel@lists.freedesktop.org, airlied@linux.ie, linux-samsung-soc@vger.kernel.org

Hi Inki,

On Sun, Jun 18, 2017 at 8:12 PM, Inki Dae <inki.dae@samsung.com> wrote:
> Hi Shuah,
>
> 2017=EB=85=84 06=EC=9B=94 17=EC=9D=BC 05:16=EC=97=90 Shuah Khan =EC=9D=B4=
(=EA=B0=80) =EC=93=B4 =EA=B8=80:
>> On 06/16/2017 08:16 AM, Shuah Khan wrote:
>>> Hi Inki,
>>>
>>> On Fri, Jun 16, 2017 at 1:50 AM, Inki Dae <inki.dae@samsung.com> wrote:
>>>> It doesn't need to try to find a bridge if bridge node doesn't exist.
>>>>
>>>> Signed-off-by: Inki Dae <inki.dae@samsung.com>
>>>> ---
>>>>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 8 +++++---
>>>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm=
/exynos/exynos_drm_dsi.c
>>>> index d404de8..e337cd2 100644
>>>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>>> @@ -1687,9 +1687,11 @@ static int exynos_dsi_bind(struct device *dev, =
struct device *master,
>>>>                 return ret;
>>>>         }
>>>>
>>>> -       bridge =3D of_drm_find_bridge(dsi->bridge_node);
>>>
>>> This is more of question than comment. I am seeing in some places,
>>> such as mtk_dpi_probe(), of_node_put() is called right after
>>> of_drm_find_bridge() whether or not bridge_node is found.
>>>
>>> In this case, of_node_put() is done from exynos_dsi_remove() which look=
s
>>> correct to me.
>>>
>>> However, there is the discrepancy. One of these is incorrect perhaps?
>>> When is the right time to call of_node_put()?
>
> No problem but seems more reasonable to call of_node_put() right after of=
_drm_find_bridge() because there is no reason to keep bridge_node after bin=
ding it.
> Could you clean up this?
>
> Thanks,
> Inki Dae

Yes I will take care of cleaning this up.

thanks,
-- Shuah

>
>>>
>>>> -       if (bridge)
>>>> -               drm_bridge_attach(encoder, bridge, NULL);
>>>> +       if (dsi->bridge_node) {
>>>> +               bridge =3D of_drm_find_bridge(dsi->bridge_node);
>>>> +               if (bridge)
>>>> +                       drm_bridge_attach(encoder, bridge, NULL);
>>>> +       }
>>>>
>>>>         return mipi_dsi_host_register(&dsi->dsi_host);
>>>>  }
>>>> --
>>>> 1.9.1
>>>
>>> Looks good to me.
>>>
>>> Reviewed-by: Shuah Khan <shuahkh@osg.samsung.com>
>>>
>>
>> I tested this on odroid-xu4
>>
>> Tested-by: Shuah Khan <shuahkh@osg.samsung.com>
>>
>> thanks,
>> -- Shuah
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-=
soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>
>>
