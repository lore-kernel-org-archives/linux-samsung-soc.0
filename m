From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v6 04/15] DMA: PL330: Add DMA_CYCLIC capability
Date: Tue, 23 Aug 2011 13:35:52 +0530
Message-ID: <CABb+yY1N0d3t6WP=0Lu02znAcd_sTv5idSei3BWcn7PJJm7yAQ@mail.gmail.com>
References: <1313744097-27289-1-git-send-email-boojin.kim@samsung.com>
	<1313744097-27289-5-git-send-email-boojin.kim@samsung.com>
	<CABb+yY2CjmoDEmvC3S0ua3=B++jKz5g2JXGTwhNcAw5MQ06M9A@mail.gmail.com>
	<002c01cc60c3$77d18210$67748630$%kim@samsung.com>
	<CABb+yY0oQwBTc1zmow+ng+TEJTzRsjB-i1xZdLVwtT+RR6J5RQ@mail.gmail.com>
	<001001cc6163$74cc62b0$5e652810$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:56819 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751407Ab1HWIFy convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Aug 2011 04:05:54 -0400
Received: by bke11 with SMTP id 11so4239319bke.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Aug 2011 01:05:53 -0700 (PDT)
In-Reply-To: <001001cc6163$74cc62b0$5e652810$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Boojin Kim <boojin.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Kukjin Kim <kgene.kim@samsung.com>, Dan Williams <dan.j.williams@intel.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Grant Likely <grant.likely@secretlab.ca>, Russell King <linux@arm.linux.org.uk>

On Tue, Aug 23, 2011 at 12:38 PM, Boojin Kim <boojin.kim@samsung.com> w=
rote:
> Jassi Brar [mailto:jassisinghbrar@gmail.com]
>> Sent: Tuesday, August 23, 2011 2:42 PM
>> To: Boojin Kim
>> Cc: linux-arm-kernel@lists.infradead.org; linux-samsung-
>> soc@vger.kernel.org; Vinod Koul; Kukjin Kim; Dan Williams; Mark Brow=
n;
>> Grant Likely; Russell King
>> Subject: Re: [PATCH v6 04/15] DMA: PL330: Add DMA_CYCLIC capability
>>
>> On Mon, Aug 22, 2011 at 5:33 PM, Boojin Kim <boojin.kim@samsung.com>
>> wrote:
>> >>
>> >> > +static struct dma_async_tx_descriptor *pl330_prep_dma_cyclic(
>> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct dma_c=
han *chan, dma_addr_t dma_addr, size_t
>> len,
>> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t perio=
d_len, enum dma_data_direction
>> direction)
>> >> > +{
>> >> > + =C2=A0 =C2=A0 =C2=A0 struct dma_pl330_desc *desc;
>> >> > + =C2=A0 =C2=A0 =C2=A0 struct dma_pl330_chan *pch =3D to_pchan(=
chan);
>> >> > + =C2=A0 =C2=A0 =C2=A0 dma_addr_t dst;
>> >> > + =C2=A0 =C2=A0 =C2=A0 dma_addr_t src;
>> >> > +
>> >> > + =C2=A0 =C2=A0 =C2=A0 desc =3D pl330_get_desc(pch);
>> >> > + =C2=A0 =C2=A0 =C2=A0 if (!desc) {
>> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(pch-=
>dmac->pif.dev, "%s:%d Unable to fetch
>> >> desc\n",
>> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 __func__, __LINE__);
>> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;
>> >> > + =C2=A0 =C2=A0 =C2=A0 }
>> >> > +
>> >> > + =C2=A0 =C2=A0 =C2=A0 switch (direction) {
>> >> > + =C2=A0 =C2=A0 =C2=A0 case DMA_TO_DEVICE:
>> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 desc->rqcfg.=
src_inc =3D 1;
>> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 desc->rqcfg.=
dst_inc =3D 0;
>> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 src =3D dma_=
addr;
>> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dst =3D pch-=
>fifo_addr;
>> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>> >> > + =C2=A0 =C2=A0 =C2=A0 case DMA_FROM_DEVICE:
>> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 desc->rqcfg.=
src_inc =3D 0;
>> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 desc->rqcfg.=
dst_inc =3D 1;
>> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 src =3D pch-=
>fifo_addr;
>> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dst =3D dma_=
addr;
>> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>> >> > + =C2=A0 =C2=A0 =C2=A0 default:
>> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(pch-=
>dmac->pif.dev, "%s:%d Invalid dma
>> >> direction\n",
>> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__, __=
LINE__);
>> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;
>> >> > + =C2=A0 =C2=A0 =C2=A0 }
>> >> > +
>> >> > + =C2=A0 =C2=A0 =C2=A0 desc->rqcfg.brst_size =3D pch->burst_sz;
>> >> > + =C2=A0 =C2=A0 =C2=A0 desc->rqcfg.brst_len =3D 1;
>> >> > +
>> >> > + =C2=A0 =C2=A0 =C2=A0 if (!pch->cyclic)
>> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pch->cyclic =
=3D CYCLIC_PREP;
>> >> The need for check here seems suspicious.
>> >> Is it really needed? If not, please remove it.
>> > It's required because Cyclic operation is passed from CYCLIC_PREP =
to
>> > CYCLIC_TRIGGER.
>> I don't see why you need to differentiate between PREP and TRIGGER i=
n
>> cyclic mode. I think, you should simply have 'bool cyclic' instead o=
f
>> enum.
> On cyclic mode, Pl330_tasklet() operation is changed according to the=
 value of
> 'cyclic'.
> In case of CYCLIC_PREP, Pl330_tasklet()operation is same with normal
> operation.
By 'normal' you mean non-cyclic, right?  That doesn't seem correct to d=
o.
Once the desc has been marked cyclic by device_prep_dma_cyclic(), you
shouldn't treat it like a non-cyclic anymore.


> The sequence is following.
> device_prep_dma_cyclic() -> set CYCLIC_PREP -> device_issue_pending()=
 ->
> Pl330_tasklet() with CYCLIC_PREP -> set CYCLIC_TRIGGER -> PL330 IRQ -=
>
> Pl330_tasklet() with CYCLIC_TRIGGER.
"device_issue_pending() ->Pl330_tasklet() with CYCLIC_PREP" is no diffe=
rent
from "device_issue_pending() ->Pl330_tasklet() with CYCLIC_TRIGGER"
because the list of 'done' xfers would be null yet.
