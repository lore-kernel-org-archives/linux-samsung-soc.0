From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 1/3] DMA: PL330: Infer transfer direction from transfer
 request instead of platform data
Date: Wed, 24 Aug 2011 08:52:46 +0530
Message-ID: <CAJuYYwQ0cKw_069V9Ci0rdfM+vESkbcGXnLj+xV68kf85VngKA@mail.gmail.com>
References: <1314050385-9617-1-git-send-email-thomas.abraham@linaro.org>
	<1314050385-9617-2-git-send-email-thomas.abraham@linaro.org>
	<000601cc61fc$201ac560$60505020$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f42.google.com ([209.85.210.42]:42118 "EHLO
	mail-pz0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750986Ab1HXDWr convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Aug 2011 23:22:47 -0400
Received: by pzk37 with SMTP id 37so132459pzk.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Aug 2011 20:22:47 -0700 (PDT)
In-Reply-To: <000601cc61fc$201ac560$60505020$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Boojin Kim <boojin.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, vinod.koul@intel.com, Jassi Brar <jassisinghbrar@gmail.com>

Hi Boojin,

On 24 August 2011 06:51, Boojin Kim <boojin.kim@samsung.com> wrote:
> Thomas Abraham wrote:
>> Sent: Tuesday, August 23, 2011 7:00 AM
>> To: linux-arm-kernel@lists.infradead.org
>> Cc: linux-samsung-soc@vger.kernel.org; kgene.kim@samsung.com;
>> vinod.koul@intel.com; Jassi Brar; Boojin Kim
>> Subject: [PATCH 1/3] DMA: PL330: Infer transfer direction from
>> transfer request instead of platform data
>>
>> The transfer direction for a channel can be inferred from the transf=
er
>> request and the need for specifying transfer direction in platfrom
>> data
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
-----------------
>> ------
>> =A0include/linux/amba/pl330.h | =A0 14 +++--------
>> =A02 files changed, 14 insertions(+), 56 deletions(-)
>>

[...]

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
> If remove capabilities setting, dmaengine() doesn't search the channe=
l that
> client requests with specific capability.
> So, I think dma_request_channel() would fail.

The capabilities is now supplied using platform data. There is a new
member 'cap_mask' added to the pl330 driver platform data structure.
The capabilities for a pl330 controller can be specified using
cap_mask. For exynos4, the capabilities is set up in the
exynos4_dma_init function. These changes are part of the third patch
in this patchset.

Thanks for your review.

Regards,
Thomas.

[...]
