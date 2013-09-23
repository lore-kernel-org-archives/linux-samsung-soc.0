From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] DT: S5P: If detected device tree skip irq init
Date: Mon, 23 Sep 2013 14:32:40 +0200
Message-ID: <1623257.C2BrDo7kio@amdc1227>
References: <1379931222-29307-1-git-send-email-m.krawczuk@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:17292 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752988Ab3IWMcx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Sep 2013 08:32:53 -0400
In-reply-to: <1379931222-29307-1-git-send-email-m.krawczuk@partner.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, m.szyprowski@samsung.com, Kyungmin Park <kyungmin.park@samsung.com>

On Monday 23 of September 2013 12:13:42 Mateusz Krawczuk wrote:
> It prevents from executing code already called by device tree.

I'd say that it prevents from executing code handling things that, when 
booting with device tree, are already handled by other code, namely the 
pinctrl-exynos driver.

> 
> Signed-off-by: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/plat-samsung/s5p-irq-eint.c | 4 ++++
>  1 file changed, 4 insertions(+)

Otherwise, after fixing commit message:

Acked-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
