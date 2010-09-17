From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S5PV210: Add audio support to Goni and Aquila board
Date: Fri, 17 Sep 2010 10:47:53 +0900
Message-ID: <03b001cb560a$5bc6ad80$13540880$%kim@samsung.com>
References: <4C8D8233.2060602@samsung.com> <4C92C4D3.4010106@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:63845 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752186Ab0IQBrn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Sep 2010 21:47:43 -0400
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L8V008TLBNHBN70@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 17 Sep 2010 10:47:41 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L8V00ANWBNG8Z@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 17 Sep 2010 10:47:41 +0900 (KST)
In-reply-to: <4C92C4D3.4010106@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Chanwoo Choi' <cw00.choi@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>
Cc: 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, 'Joonyoung Shim' <jy0922.shim@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Myungjoo Ham' <myungjoo.ham@samsung.com>, 'linux-arm-kernel' <linux-arm-kernel@lists.infradead.org>

Chanwoo Choi wrote:
> 
> Dear Ben,
> 
> Don't you have any comment this patch?
> Please give your commont for this patch.
> 
> Chanwoo Choi
> 
> Chanwoo Choi wrote:
> > This patch the I2C board information for the WM8994 used in the
Goni/Aquila
> > as audio codec and adds the I2C/I2S platform drivers. Additionlly, to
> > control power consumption have registerd the voltage consumer of WM8994
> > to the regulator framework.
> >
> > Additionally, I explain the constraints of the regulator of WM8994
codec.
> > All these consumer supply of WM8994 codec connected the
regulator(VCC_1.8V)
> > on a circuit diagram. "VCC_1.8V" regulator is always enabled, because it
is
> > used to many devices on Goni/Aquila board. This is required especially
> > when there are many devices physically attached to "VCC_1.8V" and some
of
> > they did not "register" as consumers to "VCC_1.8V". "VCC_1.8V" might be
> > turned off by those who are registered while "unregistered" are still
active.
> >
> > Signed-off-by : Chanwoo Choi <cw00.choi@samsung.com>
> > Signed-off-by : Joonyoung Shim <jy0922.shim@samsung.com>
> > Signed-off-by : Kyungmin Park <kyungmin.park@samsung.com>
> > ---

Hmm...

Please add my e-mail for S5P series later...
I found this patch just now :-(

Will check soon.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
