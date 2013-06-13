From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL 0/6] Samsung stuff for v3.11
Date: Thu, 13 Jun 2013 09:48:05 +0900
Message-ID: <143e01ce67cf$aa7d1b60$ff775220$%kim@samsung.com>
References: <51B791C3.7050702@samsung.com>
 <20130612235455.GD9067@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:59167 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756775Ab3FMAsH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Jun 2013 20:48:07 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOB00HK63JXJQ60@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Jun 2013 09:48:06 +0900 (KST)
In-reply-to: <20130612235455.GD9067@quad.lixom.net>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Olof Johansson wrote:
> 
> On Wed, Jun 12, 2013 at 06:08:19AM +0900, Kukjin Kim wrote:
> > Hi Arnd, Olof
> >
> > Please pull Samsung stuff for v3.11.
> >
> > If any problems, please kindly let me know.
> 
> Hi,
> 
> I've pulled 1, 2, 4 and 6. Please fix the comments on 3 and 5 and send
> fresh
> requests.
> 
Thanks. OK, I will.

> Also, I see you've based a bunch of branches on -rc5. While this is
> fine, it is more convenient for us to review your branch submission if it
> doesn't also pull in a newer upstream -rc.
> 
> Main reason to use the most-recent -rc would be if new code conflicts
> with fixes in the previous -rc version, but if they don't then feel free
> to start your branches on an older version instead.
> 
Agreed.

- Kukjin
