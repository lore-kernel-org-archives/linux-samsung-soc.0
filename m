From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] ARM: dts: Add l2x0 device node for Exynos4-based boards
Date: Wed, 12 Feb 2014 15:03:55 +0530
Message-ID: <CAHbNUh0mbbwjuXCQKU6MaFLRoB9tq8wgrPchPOjCEkD07xz3qg@mail.gmail.com>
References: <1389084826-19827-1-git-send-email-tushar.behera@linaro.org>
	<52E15C27.3020104@samsung.com>
	<CAHbNUh3=RVj-40d++Qa9OORBS53==zKr6XKYhEKoDYLudwFoSg@mail.gmail.com>
	<52E252FD.7030908@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f54.google.com ([209.85.219.54]:57695 "EHLO
	mail-oa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751999AbaBLJd4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Feb 2014 04:33:56 -0500
Received: by mail-oa0-f54.google.com with SMTP id i4so10767157oah.27
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Feb 2014 01:33:56 -0800 (PST)
In-Reply-To: <52E252FD.7030908@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kgene Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Tomasz Figa <tomasz.figa@gmail.com>

On 24 January 2014 17:18, Tomasz Figa <t.figa@samsung.com> wrote:
>
>
> On 24.01.2014 05:44, Tushar Behera wrote:
>>
>> On 23 January 2014 23:45, Tomasz Figa <t.figa@samsung.com> wrote:
>>>
>>> Hi,
>>>
>>>
>>> On 07.01.2014 09:53, Tushar Behera wrote:
>>>>
>>>>
>>>> For Exynos4 platform, L2 cache initialization is done only if
>>>> a device node for l2x0 device exists.
>>>>
>>>> L2 cache initialization path is different when a board boots with
>>>> secure firmware. Since there are many Exynos4 based SoCs that boot
>>>> in secure mode, enabling this only for boards that don't boot with
>>>> secure firmware.
>>>>
>>>> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
>>>> ---
>>>>
>>>> Tested on Exynos4210-Origen board.
>>>>
>>>>    arch/arm/boot/dts/exynos4.dtsi                  |    8 ++++++++
>>>>    arch/arm/boot/dts/exynos4210-origen.dts         |    4 ++++
>>>>    arch/arm/boot/dts/exynos4210-smdkv310.dts       |    4 ++++
>>>>    arch/arm/boot/dts/exynos4210-trats.dts          |    4 ++++
>>>>    arch/arm/boot/dts/exynos4210-universal_c210.dts |    4 ++++
>>>>    arch/arm/boot/dts/exynos4412-odroidx.dts        |    4 ++++
>>>>    arch/arm/boot/dts/exynos4412-smdk4412.dts       |    4 ++++
>>>>    arch/arm/boot/dts/exynos4412-tiny4412.dts       |    4 ++++
>>>>    8 files changed, 36 insertions(+)
>>>
>>>
>>>
>>> Looks good. Unfortunately this is still going to break secure firmware
>>> enabled boards, because l2x0_of_init() does not check if the node is
>>> enabled.
>>>
>>
>> Is the following check in l2x0_of_init() not enough?
>>
>> 1002 |-------np = of_find_matching_node(NULL, l2x0_ids);
>> 1003 |-------if (!np)
>> 1004 |-------|-------return -ENODEV;
>
>
> It only looks for a matching node without checking its status property.
>

Hmm ... so in that case, will this work?

diff --git a/arch/arm/mm/cache-l2x0.c b/arch/arm/mm/cache-l2x0.c
index 7abde2ce..ebcab01 100644
--- a/arch/arm/mm/cache-l2x0.c
+++ b/arch/arm/mm/cache-l2x0.c
@@ -973,11 +973,17 @@ int __init l2x0_of_init(u32 aux_val, u32 aux_mask)
        struct device_node *np;
        const struct l2x0_of_data *data;
        struct resource res;
+       const char *status;

        np = of_find_matching_node(NULL, l2x0_ids);
        if (!np)
                return -ENODEV;

+       status = of_get_property(np, "status", NULL);
+       if (status)
+               if (strcmp(status, "okay"))
+                       return -ENODEV;
+
        if (of_address_to_resource(np, 0, &res))
                return -ENODEV;



-- 
Tushar Behera
