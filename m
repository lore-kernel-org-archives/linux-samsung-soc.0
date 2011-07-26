From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH] Improve slave/cyclic DMA engine documentation (was:
 [PATCH V4 04/14] DMA: PL330: Add DMA_CYCLIC capability)
Date: Tue, 26 Jul 2011 20:07:44 +0530
Message-ID: <CABb+yY1P21hbMD2mG_cCvW3N5WqWzc2ZVt-HTOrC1J3dc5RbhA@mail.gmail.com>
References: <1311557312-26107-1-git-send-email-boojin.kim@samsung.com>
	<1311557312-26107-5-git-send-email-boojin.kim@samsung.com>
	<20110725092749.GB9653@n2100.arm.linux.org.uk>
	<002001cc4ab6$0d7cd590$287680b0$%kim@samsung.com>
	<20110725103629.GF9653@n2100.arm.linux.org.uk>
	<1311590884.29703.2.camel@vkoul-mobl4>
	<20110725105754.GG9653@n2100.arm.linux.org.uk>
	<1311591717.29703.7.camel@vkoul-mobl4>
	<20110725113926.GH9653@n2100.arm.linux.org.uk>
	<1311595303.29703.31.camel@vkoul-mobl4>
	<20110726075720.GL9653@n2100.arm.linux.org.uk>
	<1311672933.24316.1.camel@vkoul-mobl4>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:53944 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753385Ab1GZOhq convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jul 2011 10:37:46 -0400
Received: by ewy4 with SMTP id 4so469053ewy.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Jul 2011 07:37:44 -0700 (PDT)
In-Reply-To: <1311672933.24316.1.camel@vkoul-mobl4>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vinod Koul <vkoul@infradead.org>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, vinod.koul@intel.com, linux-samsung-soc@vger.kernel.org, Boojin Kim <boojin.kim@samsung.com>, Grant Likely <grant.likely@secretlab.ca>, Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org

On Tue, Jul 26, 2011 at 3:05 PM, Vinod Koul <vkoul@infradead.org> wrote=
:
> On Tue, 2011-07-26 at 08:57 +0100, Russell King - ARM Linux wrote:
>> Here's an updated patch.
>>
>> 8<----------
>> From: Russell King <rmk+kernel@arm.linux.org.uk>
>> DMAEngine: Improve slave/cyclic documentation
>>
>> Improve the documentation for the slave and cyclic DMA engine suppor=
t
>> reformatting it for easier reading, adding further APIs, splitting i=
t
>> into five steps, and including references to the documentation in
>> dmaengine.h.
>>
>> Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
>> ---
>> =C2=A0Documentation/dmaengine.txt | =C2=A0211 ++++++++++++++++++++++=
++++++++-------------
>> =C2=A01 files changed, 146 insertions(+), 65 deletions(-)
>>
>> diff --git a/Documentation/dmaengine.txt b/Documentation/dmaengine.t=
xt
>> index 5a0cb1e..8c2e888 100644
>> --- a/Documentation/dmaengine.txt
>> +++ b/Documentation/dmaengine.txt
>> @@ -10,87 +10,168 @@
>> =C2=A0Below is a guide to device driver writers on how to use the Sl=
ave-DMA API of the
>> =C2=A0DMA Engine. This is applicable only for slave DMA usage only.
>>
>> -The slave DMA usage consists of following steps
>> +The slave DMA usage consists of following steps:
>> =C2=A01. Allocate a DMA slave channel
>> =C2=A02. Set slave and controller specific parameters
>> =C2=A03. Get a descriptor for transaction
>> =C2=A04. Submit the transaction and wait for callback notification
>> +5. Issue pending requests
> Thanks Russell,
>
> Applied with change to 4 above. Moved "and wait for callback
> notification" to 5.
>
Dear Vinod,

 Since it came from the RMK, most probably it'll be the best.

But applying patches upon personal timeout seems very dangerous.

People not responding doesn't mean only either people agree completely
or they don't care. Some might be interested but too busy with current =
tasks
that they need time to check... please make some policy for such cases.

It already happened with the patch from Rob, which you probably have to
revert.

IMHO, if nobody replied, maybe you could first ack the patch and wait
for, say a week, before applying?
That way people will know they have to hurry if they care otherwise
the patch is going upstream as such.

Thanks
-Jassi
