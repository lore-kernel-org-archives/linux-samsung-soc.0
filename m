From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: exynos4-dt: Set .smp field of machine descriptor
Date: Mon, 22 Oct 2012 08:44:47 +0900
Message-ID: <CAH9JG2W-Tg5ZwzwuXg3-56KhiLwQS3rGktweRG8XwdVMda=HBg@mail.gmail.com>
References: <1350035378-31989-1-git-send-email-t.figa@samsung.com>
	<2064474.beoN9hr7Vi@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:61055 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751560Ab2JUXos (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 21 Oct 2012 19:44:48 -0400
Received: by mail-wi0-f178.google.com with SMTP id hr7so1887475wib.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Oct 2012 16:44:47 -0700 (PDT)
In-Reply-To: <2064474.beoN9hr7Vi@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc: Tomasz Figa <t.figa@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, m.szyprowski@samsung.com, thomas.abraham@linaro.org

+ Arnd, Olof,

Tomasz,
I think it's better to add arm-soc maintainers at CC when send the patches.
Samsung patches doesn't handled or merged with proper time.

Thank you,
Kyungmin Park

On 10/22/12, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> On Friday 12 of October 2012 11:49:38 Tomasz Figa wrote:
>> This patch adds missing initializer of .smp field of machine descriptor
>> of Exynos 4 DT machine.
>>
>> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
>> ---
>>  arch/arm/mach-exynos/mach-exynos4-dt.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm/mach-exynos/mach-exynos4-dt.c
>> b/arch/arm/mach-exynos/mach-exynos4-dt.c index 7222e3c..d6bdcfb 100644
>> --- a/arch/arm/mach-exynos/mach-exynos4-dt.c
>> +++ b/arch/arm/mach-exynos/mach-exynos4-dt.c
>> @@ -119,6 +119,7 @@ static char const *exynos4_dt_compat[] __initdata =
>> {
>>
>>  DT_MACHINE_START(EXYNOS4210_DT, "Samsung Exynos4 (Flattened Device
>> Tree)") /* Maintainer: Thomas Abraham <thomas.abraham@linaro.org> */
>> +	.smp		= smp_ops(exynos_smp_ops),
>>  	.init_irq	= exynos4_init_irq,
>>  	.map_io		= exynos4_dt_map_io,
>>  	.handle_irq	= gic_handle_irq,
>
> Ping. I think this should be considered a fix.
>
> Best regards,
> Tomasz Figa
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
