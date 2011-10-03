From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL] Samsung devel-2 for v3.2
Date: Mon, 03 Oct 2011 12:27:22 +0900
Message-ID: <005801cc817c$5d42f9e0$17c8eda0$%kim@samsung.com>
References: <002001cc80e5$3e497790$badc66b0$%kim@samsung.com>
 <20111002192950.GB1005@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:14671 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751630Ab1JCD1X (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 2 Oct 2011 23:27:23 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LSH00JA109IXY80@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 03 Oct 2011 12:27:22 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LSH00FS809LLZ30@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Mon, 03 Oct 2011 12:27:22 +0900 (KST)
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

Hmm, I thought it has no problem when I saw Thomas Abraham's 'serial:
samsung' patches because he said it works fine with my for-next plus his
patches on SMDK6410...Anyway, I need to sort it out.

Arnd, please hold this on, will request again soon.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
