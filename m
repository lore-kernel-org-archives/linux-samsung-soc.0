From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 4/6] DMA: PL330: Add device tree support
Date: Wed, 31 Aug 2011 12:16:48 +0530
Message-ID: <CAJuYYwT5HGy9b06AyrLJv5hFCFf_YRA4md9N=m+cwcJNTqRDWg@mail.gmail.com>
References: <1314348014-2481-1-git-send-email-thomas.abraham@linaro.org>
	<1314348014-2481-2-git-send-email-thomas.abraham@linaro.org>
	<1314348014-2481-3-git-send-email-thomas.abraham@linaro.org>
	<1314348014-2481-4-git-send-email-thomas.abraham@linaro.org>
	<1314348014-2481-5-git-send-email-thomas.abraham@linaro.org>
	<4E579C9B.7030807@gmail.com>
	<CAJuYYwR5GqqKjbMngQqorLuka4XN0jin5s6O66orTtSQg5eKRw@mail.gmail.com>
	<4E5CE37E.1050104@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:61671 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753940Ab1HaGqs convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 31 Aug 2011 02:46:48 -0400
Received: by ywf7 with SMTP id 7so345429ywf.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Aug 2011 23:46:48 -0700 (PDT)
In-Reply-To: <4E5CE37E.1050104@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: devicetree-discuss@lists.ozlabs.org, boojin.kim@samsung.com, kgene.kim@samsung.com, patches@linaro.org, vinod.koul@intel.com, jassisinghbrar@gmail.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi Rob,

On 30 August 2011 18:49, Rob Herring <robherring2@gmail.com> wrote:
> Thomas,
>
> On 08/30/2011 07:18 AM, Thomas Abraham wrote:
>> Hi Rob,
>>
>> On 26 August 2011 18:46, Rob Herring <robherring2@gmail.com
>> <mailto:robherring2@gmail.com>> wrote:
>>
>> =A0 =A0 Thomas,
>>
>> =A0 =A0 On 08/26/2011 03:40 AM, Thomas Abraham wrote:
>> =A0 =A0 > For PL330 dma controllers instantiated from device tree, t=
he channel
>> =A0 =A0 > lookup is based on phandle of the dma controller and dma r=
equest id
>> =A0 =A0 > specified by the client node. During probe, the private da=
ta of each
>> =A0 =A0 > channel of the controller is set to point to the device no=
de of the
>> =A0 =A0 > dma controller. The 'chan_id' of the each channel is used =
as the
>> =A0 =A0 > dma request id.
>> =A0 =A0 >
>> =A0 =A0 > Client driver requesting dma channels specify the phandle =
of the
>> =A0 =A0 > dma controller and the request id. The pl330 filter functi=
on
>> =A0 =A0 > converts the phandle to the device node pointer and matche=
s that
>> =A0 =A0 > with channel's private data. If a match is found, the requ=
est id
>> =A0 =A0 > from the client node and the 'chan_id' of the channel is m=
atched.
>> =A0 =A0 > A channel is found if both the values match.
>> =A0 =A0 >
>> =A0 =A0 > Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org
>> =A0 =A0 <mailto:thomas.abraham@linaro.org>>
>> =A0 =A0 > ---
>> =A0 =A0 > =A0.../devicetree/bindings/dma/arm-pl330.txt =A0 =A0 =A0 =A0=
 =A0| =A0 42
>> =A0 =A0 +++++++++++++
>> =A0 =A0 > =A0drivers/dma/pl330.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 63
>> =A0 =A0 +++++++++++++++++++-
>> =A0 =A0 > =A02 files changed, 103 insertions(+), 2 deletions(-)
>> =A0 =A0 > =A0create mode 100644
>> =A0 =A0 Documentation/devicetree/bindings/dma/arm-pl330.txt
>> =A0 =A0 >
>> =A0 =A0 > diff --git a/Documentation/devicetree/bindings/dma/arm-pl3=
30.txt
>> =A0 =A0 b/Documentation/devicetree/bindings/dma/arm-pl330.txt
>> =A0 =A0 > new file mode 100644
>> =A0 =A0 > index 0000000..46a8307
>> =A0 =A0 > --- /dev/null
>> =A0 =A0 > +++ b/Documentation/devicetree/bindings/dma/arm-pl330.txt
>> =A0 =A0 > @@ -0,0 +1,42 @@
>> =A0 =A0 > +* ARM PrimeCell PL330 DMA Controller
>> =A0 =A0 > +
>> =A0 =A0 > +The ARM PrimeCell PL330 DMA controller can move blocks of=
 memory
>> =A0 =A0 contents
>> =A0 =A0 > +between memory and peripherals or memory to memory.
>> =A0 =A0 > +
>> =A0 =A0 > +Required properties:
>> =A0 =A0 > + =A0- compatible: should one or more of the following
>> =A0 =A0 > + =A0 =A0- arm,pl330-pdma - For controllers that support m=
em-to-dev
>> =A0 =A0 and dev-to-mem
>> =A0 =A0 > + =A0 =A0 =A0transfers.
>> =A0 =A0 > + =A0 =A0- arm,pl330-mdma - For controllers that support m=
em-to-mem
>> =A0 =A0 transfers only.
>>
>> =A0 =A0 And if they support both? I would think all controllers can =
support
>> =A0 =A0 mem-to-mem. If so, the distinction can be made with the numb=
er of
>> =A0 =A0 requests.
>>
>>
>> If a controller supports both types of transfer, the device node sho=
uld
>> not claim compatibility for "arm,pl330-pdma" or "arm,pl330-mdma".
>> Compatible should be "arm,primecell".
>
> No, every Primecell peripheral has "arm,primecell", so it is not
> specific enough for a driver to use.
>
> Is there a case that a controller with peripheral requests cannot
> support mem-to-mem transfers? I don't think there is. You could decid=
e
> you don't want to for other reasons like you don't have enough free
> channels, but that's really a s/w decision, not a h/w description.

Ok. The driver has now been changed in a way that DMA_MEMCPY
capability is assigned by default to a pl330 dma controller. The
DMA_SLAVE and DMA_CYCLIC capability are assigned if the controller
supports peripheral request interface. For mem-to-mem transfer channel
requests, the filter function specified for the request should check
for the right match.

>
>>
>>
>> =A0 =A0 > + =A0 =A0- arm,primecell - should be included for all pl33=
0 dma
>> =A0 =A0 controller nodes.
>> =A0 =A0 > +
>> =A0 =A0 > + =A0- reg: physical base address of the controller and le=
ngth of
>> =A0 =A0 memory mapped
>> =A0 =A0 > + =A0 =A0region.
>> =A0 =A0 > +
>> =A0 =A0 > + =A0- interrupts: interrupt number to the cpu.
>> =A0 =A0 > +
>> =A0 =A0 > + =A0- arm,primecell-periphid: should be 0x00041330.
>>
>> =A0 =A0 Should be optional. It's only needed when the h/w value is w=
rong. This
>> =A0 =A0 is already documented in primecell.txt.
>>
>>
>> Ok. This will be made optional.
>>
>>
>>
>> =A0 =A0 > +
>> =A0 =A0 > + =A0- arm,pl330-peri-reqs: number of actual peripheral re=
quests
>> =A0 =A0 connected to the
>> =A0 =A0 > + =A0 =A0dma controller. Maximum value is 32.
>>
>> =A0 =A0 Perhaps could be a bitmask for sparsely populated requests. =
May not
>> =A0 =A0 matter since phandles will define the connections.
>>
>> =A0 =A0 Can be optional and not present means 00 requests (mem-to-me=
m only).
>>
>>
>> As suggested by Russell, this property will be removed and its value
>> will be read from the configuration register.
>>
>
> Good. Reading a value of 0 requests can still be used to determine th=
e
> controller is mem-to-mem only.
>
>>
>> =A0 =A0 > +
>> =A0 =A0 > +Example: (from Samsung's Exynos4 processor dtsi file)
>> =A0 =A0 > +
>> =A0 =A0 > + =A0 =A0 pdma0: pdma@12680000 {
>> =A0 =A0 > + =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "arm,pl330-pdma",=
 "arm,primecell";
>> =A0 =A0 > + =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x12680000 0x1000>;
>> =A0 =A0 > + =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <99>;
>> =A0 =A0 > + =A0 =A0 =A0 =A0 =A0 =A0 arm,primecell-periphid =3D <0x00=
041330>;
>> =A0 =A0 > + =A0 =A0 =A0 =A0 =A0 =A0 arm,pl330-peri-reqs =3D <30>;
>> =A0 =A0 > + =A0 =A0 };
>> =A0 =A0 > +
>> =A0 =A0 > +Client drivers (device nodes requiring dma transfers from
>> =A0 =A0 dev-to-mem or
>> =A0 =A0 > +mem-to-dev) should specify the DMA channel numbers using =
a
>> =A0 =A0 two-value pair
>> =A0 =A0 > +as shown below.
>> =A0 =A0 > +
>> =A0 =A0 > + =A0[property name] =A0=3D <[phandle of the dma controlle=
r] [dma
>> =A0 =A0 request id]>;
>> =A0 =A0 > +
>> =A0 =A0 > + =A0 =A0 =A0where 'dma request id' is the dma request num=
ber which is
>> =A0 =A0 connected
>> =A0 =A0 > + =A0 =A0 =A0to the client controller.
>> =A0 =A0 > +
>> =A0 =A0 > + =A0Example: =A0tx-dma-channel =3D <&pdma0 12>;
>>
>> =A0 =A0 I like this approach. I looked at this some and some PPC pla=
tforms do a
>> =A0 =A0 node for each channel/request, but this is much more simple =
and similar
>> =A0 =A0 to clock binding approach.
>>
>> =A0 =A0 You need to define the property name. Probably just "dma-cha=
nnel" is
>> =A0 =A0 enough. For peripherals with more than 1, just list them out=
 like when
>> =A0 =A0 you have more than 1 interrupt. The order should be defined =
as part of
>> =A0 =A0 that device's binding (i.e. 1st channel is tx and 2nd channe=
l is rx).
>>
>>
>> I am little hesitant to do this the way you suggested. A controller
>> could have dma request lines connected to multiple dma controllers. =
So
>> the phandle could be different for each dma channel. Also, the clien=
t
>> drivers specify the property value for each dma channel requested (t=
he
>> property value gets assigned to chan->private and then used by the
>> filter function to lookup the dma channel). So changing it the way y=
ou
>> have suggested would make things complex.
>>
>
> Perhaps you could make private point to the array entry rather than t=
he
> property.
>
> But I don't have s strong opinion either way.

There could be cases where tx could be polled and rx uses dma transfer
and such this could vary across platforms. This would make parsing the
property value a little complex and so I still perfer to use property
for each dma channel required in the client device nodes.

>
>>
>> =A0 =A0 > diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
>> =A0 =A0 > index 9732995..984dc18 100644
>> =A0 =A0 > --- a/drivers/dma/pl330.c
>> =A0 =A0 > +++ b/drivers/dma/pl330.c
>> =A0 =A0 > @@ -19,6 +19,7 @@
>> =A0 =A0 > =A0#include <linux/amba/pl330.h>
>> =A0 =A0 > =A0#include <linux/pm_runtime.h>
>> =A0 =A0 > =A0#include <linux/scatterlist.h>
>> =A0 =A0 > +#include <linux/of.h>
>> =A0 =A0 >
>> =A0 =A0 > =A0#define NR_DEFAULT_DESC =A0 =A0 =A016
>> =A0 =A0 >
>> =A0 =A0 > @@ -277,6 +278,20 @@ bool pl330_filter(struct dma_chan *ch=
an, void
>> =A0 =A0 *param)
>> =A0 =A0 > =A0 =A0 =A0 if (chan->device->dev->driver !=3D &pl330_driv=
er.drv)
>> =A0 =A0 > =A0 =A0 =A0 =A0 =A0 =A0 =A0 return false;
>> =A0 =A0 >
>> =A0 =A0 > +#ifdef CONFIG_OF
>> =A0 =A0 > + =A0 =A0 if (chan->device->dev->of_node) {
>> =A0 =A0 > + =A0 =A0 =A0 =A0 =A0 =A0 const __be32 *prop_value;
>> =A0 =A0 > + =A0 =A0 =A0 =A0 =A0 =A0 phandle phandle;
>> =A0 =A0 > + =A0 =A0 =A0 =A0 =A0 =A0 struct device_node *node;
>> =A0 =A0 > +
>> =A0 =A0 > + =A0 =A0 =A0 =A0 =A0 =A0 prop_value =3D ((struct property=
 *)param)->value;
>> =A0 =A0 > + =A0 =A0 =A0 =A0 =A0 =A0 phandle =3D be32_to_cpup(prop_va=
lue++);
>> =A0 =A0 > + =A0 =A0 =A0 =A0 =A0 =A0 node =3D of_find_node_by_phandle=
(phandle);
>> =A0 =A0 > + =A0 =A0 =A0 =A0 =A0 =A0 return ((chan->private =3D=3D no=
de) &&
>> =A0 =A0 > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
(chan->chan_id =3D=3D
>> =A0 =A0 be32_to_cpup(prop_value)));
>> =A0 =A0 > + =A0 =A0 }
>> =A0 =A0 > +#endif
>> =A0 =A0 > +
>> =A0 =A0 > =A0 =A0 =A0 peri_id =3D chan->private;
>> =A0 =A0 > =A0 =A0 =A0 return *peri_id =3D=3D (unsigned)param;
>> =A0 =A0 > =A0}
>> =A0 =A0 > @@ -777,6 +792,40 @@ static irqreturn_t pl330_irq_handler(=
int irq,
>> =A0 =A0 void *data)
>> =A0 =A0 > =A0 =A0 =A0 =A0 =A0 =A0 =A0 return IRQ_NONE;
>> =A0 =A0 > =A0}
>> =A0 =A0 >
>> =A0 =A0 > +#ifdef CONFIG_OF
>> =A0 =A0 > +static struct dma_pl330_platdata *pl330_parse_dt(struct d=
evice *dev)
>> =A0 =A0 > +{
>> =A0 =A0 > + =A0 =A0 struct dma_pl330_platdata *pdat;
>> =A0 =A0 > + =A0 =A0 const void *value;
>> =A0 =A0 > +
>> =A0 =A0 > + =A0 =A0 pdat =3D devm_kzalloc(dev, sizeof(*pdat), GFP_KE=
RNEL);
>> =A0 =A0 > + =A0 =A0 if (!pdat)
>> =A0 =A0 > + =A0 =A0 =A0 =A0 =A0 =A0 return NULL;
>>
>> =A0 =A0 Ideally, we will get rid of platform_data completely in the =
future, so I
>> =A0 =A0 don't think filling it in from DT is the right approach.
>>
>>
>> Ok. I will drop the usage of platform data.
>>
>>
>> =A0 =A0 > +
>> =A0 =A0 > + =A0 =A0 value =3D of_get_property(dev->of_node, "arm,pl3=
30-peri-reqs",
>> =A0 =A0 NULL);
>> =A0 =A0 > + =A0 =A0 if (value)
>> =A0 =A0 > + =A0 =A0 =A0 =A0 =A0 =A0 pdat->nr_valid_peri =3D be32_to_=
cpup(value);
>>
>> =A0 =A0 Can't you use the u32 helper function here?
>>
>>
>> This will go away now since the number of peripherals connected will=
 be
>> read from the configuration register.
>>
>>
>> =A0 =A0 > +
>> =A0 =A0 > + =A0 =A0 if (of_device_is_compatible(dev->of_node, "arm,p=
l330-pdma")) {
>> =A0 =A0 > + =A0 =A0 =A0 =A0 =A0 =A0 dma_cap_set(DMA_SLAVE, pdat->cap=
_mask);
>> =A0 =A0 > + =A0 =A0 =A0 =A0 =A0 =A0 dma_cap_set(DMA_CYCLIC, pdat->ca=
p_mask);
>> =A0 =A0 > + =A0 =A0 } else if (of_device_is_compatible(dev->of_node,
>> =A0 =A0 "arm,pl330-mdma")) {
>> =A0 =A0 > + =A0 =A0 =A0 =A0 =A0 =A0 dma_cap_set(DMA_MEMCPY, pdat->ca=
p_mask);
>> =A0 =A0 > + =A0 =A0 } else if (of_device_is_compatible(dev->of_node,
>> =A0 =A0 "arm,primecell")) {
>>
>> =A0 =A0 I don't think the driver should look at this property. This =
is really
>> =A0 =A0 just for the bus code.
>>
>>
>> The dma capabilities are derived from the compatible value by the
>> driver. Sorry, I do not understand your suggestion for this.
>>
>
> "arm,primecell" is purely for identifying peripherals with the Primec=
ell
> ID registers and in turn used to create amba_device instances. You
> cannot imply that it is a DMA controller.

This has been changed as you suggested. Could you have a look at the
updated patch listed below?


=46or PL330 dma controllers instantiated from device tree, the channel
lookup is based on phandle of the dma controller and dma request id
specified by the client node. During probe, the private data of each
channel of the controller is set to point to the device node of the
dma controller. The 'chan_id' of the each channel is used as the
dma request id.

Client driver requesting dma channels specify the phandle of the
dma controller and the request id. The pl330 filter function
converts the phandle to the device node pointer and matches that
with channel's private data. If a match is found, the request id
from the client node and the 'chan_id' of the channel is matched.
A channel is found if both the values match.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 .../devicetree/bindings/dma/arm-pl330.txt          |   29 ++++++++++++=
++++
 drivers/dma/pl330.c                                |   35 ++++++++++++=
+++++---
 2 files changed, 59 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/arm-pl330.txt

diff --git a/Documentation/devicetree/bindings/dma/arm-pl330.txt
b/Documentation/devicetree/bindings/dma/arm-pl330.txt
new file mode 100644
index 0000000..89f4b9c
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/arm-pl330.txt
@@ -0,0 +1,29 @@
+* ARM PrimeCell PL330 DMA Controller
+
+The ARM PrimeCell PL330 DMA controller can move blocks of memory conte=
nts
+between memory and peripherals or memory to memory.
+
+Required properties:
+  - compatible: should be "arm,primecell".
+  - reg: physical base address of the controller and length of memory =
mapped
+    region.
+  - interrupts: interrupt number to the cpu.
+
+Example: (from Samsung's Exynos4 processor dtsi file)
+
+	pdma0: pdma@12680000 {
+		compatible =3D "arm,primecell";
+		reg =3D <0x12680000 0x1000>;
+		interrupts =3D <99>;
+	};
+
+Client drivers (device nodes requiring dma transfers from dev-to-mem o=
r
+mem-to-dev) should specify the DMA channel numbers using a two-value p=
air
+as shown below.
+
+  [property name]  =3D <[phandle of the dma controller] [dma request i=
d]>;
+
+      where 'dma request id' is the dma request number which is connec=
ted
+      to the client controller.
+
+  Example:  tx-dma-channel =3D <&pdma0 12>;
diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index 9732995..0c55de4 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -19,6 +19,7 @@
 #include <linux/amba/pl330.h>
 #include <linux/pm_runtime.h>
 #include <linux/scatterlist.h>
+#include <linux/of.h>

 #define NR_DEFAULT_DESC	16

@@ -277,6 +278,20 @@ bool pl330_filter(struct dma_chan *chan, void *par=
am)
 	if (chan->device->dev->driver !=3D &pl330_driver.drv)
 		return false;

+#ifdef CONFIG_OF
+	if (chan->device->dev->of_node) {
+		const __be32 *prop_value;
+		phandle phandle;
+		struct device_node *node;
+
+		prop_value =3D ((struct property *)param)->value;
+		phandle =3D be32_to_cpup(prop_value++);
+		node =3D of_find_node_by_phandle(phandle);
+		return ((chan->private =3D=3D node) &&
+				(chan->chan_id =3D=3D be32_to_cpup(prop_value)));
+	}
+#endif
+
 	peri_id =3D chan->private;
 	return *peri_id =3D=3D (unsigned)param;
 }
@@ -857,12 +872,17 @@ pl330_probe(struct amba_device *adev, const
struct amba_id *id)
 	INIT_LIST_HEAD(&pd->channels);

 	/* Initialize channel parameters */
-	num_chan =3D max(pdat ? pdat->nr_valid_peri : 0, (u8)pi->pcfg.num_cha=
n);
+	num_chan =3D max(pdat ? pdat->nr_valid_peri : (u8)pi->pcfg.num_peri,
+			(u8)pi->pcfg.num_chan);
 	pdmac->peripherals =3D kzalloc(num_chan * sizeof(*pch), GFP_KERNEL);

 	for (i =3D 0; i < num_chan; i++) {
 		pch =3D &pdmac->peripherals[i];
-		pch->chan.private =3D pdat ? &pdat->peri_id[i] : NULL;
+		if (!adev->dev.of_node)
+			pch->chan.private =3D pdat ? &pdat->peri_id[i] : NULL;
+		else
+			pch->chan.private =3D adev->dev.of_node;
+
 		INIT_LIST_HEAD(&pch->work_list);
 		spin_lock_init(&pch->lock);
 		pch->pl330_chid =3D NULL;
@@ -876,11 +896,16 @@ pl330_probe(struct amba_device *adev, const
struct amba_id *id)
 	}

 	pd->dev =3D &adev->dev;
-	if (pdat)
+	if (pdat) {
 		pd->cap_mask =3D pdat->cap_mask;
-	else
+	} else {
 		dma_cap_set(DMA_MEMCPY, pd->cap_mask);
-
+		if (pi->pcfg.num_peri) {
+			dma_cap_set(DMA_SLAVE, pd->cap_mask);
+			dma_cap_set(DMA_CYCLIC, pd->cap_mask);
+		}=09
+	}
+=09
 	pd->device_alloc_chan_resources =3D pl330_alloc_chan_resources;
 	pd->device_free_chan_resources =3D pl330_free_chan_resources;
 	pd->device_prep_dma_memcpy =3D pl330_prep_dma_memcpy;
--=20
1.6.6.rc2



>
> Rob
>
>
>> Thanks for your help.
>>
>> Regards,
>> Thomas.
>>
>>
>> =A0 =A0 Rob
>>
>>
>
>
