From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: Re: [PATCH 0/2] DMA: PL330: Clock and runtime cleanup
Date: Fri, 14 Sep 2012 16:55:26 +0530
Message-ID: <CANuQgHEz1jt=gmhxUsLev8Vu1G9EeZUqiaREYEhLPBtJj257=Q@mail.gmail.com>
References: <1347000288-20441-1-git-send-email-inderpal.singh@linaro.org>
	<1347592503.1943.17.camel@vkoul-udesk3>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:62877 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758240Ab2INLZ1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Sep 2012 07:25:27 -0400
Received: by dady13 with SMTP id y13so2361256dad.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Sep 2012 04:25:26 -0700 (PDT)
In-Reply-To: <1347592503.1943.17.camel@vkoul-udesk3>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vinod Koul <vinod.koul@linux.intel.com>
Cc: Inderpal Singh <inderpal.singh@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org, boojin.kim@samsung.com, jassisinghbrar@gmail.com

On 14 September 2012 08:45, Vinod Koul <vinod.koul@linux.intel.com> wrote:
> On Fri, 2012-09-07 at 12:14 +0530, Inderpal Singh wrote:
>> The controller clock is being managed at AMBA bus level probe/remove and
>> pm_runtime/suspend functions. The existing driver does the clock enable/disable
>> again in the same code paths, which unneccessarily increments the usage count of
>> the clock for the same device.
>>
>> The following patches remove the redundant clock enable/disable from the driver.
> Looks good, any tested by before I apply this.. Kukjin?
if it matters,
Tested-by: Chander Kashyap <chander.kashyap@linaro.org>

>>
>> Inderpal Singh (2):
>>   DMA: PL330: Remove controller clock enable/disable
>>   DMA: PL330: Remove redundant runtime_suspend/resume functions
>>
>>  drivers/dma/pl330.c |   73 ++++-----------------------------------------------
>>  1 file changed, 5 insertions(+), 68 deletions(-)
>>
>
>
> --
> ~Vinod
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


-- 
with warm regards,
Chander Kashyap
