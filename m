From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V2 4/9] drm/exynos: add exynos_dp_panel driver
 registration to drm driver
Date: Tue, 22 Apr 2014 20:33:23 +0530
Message-ID: <CAEC9eQPGfFFRNF4nOgci8KCc+9E=MQRmU-Cz=TGgEdiaOVqTMg@mail.gmail.com>
References: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
	<1398119958-32005-5-git-send-email-ajaykumar.rs@samsung.com>
	<20140422083311.GC17275@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f173.google.com ([209.85.220.173]:60250 "EHLO
	mail-vc0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932828AbaDVPDY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Apr 2014 11:03:24 -0400
Received: by mail-vc0-f173.google.com with SMTP id il7so2770544vcb.32
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Apr 2014 08:03:23 -0700 (PDT)
In-Reply-To: <20140422083311.GC17275@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>

Hi Thierry,

On Tue, Apr 22, 2014 at 2:03 PM, Thierry Reding
<thierry.reding@gmail.com> wrote:
> On Tue, Apr 22, 2014 at 04:09:13AM +0530, Ajay Kumar wrote:
>> Register exynos_dp_panel before the list of exynos crtcs and
>> connectors are probed.
>>
>> This is needed because exynos_dp_panel should be registered to
>> the drm_panel list via panel-exynos-dp probe, i.e much before
>> exynos_dp_bind calls of_drm_find_panel().
>>
>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>> ---
>> Changes since V1:
>>       Added platform_driver_unregister(&exynos_dp_panel_driver) to
>>       exynos_drm_platform_remove as per Jingoo Han's correction
>>
>>  drivers/gpu/drm/exynos/exynos_drm_drv.c |   15 +++++++++++++++
>>  drivers/gpu/drm/exynos/exynos_drm_drv.h |    1 +
>>  2 files changed, 16 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
>> index 1d653f8..2db7f67 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
>> @@ -530,12 +530,23 @@ static int exynos_drm_platform_probe(struct platform_device *pdev)
>>               goto err_unregister_ipp_drv;
>>  #endif
>>
>> +#ifdef CONFIG_DRM_PANEL_EXYNOS_DP
>> +     ret = platform_driver_register(&exynos_dp_panel_driver);
>> +     if (ret < 0)
>> +             goto err_unregister_dp_panel;
>> +#endif
>
> No, this is not how you're supposed to use DRM panel drivers. The idea
> is that you write a standalone driver for a given panel.
>
> What you do here has a number of problems. For one it's a driver that's
> tightly coupled to Exynos SoCs. But if I have a different SoC that uses
> the same panel I want to be able to use the same driver, and not have to
> rewrite the driver for my SoC.
>
> Another problem is that you're assuming here that the driver is built in
> and it will break if you try to build either Exynos DRM or the panel
> driver as a module. This is perhaps nothing you care about right now,
> but eventually people will want to ship a single kernel that can run on
> a number of SoCs. But if we keep adding things like this, that kernel
> will keep growing in size until it no longer fits in any kind of memory.
>
> Thierry

I completely agree with you in this!

Yes, this is not acceptable, but I want to know an "acceptable"
workaround for the situation below:
I register the driver using module_init().
And, exynos_drm gets probed much before the panel driver probe happens.
So, the panel driver hasn't probed yet, but exynos_dp via exynos_drm
tries to call
"of_drm_find_panel" which always returns NULL.

Thanks and regards,
Ajay Kumar
