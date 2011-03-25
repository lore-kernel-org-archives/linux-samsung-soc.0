From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS4: IRQ flags for SMSC911X set as HIGH
Date: Fri, 25 Mar 2011 17:35:30 +0900
Message-ID: <000201cbeac7$9e1fd970$da5f8c50$%kim@samsung.com>
References: <1300958437-23247-1-git-send-email-tushar.behera@linaro.org>
 <AANLkTikkYn8Ocga_208HsxWVppUBH=YH-MVMMRV2kjvT@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:50142 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933468Ab1CYIfl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Mar 2011 04:35:41 -0400
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LIL004EEUJEEE00@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 25 Mar 2011 17:35:39 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LIL00C4QUJD6X@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 25 Mar 2011 17:35:38 +0900 (KST)
In-reply-to: <AANLkTikkYn8Ocga_208HsxWVppUBH=YH-MVMMRV2kjvT@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tushar Behera' <tushar.behera@linaro.org>, linux-samsung-soc@vger.kernel.org

Tushar Behera wrote:
> 
> Hi,
> 
Hi :)

> I found that there are already some patches submitted for this purpose.
> 
> http://www.spinics.net/lists/linux-samsung-soc/msg04371.html
> http://www.spinics.net/lists/linux-samsung-soc/msg04372.html
> 
> Sorry for the trouble. Please ignore this patch.
> 
No problem. Thanks ;)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> Regards,
> Tushar
> 
> On 24 March 2011 14:50, Tushar Behera <tushar.behera@linaro.org> wrote:
> >
> > There is a mismatch in IRQ flag and irq_polarity settings for
> > SMSC911X. This results in a kernel warning.
> >
> > IRQ flag is set to HIGH to match the irq_polarity.
