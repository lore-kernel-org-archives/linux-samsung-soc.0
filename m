From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH V4 06/14] ARM: SAMSUNG: Add common DMA operations
Date: Wed, 27 Jul 2011 13:27:56 +0530
Message-ID: <CABb+yY2i1rnvqWTFQUnMSrX7_h9KHnNL9xPZ2aHv8hO5Y7j+uA@mail.gmail.com>
References: <1311557312-26107-1-git-send-email-boojin.kim@samsung.com>
	<1311557312-26107-7-git-send-email-boojin.kim@samsung.com>
	<CABb+yY0nWLpdVGqTJPO2YwkGWiDw5tRjC2xn7Le0bO0ZNFHC_g@mail.gmail.com>
	<003801cc4b77$51e9f3e0$f5bddba0$%kim@samsung.com>
	<CABb+yY3shX+myCgO++rUQrFuT81cdhhf18398Wa-S=88UK3rkg@mail.gmail.com>
	<000401cc4c1c$71d63240$558296c0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f171.google.com ([209.85.215.171]:52940 "EHLO
	mail-ey0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751615Ab1G0H6A convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Jul 2011 03:58:00 -0400
Received: by eye22 with SMTP id 22so1713959eye.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Jul 2011 00:57:58 -0700 (PDT)
In-Reply-To: <000401cc4c1c$71d63240$558296c0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Boojin Kim <boojin.kim@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Vinod Koul <vinod.koul@intel.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Grant Likely <grant.likely@secretlab.ca>, linux-samsung-soc@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org

On Wed, Jul 27, 2011 at 10:47 AM, Boojin Kim <boojin.kim@samsung.com> w=
rote:
> Jassi Brar wrote:
>> Sent: Wednesday, July 27, 2011 10:34 AM
>> To: Boojin Kim
>> Cc: linux-arm-kernel@lists.infradead.org; linux-samsung-
>> soc@vger.kernel.org; Vinod Koul; Dan Williams; Kukjin Kim; Grant
>> Likely; Mark Brown
>> Subject: Re: [PATCH V4 06/14] ARM: SAMSUNG: Add common DMA operation=
s
>>
>> On Tue, Jul 26, 2011 at 3:05 PM, Boojin Kim <boojin.kim@samsung.com>
>> wrote:
>> > Jassi Brar Wrote:
>> >> Sent: Monday, July 25, 2011 8:52 PM
>> >> To: Boojin Kim
>> >> Cc: linux-arm-kernel@lists.infradead.org; linux-samsung-
>> >> soc@vger.kernel.org; Vinod Koul; Dan Williams; Kukjin Kim; Grant
>> >> Likely; Mark Brown
>> >> Subject: Re: [PATCH V4 06/14] ARM: SAMSUNG: Add common DMA
>> operations
>> >>
>> >> On Mon, Jul 25, 2011 at 6:58 AM, Boojin Kim
>> <boojin.kim@samsung.com>
>> >> wrote:
>> >>
>> >> > +
>> >> > +static bool pl330_filter(struct dma_chan *chan, void *param)
>> >> > +{
>> >> > + =C2=A0 =C2=A0 =C2=A0 struct dma_pl330_peri *peri =3D (struct =
dma_pl330_peri
>> *)chan-
>> >> >private;
>> >> > + =C2=A0 =C2=A0 =C2=A0 unsigned dma_ch =3D (unsigned)param;
>> >> > +
>> >> > + =C2=A0 =C2=A0 =C2=A0 if (peri->peri_id !=3D dma_ch)
>> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false=
;
>> >> > +
>> >> > + =C2=A0 =C2=A0 =C2=A0 return true;
>> >> > +}
>> >> This is what I meant... if we keep chan_id for paltform assigned
>> IDs,
>> >> these filter functions could simply become
>> >>
>> >> static bool pl330_filter(struct dma_chan *chan, void *param)
>> >> {
>> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 return chan->chan_id =3D=3D param
>> >> }
>> >>
>> >> And ideally in the long run, we could just drop the filter callba=
ck
>> >> and add expected channel ID to the request_channel call.
>> > The chan_id is set by dmaengine. So, We don't use it to hold the
>> user specific
>> > Id.
>> Not for long.
>> See =C2=A0https://lkml.org/lkml/2011/7/26/245
>>
>>
>> >> > +
>> >> > +static inline int s3c_dma_trigger(unsigned ch)
>> >> > +{
>> >> > + =C2=A0 =C2=A0 =C2=A0 return s3c2410_dma_ctrl(ch, S3C2410_DMAO=
P_START);
>> >> > +}
>> >> > +
>> >> > +static inline int s3c_dma_started(unsigned ch)
>> >> > +{
>> >> > + =C2=A0 =C2=A0 =C2=A0 return s3c2410_dma_ctrl(ch, S3C2410_DMAO=
P_STARTED);
>> >> > +}
>> >> > +
>> >> > +static inline int s3c_dma_flush(unsigned ch)
>> >> > +{
>> >> > + =C2=A0 =C2=A0 =C2=A0 return s3c2410_dma_ctrl(ch, S3C2410_DMAO=
P_FLUSH);
>> >> > +}
>> >> > +
>> >> > +static inline int s3c_dma_stop(unsigned ch)
>> >> > +{
>> >> > + =C2=A0 =C2=A0 =C2=A0 return s3c2410_dma_ctrl(ch, S3C2410_DMAO=
P_STOP);
>> >> > +}
>> >> > +
>> >> > +static struct samsung_dma_ops s3c_dma_ops =3D {
>> >> > + =C2=A0 =C2=A0 =C2=A0 .request =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D =
s3c_dma_request,
>> >> > + =C2=A0 =C2=A0 =C2=A0 .release =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D =
s3c_dma_release,
>> >> > + =C2=A0 =C2=A0 =C2=A0 .prepare =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D =
s3c_dma_prepare,
>> >> > + =C2=A0 =C2=A0 =C2=A0 .trigger =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D =
s3c_dma_trigger,
>> >> > + =C2=A0 =C2=A0 =C2=A0 .started =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D =
s3c_dma_started,
>> >> > + =C2=A0 =C2=A0 =C2=A0 .flush =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D s3c_dma_flush,
>> >> > + =C2=A0 =C2=A0 =C2=A0 .stop =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =3D s3c_dma_stop,
>> >>
>> >> These last 4 should be gnereallized into one callback with OP
>> argument.
>> > I don't have any idea about it. Can you explain it in more detail?
>>
>> static int s3c_dma_control(unsigned ch, enum s3c2410_chan_op/*or
>> similar*/ op)
>> =C2=A0{
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 return s3c2410_dma_ctrl(ch, op);
>> =C2=A0}
>>
>> static struct samsung_dma_ops s3c_dma_ops =3D {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 .request =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D =
s3c_dma_request,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 .release =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D =
s3c_dma_release,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 .prepare =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D =
s3c_dma_prepare,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 .control =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D =
s3c_dma_control,
> 'Struct samsung_dma_ops' is used for both 'S3C-DMA-OPS' for 's3c dma'=
 and
> 'DMA-OPS' for 'dmaengine'.
> If I modify "Struct samsung_dma_ops" as your guide, It gives un-expec=
table
> effect to DMA-OPS.
> Actually, We don't want the client with 'DMA-OPS' uses 'enum s3c2410_=
chan_op'
> operation anymore.

" enum s3c2410_chan_op /* or similar */ "  <<<<  note 'or similar'

Defining a callback for each value of the argument doesn't make sense.
