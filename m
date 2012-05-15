From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 10/20] of/irq: fix interrupt parent lookup procedure
Date: Tue, 15 May 2012 14:59:17 -0600
Message-ID: <CACxGe6u2EqcrNwb61P8YbkmvDhymv16Zrp0A+O4zc9AV3HMdMg@mail.gmail.com>
References: <1335813270-13083-1-git-send-email-thomas.abraham@linaro.org>
 <1335813270-13083-11-git-send-email-thomas.abraham@linaro.org>
 <07f801cd3274$cfbe4200$6f3ac600$%kim@samsung.com> <20120515184149.4E6B93E080A@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:61428 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966750Ab2EOU7i convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 May 2012 16:59:38 -0400
Received: by pbbrp8 with SMTP id rp8so149090pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 May 2012 13:59:38 -0700 (PDT)
In-Reply-To: <20120515184149.4E6B93E080A@localhost>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, rob.herring@calxeda.com

On Tue, May 15, 2012 at 12:41 PM, Grant Likely
<grant.likely@secretlab.ca> wrote:
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
>
> g.
>
>> >
>> > Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> > ---
>> > =A0drivers/of/irq.c | =A0 =A04 +++-
>> > =A01 files changed, 3 insertions(+), 1 deletions(-)
>> >
>> > diff --git a/drivers/of/irq.c b/drivers/of/irq.c
>> > index 9cf0060..a520363 100644
>> > --- a/drivers/of/irq.c
>> > +++ b/drivers/of/irq.c
>> > @@ -66,14 +66,16 @@ struct device_node *of_irq_find_parent(struct =
device_node *child)
>> > =A0 =A0 =A0 =A0 =A0 =A0 if (parp =3D=3D NULL)
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 p =3D of_get_parent(child)=
;
>> > =A0 =A0 =A0 =A0 =A0 =A0 else {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 of_node_put(child);
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (of_irq_workarounds & O=
=46_IMAP_NO_PHANDLE)
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 p =3D of_n=
ode_get(of_irq_dflt_pic);
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 p =3D of_f=
ind_node_by_phandle(be32_to_cpup(parp));
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return p;
>> > =A0 =A0 =A0 =A0 =A0 =A0 }
>> > =A0 =A0 =A0 =A0 =A0 =A0 of_node_put(child);
>> > =A0 =A0 =A0 =A0 =A0 =A0 child =3D p;
>> > - =A0 } while (p && of_get_property(p, "#interrupt-cells", NULL) =3D=
=3D NULL);
>> > + =A0 } while (p);
>
> This does break one use-case. =A0Sometimes the interrupt-parent is th=
e
> same node when an

Oops, ignore this comment.  I meant to delete it before sending.

g.
