From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: drm: exynos: mixer: fix using usleep() in atomic context
Date: Mon, 01 Dec 2014 17:16:17 +0100
Message-ID: <7454d0630d95195d41c3906637e223af@math.uni-bielefeld.de>
References: <1417307725-5975-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1417307725-5975-2-git-send-email-tjakobi@math.uni-bielefeld.de>
 <20141201155447.GE11943@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:60423 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752874AbaLAQQU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Dec 2014 11:16:20 -0500
In-Reply-To: <20141201155447.GE11943@ulmo.nvidia.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, Tomasz Stanislawski <t.stanislaws@samsung.com>, dri-devel@lists.freedesktop.org

On 2014-12-01 16:54, Thierry Reding wrote:
> On Sun, Nov 30, 2014 at 01:35:25AM +0100, tjakobi@math.uni-bielefeld.de 
> wrote:
>> From: Tomasz Stanislawski <t.stanislaws@samsung.com>
>> 
>> This patch fixes calling usleep_range() after taking reg_slock
>> using spin_lock_irqsave(). The mdelay() is used instead.
>> Waiting in atomic context is not the best idea in general.
>> Hopefully, waiting occurs only when Video Processor fails
>> to reset correctly.
>> 
>> Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
>> ---
>>  drivers/gpu/drm/exynos/exynos_mixer.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c 
>> b/drivers/gpu/drm/exynos/exynos_mixer.c
>> index a41c84e..cc7cccc 100644
>> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
>> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
>> @@ -632,7 +632,7 @@ static void vp_win_reset(struct mixer_context 
>> *ctx)
>>  		/* waiting until VP_SRESET_PROCESSING is 0 */
>>  		if (~vp_reg_read(res, VP_SRESET) & VP_SRESET_PROCESSING)
>>  			break;
>> -		usleep_range(10000, 12000);
>> +		mdelay(10);
>>  	}
>>  	WARN(tries == 0, "failed to reset Video Processor\n");
>>  }
> 
> I can't see a reason why you would need to hold the lock around this
> code. Perhaps a better way to fix this would be to drop the lock before
> calling vp_win_reset()?
> 
> Thierry

Hmm, I'm pretty new to spinlocks (only have worked with the usual mutex 
stuff in userspace), but wouldn't that mean that it is then possible for 
mixer_win_reset to execute while a (previous) vp_win_reset is still 
running?

With best wishes,
Tobias
