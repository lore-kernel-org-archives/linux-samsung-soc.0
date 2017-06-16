From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: Re: [PATCH] drm/exynos: dsi: do not try to find bridge
Date: Fri, 16 Jun 2017 14:16:42 -0600
Message-ID: <7c884e71-9da3-2106-07e4-b0a717cbad66@osg.samsung.com>
References: <CGME20170616075016epcas5p34938dd82d07390a03e7690f1634e9229@epcas5p3.samsung.com>
 <1497599415-4327-1-git-send-email-inki.dae@samsung.com>
 <CAKocOOM9RZkYvHOtrBXQeT7S=zCx4PY5QRJ-NXkp-GSvioMuZg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:36812
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1750797AbdFPUQw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Jun 2017 16:16:52 -0400
In-Reply-To: <CAKocOOM9RZkYvHOtrBXQeT7S=zCx4PY5QRJ-NXkp-GSvioMuZg@mail.gmail.com>
Content-Language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Shuah Khan <shuahkhan@gmail.com>, dri-devel@lists.freedesktop.org, airlied@linux.ie, linux-samsung-soc@vger.kernel.org, Shuah Khan <shuahkh@osg.samsung.com>

On 06/16/2017 08:16 AM, Shuah Khan wrote:
> Hi Inki,
> 
> On Fri, Jun 16, 2017 at 1:50 AM, Inki Dae <inki.dae@samsung.com> wrote:
>> It doesn't need to try to find a bridge if bridge node doesn't exist.
>>
>> Signed-off-by: Inki Dae <inki.dae@samsung.com>
>> ---
>>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 8 +++++---
>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> index d404de8..e337cd2 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> @@ -1687,9 +1687,11 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
>>                 return ret;
>>         }
>>
>> -       bridge = of_drm_find_bridge(dsi->bridge_node);
> 
> This is more of question than comment. I am seeing in some places,
> such as mtk_dpi_probe(), of_node_put() is called right after
> of_drm_find_bridge() whether or not bridge_node is found.
> 
> In this case, of_node_put() is done from exynos_dsi_remove() which looks
> correct to me.
> 
> However, there is the discrepancy. One of these is incorrect perhaps?
> When is the right time to call of_node_put()?
> 
>> -       if (bridge)
>> -               drm_bridge_attach(encoder, bridge, NULL);
>> +       if (dsi->bridge_node) {
>> +               bridge = of_drm_find_bridge(dsi->bridge_node);
>> +               if (bridge)
>> +                       drm_bridge_attach(encoder, bridge, NULL);
>> +       }
>>
>>         return mipi_dsi_host_register(&dsi->dsi_host);
>>  }
>> --
>> 1.9.1
> 
> Looks good to me.
> 
> Reviewed-by: Shuah Khan <shuahkh@osg.samsung.com>
> 

I tested this on odroid-xu4

Tested-by: Shuah Khan <shuahkh@osg.samsung.com>

thanks,
-- Shuah
