From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 3/7] ARM: SAMSUNG: Add SPI clock definitions for SAMSUNG SoCs
Date: Thu, 30 Jun 2011 15:13:09 +0530
Message-ID: <BANLkTi=u7hrqZwo2kCp-iNgnwWUcw_uBog@mail.gmail.com>
References: <1309436723-662-1-git-send-email-padma.v@samsung.com>
	<1309436723-662-4-git-send-email-padma.v@samsung.com>
	<20110630093024.GT21898@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:40508 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752310Ab1F3JnL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Jun 2011 05:43:11 -0400
Received: by bwd5 with SMTP id 5so1675510bwd.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jun 2011 02:43:09 -0700 (PDT)
In-Reply-To: <20110630093024.GT21898@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Padmavathi Venna <padma.v@samsung.com>, kgene.kim@samsung.com, sbkim73@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Thu, Jun 30, 2011 at 3:00 PM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Thu, Jun 30, 2011 at 08:25:19AM -0400, Padmavathi Venna wrote:
>> SPI Clocks were defined in dev-spi.c of machine specific folder.
>> To make SPI devices common across all SoCs,dev-spi.c is moved
>> from machine specific folder to plat-samsung. So SPI clock
>> definitions has been moved from dev-spi.c to SoC specific machine
>> folder for S3C64XX,S5P64X0,S5PC100 and S5PV210
>
> This just shows how sick the Samsung code is by abusing the clk API.
> If it stopped that abuse and switched over to clkdev none of this would
> be necessary.
I am anyways not for the patch set.
Though this 'sickness' predates clkdev, and I agree it should be changed now.
