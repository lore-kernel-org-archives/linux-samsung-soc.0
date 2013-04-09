From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL 10/10] devel-samsung for v3.10
Date: Tue, 09 Apr 2013 20:20:12 +0900
Message-ID: <2f2f01ce3514$33d10f00$9b732d00$%kim@samsung.com>
References: <51630A55.6030703@samsung.com> <51632451.3050801@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:46683 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934801Ab3DILUO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Apr 2013 07:20:14 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MKZ003HEJHMZIL0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 09 Apr 2013 20:20:12 +0900 (KST)
In-reply-to: <51632451.3050801@gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Sylwester Nawrocki wrote:

[...]

> > Sylwester Nawrocki (2):
> > ARM: SAMSUNG: Export MIPI CSIS/DSIM PHY control functions
> 
> This one was supposed to be a fix for 3.8-rc IIRC. But anyway the whole

If so, this should be sent to stable 3.8 tree, but I'm not sure this is
really bug fix.

> file this patch touches is going to be removed in 3.11.
> 
It means it is still needed for v3.10 :-)

> > ARM: S3C24XX: Correct NR_IRQS definition for s3c2440
> 
> And this one is needed for 3.9, sorry for not mentioning it in the patch's
> description. Together with [1] it makes my s3c2440 SoC based test board
> booting again with 3.9-rc6.
> 
> [1] http://www.spinics.net/lists/arm-kernel/msg236643.html
> 
OK, let me drop it in this branch.

Arnd and Olof, please hold on pulling for this branch. I will sort out soon.

Thanks.

- Kukjin
