From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v6 04/15] DMA: PL330: Add DMA_CYCLIC capability
Date: Tue, 23 Aug 2011 11:11:38 +0530
Message-ID: <CABb+yY0oQwBTc1zmow+ng+TEJTzRsjB-i1xZdLVwtT+RR6J5RQ@mail.gmail.com>
References: <1313744097-27289-1-git-send-email-boojin.kim@samsung.com>
	<1313744097-27289-5-git-send-email-boojin.kim@samsung.com>
	<CABb+yY2CjmoDEmvC3S0ua3=B++jKz5g2JXGTwhNcAw5MQ06M9A@mail.gmail.com>
	<002c01cc60c3$77d18210$67748630$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:36924 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751094Ab1HWFlj convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Aug 2011 01:41:39 -0400
Received: by bke11 with SMTP id 11so4171225bke.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Aug 2011 22:41:38 -0700 (PDT)
In-Reply-To: <002c01cc60c3$77d18210$67748630$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Boojin Kim <boojin.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Kukjin Kim <kgene.kim@samsung.com>, Dan Williams <dan.j.williams@intel.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Grant Likely <grant.likely@secretlab.ca>, Russell King <linux@arm.linux.org.uk>

On Mon, Aug 22, 2011 at 5:33 PM, Boojin Kim <boojin.kim@samsung.com> wr=
ote:
>>
>> > +static struct dma_async_tx_descriptor *pl330_prep_dma_cyclic(
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct dma_chan=
 *chan, dma_addr_t dma_addr, size_t len,
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t period_l=
en, enum dma_data_direction direction)
>> > +{
>> > + =C2=A0 =C2=A0 =C2=A0 struct dma_pl330_desc *desc;
>> > + =C2=A0 =C2=A0 =C2=A0 struct dma_pl330_chan *pch =3D to_pchan(cha=
n);
>> > + =C2=A0 =C2=A0 =C2=A0 dma_addr_t dst;
>> > + =C2=A0 =C2=A0 =C2=A0 dma_addr_t src;
>> > +
>> > + =C2=A0 =C2=A0 =C2=A0 desc =3D pl330_get_desc(pch);
>> > + =C2=A0 =C2=A0 =C2=A0 if (!desc) {
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(pch->dm=
ac->pif.dev, "%s:%d Unable to fetch
>> desc\n",
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 __func__, __LINE__);
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;
>> > + =C2=A0 =C2=A0 =C2=A0 }
>> > +
>> > + =C2=A0 =C2=A0 =C2=A0 switch (direction) {
>> > + =C2=A0 =C2=A0 =C2=A0 case DMA_TO_DEVICE:
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 desc->rqcfg.src=
_inc =3D 1;
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 desc->rqcfg.dst=
_inc =3D 0;
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 src =3D dma_add=
r;
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dst =3D pch->fi=
fo_addr;
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>> > + =C2=A0 =C2=A0 =C2=A0 case DMA_FROM_DEVICE:
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 desc->rqcfg.src=
_inc =3D 0;
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 desc->rqcfg.dst=
_inc =3D 1;
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 src =3D pch->fi=
fo_addr;
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dst =3D dma_add=
r;
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>> > + =C2=A0 =C2=A0 =C2=A0 default:
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(pch->dm=
ac->pif.dev, "%s:%d Invalid dma
>> direction\n",
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__, __LIN=
E__);
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;
>> > + =C2=A0 =C2=A0 =C2=A0 }
>> > +
>> > + =C2=A0 =C2=A0 =C2=A0 desc->rqcfg.brst_size =3D pch->burst_sz;
>> > + =C2=A0 =C2=A0 =C2=A0 desc->rqcfg.brst_len =3D 1;
>> > +
>> > + =C2=A0 =C2=A0 =C2=A0 if (!pch->cyclic)
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pch->cyclic =3D=
 CYCLIC_PREP;
>> The need for check here seems suspicious.
>> Is it really needed? If not, please remove it.
> It's required because Cyclic operation is passed from CYCLIC_PREP to
> CYCLIC_TRIGGER.
I don't see why you need to differentiate between PREP and TRIGGER in
cyclic mode. I think, you should simply have 'bool cyclic' instead of e=
num.
