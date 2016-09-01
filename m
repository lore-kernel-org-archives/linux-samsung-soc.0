From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] pinctrl: samsung: Remove an always false dev->of_node test
Date: Thu, 01 Sep 2016 14:09:49 +0200
Message-ID: <a7a4ea81-2a95-2d5c-2c82-fd710386b61e@samsung.com>
References: <1472731140-18034-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:28448 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932516AbcIAMJy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 1 Sep 2016 08:09:54 -0400
In-reply-to: <1472731140-18034-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, linus.walleij@linaro.org
Cc: tomasz.figa@gmail.com, b.zolnierkie@samsung.com, linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org

On 09/01/2016 01:59 PM, Sylwester Nawrocki wrote:
> samsung_pinctrl_probe() can be called only after matching
> the driver by the compatible string so this already implies
> a non null dev->of_node.  Remove the always false test
> and related error trace. While at it drop another error log
> in case of memory allocation failure - any errors are logged
> by the memory subsystem.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  drivers/pinctrl/samsung/pinctrl-samsung.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
