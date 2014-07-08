From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 4/6] pinctrl: exynos: Lock GPIOs as interrupts when used as
 EINTs
Date: Tue, 08 Jul 2014 12:50:59 +0200
Message-ID: <53BBCD13.7020902@samsung.com>
References: <1404315664-3174-1-git-send-email-t.figa@samsung.com>
 <1404315664-3174-5-git-send-email-t.figa@samsung.com>
 <CACRpkdYD=6iV0qFRQrAf2TJc7tg=m2ZEr6SvhruEwsGQLzskSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:62221 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753645AbaGHKve (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Jul 2014 06:51:34 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N8E00KFL3HF9580@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 08 Jul 2014 11:51:15 +0100 (BST)
In-reply-to: <CACRpkdYD=6iV0qFRQrAf2TJc7tg=m2ZEr6SvhruEwsGQLzskSA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>

Hi Linus,

On 08.07.2014 11:03, Linus Walleij wrote:
> On Wed, Jul 2, 2014 at 5:41 PM, Tomasz Figa <t.figa@samsung.com> wrote:
> 
>> Currently after configuring a GPIO pin as an interrupt related pinmux
>> registers are changed, but there is no protection from calling
>> gpio_direction_*() in a badly written driver, which would cause the same
>> pinmux register to be reconfigured for regular input/output and this
>> disabling interrupt capability of the pin.
>>
>> This patch addresses this issue by moving pinmux reconfiguration to
>> .irq_startup() callback of irq_chip and calling gpio_lock_as_irq()
>> helper to prevent reconfiguration of pin direction.
>>
>> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> (...)
>> +               .irq_startup = exynos_irq_startup,
>> +               .irq_shutdown = exynos_irq_shutdown,
> 
> I think you should be using the
> .irq_request_resources and .irq_release_resources callbacks instead.
> 
> The reason is that startup and shutdown cannot really fail (ret code
> is unsigned...), so using the other callbacks is safer.

Hmm, I used the at91 pinctrl driver as an example, but I agree that
request/release_resources would be better. I guess it should be changed
there as well. [Ccing Jean-Jacques and Jean-Christophe]

> 
> Can you have a quick look at this before I apply any more of the
> Samsung patches?

The two remaining patches are pretty much independent from this one and
rest of this series so please take a look at them while I prepare new
version of this patch.

Best regards,
Tomasz
