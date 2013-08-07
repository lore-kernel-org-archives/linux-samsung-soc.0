From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/3] clk: exynos4: Make exynos4_plls static
Date: Wed, 7 Aug 2013 08:51:49 +0530
Message-ID: <CAK9yfHxKn9JaA5Tbuw9qXeyEX_kio4mt3gOgJxkMNSoDHkHnBQ@mail.gmail.com>
References: <1375788675-2638-1-git-send-email-sachin.kamat@linaro.org>
	<20130806200219.GD23006@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f42.google.com ([209.85.219.42]:38316 "EHLO
	mail-oa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756894Ab3HGDVu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Aug 2013 23:21:50 -0400
Received: by mail-oa0-f42.google.com with SMTP id i18so2395932oag.29
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Aug 2013 20:21:49 -0700 (PDT)
In-Reply-To: <20130806200219.GD23006@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, mturquette@linaro.org, patches@linaro.org, Joe Perches <joe@perches.com>

+CC Joe Perches

On 7 August 2013 01:32, Russell King - ARM Linux <linux@arm.linux.org.uk> wrote:
> Also note:
>
> On Tue, Aug 06, 2013 at 05:01:13PM +0530, Sachin Kamat wrote:
>> @@ -984,7 +984,7 @@ static __initdata struct of_device_id ext_clk_match[] = {
>
> For the declaration above...
>
>> -struct __initdata samsung_pll_clock exynos4_plls[nr_plls] = {
>> +static struct __initdata samsung_pll_clock exynos4_plls[nr_plls] = {
>
> And this one... __initdata should come just before the '=', not at the
> start, not in the middle and not before the variable.
>
> The reasoning is that with how you have it above, the attributes are
> applied to the structure.  You want to apply the attributes to the
> declaration instead, so it should come after the variable name.
>
> So, for example:
>
>         struct foo *foo __attribute__((section(".foo"))) = (void *)1;
>
> will place the "foo" variable into a section called ".foo", but:
>
>         struct __attribute__((section(".foo"))) foo *foo = (void *)1;
>
> will place "foo" into the normal .data section.
>
> So, the rule with variable declarations is that the __ specifiers we
> have as macros in the kernel always come after the variable name being
> declared and nowhere else.  We consider anywhere else buggy.

Thanks for this useful tip, Russell. There are several instances in
the kernel where these attributes are used at the beginning of the
variable declaration.

Probably it would be useful to add this to checkpatch. Joe?

-- 
With warm regards,
Sachin
