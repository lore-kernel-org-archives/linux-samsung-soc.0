From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 10/20] of/irq: fix interrupt parent lookup procedure
Date: Sat, 26 May 2012 19:35:58 +0530
Message-ID: <CAJuYYwQUovU1y-1v-6Z-REBVqjkqqaqdQBusuqEgwg4DxvNo3A@mail.gmail.com>
References: <1335813270-13083-1-git-send-email-thomas.abraham@linaro.org>
	<1335813270-13083-11-git-send-email-thomas.abraham@linaro.org>
	<07f801cd3274$cfbe4200$6f3ac600$%kim@samsung.com>
	<20120515184149.4E6B93E080A@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:49363 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752090Ab2EZOF7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 26 May 2012 10:05:59 -0400
Received: by wgbdr13 with SMTP id dr13so1678668wgb.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 26 May 2012 07:05:58 -0700 (PDT)
In-Reply-To: <20120515184149.4E6B93E080A@localhost>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rob.herring@calxeda.com

On 16 May 2012 00:11, Grant Likely <grant.likely@secretlab.ca> wrote:
> On Tue, 15 May 2012 17:29:14 +0900, Kukjin Kim <kgene.kim@samsung.com=
> wrote:
>> Thomas Abraham wrote:
>> >
>> > The interrupt parent lookup fails for a node that is a interrupt-c=
ontroller
>> > but does not have an explict interrupt-parent property and instead=
 inherits
>> > this property from the root node.
>> >
>> > Consider the nodes listed below.
>> >
>> > =A0 =A0 / {
>> > =A0 =A0 =A0 =A0 interrupt-parent =3D <&intc_level1>;
>> >
>> > =A0 =A0 =A0 =A0 intc_level1: interrupt-controller@xxx {
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-controller;
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #interrupt-cells =3D <3>;
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <rest of the properties here>;
>> > =A0 =A0 =A0 =A0 };
>> >
>> > =A0 =A0 =A0 =A0 intc_level2: interrupt-controller@yyy {
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-controller;
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #interrupt-cells =3D <2>;
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <rest of the properties here>;
>> > =A0 =A0 =A0 =A0 };
>> > =A0 =A0 };
>> >
>> > The interrupt parent lookup for interrupt-controller@yyy fails. It=
 inherits
>> > the interrupt-parent property from the root node and the root node=
 ('/')
>> > specifies a 'interrupt-parent' property which represents the defau=
lt interrupt
>> > root controller. But, the property '#interrupt-cells' might not be=
 specified
>> > in the root node.
>> >
>> > In case a interrupt controller node does not include a 'interrupt-=
parent'
>> > property but inherits that property from the root node, the check =
for
>> > 'interrupt-cells' property in the root node fails. Fix this removi=
ng the
>> > check for 'interrupt-cells' property.
>
> Hmmm... I dont see the bug... =A0From your description above, I see t=
he
> following sequence.
>
> First iteration:
> =A0 =A0 =A0 =A0child =3D &ic@yyy;
> =A0 =A0 =A0 =A0cannot find "interrupt-parent" so take 'if' clause
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0p =3D of_get_parent(child); =A0(root)
> =A0 =A0 =A0 =A0iteration continues because #interrupt-cells not found=
 in 'p'(root)
> Second iteration:
> =A0 =A0 =A0 =A0child =3D root;
> =A0 =A0 =A0 =A0found "interrupt-parent", so take 'else' clause
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0p =3D of_find_node_by_phandle(); =A0(i=
c@xxx)
> =A0 =A0 =A0 =A0iteration stops because #interrupt-cells is found in '=
p'(ic@xxx)
>
> What am I missing in my admittedly short look at the code?

Grant, sorry for the bad commit message for the patch. I got it
completely wrong. I intended to generalize a change which was need for
a using interrupt-map on Exynos5 for wakeup interrupts, and in process
I wrote down a incorrect commit message.

I will list out the problem I was trying to solve. The wakeup
interrupt controller on Exynos5 has two parents - GIC and Interrupt
Combiner. The node for the Exynos5 wakeup interrupt is listed below.

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
                        compatible =3D "samsung,exynos5210-wakeup-eint-=
map";
                        #interrupt-cells =3D <2>;
                        #address-cells =3D <0>;
                        #size-cells =3D <0>;
                        interrupt-map =3D <0x0 0 &combiner 23 0>,
                                        <0x1 0 &combiner 24 0>,
                                        <0x2 0 &combiner 25 0>,
                                        <0x3 0 &combiner 25 1>,
                                        <0x4 0 &combiner 26 0>,
                                        <0x5 0 &combiner 26 1>,
                                        <0x6 0 &combiner 27 0>,
                                        <0x7 0 &combiner 27 1>,
                                        <0x8 0 &combiner 28 0>,
                                        <0x9 0 &combiner 28 1>,
                                        <0xa 0 &combiner 29 0>,
                                        <0xb 0 &combiner 29 1>,
                                        <0xc 0 &combiner 30 0>,
                                        <0xd 0 &combiner 30 1>,
                                        <0xe 0 &combiner 31 0>,
                                        <0xf 0 &combiner 31 1>,
                                        <0x10 0 &gic 0 32 0>;
                };
        };

The match table for of_irq_init() function is listed below (the third
in this list is for wakeup interrupt controller).

static const struct of_device_id exynos4_dt_irq_match[] =3D {
        { .compatible =3D "arm,cortex-a9-gic", .data =3D gic_of_init, }=
,
        { .compatible =3D "samsung,exynos4210-combiner",
                        .data =3D combiner_of_init, },
        { .compatible =3D "samsung,exynos5210-wakeup-eint-map",
                        .data =3D exynos_init_irq_eint, },
        {},
};

Without this patch, of_irq_init() finds that the interrupt parent of
"interrupt-map" node is "interrupt-controller@11400000" node. Which is
not correct. The interrupt parent of "interrupt-map" node should be
itself.

I feel that the check for "#interrupt-cells" property in do..while()
loop in of_irq_find_parent() function is not required. The presence of
"#interrupt-cells" property in the parent node should not be
considered as a necessary condition for the parent node to be
considered the interrupt-parent of the child node.

Thanks for reviewing this patch. Sorry for the delay in responding to
your email.

Thanks,
Thomas.
