From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 02/14] ARM: S5PV310: Removed unused clock
Date: Fri, 20 Aug 2010 16:10:01 +0900
Message-ID: <00b201cb4036$b7e1c7b0$27a55710$%kim@samsung.com>
References: <1282140084-10265-1-git-send-email-kgene.kim@samsung.com>
 <1282140084-10265-3-git-send-email-kgene.kim@samsung.com>
 <AANLkTinjDBxahumErXmXXDW2FLxFi6oXpu-jZa+xzYhF@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:20501 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751076Ab0HTHJx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Aug 2010 03:09:53 -0400
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L7F00KC3VWGL4A0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Aug 2010 16:09:52 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L7F00DP0VWFYD@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Aug 2010 16:09:52 +0900 (KST)
In-reply-to: <AANLkTinjDBxahumErXmXXDW2FLxFi6oXpu-jZa+xzYhF@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'MyungJoo Ham' <myungjoo.ham@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

MyungJoo Ham wrote:
> 
> Hello,
> 
Hi :-)

> On Wed, Aug 18, 2010 at 11:01 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > This pach removed unused clock on S5PV310/S5PC210.
> >
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> 
> In this patch, you've removed corem0, corem1, cores, periph, atclk,
> and pclk_dbg, which are directly affected by cpu-freq drivers. As long
> as CPUFREQ uses clocks under 800MHz, corem0, corem1, cores, and
> periph's dividers should be updated and as long as CPUFREQ uses clocks
> over 800MHz, atclk and pclk_dbg's dividers should also be updated.
> Although in the cpu-freq patches of S5PV210, the cpu-freq driver did
> not use the clock framework and accessed clock registers directly, I
> thought cpu-freq should consider using the clock framework later as,
> sometimes, other drivers and modules are interested in the values
> related with this domain (e.g., for the stability issues,
> suspend-to-mem/disk may want to read and save the clock rates of CPU).
> 
> Do you think CPUFREQ should keep accessing the clock registers
> directly? or should start using clock frameworks later?
> 
> ps. If we are going to change the bus speed as well (as in S5PV210's
> 100MHz mode), we may need to access aclk_cored, aclk_corep, and
> aclk_acp as well.
> 

Basically, no need to control them when changed frequency because can be restored original value.
But I think need to check it again.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
