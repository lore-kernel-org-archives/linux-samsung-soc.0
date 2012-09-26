From: Inderpal Singh <inderpal.singh@linaro.org>
Subject: Re: [PATCH 3/3] DMA: PL330: Balance module remove function with probe
Date: Wed, 26 Sep 2012 16:25:22 +0530
Message-ID: <CAG17yqQ5NDr4sLvWbA85q5y079j2M2OV-uRjXSSL=OFPfCw3Zg@mail.gmail.com>
References: <1348563456-30569-1-git-send-email-inderpal.singh@linaro.org>
	<1348563456-30569-4-git-send-email-inderpal.singh@linaro.org>
	<CABb+yY3TcVr=0Po0N7TLCkQ9TmMJuvQhKJj3aQ1bP9+68T+Ogw@mail.gmail.com>
	<CAG17yqSOWhg_4KrQNojdYcpygkznvrzO74qnh8yasK=UH1f05Q@mail.gmail.com>
	<CABb+yY36pQ7oXC1OKEQ-1V55c2SZurcTAPaZ=_PWugqxdL2rgg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:35951 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753911Ab2IZKzX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Sep 2012 06:55:23 -0400
Received: by vbbff1 with SMTP id ff1so434181vbb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Sep 2012 03:55:22 -0700 (PDT)
In-Reply-To: <CABb+yY36pQ7oXC1OKEQ-1V55c2SZurcTAPaZ=_PWugqxdL2rgg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, boojin.kim@samsung.com, vinod.koul@intel.com, patches@linaro.org, kgene.kim@samsung.com

On 26 September 2012 15:02, Jassi Brar <jassisinghbrar@gmail.com> wrote:
> On Wed, Sep 26, 2012 at 12:11 PM, Inderpal Singh
> <inderpal.singh@linaro.org> wrote:
>
>> How about conditionally DMA_TERMINATE_ALL and free resources like below ?
>>
>> @@ -3017,9 +3017,11 @@ static int __devexit pl330_remove(struct
>> amba_device *adev)
>>                 /* Remove the channel */
>>                 list_del(&pch->chan.device_node);
>>
>> -               /* Flush the channel */
>> -               pl330_control(&pch->chan, DMA_TERMINATE_ALL, 0);
>> -               pl330_free_chan_resources(&pch->chan);
>> +               if (pch->chan.client_count != 0) {
>> +                       /* Flush the channel */
>> +                       pl330_control(&pch->chan, DMA_TERMINATE_ALL, 0);
>> +                       pl330_free_chan_resources(&pch->chan);
>> +               }
>>         }
>>
> It is perfectly safe to flush the channels that have client_count == 0
> as well. Which is already the case.

As per my understanding, if client_count ==0, It may mean following:

1. This channel was never allocated to any client. Hence
alloc_chan_resources was not done for it.
So, no need to flush and free resources if it was never allocated at
the first place. If we free_chan_resources, it will not be balanced
against alloc_chan_resources. Scenario: insmod and then rmmod.

Or,

2. The channel was allocated to some client, alloc_chan_resource was
done, the work for the client is completed and free_chan_resources was
performed. Now  since resources have already been freed, no need to
flush and free_chan_resources again in remove.

The whole idea of this patch is to balance alloc_chan_resources and
free_chan_resources.

Thanks,
Inder
