From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH] ARM:SAMSUNG: DMA Cleanup as per sparse
Date: Wed, 6 Jul 2011 12:05:18 +0530
Message-ID: <CABb+yY219tLKj=zd7U=C=VFzWxia+vukEG12hw6tvwGYve6fXw@mail.gmail.com>
References: <1309428980-20176-1-git-send-email-sangwook.lee@linaro.org>
	<00c001cc3ba3$34558670$9d009350$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:33902 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750798Ab1GFGfT convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Jul 2011 02:35:19 -0400
Received: by bwd5 with SMTP id 5so5323814bwd.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Jul 2011 23:35:18 -0700 (PDT)
In-Reply-To: <00c001cc3ba3$34558670$9d009350$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Sangwook Lee <sangwook.lee@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, ben-linux@fluff.org

On Wed, Jul 6, 2011 at 11:38 AM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> Kukjin Kim wrote:
>>
>> Sangwook Lee wrote:
>> >
>> > Function declaration differs between file:s3c-pl330.c and file:dma=
=2Eh
>> > and SPARSE (Documentation/sparse.txt) gives error messages
>> >
>> > Signed-off-by: Sangwook Lee <sangwook.lee@linaro.org>
>> > ---
>> > =C2=A0arch/arm/plat-samsung/include/plat/dma.h | =C2=A0 16 +++++++=
+--------
>> > =C2=A01 files changed, 8 insertions(+), 8 deletions(-)
>> >
>> > diff --git a/arch/arm/plat-samsung/include/plat/dma.h b/arch/arm/p=
lat-
>> > samsung/include/plat/dma.h
>> > index 2e8f8c6..7365f46 100644
>> > --- a/arch/arm/plat-samsung/include/plat/dma.h
>> > +++ b/arch/arm/plat-samsung/include/plat/dma.h
>> > @@ -62,7 +62,7 @@ typedef int =C2=A0(*s3c2410_dma_opfn_t)(struct
>> > s3c2410_dma_chan *,
>> > =C2=A0 * request a dma channel exclusivley
>> > =C2=A0*/
>> >
>> > -extern int s3c2410_dma_request(unsigned int channel,
>> > +extern int s3c2410_dma_request(enum dma_ch id,
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct s3c2410_dma_client *, void *dev);
>> >
>> >
>> > @@ -71,14 +71,14 @@ extern int s3c2410_dma_request(unsigned int ch=
annel,
>> > =C2=A0 * change the state of the dma channel
>> > =C2=A0*/
>> >
>> > -extern int s3c2410_dma_ctrl(unsigned int channel, enum s3c2410_ch=
an_op
> op);
>> > +extern int s3c2410_dma_ctrl(enum dma_ch id, enum s3c2410_chan_op =
op);
>> >
>> > =C2=A0/* s3c2410_dma_setflags
>> > =C2=A0 *
>> > =C2=A0 * set the channel's flags to a given state
>> > =C2=A0*/
>> >
>> > -extern int s3c2410_dma_setflags(unsigned int channel,
>> > +extern int s3c2410_dma_setflags(enum dma_ch id,
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int flags);
>> >
>> > =C2=A0/* s3c2410_dma_free
>> > @@ -86,7 +86,7 @@ extern int s3c2410_dma_setflags(unsigned int cha=
nnel,
>> > =C2=A0 * free the dma channel (will also abort any outstanding ope=
rations)
>> > =C2=A0*/
>> >
>> > -extern int s3c2410_dma_free(unsigned int channel, struct
> s3c2410_dma_client *);
>> > +extern int s3c2410_dma_free(enum dma_ch id, struct s3c2410_dma_cl=
ient
> *);
>> >
>> > =C2=A0/* s3c2410_dma_enqueue
>> > =C2=A0 *
>> > @@ -95,7 +95,7 @@ extern int s3c2410_dma_free(unsigned int channel=
,
> struct
>> > s3c2410_dma_client *);
>> > =C2=A0 * drained before the buffer is given to the DMA system.
>> > =C2=A0*/
>> >
>> > -extern int s3c2410_dma_enqueue(unsigned int channel, void *id,
>> > +extern int s3c2410_dma_enqueue(enum dma_ch idx, void *id,
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_addr_t data, int size);
>> >
>> > =C2=A0/* s3c2410_dma_config
>> > @@ -103,14 +103,14 @@ extern int s3c2410_dma_enqueue(unsigned int
> channel,
>> > void *id,
>> > =C2=A0 * configure the dma channel
>> > =C2=A0*/
>> >
>> > -extern int s3c2410_dma_config(unsigned int channel, int xferunit)=
;
>> > +extern int s3c2410_dma_config(enum dma_ch id, int xferunit);
>> >
>> > =C2=A0/* s3c2410_dma_devconfig
>> > =C2=A0 *
>> > =C2=A0 * configure the device we're talking to
>> > =C2=A0*/
>> >
>> > -extern int s3c2410_dma_devconfig(unsigned int channel,
>> > +extern int s3c2410_dma_devconfig(enum dma_ch id,
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enum s3c2410_dmasrc sour=
ce, unsigned long devaddr);
>> >
>> > =C2=A0/* s3c2410_dma_getposition
>> > @@ -118,7 +118,7 @@ extern int s3c2410_dma_devconfig(unsigned int
> channel,
>> > =C2=A0 * get the position that the dma transfer is currently at
>> > =C2=A0*/
>> >
>> > -extern int s3c2410_dma_getposition(unsigned int channel,
>> > +extern int s3c2410_dma_getposition(enum dma_ch id,
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_addr_t *src, dma_addr_=
t *dest);
>> >
>> > =C2=A0extern int s3c2410_dma_set_opfn(unsigned int, s3c2410_dma_op=
fn_t rtn);
>> > --
>
> Hi Sangwook Lee,
>
> I reverted this in my -fix tree just now because this makes following=
 error
> with s3c2410_defconfig.

Sangwook's patch does the right thing.
IMO another patch to fix the following issues is needed.

>
> arch/arm/plat-samsung/include/plat/dma.h:66: warning: 'enum dma_ch' d=
eclared
> inside parameter list
> arch/arm/plat-samsung/include/plat/dma.h:66: warning: its scope is on=
ly this
> definition or declaration, which is probably not what you want
> arch/arm/plat-samsung/include/plat/dma.h:74: warning: 'enum dma_ch' d=
eclared
> inside parameter list
> arch/arm/plat-samsung/include/plat/dma.h:82: warning: 'enum dma_ch' d=
eclared
> inside parameter list
> arch/arm/plat-samsung/include/plat/dma.h:89: warning: 'enum dma_ch' d=
eclared
> inside parameter list
> arch/arm/plat-samsung/include/plat/dma.h:99: warning: 'enum dma_ch' d=
eclared
> inside parameter list
> arch/arm/plat-samsung/include/plat/dma.h:106: warning: 'enum dma_ch'
> declared inside parameter list
> arch/arm/plat-samsung/include/plat/dma.h:114: warning: 'enum dma_ch'
> declared inside parameter list
> arch/arm/plat-samsung/include/plat/dma.h:122: warning: 'enum dma_ch'
> declared inside parameter list
> drivers/mmc/host/s3cmci.c: In function 'finalize_request':
> drivers/mmc/host/s3cmci.c:889: error: type of formal parameter 1 is
> incomplete
> drivers/mmc/host/s3cmci.c: In function 's3cmci_dma_setup':
> drivers/mmc/host/s3cmci.c:927: error: type of formal parameter 1 is
> incomplete
> drivers/mmc/host/s3cmci.c:930: error: type of formal parameter 1 is
> incomplete
> drivers/mmc/host/s3cmci.c:933: error: type of formal parameter 1 is
> incomplete
> drivers/mmc/host/s3cmci.c: In function 's3cmci_prepare_dma':
> drivers/mmc/host/s3cmci.c:1091: error: type of formal parameter 1 is
> incomplete
> drivers/mmc/host/s3cmci.c:1111: error: type of formal parameter 1 is
> incomplete
> drivers/mmc/host/s3cmci.c:1114: error: type of formal parameter 1 is
> incomplete
> drivers/mmc/host/s3cmci.c:1119: error: type of formal parameter 1 is
> incomplete
> drivers/mmc/host/s3cmci.c: In function 's3cmci_probe':
> drivers/mmc/host/s3cmci.c:1692: error: type of formal parameter 1 is
> incomplete
> drivers/mmc/host/s3cmci.c:1778: error: type of formal parameter 1 is
> incomplete
> drivers/mmc/host/s3cmci.c: In function 's3cmci_remove':
> drivers/mmc/host/s3cmci.c:1840: error: type of formal parameter 1 is
> incomplete
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
