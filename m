From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 1/4] ARM: SAMSUNG: cleanup of rtc register definitions
Date: Wed, 4 Jan 2012 22:14:27 +0000
Message-ID: <20120104221427.GL11810@n2100.arm.linux.org.uk>
References: <201112211014.30695.heiko@sntech.de> <201201041512.55126.heiko@sntech.de> <201201041514.57688.heiko@sntech.de> <201201041515.45025.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:43188 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757079Ab2ADWO7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Jan 2012 17:14:59 -0500
Content-Disposition: inline
In-Reply-To: <201201041515.45025.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, a.zummo@towertech.it, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, rtc-linux@googlegroups.com, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org

On Wed, Jan 04, 2012 at 03:15:44PM +0100, Heiko St=FCbner wrote:
> regs-rtc.h uses a mixture of tabs and spaces and also (x<<y)
> to format bits. So, before adding new stuff clean up the formatting
> and also add spaces to the bit definitions (i.e. (x << y) )

Ok, so this is just a formatting change - and it should stay that way.

However, there's an opportunity missed here.

Are these register definitions used anywhere else other than in the
drivers/rtc driver?  If not, they should be placed along side that
driver or even inside the driver itself.
