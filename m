From: han jonghun <jonghun79.han@gmail.com>
Subject: Re: [PATCH 3/4] s3c-fb: Add support S5PV310 FIMD
Date: Mon, 25 Oct 2010 16:10:11 +0900
Message-ID: <AANLkTimRKmHXF9oxY6od0GVKAsUFYqgmwoytqqR+jLjg@mail.gmail.com>
References: <1287406528-15324-1-git-send-email-sbkim73@samsung.com>
	<1287406528-15324-4-git-send-email-sbkim73@samsung.com>
	<003001cb6f5e$5db43050$191c90f0$%szyprowski@samsung.com>
	<003301cb70d2$60ae4d70$220ae850$%han@samsung.com>
	<010b01cb70dc$8d35cb20$a7a16160$%dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:63695 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752618Ab0JYHKN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Oct 2010 03:10:13 -0400
In-Reply-To: <010b01cb70dc$8d35cb20$a7a16160$%dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Jonghun Han <jonghun.han@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-fbdev@vger.kernel.org, akpm@linux-foundation.org, kgene.kim@samsung.com, ben-linux@fluff.org, kyungmin.park@samsung.com

Hi,

Thanks for comment.

[snip]
>> >
>> > I don't think that the driver is the right place to change the parent of
>> > the sclk_fimd
>> > clock. It should be done in the boot loader or the board startup code.
>> >
>>
>> As you know, there are two clock sources for LCD pixel clock.
>> s3c-fb only used 'lcd' clock as a parent of LCD pixel clock.
>> But from S5PV310 SCLK_FIMD is only used as a source of LCD pixel clock.
>> And SCLK_FIMD is only for FIMD. So the parent of the SCLK_FIMD can be
>> selected in the driver.
>> In my opinion it doesn't matter.
>>
>
> Parent clock is specific to machine
> because machines could have different type of lcd panel each other and
> any parent clocks for FIMD could be used according to the lcd panel.
> So for stable pixel clock setting, parent clock should be set
> at machine specific code and FIMD driver should preserve just clock gating.
>
Right. Parent clock is specific to machine.
But as you know, 'mout_mpll' can cover almost LCD pixel clock.
If other parent clock is needed, I'll get the parent clock or
separator via platform data from board file.
It is better than setting parent clock in board file at the point of
samsung mainline scheme.

BRs,
