From: KyongHo Cho <pullip.cho@samsung.com>
Subject: Re: [PATCH 3/4] iommu/exynos: Add iommu driver for Exynos4 Platforms
Date: Mon, 26 Sep 2011 17:58:49 +0900
Message-ID: <CAHQjnOOtVHUS3KmBz7LdO88fLQyLA6f-w3ye9nAH0Bx+zh38XA@mail.gmail.com>
References: <15669786.49881316849426265.JavaMail.weblogic@epml24>
	<CAK=WgbYnGjPKs6_nmFRGfMnbh_7wDR-0QcptAGaqDKVOo-x3cg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK=WgbYnGjPKs6_nmFRGfMnbh_7wDR-0QcptAGaqDKVOo-x3cg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ohad Ben-Cohen <ohad@wizery.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "joerg.roedel@amd.com" <joerg.roedel@amd.com>, =?UTF-8?B?7J207IOB7ZiE?= <sanghyun75.lee@samsung.com>, =?UTF-8?B?6rmA6rWt7KeE?= <kgene.kim@samsung.com>, =?UTF-8?B?6rmA7JiB6529?= <younglak1004.kim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi.

On Mon, Sep 26, 2011 at 4:59 PM, Ohad Ben-Cohen <ohad@wizery.com> wrote=
:
> 2011/9/24 =EC=A1=B0=EA=B2=BD=ED=98=B8 <pullip.cho@samsung.com>:
>> This is the System MMU driver and IOMMU API implementation for
>> Exynos4 SOC platforms. Exynos4 platforms has more than 10 System
>> MMUs dedicated for each multimedia accellerators.
>>
>> Signed-off-by: KyongHo Cho <pullip.cho@samsung.com>
> ...
>> +static int exynos_iommu_fault_handler(struct iommu_domain *domain,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 struct device *dev, unsigned long iova, int flags)
>> +{
>> + =C2=A0 =C2=A0 =C2=A0 struct exynos_iommu_domain *priv =3D domain->=
priv;
>> +
>> + =C2=A0 =C2=A0 =C2=A0 dev_err(priv->dev, "%s occured at %p(Page tab=
le base: %p)\n",
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sysmmu_fault_name[flags], (void =
*)iova,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void *)(__pa(priv->pgtable)));
>> + =C2=A0 =C2=A0 =C2=A0 dev_err(priv->dev, "\t\tGenerating Kernel OOP=
S...\n");
>> + =C2=A0 =C2=A0 =C2=A0 dev_err(priv->dev, "\t\tbecause it is unrecov=
erable.\n");
>> + =C2=A0 =C2=A0 =C2=A0 dev_err(priv->dev,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "\t\tSet Fault ha=
ndler with iommu_set_fault_handler().\n");
>> + =C2=A0 =C2=A0 =C2=A0 dev_err(priv->dev, "\t\tto handle System MMU =
fault.\n");
>> +
>> + =C2=A0 =C2=A0 =C2=A0 BUG();
>> +
>> + =C2=A0 =C2=A0 =C2=A0 return 0;
>> +}
>> +
>> +static int exynos_iommu_domain_init(struct iommu_domain *domain)
>> +{
> ...
>> + =C2=A0 =C2=A0 =C2=A0 iommu_set_fault_handler(domain, &exynos_iommu=
_fault_handler);
>
> It doesn't make a lot of sense to set an iommu fault handler here; th=
e
> intention of iommu_set_fault_handler() is to allow upper layers to do
> that.

As you've noticed, it is default behavior for iommu fault.
If an upper layer calls iommu_set_fault_handler(),
it is replaced with the new one.
>
> Moreover, exynos_sysmmu_irq() anyway knows whenever a fault occurs, s=
o
> calling report_iommu_fault() just to have it call into the driver
> again seems redundant.
>
I think calling report_iommu_fault() in exynos_sysmmu_irq() is rather s=
imple.
To do the default behavior in exynos_sysmmu_irq(),
it must check if domain->handler is NULL or not.
But the checking is also performed in report_iommu_fault() also.

I think just calling report_iommu_fault() reduces redundancy.

> If you want an exynos-specific behavior to occur whenever there's an
> iommu fault, you should do that in exynos_sysmmu_irq itself. If you
> just want a generic default logging behavior to occur whenever there'=
s
> no other fault handler installed, you might even want to consider
> adding it to the IOMMU core.

It is neither a specific behavior nor a generic logging.

Just a default MMU fault report that can be replaceable with a fault
handler that a device driver provides.

Regards,
Cho KyongHo.
