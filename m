From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH 04/19] serial: samsung: Remove support for legacy clock
 code
Date: Wed, 16 Jul 2014 16:26:07 +0200
Message-ID: <1405520767.4408.39.camel@x220>
References: <1404496099-26708-1-git-send-email-t.figa@samsung.com>
	 <1404496099-26708-5-git-send-email-t.figa@samsung.com>
	 <1405502840.4408.2.camel@x220> <53C67386.5070401@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cpsmtpb-ews04.kpnxchange.com ([213.75.39.7]:56985 "EHLO
	cpsmtpb-ews04.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S934390AbaGPO0K (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Jul 2014 10:26:10 -0400
In-Reply-To: <53C67386.5070401@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Mark Brown <broonie@kernel.org>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Tomasz Figa <tomasz.figa@gmail.com>

On Wed, 2014-07-16 at 14:43 +0200, Tomasz Figa wrote:
> On 16.07.2014 11:27, Paul Bolle wrote:
> > There are three further references to CONFIG_SAMSUNG_CLOCK in this file.
> > Those should be removed too, shouldn't they?
> 
> That's right. Apparently I missed them. I guess that's not critical,
> though, and could be done in separate patch, right?

This is not critical at all, so that's fine with me. 


Paul Bolle
