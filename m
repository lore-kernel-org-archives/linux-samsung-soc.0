From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 4/6] DMA: PL330: Add device tree support
Date: Tue, 30 Aug 2011 18:39:17 +0530
Message-ID: <CAJuYYwRGaeTnXh=7RCK4RCkRyFXTCzcRiXUJQ+yjRD_BAUzyYQ@mail.gmail.com>
References: <1314348014-2481-1-git-send-email-thomas.abraham@linaro.org>
	<1314348014-2481-2-git-send-email-thomas.abraham@linaro.org>
	<1314348014-2481-3-git-send-email-thomas.abraham@linaro.org>
	<1314348014-2481-4-git-send-email-thomas.abraham@linaro.org>
	<1314348014-2481-5-git-send-email-thomas.abraham@linaro.org>
	<4E579C9B.7030807@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4E579C9B.7030807@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robherring2@gmail.com>
Cc: boojin.kim@samsung.com, kgene.kim@samsung.com, patches@linaro.org, vinod.koul@intel.com, devicetree-discuss@lists.ozlabs.org, jassisinghbrar@gmail.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Rob,

On 26 August 2011 18:46, Rob Herring <robherring2@gmail.com> wrote:
> Thomas,
>
> On 08/26/2011 03:40 AM, Thomas Abraham wrote:
>> For PL330 dma controllers instantiated from device tree, the channel
>> lookup is based on phandle of the dma controller and dma request id
>> specified by the client node. During probe, the private data of each
>> channel of the controller is set to point to the device node of the
>> dma controller. The 'chan_id' of the each channel is used as the
>> dma request id.
>>
>> Client driver requesting dma channels specify the phandle of the
>> dma controller and the request id. The pl330 filter function
>> converts the phandle to the device node pointer and matches that
>> with channel's private data. If a match is found, the request id
>> from the client node and the 'chan_id' of the channel is matched.
>> A channel is found if both the values match.
>>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> ---
>> =A0.../devicetree/bindings/dma/arm-pl330.txt =A0 =A0 =A0 =A0 =A0| =A0 42=
 +++++++++++++
>> =A0drivers/dma/pl330.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0| =A0 63 +++++++++++++++++++-
>> =A02 files changed, 103 insertions(+), 2 deletions(-)
>> =A0create mode 100644 Documentation/devicetree/bindings/dma/arm-pl330.txt
>>
>> diff --git a/Documentation/devicetree/bindings/dma/arm-pl330.txt b/Docum=
entation/devicetree/bindings/dma/arm-pl330.txt
>> new file mode 100644
>> index 0000000..46a8307
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/dma/arm-pl330.txt
>> @@ -0,0 +1,42 @@
>> +* ARM PrimeCell PL330 DMA Controller
>> +
>> +The ARM PrimeCell PL330 DMA controller can move blocks of memory conten=
ts
>> +between memory and peripherals or memory to memory.
>> +
>> +Required properties:
>> + =A0- compatible: should one or more of the following
>> + =A0 =A0- arm,pl330-pdma - For controllers that support mem-to-dev and =
dev-to-mem
>> + =A0 =A0 =A0transfers.
>> + =A0 =A0- arm,pl330-mdma - For controllers that support mem-to-mem tran=
sfers only.
>
> And if they support both? I would think all controllers can support
> mem-to-mem. If so, the distinction can be made with the number of request=
s.

If a controller supports both types of transfer, the device node
should not claim compatibility for "arm,pl330-pdma" or
"arm,pl330-mdma". Compatible should be "arm,primecell".

>
>> + =A0 =A0- arm,primecell - should be included for all pl330 dma controll=
er nodes.
>> +
>> + =A0- reg: physical base address of the controller and length of memory=
 mapped
>> + =A0 =A0region.
>> +
>> + =A0- interrupts: interrupt number to the cpu.
>> +
>> + =A0- arm,primecell-periphid: should be 0x00041330.
>
> Should be optional. It's only needed when the h/w value is wrong. This
> is already documented in primecell.txt.

Ok. This will be made optional.

>
>> +
>> + =A0- arm,pl330-peri-reqs: number of actual peripheral requests connect=
ed to the
>> + =A0 =A0dma controller. Maximum value is 32.
>
> Perhaps could be a bitmask for sparsely populated requests. May not
> matter since phandles will define the connections.
>
> Can be optional and not present means 00 requests (mem-to-mem only).

As suggested by Russell, this property will be removed and its value
will be read from the configuration register.

>
>> +
>> +Example: (from Samsung's Exynos4 processor dtsi file)
>> +
>> + =A0 =A0 pdma0: pdma@12680000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "arm,pl330-pdma", "arm,primecel=
l";
>> + =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x12680000 0x1000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <99>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 arm,primecell-periphid =3D <0x00041330>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 arm,pl330-peri-reqs =3D <30>;
>> + =A0 =A0 };
>> +
>> +Client drivers (device nodes requiring dma transfers from dev-to-mem or
>> +mem-to-dev) should specify the DMA channel numbers using a two-value pa=
ir
>> +as shown below.
>> +
>> + =A0[property name] =A0=3D <[phandle of the dma controller] [dma reques=
t id]>;
>> +
>> + =A0 =A0 =A0where 'dma request id' is the dma request number which is c=
onnected
>> + =A0 =A0 =A0to the client controller.
>> +
>> + =A0Example: =A0tx-dma-channel =3D <&pdma0 12>;
>
> I like this approach. I looked at this some and some PPC platforms do a
> node for each channel/request, but this is much more simple and similar
> to clock binding approach.
>
> You need to define the property name. Probably just "dma-channel" is
> enough. For peripherals with more than 1, just list them out like when
> you have more than 1 interrupt. The order should be defined as part of
> that device's binding (i.e. 1st channel is tx and 2nd channel is rx).

I am little hesitant to do this the way you suggested. A controller
could have dma request lines connected to multiple dma controllers. So
the phandle could be different for each dma channel. Also, the client
drivers specify the property value for each dma channel requested (the
property value gets assigned to chan->private and then used by the
filter function to lookup the dma channel). So changing it the way you
have suggested would make things complex.

>
>> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
>> index 9732995..984dc18 100644
>> --- a/drivers/dma/pl330.c
>> +++ b/drivers/dma/pl330.c
>> @@ -19,6 +19,7 @@
>> =A0#include <linux/amba/pl330.h>
>> =A0#include <linux/pm_runtime.h>
>> =A0#include <linux/scatterlist.h>
>> +#include <linux/of.h>
>>
>> =A0#define NR_DEFAULT_DESC =A0 =A0 =A016
>>
>> @@ -277,6 +278,20 @@ bool pl330_filter(struct dma_chan *chan, void *para=
m)
>> =A0 =A0 =A0 if (chan->device->dev->driver !=3D &pl330_driver.drv)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 return false;
>>
>> +#ifdef CONFIG_OF
>> + =A0 =A0 if (chan->device->dev->of_node) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 const __be32 *prop_value;
>> + =A0 =A0 =A0 =A0 =A0 =A0 phandle phandle;
>> + =A0 =A0 =A0 =A0 =A0 =A0 struct device_node *node;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 prop_value =3D ((struct property *)param)->val=
ue;
>> + =A0 =A0 =A0 =A0 =A0 =A0 phandle =3D be32_to_cpup(prop_value++);
>> + =A0 =A0 =A0 =A0 =A0 =A0 node =3D of_find_node_by_phandle(phandle);
>> + =A0 =A0 =A0 =A0 =A0 =A0 return ((chan->private =3D=3D node) &&
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (chan->chan_id=
 =3D=3D be32_to_cpup(prop_value)));
>> + =A0 =A0 }
>> +#endif
>> +
>> =A0 =A0 =A0 peri_id =3D chan->private;
>> =A0 =A0 =A0 return *peri_id =3D=3D (unsigned)param;
>> =A0}
>> @@ -777,6 +792,40 @@ static irqreturn_t pl330_irq_handler(int irq, void =
*data)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 return IRQ_NONE;
>> =A0}
>>
>> +#ifdef CONFIG_OF
>> +static struct dma_pl330_platdata *pl330_parse_dt(struct device *dev)
>> +{
>> + =A0 =A0 struct dma_pl330_platdata *pdat;
>> + =A0 =A0 const void *value;
>> +
>> + =A0 =A0 pdat =3D devm_kzalloc(dev, sizeof(*pdat), GFP_KERNEL);
>> + =A0 =A0 if (!pdat)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return NULL;
>
> Ideally, we will get rid of platform_data completely in the future, so I
> don't think filling it in from DT is the right approach.

Ok. I will drop the usage of platform data.

>
>> +
>> + =A0 =A0 value =3D of_get_property(dev->of_node, "arm,pl330-peri-reqs",=
 NULL);
>> + =A0 =A0 if (value)
>> + =A0 =A0 =A0 =A0 =A0 =A0 pdat->nr_valid_peri =3D be32_to_cpup(value);
>
> Can't you use the u32 helper function here?

This will go away now since the number of peripherals connected will
be read from the configuration register.

>
>> +
>> + =A0 =A0 if (of_device_is_compatible(dev->of_node, "arm,pl330-pdma")) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 dma_cap_set(DMA_SLAVE, pdat->cap_mask);
>> + =A0 =A0 =A0 =A0 =A0 =A0 dma_cap_set(DMA_CYCLIC, pdat->cap_mask);
>> + =A0 =A0 } else if (of_device_is_compatible(dev->of_node, "arm,pl330-md=
ma")) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 dma_cap_set(DMA_MEMCPY, pdat->cap_mask);
>> + =A0 =A0 } else if (of_device_is_compatible(dev->of_node, "arm,primecel=
l")) {
>
> I don't think the driver should look at this property. This is really
> just for the bus code.

The dma capabilities are derived from the compatible value by the
driver. Sorry, I do not understand your suggestion for this.

Thanks for your help.

Regards,
Thomas.

>
> Rob
>
>> + =A0 =A0 =A0 =A0 =A0 =A0 dma_cap_set(DMA_SLAVE, pdat->cap_mask);
>> + =A0 =A0 =A0 =A0 =A0 =A0 dma_cap_set(DMA_CYCLIC, pdat->cap_mask);
>> + =A0 =A0 =A0 =A0 =A0 =A0 dma_cap_set(DMA_MEMCPY, pdat->cap_mask);
>> + =A0 =A0 }
>> +
>> + =A0 =A0 return pdat;
>> +}
>> +#else
>> +static struct dma_pl330_platdata *pl330_parse_dt(struct device *dev)
>> +{
>> + =A0 =A0 return NULL;
>> +}
>> +#endif
>> +
>> =A0static int __devinit
>> =A0pl330_probe(struct amba_device *adev, const struct amba_id *id)
>> =A0{
>> @@ -789,7 +838,13 @@ pl330_probe(struct amba_device *adev, const struct =
amba_id *id)
>> =A0 =A0 =A0 int i, ret, irq;
>> =A0 =A0 =A0 int num_chan;
>>
>> - =A0 =A0 pdat =3D adev->dev.platform_data;
>> + =A0 =A0 if (adev->dev.of_node) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 pdat =3D pl330_parse_dt(&adev->dev);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (!pdat)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
>> + =A0 =A0 } else {
>> + =A0 =A0 =A0 =A0 =A0 =A0 pdat =3D adev->dev.platform_data;
>> + =A0 =A0 }
>>
>> =A0 =A0 =A0 /* Allocate a new DMAC and its Channels */
>> =A0 =A0 =A0 pdmac =3D kzalloc(sizeof(*pdmac), GFP_KERNEL);
>> @@ -862,7 +917,11 @@ pl330_probe(struct amba_device *adev, const struct =
amba_id *id)
>>
>> =A0 =A0 =A0 for (i =3D 0; i < num_chan; i++) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 pch =3D &pdmac->peripherals[i];
>> - =A0 =A0 =A0 =A0 =A0 =A0 pch->chan.private =3D pdat ? &pdat->peri_id[i]=
 : NULL;
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (!adev->dev.of_node)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pch->chan.private =3D pdat ? &=
pdat->peri_id[i] : NULL;
>> + =A0 =A0 =A0 =A0 =A0 =A0 else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pch->chan.private =3D adev->de=
v.of_node;
>> +
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 INIT_LIST_HEAD(&pch->work_list);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_lock_init(&pch->lock);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 pch->pl330_chid =3D NULL;
>
>
