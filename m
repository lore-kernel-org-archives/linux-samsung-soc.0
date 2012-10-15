From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 0/6] ARM: EXYNOS: Add secure firmware support
Date: Mon, 15 Oct 2012 22:59:11 +0900
Message-ID: <10db01cdaadd$40bc29a0$c2347ce0$%kim@samsung.com>
References: <1348496913-25422-1-git-send-email-t.figa@samsung.com>
 <1647638.5fBfDOzz0u@amdc1227>
 <CAH9JG2V56eLCCX+9id1EWhKfZ-6qW-3O0j0mVpzOjz5S8QGQ7g@mail.gmail.com>
 <20121010161136.GD582@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:41804 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752219Ab2JOOAN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Oct 2012 10:00:13 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MBX00BVDTINHQ90@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 15 Oct 2012 22:59:11 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MBX00GDSTIN9J90@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 15 Oct 2012 22:59:11 +0900 (KST)
In-reply-to: <20121010161136.GD582@quad.lixom.net>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>, 'Kyungmin Park' <kmpark@infradead.org>
Cc: 'Tomasz Figa' <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux@arm.linux.org.uk, arnd@arndb.de, m.szyprowski@samsung.com

Olof Johansson wrote:
> 
> Hi,
> 
> On Thu, Oct 11, 2012 at 12:35:54AM +0900, Kyungmin Park wrote:
> > Hi Arnd or Olof,
> >
> > Can you pick up for v3.7?
> >
> > To Tomasz,
> > Can you rebase it on the latest arm-soc tree?
> 
> This code should have been in arm-soc by the beginning of the merge window
> (and in linux-next) to be merged for 3.7, but we will be happy to queue
> it up for 3.8 once 3.7-rc1 is out. I have one outstanding comment on
> the DT binding but the rest looks OK to me.
> 
Yeah, I agree.

Olof, thanks for your review.

> Tomasz, please rebase and send this to Kukjin so he can queue it up with
> other
> Samsung code.
> 
OK, let me apply this series in Samsung tree when Tomasz's rebased code
against on v3.7-rc1 is available.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
