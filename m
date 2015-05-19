From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: drm/exynos: Add atomic modesetting support
Date: Tue, 19 May 2015 19:27:46 +0200
Message-ID: <933513a3ff2090c9ec2921e8cb71effb@math.uni-bielefeld.de>
References: <10cea26ae89c8bf2f26c2d258dcabd3a@math.uni-bielefeld.de>
 <20150518195101.GA18856@joana>
 <CAPj87rOnseYOzPqetbxKpq7_4855Vup2cySzZJmz8JejBHFPMw@mail.gmail.com>
 <20150518210239.GB18856@joana>
 <182ac8915516e85d964fca30afa1702a@math.uni-bielefeld.de>
 <CAPj87rM-oNsqb+=7HyJ4k7GMJA80nfq_AwYVx5ct1J7hYL12PA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:35875 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752107AbbESR1s (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 May 2015 13:27:48 -0400
In-Reply-To: <CAPj87rM-oNsqb+=7HyJ4k7GMJA80nfq_AwYVx5ct1J7hYL12PA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Stone <daniel@fooishbar.org>
Cc: Gustavo Padovan <gustavo@padovan.org>, InKi Dae <inki.dae@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, liquid.acid@gmx.net

OK,

so Daniel helped me track down this issue. It came from an incorrect 
'clock-frequency' entry in my DTS. The freq was 500000. Daniel 
recommended 70600000 which works 'fine' (and according to modetest 
produces a 59Hz mode). I say 'fine' because I can't confirm that FIMD is 
actually working. I just see that with that change I no longer get any 
div-by-zeros in the kernel.

So fimd_calc_clkdiv needs some sanitizing for 'ideal_clk' at least.

What still bothers me though is the fact that FIMD actually gets 
enabled. I'm just calling 'modetest -M exynos', so it's just doing 
probing. Why does that trigger dpms?

With best wishes,
Tobias



On 2015-05-19 16:06, Daniel Stone wrote:
> Hi Tobias,
> 
> On 19 May 2015 at 14:53, Tobias Jakobi <tjakobi@math.uni-bielefeld.de> 
> wrote:
>> On 2015-05-18 23:02, Gustavo Padovan wrote:
>>> So better try this. Ideally fimd_mode_fixup should go away too, I'll 
>>> do a
>>> proper
>>> patch once we know this works.
>>> 
>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>>> b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>>> index 12ab80c..363353b 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>>> @@ -307,9 +307,17 @@ static void fimd_iommu_detach_devices(struct
>>> fimd_context *ctx)
>>>  static u32 fimd_calc_clkdiv(struct fimd_context *ctx,
>>>                 const struct drm_display_mode *mode)
>>>  {
>>> -       unsigned long ideal_clk = mode->htotal * mode->vtotal *
>>> mode->vrefresh;
>>> +       unsigned long ideal_clk;
>>> +       int vrefresh;
>>>         u32 clkdiv;
>>> 
>>> +       if (mode->vrefresh == 0)
>>> +               vrefresh = drm_mode_vrefresh(mode);
>>> +       else
>>> +               vrefresh = mode->vrefresh;
>>> +
>>> +       ideal_clk =  mode->htotal * mode->vtotal * vrefresh;
>>> +
>>>         if (ctx->i80_if) {
>>>                 /*
>>>                  * The frame done interrupt should be occurred prior 
>>> to
>>> the
>> 
>> I've applied this and the debug output patch, but I still get a 
>> div-by-zero.
> 
> Can you please add a drm_mode_debug_printmodeline(mode) and give the
> output there?
> 
> Cheers,
> Daniel
