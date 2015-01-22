From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v4 9/9] drm/exynos: add support for 'hdmi' clock
Date: Thu, 22 Jan 2015 13:51:11 +0100
Message-ID: <54C0F23F.3030804@collabora.co.uk>
References: <1421756219-21037-1-git-send-email-m.szyprowski@samsung.com> <1421756219-21037-10-git-send-email-m.szyprowski@samsung.com> <54BE4F8E.50605@collabora.co.uk> <54C0EFEB.6080201@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:35628 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751130AbbAVMvS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Jan 2015 07:51:18 -0500
In-Reply-To: <54C0EFEB.6080201@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Kukjin Kim <kgene@kernel.org>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, jy0922.shim@samsung.com, kyungmin.park@samsung.com

Hello Marek,

On 01/22/2015 01:41 PM, Marek Szyprowski wrote:
>>>   
>>> +	mixer_res->hdmi = devm_clk_get(dev, "hdmi");
>> You need to update the Documentation/devicetree/bindings/video/exynos_mixer.txt
>> DT binding docs to also mention the "hdmi" clock in the list of clocks.
> 
> Right, I've send an updated version of the patch.
>

Great thanks.
 
>> But as I mentioned in "[PATCH v2 0/6] Enable HDMI support on Exynos platforms"
>> thread, while this seems to be enough to prevent the issue on Exynos4 is not
>> enough on the Exynos5420/5422/5800 boards I've tested.
>>
>> So I wonder if $subject is fixing the root cause or just fixing a symptom and
>> the cause is that the exynos_hdmi DPMS handler has to be executed before the
>> exynos_mixer DPMS handler for DRM_MODE_DPMS_ON like is the case for DPMS_OFF
>> after commit 245f98f269714 ("drm/exynos: hdmi: fix power order issue").
> 
> I'm aware of the issues with Exynos542x, I've tested it with Odroid XU3, 
> but I
> really have no idea how to fix it. The reference manual (both for power 
> domain
> and mixer/hdmi modules) also doesn't provide any useful information for this
> case.
>

Yeah, I'm in the same situation. All the documentation I had access to doesn't
now explain what's happening.
 
> The issue with power on/off sequence definitely IS related to clock 
> configuration,
> but we didn't figure out how to solve it in a generic way. This will be 
> handled in
> Exynos HDMI and mixer drivers anyway, so the DTS part (at least for 
> Exynos4 SoC)
> will not change.
>
> We would really like to have HDMI support for Exynos4 merged, especially 
> that the
> first version of the HDMI patches was posted in v3.16 times and now we 
> are close
> to v3.20 -next merge window end...
>

Sorry, I didn't mean to imply that $subject should be blocked. I agree with
you that the power on/off sequence has to be fixed in the hdmi and mixer
drivers and is orthogonal to the DTS changes. That's why I also decided to
finally post my "Add HDMI support for Exynos5420 platform" [0] series too.

> Best regards
> 

Best regards,
Javier

[0]: https://lkml.org/lkml/2015/1/20/235
