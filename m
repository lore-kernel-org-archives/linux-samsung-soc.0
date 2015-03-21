From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 10/10] ARM: s3c64xx: allow building without board
	support
Date: Sat, 21 Mar 2015 17:17:36 +0000
Message-ID: <20150321171736.GF23705@opensource.wolfsonmicro.com>
References: <1425299763-4066822-1-git-send-email-arnd@arndb.de> <1425299763-4066822-11-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:41069 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751532AbbCURRh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 21 Mar 2015 13:17:37 -0400
Content-Disposition: inline
In-Reply-To: <1425299763-4066822-11-git-send-email-arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, padma.v@samsung.com, dmitry.torokhov@gmail.com, Maurus Cuelenaere <mcuelenaere@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Tomasz Figa <tomasz.figa@gmail.com>, cw00.choi@samsung.com, Mark Brown <broonie@kernel.org>, Kukjin Kim <kgene@kernel.org>, a.kesavan@samsung.com, ch.naveen@samsung.com, jic23@kernel.org

On Mon, Mar 02, 2015 at 01:36:03PM +0100, Arnd Bergmann wrote:
> Most of the code for the s3c64xx platform is only used when booting
> with ATAGS based board files, but not when using device-tree.
> 
> This tries to identify all the s3c64xx specific code that is
> unneeded when CONFIG_ATAGS is not set, so we can build a smaller
> DT-only kernel if configured that way.
> 
> All board support is still left intact but now depends on the
> CONFIG_ATAGS symbol that users may intentionally disable.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Rest of this series doesn't seem to cause me any problems on
Cragganmore.

Thanks,
Charles
