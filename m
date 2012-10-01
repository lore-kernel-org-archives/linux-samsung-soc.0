From: Inderpal Singh <inderpal.singh@linaro.org>
Subject: Re: [PATCH 3/3] DMA: PL330: Balance module remove function with probe
Date: Mon, 1 Oct 2012 15:29:37 +0530
Message-ID: <CAG17yqTDzkD6_FSn0eVBbeUn=XinJ+OyPpKZQ4+nbwdpQ4OrcQ@mail.gmail.com>
References: <1348563456-30569-1-git-send-email-inderpal.singh@linaro.org>
	<1348563456-30569-4-git-send-email-inderpal.singh@linaro.org>
	<CABb+yY3TcVr=0Po0N7TLCkQ9TmMJuvQhKJj3aQ1bP9+68T+Ogw@mail.gmail.com>
	<CAG17yqSOWhg_4KrQNojdYcpygkznvrzO74qnh8yasK=UH1f05Q@mail.gmail.com>
	<1348739292.1648.15.camel@vkoul-udesk3>
	<CAG17yqRxZFsKpx+gpEGoZTbs4x7ijmqywX39=ezq2+RZkvk=TA@mail.gmail.com>
	<CABb+yY1qbs_s7a-rb91wehEUbO1Azax+-PCaH2QQ=gr+Mc5ioA@mail.gmail.com>
	<CAG17yqTSj4wg0f-9kuzqYDicpD50mjZ2vuWCm+s4vfCTcQs_1g@mail.gmail.com>
	<CABb+yY3QfZEyvn4jvwdbgf6OBy++XMNZoeN0zrzHrCy=f4iwzw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:36223 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752477Ab2JAJ7i (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Oct 2012 05:59:38 -0400
Received: by vbbff1 with SMTP id ff1so5092127vbb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 01 Oct 2012 02:59:38 -0700 (PDT)
In-Reply-To: <CABb+yY3QfZEyvn4jvwdbgf6OBy++XMNZoeN0zrzHrCy=f4iwzw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Vinod Koul <vinod.koul@linux.intel.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, boojin.kim@samsung.com, patches@linaro.org, kgene.kim@samsung.com

On 28 September 2012 16:28, Jassi Brar <jassisinghbrar@gmail.com> wrote:
> On Fri, Sep 28, 2012 at 10:03 AM, Inderpal Singh
> <inderpal.singh@linaro.org> wrote:
>>
>> Now, if we have to check if any client is using the channel and then
>> decide. We will have to traverse the channel list twice once to check
>> the usage and second time to delete the nodes from the list if we go
>> ahead with remove.
>> The remove will look like below:
>>
>> @@ -3008,18 +3008,19 @@ static int __devexit pl330_remove(struct
>> amba_device *adev)
>>         if (!pdmac)
>>                 return 0;
>>
>> +       /* check if any client is using any channel */
>> +       list_for_each_entry_safe(pch, _p, &pdmac->ddma.channels,
>> +                       chan.device_node) {
>> +
>> +               if (pch->chan.client_count)
>> +                       return -EBUSY;
>> +       }
>> +
> The iteration doesn't have to be the 'safe' version here. Other than
> that it seems OK.

Ok. I will update the patch and send again.

Thanks,
Inder
