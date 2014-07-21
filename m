From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [RESEND PATCH V5 12/12] drm/exynos: Add ps8622 lvds bridge
 discovery to DP driver
Date: Mon, 21 Jul 2014 16:58:25 +0530
Message-ID: <CAEC9eQPkzrpQn41+zu8mwJUctSd0CF_U4UCdff0F7VYq2oWthw@mail.gmail.com>
References: <1405629839-12086-1-git-send-email-ajaykumar.rs@samsung.com>
	<1405629839-12086-13-git-send-email-ajaykumar.rs@samsung.com>
	<20140721071028.GB8843@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f170.google.com ([209.85.220.170]:43387 "EHLO
	mail-vc0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754157AbaGUL20 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Jul 2014 07:28:26 -0400
Received: by mail-vc0-f170.google.com with SMTP id lf12so11939208vcb.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Jul 2014 04:28:25 -0700 (PDT)
In-Reply-To: <20140721071028.GB8843@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, InKi Dae <inki.dae@samsung.com>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Javier Martinez Canillas <javier@dowhile0.org>, Rahul Sharma <rahul.sharma@samsung.com>

On Mon, Jul 21, 2014 at 12:40 PM, Thierry Reding
<thierry.reding@gmail.com> wrote:
> On Fri, Jul 18, 2014 at 02:13:58AM +0530, Ajay Kumar wrote:
>> From: Rahul Sharma <Rahul.Sharma@samsung.com>
>>
>> This patch adds ps8622 lvds bridge discovery code to the dp driver.
>>
>> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>> ---
>>  drivers/gpu/drm/exynos/exynos_dp_core.c |    5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
>> index 0ca6256..82e2942 100644
>> --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
>> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
>> @@ -31,6 +31,7 @@
>>  #include <drm/drm_panel.h>
>>  #include <drm/bridge/ptn3460.h>
>>  #include <drm/bridge/panel_binder.h>
>> +#include <drm/bridge/ps8622.h>
>>
>>  #include "exynos_drm_drv.h"
>>  #include "exynos_dp_core.h"
>> @@ -999,6 +1000,10 @@ static int exynos_drm_attach_lcd_bridge(struct exynos_dp_device *dp,
>>       if (find_bridge("nxp,ptn3460", &bridge)) {
>>               bridge_chain = ptn3460_init(dp->drm_dev, encoder, bridge.client,
>>                                                               bridge.node);
>> +     } else if (find_bridge("parade,ps8622", &bridge) ||
>> +                             find_bridge("parade,ps8625", &bridge)) {
>> +             bridge_chain = ps8622_init(dp->drm_dev, encoder, bridge.client,
>> +                                                             bridge.node);
>>       }
>
> We really ought to be adding some sort of registry at some point.
> Otherwise every driver that wants to use bridges needs to come up with a
> similar set of helpers to instantiate them.
>
> Also you're making this driver depend on (now) two bridges, whereas it
> really shouldn't matter which exact types it supports. Bridges should be
> exposed via a generic interface.

How about moving out the find_bridge() function into a common header file,
and also supporting the list of bridge_init declarations in the same file?

We get bridge chip node from phandle, and then pass the same node
to find_bridge() which searches the list using of_device_is_compatible()
to call the appropriate bridge_init function?

Ajay
