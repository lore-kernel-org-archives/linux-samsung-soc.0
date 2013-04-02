From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: EXYNOS will support only DT from v3.10
Date: Tue, 02 Apr 2013 12:15:57 +0200
Message-ID: <515AAFDD.1060204@samsung.com>
References: <17a501ce2948$17037610$450a6230$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:63772 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760893Ab3DBKQE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Apr 2013 06:16:04 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MKM008GMHRVP150@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 02 Apr 2013 11:16:01 +0100 (BST)
In-reply-to: <17a501ce2948$17037610$450a6230$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, olof@lixom.net, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Thomas P Abraham' <thomas.ab@samsung.com>, heiko@sntech.de, 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>

On 03/25/2013 12:01 PM, Kukjin Kim wrote:
> Hi all,
> 
> As we discussed before, it's time to decide to support non-DT for EXYNOS
> SoCs.
> 
> If everybody else agrees to drop non-DT support from v3.10, I will. Feel
> free to talk your opinion about that.

I'm fine with supporting Exynos as dt-only from 3.10. We just need to
resolve some issues with samsung pwm/timers to get DT board support for
Universal_c210 working. Currently Tomasz Figa is working on it. Hopefully
it all can be finished this week.

I'll see if I can find some spare time and help out with porting S5PV210
to DT.


Regards,
Sylwester
