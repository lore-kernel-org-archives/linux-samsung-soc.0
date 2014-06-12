From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: Aw: Re: [PATCH] ARM: dts: Initial ODROID U2 support
Date: Thu, 12 Jun 2014 20:56:46 +0200
Message-ID: <5399F7EE.2050001@gmail.com>
References: <1402577077-7835-1-git-send-email-drake@endlessm.com>, <5399A526.6040303@samsung.com> <trinity-980edcd5-a3eb-42ff-b755-cea7c1c6cd0d-1402579141856@3capp-gmx-bs65>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:64364 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750716AbaFLS5F (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Jun 2014 14:57:05 -0400
Received: by mail-wi0-f180.google.com with SMTP id hi2so3513409wib.7
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Jun 2014 11:57:03 -0700 (PDT)
In-Reply-To: <trinity-980edcd5-a3eb-42ff-b755-cea7c1c6cd0d-1402579141856@3capp-gmx-bs65>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <Liquid.Acid@gmx.net>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Daniel Drake <drake@endlessm.com>, ben-linux@fluff.org, kgene.kim@samsung.com, prahal@yahoo.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Tobias,

On 12.06.2014 15:19, Tobias Jakobi wrote:
> Hello Marek,
> 
> since you pointed out HDMI support on the ODROID, I assume you've looked into that. I've posted about some issues with HDMI PHY and mixer some days ago here:
> http://www.spinics.net/lists/linux-samsung-soc/msg31643.html
> 
> Tomasz already suggested on IRC to CC some more people, who have worked in that area. Maybe you have an idea what is going wrong there?

Empirically we have managed to find that after bypassing the Video
Processor and using the Mixer alone [1], LCD0 power domain is no longer
needed for HDMI operation.

However there is still an issue with power-up and/or -down sequences
causing the whole system to hang when trying to power on and off HDMI
repeatedly. This is to be investigated yet.

[1] This can be achieved by setting .is_vp_enabled of
exynos4210_mxr_drv_data to 0, assuming that you have a patch applied
which adds appropriate compatible string to mixer_match_types[],
pointing to that struct.

Best regards,
Tomasz
