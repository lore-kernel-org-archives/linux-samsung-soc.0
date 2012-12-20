From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH] gpio: samsung: remove exynos_gpio_cfg
Date: Thu, 20 Dec 2012 10:13:54 +0900
Message-ID: <50D26652.1020205@samsung.com>
References: <1355481842-17952-1-git-send-email-jy0922.shim@samsung.com>
 <20121219222255.49E263E0AD6@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:21442 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752207Ab2LTBNj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Dec 2012 20:13:39 -0500
In-reply-to: <20121219222255.49E263E0AD6@localhost>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linus.walleij@linaro.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com

Hi Grant,

On 12/20/2012 07:22 AM, Grant Likely wrote:
> On Fri, 14 Dec 2012 19:44:01 +0900, Joonyoung Shim <jy0922.shim@samsung.com> wrote:
>> The exynos_gpio_cfg can be substituted to samsung_gpio_cfgs[8].
>>
>> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
> Hi Joonyoung,
>
> I need some help here. I don't understand what this patch is for or how
> it works. The commit text above doesn't give me enough information to
> evaluate the patch. What is the intent here? Why is samsung_gpio_cfgs[8]
> more correct than exynos_gpio_cfg?

First, i just wondered why samsung_gpio_cfgs[8] is used in the
exynos4_gpios_2[] even if exynos_gpio_cfg is exist and found
samsung_gpio_cfgs[8] does same thing with exynos_gpio_cfg. The
exynos_gpio_cfg is used only for Exynos SoCs so it is compiled by #if
defined(CONFIG_ARCH_EXYNOS4) || defined(CONFIG_ARCH_EXYNOS5).
I think one can be removed because they are duplicated codes and it is
better to decrease use of #if defined.

Thanks.

> g.
>
>
