From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: Re: [BUG] broken mixer after second resume from mem
Date: Wed, 14 Oct 2015 08:50:23 +0200
Message-ID: <CAAObsKCubVgXTCdLJOZZ3nSXZjdL3G9SjWWuVYPcxLgh5poV6g@mail.gmail.com>
References: <561CDC33.7050103@collabora.com> <561DEE43.5040309@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:38093 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750845AbbJNGuo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Oct 2015 02:50:44 -0400
In-Reply-To: <561DEE43.5040309@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Javier Martinez Canillas <javier@dowhile0.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Daniel Stone <daniel.stone@collabora.co.uk>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 14 October 2015 at 07:55, Krzysztof Kozlowski
<k.kozlowski@samsung.com> wrote:
> On 13.10.2015 19:25, Tomeu Vizoso wrote:
>> Hi,
>>
>> have been hunting down a bug on exynos5250-snow which caused both HDMI
>> and LVDS output to be broken after the second resume (with suspend to
>> mem, but not to idle).
>>
>> What I have found is that when powering down the DISP1 power domain
>> while suspending for the second time, the contents of the SRC_TOP3
>> register change from 0x1110550 to 0x1110500. IIUIC, this means that
>> ACLK_200_DISP1 is reparented to XXTI.
>>
>> When the CPU comes up again, that register contains 0x1110550 again, but
>> it's set to 0x1110500 by the code that restores clk registers when resuming:
>>
>> First suspend:
>>
>> exynos_pd_power: SRC_TOP3 1110550 disp1-power-domain@100440A0 - before
>> exynos_pd_power: SRC_TOP3 1110550 disp1-power-domain@100440A0 - after
>> exynos5250_clk_suspend: SRC_TOP3 1110550
>> exynos5250_clk_resume: SRC_TOP3 1110550 - before
>> exynos5250_clk_resume: SRC_TOP3 1110550 - after
>> exynos_pd_power: SRC_TOP3 1110550 disp1-power-domain@100440A0 - before
>> exynos_pd_power: SRC_TOP3 1110550 disp1-power-domain@100440A0 - after
>>
>>
>> Second suspend:
>>
>> exynos_pd_power: SRC_TOP3 1110550 disp1-power-domain@100440A0 - before
>> exynos_pd_power: SRC_TOP3 1110500 disp1-power-domain@100440A0 - after
>> exynos5250_clk_suspend: SRC_TOP3 1110500
>> exynos5250_clk_resume: SRC_TOP3 1110550 - before
>> exynos5250_clk_resume: SRC_TOP3 1110500 - after
>> exynos_pd_power: SRC_TOP3 1110500 disp1-power-domain@100440A0 - before
>> exynos_pd_power: SRC_TOP3 1110500 disp1-power-domain@100440A0 - after
>>
>
> I am assuming you are talking about current linux-next. The actual
> reparent happens in exynos_pd_power which would indicate the exynos pd
> clock reparenting code. However the domains for Exynos5250 don't have
> any clocks set up for reparenting... which actually might be the issue.
> These clocks should be probably reparented - as it is done for other
> platforms - look at 5420 example (they are glitch-free on both of SoCs).
>
> I've seen a such issues before. The problem is that after some time I
> tend to forget the needed workaround and solution. :)
>
> Try with reparenting necessary clocks. On other platform for some kind
> of similar issue the reset was required for the IP block - DECON
> (actually the mux could not stabilize there which can be observed in one
> of STATUS registers for mux).
>
> Let me know if explanation above is not detailed enough.

Thanks for the reply, I looked at downstream and saw that two clocks
are being reparented and that seems to fix things. Will send a patch
later today.

Regards,

Tomeu

>> I have no idea of why it happens on the second suspend, and also don't
>> know why it doesn't happen when suspending to idle.
>
> As for the idle - domains are probably not gated so the problems just
> does not exist.
>
> BTW as this is display, you can CC some Samsung guys from DRM... they
> know a lot on these stuff. :)
>
> Best regards,
> Krzysztof
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
