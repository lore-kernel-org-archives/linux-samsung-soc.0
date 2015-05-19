From: Daniel Stone <daniel@fooishbar.org>
Subject: Re: drm/exynos: Add atomic modesetting support
Date: Tue, 19 May 2015 15:06:54 +0100
Message-ID: <CAPj87rM-oNsqb+=7HyJ4k7GMJA80nfq_AwYVx5ct1J7hYL12PA@mail.gmail.com>
References: <10cea26ae89c8bf2f26c2d258dcabd3a@math.uni-bielefeld.de>
	<20150518195101.GA18856@joana>
	<CAPj87rOnseYOzPqetbxKpq7_4855Vup2cySzZJmz8JejBHFPMw@mail.gmail.com>
	<20150518210239.GB18856@joana>
	<182ac8915516e85d964fca30afa1702a@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f174.google.com ([209.85.223.174]:34651 "EHLO
	mail-ie0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932468AbbESOGz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 May 2015 10:06:55 -0400
Received: by ieczm2 with SMTP id zm2so14454236iec.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 May 2015 07:06:54 -0700 (PDT)
In-Reply-To: <182ac8915516e85d964fca30afa1702a@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: Gustavo Padovan <gustavo@padovan.org>, InKi Dae <inki.dae@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, liquid.acid@gmx.net

Hi Tobias,

On 19 May 2015 at 14:53, Tobias Jakobi <tjakobi@math.uni-bielefeld.de> wrote:
> On 2015-05-18 23:02, Gustavo Padovan wrote:
>> So better try this. Ideally fimd_mode_fixup should go away too, I'll do a
>> proper
>> patch once we know this works.
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> index 12ab80c..363353b 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> @@ -307,9 +307,17 @@ static void fimd_iommu_detach_devices(struct
>> fimd_context *ctx)
>>  static u32 fimd_calc_clkdiv(struct fimd_context *ctx,
>>                 const struct drm_display_mode *mode)
>>  {
>> -       unsigned long ideal_clk = mode->htotal * mode->vtotal *
>> mode->vrefresh;
>> +       unsigned long ideal_clk;
>> +       int vrefresh;
>>         u32 clkdiv;
>>
>> +       if (mode->vrefresh == 0)
>> +               vrefresh = drm_mode_vrefresh(mode);
>> +       else
>> +               vrefresh = mode->vrefresh;
>> +
>> +       ideal_clk =  mode->htotal * mode->vtotal * vrefresh;
>> +
>>         if (ctx->i80_if) {
>>                 /*
>>                  * The frame done interrupt should be occurred prior to
>> the
>
> I've applied this and the debug output patch, but I still get a div-by-zero.

Can you please add a drm_mode_debug_printmodeline(mode) and give the
output there?

Cheers,
Daniel
