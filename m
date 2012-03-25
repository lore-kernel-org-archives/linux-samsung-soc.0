From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH] of/irq: of_irq_init: Call initialization function for all controllers
Date: Sun, 25 Mar 2012 21:46:53 +0530
Message-ID: <CAJuYYwTzx8+J9oMRd7kJ=Qp5V4v0LVUYxdkAe8dMqVji0Dk4yg@mail.gmail.com>
References: <CAJuYYwS5Srw2-D6hdk=-=YN3iB37+KTWVqQPPPVbb-e7it+uVQ@mail.gmail.com>
	<1332679129-23864-1-git-send-email-thomas.abraham@linaro.org>
	<4F6F37B6.3050506@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:50711 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756539Ab2CYQQx convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 25 Mar 2012 12:16:53 -0400
Received: by vcqp1 with SMTP id p1so3854075vcq.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 25 Mar 2012 09:16:53 -0700 (PDT)
In-Reply-To: <4F6F37B6.3050506@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, rob.herring@calxeda.com, patches@linaro.org

On 25 March 2012 20:50, Rob Herring <robherring2@gmail.com> wrote:
> On 03/25/2012 07:38 AM, Thomas Abraham wrote:
>> The of_irq_init function stops processing the interrupt controller h=
ierarchy
>> when there are no more interrupt controller parents identified. Thou=
gh this
>> condition suffices most cases, there are cases where a interrupt con=
troller's
>> parent controller does not participate in the initialization of the =
interrupt
>> hierarchy. An example of such a case is the use of a interrupt nexus=
 node
>> by a interrupt controller node which delivers interrupts to separate=
 interrupt
>> parent controllers.
>>
>> Instead of stopping the processing of interrupt controller hierarchy=
 in such
>> a case, the orphan interrupt controller node's descriptor can be ide=
ntified
>> and its 'logical' parent in the descriptor is set as NULL. The proce=
ssing of
>> interrupt hierarchy is then restarted by looking for descriptors whi=
ch have
>> a NULL interrupt parent.
>>
>> Cc: Rob Herring <rob.herring@calxeda.com>
>> Cc: Grant Likely <grant.likely@secretlab.ca>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> ---
>
> Wouldn't this accomplish the same thing? You just need to add the
> wakeup-map node name to your matches list.
>
>
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index 9cf0060..deeaf00 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -416,8 +416,6 @@ void __init of_irq_init(const struct of_device_id
> *matches)
> =A0 =A0 =A0 =A0INIT_LIST_HEAD(&intc_parent_list);
>
> =A0 =A0 =A0 =A0for_each_matching_node(np, matches) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!of_find_property(np, "interrupt-co=
ntroller", NULL))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * Here, we allocate and populate an i=
ntc_desc with the node
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * pointer, interrupt-parent device_no=
de etc.
>

Hi Rob,

I tested with this, but the init function of wakeup controller is not
called. The following is the example nodes that I used for testing.

 gic:interrupt-controller@10490000 {
               compatible =3D "arm,cortex-a9-gic";
               #interrupt-cells =3D <3>;
               #address-cells =3D <0>;
               #size-cells =3D <0>;
               interrupt-controller;
               cpu-offset =3D <0x8000>;
               reg =3D <0x10490000 0x1000>, <0x10480000 0x100>;
       };

       combiner:interrupt-controller@10440000 {
               compatible =3D "samsung,exynos4210-combiner";
               #interrupt-cells =3D <2>;
               interrupt-controller;
               samsung,combiner-nr =3D <16>;
               reg =3D <0x10440000 0x1000>;
               interrupts =3D <0 0 0>, <0 1 0>, <0 2 0>, <0 3 0>,
                            <0 4 0>, <0 5 0>, <0 6 0>, <0 7 0>,
                            <0 8 0>, <0 9 0>, <0 10 0>, <0 11 0>,
                            <0 12 0>, <0 13 0>, <0 14 0>, <0 15 0>;
       };

       wakeup_eint: interrupt-controller@11400000 {
               compatible =3D "samsung,exynos5210-wakeup-eint";
               reg =3D <0x11400000 0x1000>;
               interrupt-controller;
               #interrupt-cells =3D <2>;
               interrupt-parent =3D <&wakeup_map>;
               interrupts =3D <0x0 0>, <0x1 0>, <0x2 0>, <0x3 0>,
                            <0x4 0>, <0x5 0>, <0x6 0>, <0x7 0>,
                            <0x8 0>, <0x9 0>, <0xa 0>, <0xb 0>,
                            <0xc 0>, <0xd 0>, <0xe 0>, <0xf 0>,
                            <0x10 0>;

               wakeup_map: interrupt-map {
                       compatible =3D "samsung,exynos5210-wakeup-eint-m=
ap";
                       #interrupt-cells =3D <2>;
                       #address-cells =3D <0>;
                       #size-cells =3D <0>;
                       interrupt-map =3D <0x0 0 &gic 0 16 0>,
                                       <0x1 0 &gic 0 17 0>,
                                       <0x2 0 &gic 0 18 0>,
                                       <0x3 0 &gic 0 19 1>,
                                       <0x4 0 &gic 0 20 0>,
                                       <0x5 0 &gic 0 21 1>,
                                       <0x6 0 &gic 0 22 0>,
                                       <0x7 0 &gic 0 23 1>,
                                       <0x8 0 &gic 0 24 0>,
                                       <0x9 0 &gic 0 25 1>,
                                       <0xa 0 &gic 0 26 0>,
                                       <0xb 0 &gic 0 27 1>,
                                       <0xc 0 &gic 0 28 0>,
                                       <0xd 0 &gic 0 29 1>,
                                       <0xe 0 &gic 0 30 0>,
                                       <0xf 0 &gic 0 31 1>,
                                       <0x10 0 &combiner 2 4>;
               };
       };

And following is the match table used for testing.

static const struct of_device_id exynos4_dt_irq_match[] =3D {
       { .compatible =3D "arm,cortex-a9-gic", .data =3D gic_of_init, },
       { .compatible =3D "samsung,exynos4210-combiner",
                       .data =3D combiner_of_init, },
       { .compatible =3D "samsung,exynos4210-wakeup-eint-map",
                       .data =3D exynos_init_irq_eint, },
       {},
};

The ' interrupt-map' map sub-node of 'interrupt-controller@11400000'
node does not have a interrupt-parent property. So it inherits it from
its parent node, which is 'interrupt-map' itself. So the parent of
wakeup-map is not gic or combiner and hence the initialization
function of wakeup controller is not called.

If a interrupt-parent property is added to 'interrupt-map' node (which
is probably not the right thing to do), and set the interrupt parent
as gic or combiner, there is a possibility that the interrupt-map is
initialized before the combiner (which is not correct since
interrupt-map uses combiner as one of its parents). But by placing
'wakeup_eint' node ahead of combiner node, this can be overcome but
relying on placement of nodes in dts file is not a reliable solution.

Thanks,
Thomas.

>
>> =A0drivers/of/irq.c | =A0 45 +++++++++++++++++++++++++++++++++++++++=
+++++-
>> =A01 files changed, 44 insertions(+), 1 deletions(-)
>>
>> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
>> index 9cf0060..70c6ece 100644
>> --- a/drivers/of/irq.c
>> +++ b/drivers/of/irq.c
>> @@ -400,6 +400,38 @@ struct intc_desc {
>> =A0};
>>
>> =A0/**
>> + * of_irq_mark_orphan_desc - Set parent as NULL for a orphan intc_d=
esc
>> + * @intc_desc_list: the list of intc_desc to search for orphan intc=
_desc
>> + *
>> + * This is a helper function for the of_irq_init function and is in=
voked
>> + * when there are child nodes available in intc_desc_list but there=
 are
>> + * no parent nodes in intc_parent_list. When invoked, this function
>> + * searches for a intc_desc instance that does not have a parent in=
tc_desc
>> + * instance in intc_desc_list. The very reason of the invocation of=
 this
>> + * function ensures that a orphan intc_desc will be found. When fou=
nd, the
>> + * interrupt_parent of the orphan intc_desc is set to NULL.
>> + */
>> +static void of_irq_mark_orphan_desc(struct list_head *intc_desc_lis=
t)
>> +{
>> + =A0 =A0 struct intc_desc *desc, *temp_desc;
>> +
>> + =A0 =A0 list_for_each_entry_safe(desc, temp_desc, intc_desc_list, =
list) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 struct intc_desc *td1, *td2;
>> + =A0 =A0 =A0 =A0 =A0 =A0 list_for_each_entry_safe(td1, td2, intc_de=
sc_list, list) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (desc->interrupt_parent=
 =3D=3D td1->dev)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (desc->interrupt_parent =3D=3D td1->dev=
)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 pr_debug("%s: set interrupt_parent of 'int=
c_desc' with dev name"
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 " %s as NULL\n", __func__,=
 desc->dev->full_name);
>> + =A0 =A0 =A0 =A0 =A0 =A0 desc->interrupt_parent =3D NULL;
>> + =A0 =A0 =A0 =A0 =A0 =A0 return;
>> + =A0 =A0 }
>> +}
>> +
>> +/**
>> =A0 * of_irq_init - Scan and init matching interrupt controllers in =
DT
>> =A0 * @matches: 0 terminated array of nodes to match and init functi=
on to call
>> =A0 *
>> @@ -481,8 +513,19 @@ void __init of_irq_init(const struct of_device_=
id *matches)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Get the next pending parent that migh=
t have children */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 desc =3D list_first_entry(&intc_parent_l=
ist, typeof(*desc), list);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (list_empty(&intc_parent_list) || !de=
sc) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* This has reached a po=
int where there are children in
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* the intc_desc_list bu=
t no parent in intc_parent_list.
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* This means there is a=
 child desc in intc_desc_list
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* whose parent is not o=
ne of the remaining elements of
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* the intc_desc_list. S=
uch a child node is marked as
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* orphan (interrupt_par=
ent is set to NULL) and the
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* process continues wit=
h parent set to NULL.
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("of_irq_init: chi=
ldren remain, but no parents\n");
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 of_irq_mark_orphan_desc(&i=
ntc_desc_list);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 parent =3D NULL;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 list_del(&desc->list);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 parent =3D desc->dev;
>
