From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v3 0/6] ARM: EXYNOS: Add secure firmware support
Date: Mon, 12 Nov 2012 09:55:30 +0000
Message-ID: <20121112095530.GF28327@n2100.arm.linux.org.uk>
References: <1351178560-19188-1-git-send-email-t.figa@samsung.com> <006501cdc0a8$d880c990$89825cb0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:40711 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750736Ab2KLJzi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Nov 2012 04:55:38 -0500
Content-Disposition: inline
In-Reply-To: <006501cdc0a8$d880c990$89825cb0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Tomasz Figa' <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, arnd@arndb.de, olof@lixom.net, m.szyprowski@samsung.com, tomasz.figa@gmail.com

On Mon, Nov 12, 2012 at 04:39:28PM +0900, Kukjin Kim wrote:
> (+ Russell King)

I think there's still an amount of work to do here; it's not a generic
interface at the moment because it makes some assumptions about how
things are done (eg, it assumes that there _will_ be a CPU boot register;
that is not always true.

Moreover, the 'cpu' arguments given seem to be uncertain whether they're
logical CPU numbers or physical CPU numbers.

Lastly, where is this interface actually documented?  It's just a bunch
of code _without_ _any_ documentation.  That means people will interpret
it differently, and it'll get used differently from platform to platform.

Let's have some documentation on this.
