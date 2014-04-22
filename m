From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V2 9/9] drm/exynos: Add ps8622 lvds bridge discovery to DP driver
Date: Tue, 22 Apr 2014 22:50:43 +0530
Message-ID: <CAEC9eQP8azYPN7cbAcbxg==2LjmFzDa0ci7U+0UDvV3y0E6gpA@mail.gmail.com>
References: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
	<1398119958-32005-10-git-send-email-ajaykumar.rs@samsung.com>
	<20140422092743.GB22133@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f169.google.com ([209.85.220.169]:55764 "EHLO
	mail-vc0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932199AbaDVRUo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Apr 2014 13:20:44 -0400
Received: by mail-vc0-f169.google.com with SMTP id ik5so3080839vcb.28
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Apr 2014 10:20:43 -0700 (PDT)
In-Reply-To: <20140422092743.GB22133@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>

Hi Thierry,


On Tue, Apr 22, 2014 at 2:57 PM, Thierry Reding
<thierry.reding@gmail.com> wrote:
> On Tue, Apr 22, 2014 at 04:09:18AM +0530, Ajay Kumar wrote:
>> This patch adds ps8622 lvds bridge discovery code to the dp driver.
>>
>> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>> ---
>> Changes since V1:
>>       Pushing V1 for this as V2 because this patch holds good in this series.
>>
>>  drivers/gpu/drm/exynos/exynos_dp_core.c |    9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
>> index 4853f31..0006412 100644
>> --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
>> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
>> @@ -30,6 +30,7 @@
>>  #include <drm/drm_crtc_helper.h>
>>  #include <drm/drm_panel.h>
>>  #include <drm/bridge/ptn3460.h>
>> +#include <drm/bridge/ps8622.h>
>>
>>  #include "exynos_drm_drv.h"
>>  #include "exynos_dp_core.h"
>> @@ -999,7 +1000,15 @@ static int exynos_drm_attach_lcd_bridge(struct drm_device *dev,
>>                               panel);
>>               if (!ret)
>>                       return 1;
>> +     } else if (find_bridge("parade,ps8625", &bridge)) {
>
> So this is where the inspiration for the of_find_compatible_node() in
> the earlier patch came from.
>
I shall use phandle for that as suggested by you for previous patches.

>> +             ret = ps8622_init(dev, encoder, bridge.client, bridge.node,
>> +                             panel);
>
> Long-term I don't think this is going to scale very well. In my opinion
> it would be much more useful to have the bridge driver initialize what
> it can and then have the DRM driver call a generic initialization
> function to bind it to the DRM device or encoder. Otherwise we have to
> keep knowledge about the type of bridge in each driver that uses it,
> whereas the goal (I think) would be to create a proper abstraction so
> that the DRM driver doesn't have to know that kind of detail.
Well, having a generic initialization function makes more sense when
we have multiple platforms supporting the 2 available bridge chips.
Then we can let the bridge chip initialize first, and then call a drm_bridge
search and bind function to search the bridge_list to find the bridge which has
already got registered.
But, this again poses a challenge that the bridge chip driver should
be probed before
the corresponding drm_encoder is trying to bind the bridge with
drm_device/encoder.

So, I think the current way of explicitly calling bridgeXXX_init is
fine, at least
till multiple platforms start keeping track of all possible bridges
they support,
inside their respective drivers.

Thanks and regards,
Ajay Kumar
