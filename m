From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 18/19] ARM: SAMSUNG: Remove remaining legacy code
Date: Wed, 16 Jul 2014 14:56:00 +0200
Message-ID: <53C67660.8050003@samsung.com>
References: <1404496099-26708-1-git-send-email-t.figa@samsung.com>
 <1404496099-26708-19-git-send-email-t.figa@samsung.com>
 <1405504062.4408.11.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:41876 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933666AbaGPM4k (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Jul 2014 08:56:40 -0400
In-reply-to: <1405504062.4408.11.camel@x220>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Mark Brown <broonie@kernel.org>, =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, Tomasz Figa <tomasz.figa@gmail.com>

On 16.07.2014 11:47, Paul Bolle wrote:
> On Fri, 2014-07-04 at 19:48 +0200, Tomasz Figa wrote:

[snip]

>>  config SAMSUNG_GPIO_EXTRA
>>  	int "Number of additional GPIO pins"
>>  	default 128 if SAMSUNG_GPIO_EXTRA128
> 
> So a second order effect is that SAMSUNG_GPIO_EXTRA can now be removed.
> Which implies that SAMSUNG_GPIO_EXTRA64 and SAMSUNG_GPIO_EXTRA128 can
> also be removed.
> 
> Should I submit the trivial patch to do that or is a patch already
> queued somewhere?

Please do if you don't mind. That's one more thing I missed.

Best regards,
Tomasz
