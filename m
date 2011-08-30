From: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/6] DMA: PL330: Add device tree support
Date: Tue, 30 Aug 2011 17:48:46 +0530
Message-ID: <CAJuYYwR5GqqKjbMngQqorLuka4XN0jin5s6O66orTtSQg5eKRw@mail.gmail.com>
References: <1314348014-2481-1-git-send-email-thomas.abraham@linaro.org>
	<1314348014-2481-2-git-send-email-thomas.abraham@linaro.org>
	<1314348014-2481-3-git-send-email-thomas.abraham@linaro.org>
	<1314348014-2481-4-git-send-email-thomas.abraham@linaro.org>
	<1314348014-2481-5-git-send-email-thomas.abraham@linaro.org>
	<4E579C9B.7030807@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7393440117496744424=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4E579C9B.7030807-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: boojin.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

--===============7393440117496744424==
Content-Type: multipart/alternative; boundary=000e0cd215e46e1fd904abb8034f

--000e0cd215e46e1fd904abb8034f
Content-Type: text/plain; charset=ISO-8859-1

Hi Rob,

On 26 August 2011 18:46, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Thomas,
>
> On 08/26/2011 03:40 AM, Thomas Abraham wrote:
> > For PL330 dma controllers instantiated from device tree, the channel
> > lookup is based on phandle of the dma controller and dma request id
> > specified by the client node. During probe, the private data of each
> > channel of the controller is set to point to the device node of the
> > dma controller. The 'chan_id' of the each channel is used as the
> > dma request id.
> >
> > Client driver requesting dma channels specify the phandle of the
> > dma controller and the request id. The pl330 filter function
> > converts the phandle to the device node pointer and matches that
> > with channel's private data. If a match is found, the request id
> > from the client node and the 'chan_id' of the channel is matched.
> > A channel is found if both the values match.
> >
> > Signed-off-by: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  .../devicetree/bindings/dma/arm-pl330.txt          |   42 +++++++++++++
> >  drivers/dma/pl330.c                                |   63
> +++++++++++++++++++-
> >  2 files changed, 103 insertions(+), 2 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/dma/arm-pl330.txt
> >
> > diff --git a/Documentation/devicetree/bindings/dma/arm-pl330.txt
> b/Documentation/devicetree/bindings/dma/arm-pl330.txt
> > new file mode 100644
> > index 0000000..46a8307
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/dma/arm-pl330.txt
> > @@ -0,0 +1,42 @@
> > +* ARM PrimeCell PL330 DMA Controller
> > +
> > +The ARM PrimeCell PL330 DMA controller can move blocks of memory
> contents
> > +between memory and peripherals or memory to memory.
> > +
> > +Required properties:
> > +  - compatible: should one or more of the following
> > +    - arm,pl330-pdma - For controllers that support mem-to-dev and
> dev-to-mem
> > +      transfers.
> > +    - arm,pl330-mdma - For controllers that support mem-to-mem transfers
> only.
>
> And if they support both? I would think all controllers can support
> mem-to-mem. If so, the distinction can be made with the number of requests.
>
>
If a controller supports both types of transfer, the device node should not
claim compatibility for "arm,pl330-pdma" or "arm,pl330-mdma". Compatible
should be "arm,primecell".


> > +    - arm,primecell - should be included for all pl330 dma controller
> nodes.
> > +
> > +  - reg: physical base address of the controller and length of memory
> mapped
> > +    region.
> > +
> > +  - interrupts: interrupt number to the cpu.
> > +
> > +  - arm,primecell-periphid: should be 0x00041330.
>
> Should be optional. It's only needed when the h/w value is wrong. This
> is already documented in primecell.txt.
>

Ok. This will be made optional.


>
> > +
> > +  - arm,pl330-peri-reqs: number of actual peripheral requests connected
> to the
> > +    dma controller. Maximum value is 32.
>
> Perhaps could be a bitmask for sparsely populated requests. May not
> matter since phandles will define the connections.
>
> Can be optional and not present means 00 requests (mem-to-mem only).
>
>
As suggested by Russell, this property will be removed and its value will be
read from the configuration register.


>  > +
> > +Example: (from Samsung's Exynos4 processor dtsi file)
> > +
> > +     pdma0: pdma@12680000 {
> > +             compatible = "arm,pl330-pdma", "arm,primecell";
> > +             reg = <0x12680000 0x1000>;
> > +             interrupts = <99>;
> > +             arm,primecell-periphid = <0x00041330>;
> > +             arm,pl330-peri-reqs = <30>;
> > +     };
> > +
> > +Client drivers (device nodes requiring dma transfers from dev-to-mem or
> > +mem-to-dev) should specify the DMA channel numbers using a two-value
> pair
> > +as shown below.
> > +
> > +  [property name]  = <[phandle of the dma controller] [dma request id]>;
> > +
> > +      where 'dma request id' is the dma request number which is
> connected
> > +      to the client controller.
> > +
> > +  Example:  tx-dma-channel = <&pdma0 12>;
>
> I like this approach. I looked at this some and some PPC platforms do a
> node for each channel/request, but this is much more simple and similar
> to clock binding approach.
>
> You need to define the property name. Probably just "dma-channel" is
> enough. For peripherals with more than 1, just list them out like when
> you have more than 1 interrupt. The order should be defined as part of
> that device's binding (i.e. 1st channel is tx and 2nd channel is rx).
>
>
I am little hesitant to do this the way you suggested. A controller could
have dma request lines connected to multiple dma controllers. So the phandle
could be different for each dma channel. Also, the client drivers specify
the property value for each dma channel requested (the property value gets
assigned to chan->private and then used by the filter function to lookup the
dma channel). So changing it the way you have suggested would make things
complex.


> > diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> > index 9732995..984dc18 100644
> > --- a/drivers/dma/pl330.c
> > +++ b/drivers/dma/pl330.c
> > @@ -19,6 +19,7 @@
> >  #include <linux/amba/pl330.h>
> >  #include <linux/pm_runtime.h>
> >  #include <linux/scatterlist.h>
> > +#include <linux/of.h>
> >
> >  #define NR_DEFAULT_DESC      16
> >
> > @@ -277,6 +278,20 @@ bool pl330_filter(struct dma_chan *chan, void
> *param)
> >       if (chan->device->dev->driver != &pl330_driver.drv)
> >               return false;
> >
> > +#ifdef CONFIG_OF
> > +     if (chan->device->dev->of_node) {
> > +             const __be32 *prop_value;
> > +             phandle phandle;
> > +             struct device_node *node;
> > +
> > +             prop_value = ((struct property *)param)->value;
> > +             phandle = be32_to_cpup(prop_value++);
> > +             node = of_find_node_by_phandle(phandle);
> > +             return ((chan->private == node) &&
> > +                             (chan->chan_id ==
> be32_to_cpup(prop_value)));
> > +     }
> > +#endif
> > +
> >       peri_id = chan->private;
> >       return *peri_id == (unsigned)param;
> >  }
> > @@ -777,6 +792,40 @@ static irqreturn_t pl330_irq_handler(int irq, void
> *data)
> >               return IRQ_NONE;
> >  }
> >
> > +#ifdef CONFIG_OF
> > +static struct dma_pl330_platdata *pl330_parse_dt(struct device *dev)
> > +{
> > +     struct dma_pl330_platdata *pdat;
> > +     const void *value;
> > +
> > +     pdat = devm_kzalloc(dev, sizeof(*pdat), GFP_KERNEL);
> > +     if (!pdat)
> > +             return NULL;
>
> Ideally, we will get rid of platform_data completely in the future, so I
> don't think filling it in from DT is the right approach.
>
>
Ok. I will drop the usage of platform data.


>  > +
> > +     value = of_get_property(dev->of_node, "arm,pl330-peri-reqs", NULL);
> > +     if (value)
> > +             pdat->nr_valid_peri = be32_to_cpup(value);
>
> Can't you use the u32 helper function here?
>
>
This will go away now since the number of peripherals connected will be read
from the configuration register.


>  > +
> > +     if (of_device_is_compatible(dev->of_node, "arm,pl330-pdma")) {
> > +             dma_cap_set(DMA_SLAVE, pdat->cap_mask);
> > +             dma_cap_set(DMA_CYCLIC, pdat->cap_mask);
> > +     } else if (of_device_is_compatible(dev->of_node, "arm,pl330-mdma"))
> {
> > +             dma_cap_set(DMA_MEMCPY, pdat->cap_mask);
> > +     } else if (of_device_is_compatible(dev->of_node, "arm,primecell"))
> {
>
> I don't think the driver should look at this property. This is really
> just for the bus code.
>

The dma capabilities are derived from the compatible value by the driver.
Sorry, I do not understand your suggestion for this.

Thanks for your help.

Regards,
Thomas.


> Rob
>
>

--000e0cd215e46e1fd904abb8034f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Rob,<br><br><div class=3D"gmail_quote">On 26 August 2011 18:46, Rob Herr=
ing <span dir=3D"ltr">&lt;<a href=3D"mailto:robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=
=3D"_blank">robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"border-left: 1px solid rgb(204, 204, 204); margi=
n: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">

Thomas,<br>
<div><div></div><div><br>
On 08/26/2011 03:40 AM, Thomas Abraham wrote:<br>
&gt; For PL330 dma controllers instantiated from device tree, the channel<b=
r>
&gt; lookup is based on phandle of the dma controller and dma request id<br=
>
&gt; specified by the client node. During probe, the private data of each<b=
r>
&gt; channel of the controller is set to point to the device node of the<br=
>
&gt; dma controller. The &#39;chan_id&#39; of the each channel is used as t=
he<br>
&gt; dma request id.<br>
&gt;<br>
&gt; Client driver requesting dma channels specify the phandle of the<br>
&gt; dma controller and the request id. The pl330 filter function<br>
&gt; converts the phandle to the device node pointer and matches that<br>
&gt; with channel&#39;s private data. If a match is found, the request id<b=
r>
&gt; from the client node and the &#39;chan_id&#39; of the channel is match=
ed.<br>
&gt; A channel is found if both the values match.<br>
&gt;<br>
&gt; Signed-off-by: Thomas Abraham &lt;<a href=3D"mailto:thomas.abraham@lin=
aro.org" target=3D"_blank">thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt;<br>
&gt; ---<br>
&gt; =A0.../devicetree/bindings/dma/arm-pl330.txt =A0 =A0 =A0 =A0 =A0| =A0 =
42 +++++++++++++<br>
&gt; =A0drivers/dma/pl330.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0| =A0 63 +++++++++++++++++++-<br>
&gt; =A02 files changed, 103 insertions(+), 2 deletions(-)<br>
&gt; =A0create mode 100644 Documentation/devicetree/bindings/dma/arm-pl330.=
txt<br>
&gt;<br>
&gt; diff --git a/Documentation/devicetree/bindings/dma/arm-pl330.txt b/Doc=
umentation/devicetree/bindings/dma/arm-pl330.txt<br>
&gt; new file mode 100644<br>
&gt; index 0000000..46a8307<br>
&gt; --- /dev/null<br>
&gt; +++ b/Documentation/devicetree/bindings/dma/arm-pl330.txt<br>
&gt; @@ -0,0 +1,42 @@<br>
&gt; +* ARM PrimeCell PL330 DMA Controller<br>
&gt; +<br>
&gt; +The ARM PrimeCell PL330 DMA controller can move blocks of memory cont=
ents<br>
&gt; +between memory and peripherals or memory to memory.<br>
&gt; +<br>
&gt; +Required properties:<br>
&gt; + =A0- compatible: should one or more of the following<br>
&gt; + =A0 =A0- arm,pl330-pdma - For controllers that support mem-to-dev an=
d dev-to-mem<br>
&gt; + =A0 =A0 =A0transfers.<br>
&gt; + =A0 =A0- arm,pl330-mdma - For controllers that support mem-to-mem tr=
ansfers only.<br>
<br>
</div></div>And if they support both? I would think all controllers can sup=
port<br>
mem-to-mem. If so, the distinction can be made with the number of requests.=
<br>
<br></blockquote><div><br>If a controller supports both types of transfer, =
the device node should not claim compatibility for &quot;arm,pl330-pdma&quo=
t; or &quot;arm,pl330-mdma&quot;. Compatible should be &quot;arm,primecell&=
quot;.<br>

=A0</div><blockquote class=3D"gmail_quote" style=3D"border-left: 1px solid =
rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;"><div>
&gt; + =A0 =A0- arm,primecell - should be included for all pl330 dma contro=
ller nodes.<br>
&gt; +<br>
&gt; + =A0- reg: physical base address of the controller and length of memo=
ry mapped<br>
&gt; + =A0 =A0region.<br>
&gt; +<br>
&gt; + =A0- interrupts: interrupt number to the cpu.<br>
&gt; +<br>
&gt; + =A0- arm,primecell-periphid: should be 0x00041330.<br>
<br>
</div>Should be optional. It&#39;s only needed when the h/w value is wrong.=
 This<br>
is already documented in primecell.txt.<br></blockquote><div><br>Ok. This w=
ill be made optional.<br>=A0</div><blockquote class=3D"gmail_quote" style=
=3D"border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; p=
adding-left: 1ex;">


<div><br>
&gt; +<br>
&gt; + =A0- arm,pl330-peri-reqs: number of actual peripheral requests conne=
cted to the<br>
&gt; + =A0 =A0dma controller. Maximum value is 32.<br>
<br>
</div>Perhaps could be a bitmask for sparsely populated requests. May not<b=
r>
matter since phandles will define the connections.<br>
<br>
Can be optional and not present means 00 requests (mem-to-mem only).<br>
<div><br></div></blockquote><div><br>As suggested by Russell, this property=
 will be removed and its value will be read from the configuration register=
.<br>=A0</div><blockquote class=3D"gmail_quote" style=3D"border-left: 1px s=
olid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">

<div>
&gt; +<br>
&gt; +Example: (from Samsung&#39;s Exynos4 processor dtsi file)<br>
&gt; +<br>
&gt; + =A0 =A0 pdma0: pdma@12680000 {<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D &quot;arm,pl330-pdma&quot;, &=
quot;arm,primecell&quot;;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 reg =3D &lt;0x12680000 0x1000&gt;;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D &lt;99&gt;;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 arm,primecell-periphid =3D &lt;0x00041330&gt=
;;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 arm,pl330-peri-reqs =3D &lt;30&gt;;<br>
&gt; + =A0 =A0 };<br>
&gt; +<br>
&gt; +Client drivers (device nodes requiring dma transfers from dev-to-mem =
or<br>
&gt; +mem-to-dev) should specify the DMA channel numbers using a two-value =
pair<br>
&gt; +as shown below.<br>
&gt; +<br>
&gt; + =A0[property name] =A0=3D &lt;[phandle of the dma controller] [dma r=
equest id]&gt;;<br>
&gt; +<br>
&gt; + =A0 =A0 =A0where &#39;dma request id&#39; is the dma request number =
which is connected<br>
&gt; + =A0 =A0 =A0to the client controller.<br>
&gt; +<br>
&gt; + =A0Example: =A0tx-dma-channel =3D &lt;&amp;pdma0 12&gt;;<br>
<br>
</div>I like this approach. I looked at this some and some PPC platforms do=
 a<br>
node for each channel/request, but this is much more simple and similar<br>
to clock binding approach.<br>
<br>
You need to define the property name. Probably just &quot;dma-channel&quot;=
 is<br>
enough. For peripherals with more than 1, just list them out like when<br>
you have more than 1 interrupt. The order should be defined as part of<br>
that device&#39;s binding (i.e. 1st channel is tx and 2nd channel is rx).<b=
r>
<div><div><br></div></div></blockquote><div><br>I am little hesitant to do =
this the way you suggested. A controller could have dma request lines conne=
cted to multiple dma controllers. So the phandle could be different for eac=
h dma channel. Also, the client drivers specify the property value for each=
 dma channel requested (the property value gets assigned to chan-&gt;privat=
e and then used by the filter function to lookup the dma channel). So chang=
ing it the way you have suggested would make things complex.<br>

=A0</div><blockquote class=3D"gmail_quote" style=3D"border-left: 1px solid =
rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;"><div><di=
v>
&gt; diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c<br>
&gt; index 9732995..984dc18 100644<br>
&gt; --- a/drivers/dma/pl330.c<br>
&gt; +++ b/drivers/dma/pl330.c<br>
&gt; @@ -19,6 +19,7 @@<br>
&gt; =A0#include &lt;linux/amba/pl330.h&gt;<br>
&gt; =A0#include &lt;linux/pm_runtime.h&gt;<br>
&gt; =A0#include &lt;linux/scatterlist.h&gt;<br>
&gt; +#include &lt;linux/of.h&gt;<br>
&gt;<br>
&gt; =A0#define NR_DEFAULT_DESC =A0 =A0 =A016<br>
&gt;<br>
&gt; @@ -277,6 +278,20 @@ bool pl330_filter(struct dma_chan *chan, void *pa=
ram)<br>
&gt; =A0 =A0 =A0 if (chan-&gt;device-&gt;dev-&gt;driver !=3D &amp;pl330_dri=
ver.drv)<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 return false;<br>
&gt;<br>
&gt; +#ifdef CONFIG_OF<br>
&gt; + =A0 =A0 if (chan-&gt;device-&gt;dev-&gt;of_node) {<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 const __be32 *prop_value;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 phandle phandle;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 struct device_node *node;<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 prop_value =3D ((struct property *)param)-&g=
t;value;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 phandle =3D be32_to_cpup(prop_value++);<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 node =3D of_find_node_by_phandle(phandle);<b=
r>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 return ((chan-&gt;private =3D=3D node) &amp;=
&amp;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (chan-&gt;ch=
an_id =3D=3D be32_to_cpup(prop_value)));<br>
&gt; + =A0 =A0 }<br>
&gt; +#endif<br>
&gt; +<br>
&gt; =A0 =A0 =A0 peri_id =3D chan-&gt;private;<br>
&gt; =A0 =A0 =A0 return *peri_id =3D=3D (unsigned)param;<br>
&gt; =A0}<br>
&gt; @@ -777,6 +792,40 @@ static irqreturn_t pl330_irq_handler(int irq, voi=
d *data)<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 return IRQ_NONE;<br>
&gt; =A0}<br>
&gt;<br>
&gt; +#ifdef CONFIG_OF<br>
&gt; +static struct dma_pl330_platdata *pl330_parse_dt(struct device *dev)<=
br>
&gt; +{<br>
&gt; + =A0 =A0 struct dma_pl330_platdata *pdat;<br>
&gt; + =A0 =A0 const void *value;<br>
&gt; +<br>
&gt; + =A0 =A0 pdat =3D devm_kzalloc(dev, sizeof(*pdat), GFP_KERNEL);<br>
&gt; + =A0 =A0 if (!pdat)<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 return NULL;<br>
<br>
</div></div>Ideally, we will get rid of platform_data completely in the fut=
ure, so I<br>
don&#39;t think filling it in from DT is the right approach.<br>
<div><br></div></blockquote><div><br>Ok. I will drop the usage of platform =
data.<br>=A0</div><blockquote class=3D"gmail_quote" style=3D"border-left: 1=
px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;"=
>

<div>
&gt; +<br>
&gt; + =A0 =A0 value =3D of_get_property(dev-&gt;of_node, &quot;arm,pl330-p=
eri-reqs&quot;, NULL);<br>
&gt; + =A0 =A0 if (value)<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 pdat-&gt;nr_valid_peri =3D be32_to_cpup(valu=
e);<br>
<br>
</div>Can&#39;t you use the u32 helper function here?<br>
<div><br></div></blockquote><div><br>This will go away now since the number=
 of peripherals connected will be read from the configuration register.<br>=
=A0</div><blockquote class=3D"gmail_quote" style=3D"border-left: 1px solid =
rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">

<div>
&gt; +<br>
&gt; + =A0 =A0 if (of_device_is_compatible(dev-&gt;of_node, &quot;arm,pl330=
-pdma&quot;)) {<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 dma_cap_set(DMA_SLAVE, pdat-&gt;cap_mask);<b=
r>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 dma_cap_set(DMA_CYCLIC, pdat-&gt;cap_mask);<=
br>
&gt; + =A0 =A0 } else if (of_device_is_compatible(dev-&gt;of_node, &quot;ar=
m,pl330-mdma&quot;)) {<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 dma_cap_set(DMA_MEMCPY, pdat-&gt;cap_mask);<=
br>
&gt; + =A0 =A0 } else if (of_device_is_compatible(dev-&gt;of_node, &quot;ar=
m,primecell&quot;)) {<br>
<br>
</div>I don&#39;t think the driver should look at this property. This is re=
ally<br>
just for the bus code.<br></blockquote><div><br>The dma capabilities are de=
rived from the compatible value by the driver. Sorry, I do not understand y=
our suggestion for this.<br>=A0<br>Thanks for your help.<br><br>Regards,<br=
>
Thomas.<br><br></div><blockquote class=3D"gmail_quote" style=3D"border-left=
: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1e=
x;">
<font color=3D"#888888"><br>
Rob<br>
</font><div><div></div><div><br>
</div></div></blockquote></div><br>

--000e0cd215e46e1fd904abb8034f--

--===============7393440117496744424==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============7393440117496744424==--
