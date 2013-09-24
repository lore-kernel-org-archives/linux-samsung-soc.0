From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] pinctrl: Correct number of pins for s5pv210
Date: Tue, 24 Sep 2013 17:06:31 +0200
Message-ID: <2660734.r2Dp8L0F5K@amdc1227>
References: <1380035051-24526-1-git-send-email-m.krawczuk@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:61589 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751301Ab3IXPGo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Sep 2013 11:06:44 -0400
In-reply-to: <1380035051-24526-1-git-send-email-m.krawczuk@partner.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>
Cc: linus.walleij@linaro.org, thomas.abraham@linaro.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>

Hi Mateusz,

On Tuesday 24 of September 2013 16:35:07 Mateusz Krawczuk wrote:
> Values of pins in table s5pv210 bank are incorrect. This patch correct values.
> 
> Signed-off-by: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  drivers/pinctrl/pinctrl-exynos.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Acked-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz

P.S. Please be more careful next time when defining things like this.
