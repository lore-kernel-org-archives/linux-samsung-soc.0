From: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Subject: Re: [PATCH] drm/exynos: Make exynos_drm_init() call late during the bootup
Date: Mon, 26 May 2014 11:09:52 +0530
Message-ID: <CAHfPSqBoh=RmavEsJPwb8Mp5Or_M64smUk8NEpO8aAJm5RU0GQ@mail.gmail.com>
References: <1400067585-31236-1-git-send-email-ch.naveen@samsung.com> <20140521154622.GO2014@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f49.google.com ([209.85.192.49]:44554 "EHLO
	mail-qg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751424AbaEZFkN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 May 2014 01:40:13 -0400
Received: by mail-qg0-f49.google.com with SMTP id a108so11176973qge.8
        for <linux-samsung-soc@vger.kernel.org>; Sun, 25 May 2014 22:40:13 -0700 (PDT)
In-Reply-To: <20140521154622.GO2014@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, dri-devel@lists.freedesktop.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, seanpaul@chromium.org, inki.dae@samsung.com, a.hajda@samsung.com

Hello Everyone,

On 21 May 2014 21:16, Thierry Reding <thierry.reding@gmail.com> wrote:
> On Wed, May 14, 2014 at 05:09:45PM +0530, Naveen Krishna Chatradhi wrote:
>> exynos_drm_init() does probing of various drivers like dp_panel,
>> hdmi, fimd, mixer, etc in an order and finally binds them together.
>>
>> Some of the drm devices (Eg: dp_panel) try to do regulator_get()
>> and enable few supplies during their probe.
>> Chances are that, these devices may get probed before the respective
>> supply/PMIC is hooked.  In such cases, dp_panel would continue with
>> "dummy regulator". Which is not what the system wants.
>>
>> Lets give the core connectivity and regulators modules some time
>> to hookup the supplies before Exynos DRM devices comes into picture.
>>
>> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
>> ---
>> This change is proposed after
>> 1. Discussing with I2C/SPI & DMA subsystem maintainers and Others
>>    @ https://lkml.org/lkml/2014/5/9/333
>>    Trying to change the I2C, SPI and DMA drivers as subsys_initcall()
>>    Which was strictly opposed, as a flaw was found in DRM subsystem.
>>
>> 2. -EPROBE_DEFER won't work well with the current sequency of
>>     platform_driver_register()s in exynos_drm_init()
>
> Then this is the problem that you need to fix. If the driver doesn't
> handle -EPROBE_DEFER properly then that means the driver is broken. No
> amount of initcall ordering can fix this for you.

We seem to have a problem with the probe sequencing and usage of _EPROBE_DEFER
in DRM.  Component way of registration doesnt seem to fix everything.

Inki Dae,
Is there any discussion or approach underway.
Anyone working on this.
>
> Thierry



-- 
Shine bright,
(: Nav :)
