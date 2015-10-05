From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 0/7] Add support for Exynos SROM Controller driver
Date: Mon, 5 Oct 2015 21:48:30 +0900
Message-ID: <5612719E.60006@samsung.com>
References: <1440403348-8974-1-git-send-email-pankaj.dubey@samsung.com>
 <018501d0ff62$1650b410$42f21c30$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:36541 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751501AbbJEMsg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Oct 2015 08:48:36 -0400
In-Reply-To: <018501d0ff62$1650b410$42f21c30$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pavel Fedin <p.fedin@samsung.com>, 'Pankaj Dubey' <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: k.kozlowski.k@gmail.com, thomas.ab@samsung.com, kgene@kernel.org, heiko@sntech.de

W dniu 05.10.2015 o 20:36, Pavel Fedin pisze:
>  Hello!
> 
>> This patch set adds support for Exynos SROM controller DT based driver.
>> Currently SROM register sets are used only during S2R, so driver
>> basically added for taking care of S2R. It will help us in removing
>> static mapping from exynos.c and other extra code handline during S2R.
> 
>  Very good news, but, your driver seems not to do anything except suspend/resume. But how do i add
> some device plugged into it? In order to be operational, its outputs have to be configured. But how
> do i do it with your driver? For example, on SMDK boards SROM controller is used to connect SMSC9111
> etherner chip.

That is interesting. What do you mean by that? Although SROM controller
can access external memory (SRAM, ROM) but it is not exactly a bus. How
is the SMSC9111 "connected"? What interface or protocol is used?

>  Currently i use hardcoded initialization based on of_machine_is_compatible(), but i believe this
> would be considered a hack and such a thing cannot be pushed upstream. I guess i have to put all
> needed configuration into device tree somehow. But how? Are there any recommentations?

I am sorry but I cannot figure out what exactly are you talking about.
The Device Tree is the glue to describe the board, the hardware and its
configuration. Please elaborate a little more.

Best regards,
Krzysztof
