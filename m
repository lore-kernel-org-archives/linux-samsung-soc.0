From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: EXYNOS will support only DT from v3.10
Date: Mon, 25 Mar 2013 13:15:58 +0000
Message-ID: <201303251315.58347.arnd@arndb.de>
References: <17a501ce2948$17037610$450a6230$%kim@samsung.com> <201303251237.38782.arnd@arndb.de> <20130325130951.GQ18316@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.9]:56061 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757728Ab3CYNQT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Mar 2013 09:16:19 -0400
In-Reply-To: <20130325130951.GQ18316@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, olof@lixom.net, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Thomas P Abraham' <thomas.ab@samsung.com>, heiko@sntech.de, 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>

On Monday 25 March 2013, Mark Brown wrote:
> On Mon, Mar 25, 2013 at 12:37:38PM +0000, Arnd Bergmann wrote:
> 
> > We don't have any DT support for S3C and S5P upstream yet, so I would
> > certainly agree on that. I think we should plan at least one release of
> > supporting both simultaneously in order to find bugs with the DT
> > implementation before we can consider removing ATAGS support for any
> > major platform.
> 
> We really ought to look into fixing the bootloader protocol to allow
> ATAGS and DT simultaneously BTW, the current situation is a pain
> especially if you need uImage.

I think the plan at the moment is to extend the atags wrapper to allow
picking one out of multiple device tree blobs, which matches the
machine ID, rather than having to know the right one in advance.

	Arnd
