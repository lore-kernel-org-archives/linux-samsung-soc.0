From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: clock updates
Date: Fri, 25 Jun 2010 12:52:46 +0100
Message-ID: <20100625115246.GE2803@sirena.org.uk>
References: <20100623232422.GB16584@trinity.fluff.org>
 <000801cb142b$e6624420$b326cc60$%szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:50225 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751501Ab0FYLwx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jun 2010 07:52:53 -0400
Content-Disposition: inline
In-Reply-To: <000801cb142b$e6624420$b326cc60$%szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: 'Ben Dooks' <ben-linux@fluff.org>, 'Linux Samsung SoC' <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org

On Fri, Jun 25, 2010 at 08:01:45AM +0200, Marek Szyprowski wrote:

> I like this idea, but I wonder how the drivers will be able to get/control
> the additional peripheral clocks (like sclk_fimc and sclk_cam for fimc for
> example)?

You can still do lookups by name for multiple clocks with clkdev
(personally I prefer to just not make use of the option of using NULL
for a default clock since it's not always clear what the default should
be for a block but there we are).
