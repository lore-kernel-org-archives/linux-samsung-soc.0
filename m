From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2] pinctrl: samsung: Fix memory mapping code
Date: Tue, 14 Mar 2017 15:28:14 +0100
Message-ID: <bfec244e-d522-432b-352d-4071ba09ef74@samsung.com>
References: <CGME20170223101244eucas1p2eddf13a013d66f9ccdbe45f410b5939c@eucas1p2.samsung.com>
 <20170222170202.heu35anyoziwv23n@kozik-lap>
 <1487844760-26272-1-git-send-email-a.hajda@samsung.com>
 <CACRpkdbWxRVf5aVJYFMzYEzY+UvK3-vk59U=dNdK113wYOpkOw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:20858 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752300AbdCNO20 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 14 Mar 2017 10:28:26 -0400
In-reply-to: <CACRpkdbWxRVf5aVJYFMzYEzY+UvK3-vk59U=dNdK113wYOpkOw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hi Linus,

On 14.03.2017 14:35, Linus Walleij wrote:
> On Thu, Feb 23, 2017 at 11:12 AM, Andrzej Hajda <a.hajda@samsung.com> wrote:
>
>> Some pinctrls share memory regions, and devm_ioremap_resource does not
>> allow to share resources, in opposition to devm_ioremap.
>> This patch restores back usage of devm_ioremap function, but with proper
>> error handling and logging.
>>
>> Fixes: baafaca ("pinctrl: samsung: Fix return value check in samsung_pinctrl_get_soc_data()")
>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>> ---
>> v2:
>> - added platform_get_resource error check (thanks to Krzysztof)
> This conflicts with the revert that Marek urged me to do for the
> fixes branch.
>
> Please check the resulting tree on my fixes branch and rebase on
> that.

I do not see your revert on fixes branch of [1].
The most recent patch is:
96e1ce8 pinctrl: uniphier: change pin names of aio/xirq for LD11

And on this branch my patch applies cleanly :)


Regards
Andrzej


[1]:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git

>
> Yours,
> Linus Walleij
>
>
>
