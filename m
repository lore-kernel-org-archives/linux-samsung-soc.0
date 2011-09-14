From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v3 4/6] DMA: PL330: Add device tree support
Date: Wed, 14 Sep 2011 23:16:32 +0530
Message-ID: <CAJuYYwTmw7y4DrrHcoSdnFv23BUELvKzTY5YQbGv6_23OeVnUg@mail.gmail.com>
References: <1315852165-32402-1-git-send-email-thomas.abraham@linaro.org>
	<1315852165-32402-2-git-send-email-thomas.abraham@linaro.org>
	<1315852165-32402-3-git-send-email-thomas.abraham@linaro.org>
	<1315852165-32402-4-git-send-email-thomas.abraham@linaro.org>
	<1315852165-32402-5-git-send-email-thomas.abraham@linaro.org>
	<20110914162401.GK3134@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f170.google.com ([209.85.161.170]:55443 "EHLO
	mail-gx0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754950Ab1INRqd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Sep 2011 13:46:33 -0400
Received: by gxk27 with SMTP id 27so2520885gxk.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Sep 2011 10:46:32 -0700 (PDT)
In-Reply-To: <20110914162401.GK3134@ponder.secretlab.ca>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, robherring2@gmail.com, vinod.koul@intel.com, patches@linaro.org, jassisinghbrar@gmail.com, boojin.kim@samsung.com

Hi Grant,

On 14 September 2011 21:54, Grant Likely <grant.likely@secretlab.ca> wr=
ote:
> On Mon, Sep 12, 2011 at 11:59:23PM +0530, Thomas Abraham wrote:
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
>> Cc: Jassi Brar <jassisinghbrar@gmail.com>
>> Cc: Boojin Kim <boojin.kim@samsung.com>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> Reviewed-by: Rob Herring <rob.herring@calxeda.com>
>> ---
>> =A0.../devicetree/bindings/dma/arm-pl330.txt =A0 =A0 =A0 =A0 =A0| =A0=
 29 +++++++++++++++++
>> =A0drivers/dma/pl330.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0| =A0 33 +++++++++++++++++--
>> =A02 files changed, 58 insertions(+), 4 deletions(-)
>> =A0create mode 100644 Documentation/devicetree/bindings/dma/arm-pl33=
0.txt
>>
>> diff --git a/Documentation/devicetree/bindings/dma/arm-pl330.txt b/D=
ocumentation/devicetree/bindings/dma/arm-pl330.txt
>> new file mode 100644
>> index 0000000..05b007d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/dma/arm-pl330.txt
>> @@ -0,0 +1,29 @@
>> +* ARM PrimeCell PL330 DMA Controller
>> +
>> +The ARM PrimeCell PL330 DMA controller can move blocks of memory co=
ntents
>> +between memory and peripherals or memory to memory.
>> +
>> +Required properties:
>> + =A0- compatible: should include both "arm,pl330" and "arm,primecel=
l".
>> + =A0- reg: physical base address of the controller and length of me=
mory mapped
>> + =A0 =A0region.
>> + =A0- interrupts: interrupt number to the cpu.
>> +
>> +Example: (from Samsung's Exynos4 processor dtsi file)
>> +
>> + =A0 =A0 pdma0: pdma@12680000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "arm,pl330", "arm,primecell=
";
>> + =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x12680000 0x1000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <99>;
>> + =A0 =A0 };
>> +
>> +Client drivers (device nodes requiring dma transfers from dev-to-me=
m or
>> +mem-to-dev) should specify the DMA channel numbers using a two-valu=
e pair
>> +as shown below.
>> +
>> + =A0[property name] =A0=3D <[phandle of the dma controller] [dma re=
quest id]>;
>> +
>> + =A0 =A0 =A0where 'dma request id' is the dma request number which =
is connected
>> + =A0 =A0 =A0to the client controller.
>> +
>> + =A0Example: =A0tx-dma-channel =3D <&pdma0 12>;
>
> Looks good to me. =A0You may want to specify that the property name
> should be in the form: <name>-dma-channel just to enforce a bit of
> convention on the users.

Ok. This will be added as a suggestion for property name specifying
the dma channel.

>
>> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
>> index 992bf82..7a4ebf1 100644
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
>> @@ -277,6 +278,20 @@ bool pl330_filter(struct dma_chan *chan, void *=
param)
>> =A0 =A0 =A0 if (chan->device->dev->driver !=3D &pl330_driver.drv)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 return false;
>>
>> +#ifdef CONFIG_OF
>> + =A0 =A0 if (chan->device->dev->of_node) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 const __be32 *prop_value;
>> + =A0 =A0 =A0 =A0 =A0 =A0 phandle phandle;
>> + =A0 =A0 =A0 =A0 =A0 =A0 struct device_node *node;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 prop_value =3D ((struct property *)param)-=
>value;
>> + =A0 =A0 =A0 =A0 =A0 =A0 phandle =3D be32_to_cpup(prop_value++);
>> + =A0 =A0 =A0 =A0 =A0 =A0 node =3D of_find_node_by_phandle(phandle);
>> + =A0 =A0 =A0 =A0 =A0 =A0 return ((chan->private =3D=3D node) &&
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (chan->cha=
n_id =3D=3D be32_to_cpup(prop_value)));
>
> Don't open code this. =A0There is already a function to decode a phan=
dle
> property. =A0of_parse_phandle() should do the trick.

The parameter to this function 'void *param' is already pointing to a
'struct property'. That 'struct property' has a value of type
<[phandle of dma controller] [channel id]>.

Since the property is already known, the of_get_property() call within
the of_parse_phandle() would complicate the above code. And,
of_parse_phandle requires a 'property name' inside the dma client
device node, which the above code fragment does not know about
(property names are defined by client drivers).

So, I would prefer to continue with the above implementation.

>
> Otherwise looks good to me.
>
> g.


Thanks for your review.

Regards,
Thomas.

[...]
