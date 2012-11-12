From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/2] ARM: S3C64XX: Staticly define parent clock of "camera"
 clock
Date: Mon, 12 Nov 2012 14:02:47 +0900
Message-ID: <004a01cdc092$f57312d0$e0593870$%kim@samsung.com>
References: <1352556477-3700-1-git-send-email-y@samsung.com>
 <509e6047.a766980a.0f91.14f6@mx.google.com> <509EC391.9090506@gmail.com>
 <509EC83D.8010704@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:41342 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750725Ab2KLFCt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Nov 2012 00:02:49 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDC009Y9ZBDJ2H0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 12 Nov 2012 14:02:48 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDC00B36ZCNEIB0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 12 Nov 2012 14:02:47 +0900 (KST)
In-reply-to: <509EC83D.8010704@gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>, dron0gus@gmail.com
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Andrey Gusakov' <dron_gus@mail.ru>

Sylwester Nawrocki wrote:
> 
> On 11/10/2012 10:13 PM, Sylwester Nawrocki wrote:
> > On 11/10/2012 03:07 PM, dron0gus@gmail.com wrote:
> >> From: Andrey Gusakov<dron_gus@mail.ru>
> >>
> >> The "camera" clock have only one parent. Define it staticly and
> 
> Forgot to point out a small typo here: staticly -> statically.
> 
Thanks for pointing out. I fixed it when I applied.

> >> remove unused source clock list.
> >>
> >> Signed-off-by: Andrey Gusakov<dron0gus@gmail.com>
> >
> > Reviewed-by: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
