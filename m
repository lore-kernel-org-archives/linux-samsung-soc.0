From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [GIT PULL] Samsung devel-2 for v3.2
Date: Wed, 5 Oct 2011 17:54:02 +0100
Message-ID: <20111005165401.GA7155@opensource.wolfsonmicro.com>
References: <002001cc80e5$3e497790$badc66b0$%kim@samsung.com>
 <20111002192950.GB1005@sirena.org.uk>
 <019201cc8293$7776a790$6663f6b0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:53188 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S934962Ab1JEQyE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Oct 2011 12:54:04 -0400
Content-Disposition: inline
In-Reply-To: <019201cc8293$7776a790$6663f6b0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Tue, Oct 04, 2011 at 09:45:16PM +0900, Kukjin Kim wrote:

> Could you please test on Cragganmore board again only with my for-next-test
> branch?

I tried this, same result as -next.  v3.1-rc8 works fine.  I also tried
a bisect which was a bit of a nightmare due to soc_is_ and S5P_VA_GPIOn
not being defined in the GPIO code and other places in a lot of
revisions so I didn't finish it, perhaps later.
