From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH RESEND v3] ARM: s3c2442: Setup gpio {set,get}_pull callbacks
Date: Tue, 30 Nov 2010 16:33:04 +0200
Message-ID: <201011301633.05545.anarsoul@gmail.com>
References: <000201cb8fae$4d61fd20$e825f760$%kim@samsung.com> <201011301401.44973.anarsoul@gmail.com> <4CF4F845.7010207@metafoo.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f194.google.com ([209.85.215.194]:49834 "EHLO
	mail-ey0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750936Ab0K3Odc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Nov 2010 09:33:32 -0500
Received: by eya28 with SMTP id 28so1359322eya.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Nov 2010 06:33:31 -0800 (PST)
In-Reply-To: <4CF4F845.7010207@metafoo.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>, 'Russell King' <linux@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Abdoulaye Walsimou GAYE' <awg@embtoolkit.org>

On Tuesday 30 November 2010 15:12:37 Lars-Peter Clausen wrote:

> Hi
> 
> While this might work for setting the pullup, what to you want to return in
> get_pull?

Some custom value like S3C_GPIO_PULL_ENABLED?
 
> The reason why s3c24xx_gpiocfg_default needs to have {get,set}_pull set at
> compile time is that the board init code is called before the cpu init
> code. Which is in my opinion a bit odd and should be fixed instead.

That's because cpu init code is arch_initcall. Kernel calls mdesc-
>init_machine before any arch_initcall function, not sure if it can be fixed 
without massive rework of existing code.

> If it is not fixed for whatever reason we could fallback to using some sort
> of "cpu_is_s3c2442() ? S3C_GPIO_PULL_UP : S3C_GPIO_PULL_DOWN"

AFAIK, Ben does not like runtime CPUtype checks

Regards
Vasily
