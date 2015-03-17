From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH 0/3] ARM: dts: Define stdout-patch for Exynos Chromebooks
Date: Wed, 18 Mar 2015 00:28:04 +0900
Message-ID: <55084804.8000108@kernel.org>
References: <1426501710-24177-1-git-send-email-javier.martinez@collabora.co.uk> <075601d06054$d94e6fa0$8beb4ee0$@kernel.org> <2791862.CZRe5DtPad@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:32866 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753451AbbCQP2K (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Mar 2015 11:28:10 -0400
In-Reply-To: <2791862.CZRe5DtPad@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kukjin Kim <kgene@kernel.org>, 'Javier Martinez Canillas' <javier.martinez@collabora.co.uk>, 'Olof Johansson' <olof@lixom.net>, 'Doug Anderson' <dianders@chromium.org>, 'Andreas Faerber' <afaerber@suse.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On 03/17/15 14:27, Arnd Bergmann wrote:
> On Tuesday 17 March 2015 10:51:13 Kukjin Kim wrote:
>> Javier Martinez Canillas wrote:
>>>
>>> The kernel can use as the default console a serial port if is defined
>>> as stdout device in the Device Tree.
>>>
>>> This allows a board to be booted without the need of having a console
>>> parameter in the kernel command line.
>>>
>>> This small series add a stdout-path property for Exynos5 Chromebooks and
>>> is composed of the following patches:
>>>
>>> Javier Martinez Canillas (3):
>>>   ARM: dts: Define stdout-path property for Peach boards
>>>   ARM: dts: Define stdout-path property for Snow board
>>>   ARM: dts: Define stdout-path property for Spring board
>>>
>>>  arch/arm/boot/dts/exynos5250-snow.dts      | 1 +
>>>  arch/arm/boot/dts/exynos5250-spring.dts    | 1 +
>>>  arch/arm/boot/dts/exynos5420-peach-pit.dts | 4 ++++
>>>  arch/arm/boot/dts/exynos5800-peach-pi.dts  | 4 ++++
>>>  4 files changed, 10 insertions(+)
>>>
>> + Arnd
>>
>> Basically, I have no objection to add stdout-path property on board DT but I
>> need to ask other ARM guys how they think about? Always I'm questioned what
>> should be defined in bootloader before entering kernel and IMHO kernel can do
>> it, it should be defined in bootloader though 
>>
>> Let's wait for other opinions...
>>
> 
> We're trying to do this on all machines now so we can replace
> debug_ll with earlycon for any normal use case aside from early
> early boot debugging.
> 
> Please merge this patch set.
> 
OK, got it. Applied.

Thanks,
Kukjin
