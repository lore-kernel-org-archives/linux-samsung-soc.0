From: Sangwook Lee <sangwook.lee@linaro.org>
Subject: Re: [PATCH] ARM:SAMSUNG: DMA Cleanup as per sparse
Date: Wed, 6 Jul 2011 09:31:46 +0100
Message-ID: <CADPsn1bM191O44B2ffohQU+qD859yDcNHAZqF2=D824oQYD8sg@mail.gmail.com>
References: <1309428980-20176-1-git-send-email-sangwook.lee@linaro.org>
	<00c001cc3ba3$34558670$9d009350$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:55980 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753263Ab1GFIbq convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Jul 2011 04:31:46 -0400
Received: by pvg12 with SMTP id 12so5835197pvg.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Jul 2011 01:31:46 -0700 (PDT)
In-Reply-To: <00c001cc3ba3$34558670$9d009350$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, ben-linux@fluff.org

I can reproduce this errors and let me see how to fix those.


On 6 July 2011 07:08, Kukjin Kim <kgene.kim@samsung.com> wrote:
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
>> > =A0arch/arm/plat-samsung/include/plat/dma.h | =A0 16 ++++++++-----=
---
>> > =A01 files changed, 8 insertions(+), 8 deletions(-)
>> >
>> > diff --git a/arch/arm/plat-samsung/include/plat/dma.h b/arch/arm/p=
lat-
>> > samsung/include/plat/dma.h
>> > index 2e8f8c6..7365f46 100644
>> > --- a/arch/arm/plat-samsung/include/plat/dma.h
>> > +++ b/arch/arm/plat-samsung/include/plat/dma.h
>> > @@ -62,7 +62,7 @@ typedef int =A0(*s3c2410_dma_opfn_t)(struct
>> > s3c2410_dma_chan *,
>> > =A0 * request a dma channel exclusivley
>> > =A0*/
>> >
>> > -extern int s3c2410_dma_request(unsigned int channel,
>> > +extern int s3c2410_dma_request(enum dma_ch id,
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct s3c2=
410_dma_client *, void *dev);
>> >
>> >
>> > @@ -71,14 +71,14 @@ extern int s3c2410_dma_request(unsigned int ch=
annel,
>> > =A0 * change the state of the dma channel
>> > =A0*/
>> >
>> > -extern int s3c2410_dma_ctrl(unsigned int channel, enum s3c2410_ch=
an_op
> op);
>> > +extern int s3c2410_dma_ctrl(enum dma_ch id, enum s3c2410_chan_op =
op);
>> >
>> > =A0/* s3c2410_dma_setflags
>> > =A0 *
>> > =A0 * set the channel's flags to a given state
>> > =A0*/
>> >
>> > -extern int s3c2410_dma_setflags(unsigned int channel,
>> > +extern int s3c2410_dma_setflags(enum dma_ch id,
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned i=
nt flags);
>> >
>> > =A0/* s3c2410_dma_free
>> > @@ -86,7 +86,7 @@ extern int s3c2410_dma_setflags(unsigned int cha=
nnel,
>> > =A0 * free the dma channel (will also abort any outstanding operat=
ions)
>> > =A0*/
>> >
>> > -extern int s3c2410_dma_free(unsigned int channel, struct
> s3c2410_dma_client *);
>> > +extern int s3c2410_dma_free(enum dma_ch id, struct s3c2410_dma_cl=
ient
> *);
>> >
>> > =A0/* s3c2410_dma_enqueue
>> > =A0 *
>> > @@ -95,7 +95,7 @@ extern int s3c2410_dma_free(unsigned int channel=
,
> struct
>> > s3c2410_dma_client *);
>> > =A0 * drained before the buffer is given to the DMA system.
>> > =A0*/
>> >
>> > -extern int s3c2410_dma_enqueue(unsigned int channel, void *id,
>> > +extern int s3c2410_dma_enqueue(enum dma_ch idx, void *id,
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dma_addr_t =
data, int size);
>> >
>> > =A0/* s3c2410_dma_config
>> > @@ -103,14 +103,14 @@ extern int s3c2410_dma_enqueue(unsigned int
> channel,
>> > void *id,
>> > =A0 * configure the dma channel
>> > =A0*/
>> >
>> > -extern int s3c2410_dma_config(unsigned int channel, int xferunit)=
;
>> > +extern int s3c2410_dma_config(enum dma_ch id, int xferunit);
>> >
>> > =A0/* s3c2410_dma_devconfig
>> > =A0 *
>> > =A0 * configure the device we're talking to
>> > =A0*/
>> >
>> > -extern int s3c2410_dma_devconfig(unsigned int channel,
>> > +extern int s3c2410_dma_devconfig(enum dma_ch id,
>> > =A0 =A0 =A0 =A0 =A0 =A0 enum s3c2410_dmasrc source, unsigned long =
devaddr);
>> >
>> > =A0/* s3c2410_dma_getposition
>> > @@ -118,7 +118,7 @@ extern int s3c2410_dma_devconfig(unsigned int
> channel,
>> > =A0 * get the position that the dma transfer is currently at
>> > =A0*/
>> >
>> > -extern int s3c2410_dma_getposition(unsigned int channel,
>> > +extern int s3c2410_dma_getposition(enum dma_ch id,
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dma=
_addr_t *src, dma_addr_t *dest);
>> >
>> > =A0extern int s3c2410_dma_set_opfn(unsigned int, s3c2410_dma_opfn_=
t rtn);
>> > --
>
> Hi Sangwook Lee,
>
> I reverted this in my -fix tree just now because this makes following=
 error
> with s3c2410_defconfig.
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
