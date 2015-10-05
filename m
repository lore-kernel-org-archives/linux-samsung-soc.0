From: Pavel Fedin <p.fedin@samsung.com>
Subject: RE: [PATCH v2 0/7] Add support for Exynos SROM Controller driver
Date: Mon, 05 Oct 2015 16:18:46 +0300
Message-ID: <01cb01d0ff70$6027b760$20772620$@samsung.com>
References: <1440403348-8974-1-git-send-email-pankaj.dubey@samsung.com>
 <018501d0ff62$1650b410$42f21c30$@samsung.com> <5612719E.60006@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:28665 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751831AbbJENSy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Oct 2015 09:18:54 -0400
In-reply-to: <5612719E.60006@samsung.com>
Content-language: ru
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, 'Pankaj Dubey' <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: k.kozlowski.k@gmail.com, thomas.ab@samsung.com, kgene@kernel.org, heiko@sntech.de

 Hello!

> That is interesting. What do you mean by that? Although SROM controller
> can access external memory (SRAM, ROM) but it is not exactly a bus. How
> is the SMSC9111 "connected"? What interface or protocol is used?

 SROM controller actually provides a demultiplexed external address and data bus. This way you could
hook up old good ROM chip to it (hence its name). However, you can plug in there anything else with
the appropriate interface, and SMSC9111 uses exactly that. Just some address + control + data wires.
Therefore, you can think of SROMc as a simple bus.

> I am sorry but I cannot figure out what exactly are you talking about.
> The Device Tree is the glue to describe the board, the hardware and its
> configuration. Please elaborate a little more.

 Yes, exactly that. SROM controller has 4 outputs, and for every of these outputs you have to choose
mode and timings. Once you set them correctly, you can use peripherial behind them. These timings
actually depend on the actual peripherial.

 By this time i remembered that u-boot guys also did something with this. And here are links:
http://git.denx.de/?p=u-boot.git;a=blob;f=arch/arm/dts/exynos5250-smdk5250.dts;h=8b695442b1a29dec4e3
53ebd3cfee0ff89f218a6;hb=HEAD#l43 - this is how connection is described
http://git.denx.de/?p=u-boot.git;a=blob;f=board/samsung/common/board.c;h=d32c75de50858f131284e28db0c
7ed55883f1cb0;hb=HEAD#l184 - and this is parsing code

 There's only one small problem with their code. "bank" parameter is device-wide, therefore you
cannot configure more than one bank. For SMDK boards it's OK, but in future you may run into problem
with this.

Kind regards,
Pavel Fedin
Expert Engineer
Samsung Electronics Research center Russia
