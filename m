From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] ARM: Exynos4: Put PCM, Slimbus,
 Spdif clocks to off state
Date: Thu, 20 Sep 2012 08:55:01 +0900
Message-ID: <09a901cd96c2$2ef71920$8ce54b60$%kim@samsung.com>
References: <1346940968-4423-1-git-send-email-chander.kashyap@linaro.org>
 <CAJuYYwT443=NPZX4n2Y9TToWZ9-yH5YQyCa3iq_LRCv1XnF0WQ@mail.gmail.com>
 <09a101cd96bd$d33e4030$79bac090$%kim@samsung.com>
 <048601cd96c1$e40c7a90$ac256fb0$@com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:17135 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752821Ab2ISXzD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Sep 2012 19:55:03 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAM00I7DFRM5H70@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Sep 2012 08:55:02 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAM000JRFRQ1930@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Sep 2012 08:55:02 +0900 (KST)
In-reply-to: <048601cd96c1$e40c7a90$ac256fb0$@com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sangbeom Kim' <sbkim73@samsung.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Chander Kashyap' <chander.kashyap@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, patches@linaro.org

Sangbeom Kim wrote:
> 
> Hi!
> On Thursday, Sep 20, 2012 at 08:24 AM, Kukjin Kim wrote:
> 
> > > > The clocks for PCM, Slimbus, Spdif added to off list in order
> > > > to turn them off at boot time.
> > > >
> > > > Signed-off-by: Chander Kashyap <chander.kashyap@linaro.org>
> > > Acked-by: Thomas Abraham <thomas.abraham@linaro.org>
> 
> Acked-by: Sangbeom Kim <sbkim73@samsung.com>
> 
Thanks, will apply.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
