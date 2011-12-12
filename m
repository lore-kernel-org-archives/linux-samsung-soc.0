From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [RESEND][PATCH] ARM: Exynos: Add irq domain and device tree
 support for interrupt combiner
Date: Mon, 12 Dec 2011 21:32:10 +0530
Message-ID: <CAJuYYwS=d92ra9-R0W0Q8nwv1aPfe192FcOb-5QM9ZnQAO_T3g@mail.gmail.com>
References: <1323586114-24486-1-git-send-email-thomas.abraham@linaro.org>
	<4EE5781E.2060702@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:36408 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751712Ab1LLQCL convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Dec 2011 11:02:11 -0500
Received: by vbbfc26 with SMTP id fc26so3850195vbb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Dec 2011 08:02:10 -0800 (PST)
In-Reply-To: <4EE5781E.2060702@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, rob.herring@calxeda.com, patches@linaro.org

Hi Rob,

On 12 December 2011 09:12, Rob Herring <robherring2@gmail.com> wrote:
>> +Example:
>> +
>> + =A0 =A0 combiner:interrupt-controller@10440000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "samsung,exynos4120-combine=
r";
>> + =A0 =A0 =A0 =A0 =A0 =A0 #interrupt-cells =3D <2>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 interrupt-controoler;
>
> s/controoler/controller/

Ok. I will fix this.

>
>> + =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x10440000 0x1000>;
>> + =A0 =A0 };
>
> [snip]
>
>> +
>> +int __init combiner_init_irq_domain(unsigned int irq_base, unsigned=
 int nr_irq,
>
> Make irq_base signed.

Ok.

>
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 struct device_node *np)
>> +{
>> + =A0 =A0 struct irq_domain *domain =3D &combiner_irq_domain;
>> +
>> + =A0 =A0 domain->irq_base =3D irq_alloc_descs(irq_base, irq_base, n=
r_irq, 0);
>
> This should be irq_alloc_descs(irq_base, 1,
>
> So that dynamic allocation can work when irq_base is -1.

Ok. I will modify this.

>
>> + =A0 =A0 if (domain->irq_base < 0) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 pr_err("failed to alloc irq descs, combine=
r init failed\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -EBUSY;
>
> On failure, just warn and do:
>
> domain->irq_base =3D irq_base
>
> instead of returning unless all platforms using this are completely
> converted over to support dynamic Linux virq mapping.

Ok.

>
> Also you should update your platforms' to set mdesc.nr_irq to
> NR_IRQS_LEGACY. And test with SPARSE_IRQ turned on.

Ok. I will test with NR_IRQS_LEGACY. Hope nothing breaks!

Thank you Rob for you review and comments on this patch.

Regards,
Thomas.

>
> Rob
