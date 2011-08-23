From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 2/3] ARM: SAMSUNG: Modify pl330 channel filter function
Date: Tue, 23 Aug 2011 21:29:43 +0530
Message-ID: <CAJuYYwRL0LGA_TAQtfxAZhz4kYgvFnXfb=81s7ohH03dDTK8Mw@mail.gmail.com>
References: <1314050385-9617-1-git-send-email-thomas.abraham@linaro.org>
	<1314050385-9617-2-git-send-email-thomas.abraham@linaro.org>
	<1314050385-9617-3-git-send-email-thomas.abraham@linaro.org>
	<20110822215255.GB3895@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gw0-f46.google.com ([74.125.83.46]:52582 "EHLO
	mail-gw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751959Ab1HWP7o convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Aug 2011 11:59:44 -0400
Received: by gwaa12 with SMTP id a12so196335gwa.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Aug 2011 08:59:43 -0700 (PDT)
In-Reply-To: <20110822215255.GB3895@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, vinod.koul@intel.com, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org

Hi Russell,

On 23 August 2011 03:22, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Tue, Aug 23, 2011 at 03:29:44AM +0530, Thomas Abraham wrote:
>> With the change in dma channels private data information, the pl330
>> channel filter function is modified to look for a simple u8 value
>> instead of the now unused 'struct dma_pl330_peri' value.
>>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> ---
>> =A0arch/arm/plat-samsung/dma-ops.c | =A0 =A04 ++--
>> =A01 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/plat-samsung/dma-ops.c b/arch/arm/plat-samsung=
/dma-ops.c
>> index 6e3d9ab..4f1430b 100644
>> --- a/arch/arm/plat-samsung/dma-ops.c
>> +++ b/arch/arm/plat-samsung/dma-ops.c
>> @@ -19,8 +19,8 @@
>>
>> =A0static inline bool pl330_filter(struct dma_chan *chan, void *para=
m)
>> =A0{
>> - =A0 =A0 struct dma_pl330_peri *peri =3D chan->private;
>> - =A0 =A0 return peri->peri_id =3D=3D (unsigned)param;
>> + =A0 =A0 u8 *peri_id =3D chan->private;
>> + =A0 =A0 return *peri_id =3D=3D (unsigned)param;
>> =A0}
>
> As a word of warning - this will fail horribly if you have mixed DMA
> engines in the system. =A0While we wait for a better scheme, we reall=
y
> need to sort out these filter functions properly and stop poking
> about in data which may not be what we expect.
>
> One solution to that is to move pl330_filter() into drivers/dma/pl330=
=2Ec
> and have it check chan->device->dev->driver =3D=3D &pl330_driver.driv=
er
> _before_ we start accessing chan->private.
>
> That's not a comment against your patch - you're not really changing
> the brokenness of this function. =A0It would be good to see a follow =
up
> patch fixing it properly though.
>

Ok. I will prepare a patch to move the pl330_filter function into
drivers/dma/pl330.c and also add the check that you have proposed.

Thanks for your help.

Regards,
Thomas.
