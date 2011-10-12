From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v6 00/10] Add device tree support for PL330 dma controller
 driver
Date: Wed, 12 Oct 2011 14:03:12 +0900
Message-ID: <063701cc889c$3e10dcf0$ba3296d0$%kim@samsung.com>
References: <1318270538-30450-1-git-send-email-thomas.abraham@linaro.org>
 <057401cc880e$41e30b20$c5a92160$%kim@samsung.com>
 <1318351780.1546.358.camel@vkoul-udesk3>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:38525 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751859Ab1JLFDN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Oct 2011 01:03:13 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LSX00FG3SP92QK0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 12 Oct 2011 14:03:11 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LSX004A7SPBQO70@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 12 Oct 2011 14:03:11 +0900 (KST)
In-reply-to: <1318351780.1546.358.camel@vkoul-udesk3>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Vinod Koul' <vinod.koul@intel.com>
Cc: 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Vinod Koul wrote:
> 
> On Tue, 2011-10-11 at 21:06 +0900, Kukjin Kim wrote:
> > Thomas Abraham wrote:
> >
> > Hi,
> >
> > Looks ok to me and if required,
> > Acked-by: Kukjin Kim <kgene.kim@samsung.com>
> >
> > And I hope since this includes many changes of arch/arm/Samsung stuff, this
> > would be sent to upstream via Samsung tree after ack from Vinod for dma
> > stuff.
> Sure, looks fine to me
> Acked-by: Vinod Koul <vinod.koul@intel.com>
> 
Hi Vinod,

OK, I will apply this series to send to upstream via Samsung tree. If you need branch to apply in your tree, please let me know.

As a note, Boojin Kim will test this series based on boards with -next of Samsung tree before sending to upstream even though I know Thomas tested and it works fine :)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
