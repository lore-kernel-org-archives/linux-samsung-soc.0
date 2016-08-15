From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] pinctrl: exynos: remove duplicate calls in irq handler
Date: Mon, 15 Aug 2016 18:59:41 +0200
Message-ID: <20160815165941.GA3769@kozik-lap>
References: <1471256227-6282-1-git-send-email-strongbox8@zoho.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:34712 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752713AbcHOQ7q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Aug 2016 12:59:46 -0400
Content-Disposition: inline
In-Reply-To: <1471256227-6282-1-git-send-email-strongbox8@zoho.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: perr <strongbox8@zoho.com>
Cc: tomasz.figa@gmail.com, k.kozlowski@samsung.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, kgene@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Aug 15, 2016 at 06:17:07PM +0800, perr wrote:
> Because chained_irq_enter() has already called chip->irq_mask() and
> chip->irq_ack(), also chained_irq_exit() will call chip->irq_unmask(),
> so it's not necessary to call chip->irq_*() here.
> 
> Signed-off-by: perr <strongbox8@zoho.com>
> 
> ---
>  drivers/pinctrl/samsung/pinctrl-exynos.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>


Looks correct so for the patch itself:
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

However, your name "Perr" confuses me a little bit. For the
Signed-off-by statement, as mentioned in
Documentation/SubmittingPatches, a real name is required. The name
should match the author.

Would you be so kind as to use a full, real name? Unless Perr is your
full, real name... then sorry for the trouble.

Best regards,
Krzysztof
