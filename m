From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] ARM: S5PV210: Add audio support to Goni and Aquila board
Date: Fri, 01 Oct 2010 13:07:56 +0900
Message-ID: <4CA55E9C.2020509@samsung.com>
References: <4C8D8233.2060602@samsung.com>
 <AANLkTi=ibP77PvqzJCaQC++=WRkfgNYHfsRiCM38+4hc@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:46832 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750712Ab0JAEH7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Oct 2010 00:07:59 -0400
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9L00EEEFH9SI20@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 01 Oct 2010 13:07:57 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9L00I1KFH9XX@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 01 Oct 2010 13:07:57 +0900 (KST)
In-reply-to: <AANLkTi=ibP77PvqzJCaQC++=WRkfgNYHfsRiCM38+4hc@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Myungjoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Joonyoung Shim <jy0922.shim@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>



Jassi Brar wrote:
> On Mon, Sep 13, 2010 at 10:45 AM, Chanwoo Choi <cw00.choi@samsung.com> wrote:
>> This patch the I2C board information for the WM8994 used in the Goni/Aquila
>> as audio codec and adds the I2C/I2S platform drivers. Additionlly, to
>> control power consumption have registerd the voltage consumer of WM8994
>> to the regulator framework.
>>
>> Additionally, I explain the constraints of the regulator of WM8994 codec.
>> All these consumer supply of WM8994 codec connected the regulator(VCC_1.8V)
>> on a circuit diagram. "VCC_1.8V" regulator is always enabled, because it is
>> used to many devices on Goni/Aquila board. This is required especially
>> when there are many devices physically attached to "VCC_1.8V" and some of
>> they did not "register" as consumers to "VCC_1.8V". "VCC_1.8V" might be
>> turned off by those who are registered while "unregistered" are still active.
>>
>> Signed-off-by : Chanwoo Choi <cw00.choi@samsung.com>
>> Signed-off-by : Joonyoung Shim <jy0922.shim@samsung.com>
>> Signed-off-by : Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>>  arch/arm/mach-s5pv210/mach-aquila.c |  170 +++++++++++++++++++++++++++++++++++
>>  arch/arm/mach-s5pv210/mach-goni.c   |  157 ++++++++++++++++++++++++++++++++
> 
> The contents seem ok (at least the audio related).
> 
> But it would have been better if you had broken the patch into three
>    a) Regulator support adding  (90% of the code and should have been
> CC'd to Mark and Liam as well)
>    b) I2C related.
>    c) Audio related
> 
> Preferably further divided for each machine.
> 
Yes, I will do and resend patch.

Thanks

Best Regards,
Chanwoo Choi
