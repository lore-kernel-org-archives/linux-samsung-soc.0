From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [alsa-devel] [PATCH 1/2] ARM: S5PV210: Add audio support to	Aquila
Date: Wed, 04 Aug 2010 15:16:51 +0900
Message-ID: <4C5905D3.8090703@samsung.com>
References: <4C4F9E4C.7000001@samsung.com>
 <20100729173825.GE24781@opensource.wolfsonmicro.com>
 <4C527C11.5090409@samsung.com> <20100803085929.GC25306@rakim.wolfsonmicro.main>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:55491 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758197Ab0HDGRG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Aug 2010 02:17:06 -0400
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L6M00FNP6S35A20@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 04 Aug 2010 15:16:51 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L6M00FXN6S3DW@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 04 Aug 2010 15:16:51 +0900 (KST)
In-reply-to: <20100803085929.GC25306@rakim.wolfsonmicro.main>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Ben Dooks <ben@simtec.co.uk>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Myungjoo Ham <myungjoo.ham@samsung.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Liam Girdwood <lrg@slimlogic.co.uk>

Mark Brown wrote:
> On Fri, Jul 30, 2010 at 04:15:29PM +0900, Chanwoo Choi wrote:
> 
>>> All these fixed voltage regulators seem a bit suspicous for a mobile
>>> phone - I'd have expected that the supplies would all be being provided
>>> by your PMIC except for things taken directly from the battery supply
>>> (like the speakers tend to be, for example)?  There's no problem with
>>> the code itself, it just looks a bit odd.
> 
>> All these consumer supply of WM8994 codec connected the below regulator(VCC_1.8V) on
>> a circuit diagram. "VCC_1.8V" regualtor is always enabled, because it is used to many devices.
>> Then I haven't connected all these consumer supply of WM8994 codec to "VCC_1.8V" regulator.
>> I will modify that the consumer supply would be provided by PMIC.
> 
> OK, good - the fact that the connection wasn't being made with the PMIC
> was my main point here.

Did you read writed mail about consumer supply of WM8994 by MyungJoo Ham?
He is in charge of PMIC and Power Management on Aquila board.

MyungJoo Ham is wrote : 
This aquila_buck3_data.constraints would be better have ".always_on =
1" entry as this buck3 is required to be turned on at all times in
Aquila boards (even when the system is in suspend-to-mem state). This
is required especially when there are many devices physically attached
to Buck3 and some of they did not "register" as consumers to Buck3.
Buck3 might be turned off by those who are registered while
"unregistered" are still active.

Can you tell me your opinion about the review by MyungJoo Ham?
I will respect your response.
