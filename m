From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [GIT PULL] Samsung devel-2 for v3.2
Date: Sun, 2 Oct 2011 20:29:50 +0100
Message-ID: <20111002192950.GB1005@sirena.org.uk>
References: <002001cc80e5$3e497790$badc66b0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:41183 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750727Ab1JBT3z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 2 Oct 2011 15:29:55 -0400
Content-Disposition: inline
In-Reply-To: <002001cc80e5$3e497790$badc66b0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Sun, Oct 02, 2011 at 06:25:36PM +0900, Kukjin Kim wrote:

>       gpio/samsung: gpio-samsung.c to support Samsung GPIOs

As I reported the other day this change breaks the boot early on on the
Cragganmore S3C6410 based systems (I've not actually fired up my
SMDK6410 but I suspect it may have issues too).  I did make some brief
attempts to debug but as there's no console output at all and the diff
is rather large it's not easy to see what's gone wrong.
