From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [RFC 0/6] pinctrl: samsung: Remove static platform-specific data
Date: Mon, 24 Sep 2012 11:34:12 -0600
Message-ID: <50609994.8040005@wwwdotorg.org>
References: <1348131197-25506-1-git-send-email-t.figa@samsung.com> <505CB4A3.9050707@wwwdotorg.org> <3531529.1enE84BHSJ@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:54667 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757174Ab2IXReQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Sep 2012 13:34:16 -0400
In-Reply-To: <3531529.1enE84BHSJ@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Tomasz Figa <t.figa@samsung.com>, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, devicetree-discuss@lists.ozlabs.org, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, thomas.abraham@linaro.org, linus.walleij@linaro.org, m.szyprowski@samsung.com

On 09/21/2012 01:31 PM, Tomasz Figa wrote:
> On Friday 21 of September 2012 12:40:35 Stephen Warren wrote:
>> On 09/20/2012 02:53 AM, Tomasz Figa wrote:
>>> This RFC series is a work on replacing static platform-specific data in
>>> pinctrl-samsung driver with data dynamically parsed from device tree.
...
>>> It aims at reducing the SoC-specific part of the driver and thus the
>>> amount of modifications to driver sources when adding support for next
>>> SoCs (like Exynos4x12).
>>>
>>> Furthermore, moving definitions of pin banks to device tree will allow
>>> to simplify GPIO and GEINT specification to a format similar to used
>>> previously by gpiolib-based implementation, using a phandle to the bank
>>> and pin index inside the bank, e.g.
>>>
>>> 	gpios = <&gpa1 4 0>;
>>> 	interrupt-parent = <&gpa1>;
>>> 	interrupts = <4 0>;
>>
>> I don't think those two are correlated; the GPIO specifier format could
>> just as easily be <bank pin> irrespective of whether the pinctrl driver
>> contains SoC-specific tables or not.
> 
> Correct me if I'm wrong, but each bank needs to have its own subnode to be 
> able to address pins like this. That was the starting point of the whole 
> series and the idea that if all the banks (which are SoC-specific) have to 
> be defined anyway, maybe it wouldn't be too bad to put all the SoC-specific 
> parameters there too.

If you write your own custom .xlate function, I think you can do
basically anything you want; all of the following are possible, I believe:

a) Single DT node covering all banks, with GPIO specifier being <n>
where n is some linearized GPIO ID across all banks.

b) Single DT node covering all banks, with GPIO specifier being <b n>
where b is the bank number, and n is the GPIO ID within the bank (xlate
would presumably calculate "(b * MAX_GPIOS_PER_BANK) + n" and up with
the same data as in (a) above.

c) One DT node per bank, one gpio_chip registered per node, with the
GPIO specifier being <n> where n is the GPIO ID within the bank the
phandle points at.

d) One DT node per bank, all contained within a single parent DT node,
one gpio_chip registered per node (one for each bank node, and one for
the parent node), with GPIO phandles pointing at the parent node, with
GPIO specifier in the format of either (a) or (b) above, and the
top-level node's .xlate returning a different gpio_chip (for one of the
child bank-specific nodes) rather than the parent chip. At least, IIRC,
Grant Likely was going to extend a gpio_chip's .xlate to be able to
return a different chip; I'm not sure if that was implemented yet or not.
