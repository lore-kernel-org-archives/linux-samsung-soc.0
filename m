From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [BUG] broken mixer after second resume from mem
Date: Wed, 14 Oct 2015 14:55:15 +0900
Message-ID: <561DEE43.5040309@samsung.com>
References: <561CDC33.7050103@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <561CDC33.7050103@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>, javier@dowhile0.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Daniel Stone <daniel.stone@collabora.co.uk>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 13.10.2015 19:25, Tomeu Vizoso wrote:
> Hi,
> 
> have been hunting down a bug on exynos5250-snow which caused both HDMI
> and LVDS output to be broken after the second resume (with suspend to
> mem, but not to idle).
> 
> What I have found is that when powering down the DISP1 power domain
> while suspending for the second time, the contents of the SRC_TOP3
> register change from 0x1110550 to 0x1110500. IIUIC, this means that
> ACLK_200_DISP1 is reparented to XXTI.
> 
> When the CPU comes up again, that register contains 0x1110550 again, but
> it's set to 0x1110500 by the code that restores clk registers when resuming:
> 
> First suspend:
> 
> exynos_pd_power: SRC_TOP3 1110550 disp1-power-domain@100440A0 - before
> exynos_pd_power: SRC_TOP3 1110550 disp1-power-domain@100440A0 - after
> exynos5250_clk_suspend: SRC_TOP3 1110550
> exynos5250_clk_resume: SRC_TOP3 1110550 - before
> exynos5250_clk_resume: SRC_TOP3 1110550 - after
> exynos_pd_power: SRC_TOP3 1110550 disp1-power-domain@100440A0 - before
> exynos_pd_power: SRC_TOP3 1110550 disp1-power-domain@100440A0 - after
> 
> 
> Second suspend:
> 
> exynos_pd_power: SRC_TOP3 1110550 disp1-power-domain@100440A0 - before
> exynos_pd_power: SRC_TOP3 1110500 disp1-power-domain@100440A0 - after
> exynos5250_clk_suspend: SRC_TOP3 1110500
> exynos5250_clk_resume: SRC_TOP3 1110550 - before
> exynos5250_clk_resume: SRC_TOP3 1110500 - after
> exynos_pd_power: SRC_TOP3 1110500 disp1-power-domain@100440A0 - before
> exynos_pd_power: SRC_TOP3 1110500 disp1-power-domain@100440A0 - after
> 

I am assuming you are talking about current linux-next. The actual
reparent happens in exynos_pd_power which would indicate the exynos pd
clock reparenting code. However the domains for Exynos5250 don't have
any clocks set up for reparenting... which actually might be the issue.
These clocks should be probably reparented - as it is done for other
platforms - look at 5420 example (they are glitch-free on both of SoCs).

I've seen a such issues before. The problem is that after some time I
tend to forget the needed workaround and solution. :)

Try with reparenting necessary clocks. On other platform for some kind
of similar issue the reset was required for the IP block - DECON
(actually the mux could not stabilize there which can be observed in one
of STATUS registers for mux).

Let me know if explanation above is not detailed enough.

> I have no idea of why it happens on the second suspend, and also don't
> know why it doesn't happen when suspending to idle.

As for the idle - domains are probably not gated so the problems just
does not exist.

BTW as this is display, you can CC some Samsung guys from DRM... they
know a lot on these stuff. :)

Best regards,
Krzysztof
