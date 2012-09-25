From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [RFC 6/6] ARM: dts: exynos4210: Add platform-specific descriptions
 for pin controllers
Date: Tue, 25 Sep 2012 16:52:39 -0600
Message-ID: <506235B7.7020507@wwwdotorg.org>
References: <1348131197-25506-1-git-send-email-t.figa@samsung.com> <6920043.WDO1laKTfY@flatron> <5061F64B.5@wwwdotorg.org> <1634883.GDdJlvHhnl@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:51089 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751309Ab2IYWwm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Sep 2012 18:52:42 -0400
In-Reply-To: <1634883.GDdJlvHhnl@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Tomasz Figa <t.figa@samsung.com>, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, devicetree-discuss@lists.ozlabs.org, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, thomas.abraham@linaro.org, linus.walleij@linaro.org, m.szyprowski@samsung.com

On 09/25/2012 12:35 PM, Tomasz Figa wrote:
> On Tuesday 25 of September 2012 12:22:03 Stephen Warren wrote:
...
>> BTW, how does the driver know what register addresses to use; I can see
>> the base for each pin controller bank is in samsung,pctl-offset, but
>> what describes the offset for each of the func, pud, drv, ... registers
>> from there? Are the offsets the same for all current Samsung SoCs?
> 
> The offsets are defined as constants in the driver.
> 
> They are the same in all cases, but the "4bit2" bank type of S3C64xx, which 
> can have up to 16 pins with 4-bit function specifiers, so two registers are 
> required for function configuration. In this case all the remaining 
> registers are offset by 0x04.
> 
> I couldn't think about any good solution for this special case, but still, 
> I haven't been thinking a lot about it, as the driver is targetted at 
> current Exynos SoCs primarily.

I suppose if you always assume that the registers will appear in a
specific order, and never have gaps between them, then you can simply
always calculate the addresses as e.g.:

reg_func = reg_base
reg_pud = reg_func + round_up(num_pins / (32 / func_width))
reg_drv = reg_pud + round_up(num_pins / (32 / func_width))
...

Then, there wouldn't ever be any special cases - that calculation would
always work.

An alternative would be to put each register's address in DT rather than
just the base of the register block. It'd certainly be more
future-flexible, even if not strictly necessary.
