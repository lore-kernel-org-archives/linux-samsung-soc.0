From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH 18/19] ARM: SAMSUNG: Remove remaining legacy code
Date: Thu, 17 Jul 2014 12:10:44 +0200
Message-ID: <1405591844.4808.30.camel@x220>
References: <1404496099-26708-1-git-send-email-t.figa@samsung.com>
	 <1404496099-26708-19-git-send-email-t.figa@samsung.com>
	 <1405504062.4408.11.camel@x220> <53C67660.8050003@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cpsmtpb-ews06.kpnxchange.com ([213.75.39.9]:54001 "EHLO
	cpsmtpb-ews06.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932118AbaGQKKq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Jul 2014 06:10:46 -0400
In-Reply-To: <53C67660.8050003@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Mark Brown <broonie@kernel.org>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Tomasz Figa <tomasz.figa@gmail.com>

Tomasz,

On Wed, 2014-07-16 at 14:56 +0200, Tomasz Figa wrote:
> On 16.07.2014 11:47, Paul Bolle wrote: 
> > So a second order effect is that SAMSUNG_GPIO_EXTRA can now be removed.
> > Which implies that SAMSUNG_GPIO_EXTRA64 and SAMSUNG_GPIO_EXTRA128 can
> > also be removed.
> > 
> > Should I submit the trivial patch to do that or is a patch already
> > queued somewhere?
> 
> Please do if you don't mind. That's one more thing I missed.

I got lucky! Commit ab275b132a79 ("ARM: s5p: cut the custom
ARCH_NR_GPIOS definition") was added to next-20140717 which does just
that.

The strange thing is that it is dated "Jun 3 2104". I don't know what
happened there but I have little reason to find that out.

Thanks,


Paul Bolle
