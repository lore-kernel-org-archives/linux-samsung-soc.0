From: Inderpal Singh <inderpal.singh@linaro.org>
Subject: Re: [PATCH 3/3] DMA: PL330: Balance module remove function with probe
Date: Thu, 27 Sep 2012 11:00:42 +0530
Message-ID: <CAG17yqSDi7_-VixEDfViLj0u99QBVDzePwhqswM__dp1ANpr7w@mail.gmail.com>
References: <1348563456-30569-1-git-send-email-inderpal.singh@linaro.org>
	<1348563456-30569-4-git-send-email-inderpal.singh@linaro.org>
	<CABb+yY3TcVr=0Po0N7TLCkQ9TmMJuvQhKJj3aQ1bP9+68T+Ogw@mail.gmail.com>
	<CAG17yqSOWhg_4KrQNojdYcpygkznvrzO74qnh8yasK=UH1f05Q@mail.gmail.com>
	<CABb+yY36pQ7oXC1OKEQ-1V55c2SZurcTAPaZ=_PWugqxdL2rgg@mail.gmail.com>
	<CAG17yqQ5NDr4sLvWbA85q5y079j2M2OV-uRjXSSL=OFPfCw3Zg@mail.gmail.com>
	<CABb+yY0dvtOZoa=T+gyTeWy3XyAictXJnqSkbF39E=peHSXDuQ@mail.gmail.com>
	<CAG17yqQbRMaaEFyTBngMwdiKVBsGaOit1ufv3t5TdwLBgSKmfw@mail.gmail.com>
	<CABb+yY0YAkaKaFRO14wYR52-Si5S=qfVczXs_2Z+jZYEpXFh2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:38318 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751475Ab2I0Fan (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 Sep 2012 01:30:43 -0400
Received: by vcbfo13 with SMTP id fo13so1623848vcb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Sep 2012 22:30:42 -0700 (PDT)
In-Reply-To: <CABb+yY0YAkaKaFRO14wYR52-Si5S=qfVczXs_2Z+jZYEpXFh2Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, boojin.kim@samsung.com, vinod.koul@intel.com, patches@linaro.org, kgene.kim@samsung.com

On 27 September 2012 10:35, Jassi Brar <jassisinghbrar@gmail.com> wrote:
> On Thu, Sep 27, 2012 at 9:43 AM, Inderpal Singh
> <inderpal.singh@linaro.org> wrote:
>>
>> Don't you think free_chan_resource should be done __only if__
>> alloc_chan_resource was successful ?
>>
> No, I don't think so. Thanks.

Thanks for quick response.
Please elaborate more on this as I find it against the general rule
and against the dmaengine implementation which checks on the same
condition before proceeding for free_chan_resouces in dma_chan_put
function.

Thanks,
Inder
