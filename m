From: Marc Zyngier <maz@misterjones.org>
Subject: Re: [PATCH 2/3] drm/exynos: fimd: add HW trigger support
Date: Tue, 31 May 2016 16:18:01 +0100
Message-ID: <62a251beb1b54fff34019c3cd4595984@www.loen.fr>
References: <1459844864-12065-1-git-send-email-inki.dae@samsung.com>
 <1459844864-12065-3-git-send-email-inki.dae@samsung.com>
 <a8e410dd-ef60-f8cd-f4ea-cf60414db5bd@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from inca-roads.misterjones.org ([213.251.177.50]:51133 "EHLO
	inca-roads.misterjones.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754803AbcEaPbr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 May 2016 11:31:47 -0400
In-Reply-To: <a8e410dd-ef60-f8cd-f4ea-cf60414db5bd@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org, airlied@linux.ie, linux-samsung-soc@vger.kernel.org, marc.zyngier@arm.com

On 2016-05-30 23:58, Javier Martinez Canillas wrote:
> Hello Inki,
>
> On 04/05/2016 04:27 AM, Inki Dae wrote:
>> This patch adds HW trigger support on i80 mode.
>>
>> Until now, Exynos DRM only supported SW trigger which was set
>> SWTRGCMD bit of TRIGCON register by CPU to transfer scanout
>> buffer to Display bus device or panel.
>>
>> With this patch, the transmission to Display bus device or
>> panel will be initiated by FIMD controller.
>>
>> Signed-off-by: Inki Dae <inki.dae@samsung.com>
>> ---
>
> There is a regression for the Exynos5800 Peach Pi Chromebook display 
> due
> this patch. The display is blank and I noticed that it only happens 
> when
> HW start trigger is enabled, but works with SW trigger (as it was 
> before).
>
> So for example with the following diff on top of v4.7-rc1, display 
> works
> again. Do you have any hints about what could be the issue?
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index 0444d7fc400d..8c62830e9514 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -171,7 +171,7 @@ static struct fimd_driver_data
> exynos5420_fimd_driver_data = {
>  	.lcdblk_vt_shift = 24,
>  	.lcdblk_bypass_shift = 15,
>  	.lcdblk_mic_bypass_shift = 11,
> -	.trg_type = I80_HW_TRG,
>  	.has_shadowcon = 1,
>  	.has_vidoutcon = 1,
>  	.has_vtsel = 1,
>
> Best regards,

On a related note, my Exynos5250 Chromebook (snow) has stopped working 
as well since -rc1 has landed. I haven't had time to bisect it yet, but 
the symptoms are vaguely similar (bright white screen).

I'm happy to test patches.

Thanks,

         M.
-- 
Who you jivin' with that Cosmik Debris?
