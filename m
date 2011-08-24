From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 1/3] DMA: PL330: Infer transfer direction from transfer
 request instead of platform data
Date: Wed, 24 Aug 2011 19:55:14 +0530
Message-ID: <CAJuYYwQ6yHb_ixJ87cmt6BiwJ-487iVUG1xWFsdXL2b57Mr2bQ@mail.gmail.com>
References: <1314050385-9617-1-git-send-email-thomas.abraham@linaro.org>
	<1314050385-9617-2-git-send-email-thomas.abraham@linaro.org>
	<4E54E42D.9060905@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yi0-f46.google.com ([209.85.218.46]:34201 "EHLO
	mail-yi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751850Ab1HXOZP convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Aug 2011 10:25:15 -0400
Received: by yie30 with SMTP id 30so892902yie.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Aug 2011 07:25:14 -0700 (PDT)
In-Reply-To: <4E54E42D.9060905@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, vinod.koul@intel.com, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>, Boojin Kim <boojin.kim@samsung.com>

Hi Rob,

On 24 August 2011 17:14, Rob Herring <robherring2@gmail.com> wrote:
> Thomas,
>
> On 08/22/2011 04:59 PM, Thomas Abraham wrote:
>> The transfer direction for a channel can be inferred from the transf=
er
>> request and the need for specifying transfer direction in platfrom d=
ata
>> can be eliminated. So the structure definition 'struct dma_pl330_per=
i'
>> is no longer required.
>>
>> With the 'struct dma_pl330_peri' removed, the dma controller transfe=
r
>> capabilities cannot be inferred any longer. Hence, the dma controlle=
r
>> capabilities is specified using platforme data.
>>
>> Cc: Jassi Brar <jassisinghbrar@gmail.com>
>> Cc: Boojin Kim <boojin.kim@samsung.com>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> ---
>> =A0drivers/dma/pl330.c =A0 =A0 =A0 =A0| =A0 56 ++++++++-------------=
-----------------------
>> =A0include/linux/amba/pl330.h | =A0 14 +++--------
>> =A02 files changed, 14 insertions(+), 56 deletions(-)
>>
>> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
>> index 3a0baac..6592b9a 100644
>> --- a/drivers/dma/pl330.c
>> +++ b/drivers/dma/pl330.c

[...]

>> @@ -872,27 +855,7 @@ pl330_probe(struct amba_device *adev, const str=
uct amba_id *id)
>>
>> =A0 =A0 =A0 for (i =3D 0; i < num_chan; i++) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 pch =3D &pdmac->peripherals[i];
>> - =A0 =A0 =A0 =A0 =A0 =A0 if (pdat) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct dma_pl330_peri *per=
i =3D &pdat->peri[i];
>> -
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 switch (peri->rqtype) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 case MEMTOMEM:
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dma_cap_se=
t(DMA_MEMCPY, pd->cap_mask);
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 case MEMTODEV:
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 case DEVTOMEM:
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dma_cap_se=
t(DMA_SLAVE, pd->cap_mask);
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dma_cap_se=
t(DMA_CYCLIC, pd->cap_mask);
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 default:
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&a=
dev->dev, "DEVTODEV Not Supported\n");
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pch->chan.private =3D peri=
;
>> - =A0 =A0 =A0 =A0 =A0 =A0 } else {
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dma_cap_set(DMA_MEMCPY, pd=
->cap_mask);
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pch->chan.private =3D NULL=
;
>> - =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 =A0 =A0 =A0 =A0 pch->chan.private =3D (pdat) ? &pdat->peri=
_id[i] : NULL;
>
> Don't need parentheses here.

Ok. I will fix this in the next version of this patchset.

>
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 INIT_LIST_HEAD(&pch->work_list);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_lock_init(&pch->lock);
>> @@ -907,6 +870,7 @@ pl330_probe(struct amba_device *adev, const stru=
ct amba_id *id)
>> =A0 =A0 =A0 }
>>
>> =A0 =A0 =A0 pd->dev =3D &adev->dev;
>> + =A0 =A0 pd->cap_mask =3D pdat->cap_mask;
>
> You are re-introducing the requirement to have platform data which I
> just made optional. For mem to mem transfers, there is no reason to h=
ave
> platform data. In my case, we only support mem to mem transfers.
>
> How about:
> pd->cap_mask =3D pdat ? pdat->cap_mask : DMA_MEMCPY;

All of your changes to make platform data optional is still retained
in this patch. But, as you said, the above change that I did to get
the capabilities from pdata would not work when no pdata is supplied
(as in the case mem-to-mem transfers). Thanks for pointing this out.

This can be fixed as below

if (pdat)
        pd->cap_mask =3D pdat->cap_mask;
else
        dma_cap_set(DMA_MEMCPY, pd->cap_mask);

>
> Also, should you be using dma_cap_set here?

Yes. That would be required. I will do these changes and resubmit the
patch. Thanks for your review.

Regards,
Thomas.

>
> Rob
>

[...]
