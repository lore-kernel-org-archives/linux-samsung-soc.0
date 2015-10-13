From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [BUG] broken mixer after second resume from mem
Date: Tue, 13 Oct 2015 12:25:55 +0200
Message-ID: <561CDC33.7050103@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:38455 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752519AbbJMK0B (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Oct 2015 06:26:01 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: javier@dowhile0.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Daniel Stone <daniel.stone@collabora.co.uk>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Hi,

have been hunting down a bug on exynos5250-snow which caused both HDMI
and LVDS output to be broken after the second resume (with suspend to
mem, but not to idle).

What I have found is that when powering down the DISP1 power domain
while suspending for the second time, the contents of the SRC_TOP3
register change from 0x1110550 to 0x1110500. IIUIC, this means that
ACLK_200_DISP1 is reparented to XXTI.

When the CPU comes up again, that register contains 0x1110550 again, but
it's set to 0x1110500 by the code that restores clk registers when resuming:

First suspend:

exynos_pd_power: SRC_TOP3 1110550 disp1-power-domain@100440A0 - before
exynos_pd_power: SRC_TOP3 1110550 disp1-power-domain@100440A0 - after
exynos5250_clk_suspend: SRC_TOP3 1110550
exynos5250_clk_resume: SRC_TOP3 1110550 - before
exynos5250_clk_resume: SRC_TOP3 1110550 - after
exynos_pd_power: SRC_TOP3 1110550 disp1-power-domain@100440A0 - before
exynos_pd_power: SRC_TOP3 1110550 disp1-power-domain@100440A0 - after


Second suspend:

exynos_pd_power: SRC_TOP3 1110550 disp1-power-domain@100440A0 - before
exynos_pd_power: SRC_TOP3 1110500 disp1-power-domain@100440A0 - after
exynos5250_clk_suspend: SRC_TOP3 1110500
exynos5250_clk_resume: SRC_TOP3 1110550 - before
exynos5250_clk_resume: SRC_TOP3 1110500 - after
exynos_pd_power: SRC_TOP3 1110500 disp1-power-domain@100440A0 - before
exynos_pd_power: SRC_TOP3 1110500 disp1-power-domain@100440A0 - after


I have no idea of why it happens on the second suspend, and also don't
know why it doesn't happen when suspending to idle.

Any ideas?

Thanks,

Tomeu
