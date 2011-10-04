From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL] Samsung devel-2 for v3.2
Date: Tue, 04 Oct 2011 21:45:16 +0900
Message-ID: <019201cc8293$7776a790$6663f6b0$%kim@samsung.com>
References: <002001cc80e5$3e497790$badc66b0$%kim@samsung.com>
 <20111002192950.GB1005@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:46299 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932079Ab1JDMpR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Oct 2011 08:45:17 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LSJ00EWOKR6VLL0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 04 Oct 2011 21:45:16 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LSJ0043WKRG6Q90@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Tue, 04 Oct 2011 21:45:16 +0900 (KST)
In-reply-to: <20111002192950.GB1005@sirena.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Mark Brown wrote:
> 
> On Sun, Oct 02, 2011 at 06:25:36PM +0900, Kukjin Kim wrote:
> 
> >       gpio/samsung: gpio-samsung.c to support Samsung GPIOs
> 
> As I reported the other day this change breaks the boot early on on the
> Cragganmore S3C6410 based systems (I've not actually fired up my
> SMDK6410 but I suspect it may have issues too).  I did make some brief
> attempts to debug but as there's no console output at all and the diff
> is rather large it's not easy to see what's gone wrong. 

Hi Mark,

Could you please test on Cragganmore board again only with my for-next-test
branch?

(I have did 'git-revert' some patches which have some dependencies with
other tree to build without others.)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
