From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [GIT PULL 2/4] Samsung serial updates for v3.19
Date: Sat, 29 Nov 2014 09:16:26 +0900
Message-ID: <015c01d00b69$b746b380$25d41a80$@kernel.org>
References: <5476CD7B.4020808@kernel.org> <201411281328.37868.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:44951 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751312AbaK2AQ2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Nov 2014 19:16:28 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NFR007GRY3F1W30@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 29 Nov 2014 09:16:27 +0900 (KST)
In-reply-to: <201411281328.37868.arnd@arndb.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Kukjin Kim' <kgene@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, arm@kernel.org, 'Greg KH' <gregkh@linuxfoundation.org>, 'Kevin Hilman' <khilman@linaro.org>, 'Olof Johansson' <olof@lixom.net>, linux-arm-kernel@lists.infradead.org

Arnd Bergmann wrote:
> 
> On Thursday 27 November 2014, Kukjin Kim wrote:
> > Hi Arnd, Olof, Kevin
> >
> > Please pull this branch for exynos7 SoC into arm-soc.
> > Note Greg agreed to upstream via arm-soc tree.
> 
> I don't really see any dependency on anything else here, so I
> wonder why you are sending it to me, but I assume there is some
> reason and it's trivial enough.
> 
Yes, actually there is no dependency for build the kernel but I wanted to
provide a topic branch for test and implement further features on exynos7.

> Pulled into next/drivers.
>
Thanks a lot.

- Kukjin
