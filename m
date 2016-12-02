From: Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH] drm/bridge: analogix: Don't return -EINVAL when panel not
 support PSR in PSR functions
Date: Fri, 2 Dec 2016 11:03:09 -0500
Message-ID: <CAOw6vbJTRLu6mTWXWNBmhhgxmkK-szgnUY_bZ+es5PKnjetiXw@mail.gmail.com>
References: <1480645942-29912-1-git-send-email-wzz@rock-chips.com> <b9e49431-5680-8a03-557a-b9c5b8307737@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f169.google.com ([209.85.161.169]:34849 "EHLO
        mail-yw0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754950AbcLBQDg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 2 Dec 2016 11:03:36 -0500
Received: by mail-yw0-f169.google.com with SMTP id i145so220807748ywg.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 02 Dec 2016 08:03:36 -0800 (PST)
Received: from mail-yw0-f175.google.com (mail-yw0-f175.google.com. [209.85.161.175])
        by smtp.gmail.com with ESMTPSA id j140sm2072830ywg.36.2016.12.02.08.03.30
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Dec 2016 08:03:31 -0800 (PST)
Received: by mail-yw0-f175.google.com with SMTP id r204so220354973ywb.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 02 Dec 2016 08:03:30 -0800 (PST)
In-Reply-To: <b9e49431-5680-8a03-557a-b9c5b8307737@codeaurora.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Archit Taneja <architt@codeaurora.org>
Cc: zain wang <wzz@rock-chips.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, David Airlie <airlied@linux.ie>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Mika Kahola <mika.kahola@intel.com>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>, Tomasz Figa <tfiga@chromium.org>, Doug Anderson <dianders@chromium.org>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-rockchip@lists.infradead.org

On Thu, Dec 1, 2016 at 10:54 PM, Archit Taneja <architt@codeaurora.org> wrote:
> Hi,
>
> On 12/02/2016 08:02 AM, zain wang wrote:
>>
>> We will ignored PSR setting if panel not support it. So, in this case, we
>> should
>> return from analogix_dp_enable/disable_psr() without any error code.
>> Let's retrun 0 instead of -EINVAL when panel not support PSR in
>> analogix_dp_enable/disable_psr().
>>
>> Signed-off-by: zain wang <wzz@rock-chips.com>
>> ---
>>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> index 6e0447f..0cb3695 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> @@ -112,7 +112,7 @@ int analogix_dp_enable_psr(struct device *dev)
>>         struct edp_vsc_psr psr_vsc;
>>
>>         if (!dp->psr_support)
>> -               return -EINVAL;
>> +               return 0;
>
>
> Looking at the rockchip analogix dp code, in analogix_dp_psr_set, the worker
> that calls
> analogix_dp_enable/disable_psr isn't even if psr isn't enabled. So, the
> bridge funcs
> shouldn't be called in the first place. I think the error handling is fine
> to have
> here.
>

Hi Archit,

This was my first impression, too, and the complexity of the various
psr abstraction layers don't help :)

However, this code path will be hit if the source supports psr, but
the sink doesn't. The rockchip_drm_psr code doesn't know if the sink
supports psr, so it will end up calling this.

Sean


>>
>>         /* Prepare VSC packet as per EDP 1.4 spec, Table 6.9 */
>>         memset(&psr_vsc, 0, sizeof(psr_vsc));
>> @@ -135,7 +135,7 @@ int analogix_dp_disable_psr(struct device *dev)
>>         struct edp_vsc_psr psr_vsc;
>>
>>         if (!dp->psr_support)
>> -               return -EINVAL;
>> +               return 0;
>>
>>         /* Prepare VSC packet as per EDP 1.4 spec, Table 6.9 */
>>         memset(&psr_vsc, 0, sizeof(psr_vsc));
>> @@ -878,6 +878,8 @@ static void analogix_dp_commit(struct
>> analogix_dp_device *dp)
>>         dp->psr_support = analogix_dp_detect_sink_psr(dp);
>>         if (dp->psr_support)
>>                 analogix_dp_enable_sink_psr(dp);
>> +       else
>> +               dev_warn(dp->dev, "Sink not support PSR\n");
>
>
> This doesn't seem beneficial either. There seems to be a debug
> print already in analogix_dp_detect_sink_psr which reports PSR
> related info.
>
> Archit
>
>>  }
>>
>>  /*
>>
>
> --
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
