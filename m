From: KyongHo Cho <pullip.cho@samsung.com>
Subject: Re: [PATCH v2 3/5] iommu/exynos: Add iommu driver for Exynos4 Platforms
Date: Sat, 1 Oct 2011 08:46:51 +0900
Message-ID: <CAHQjnONrPRynW5_C3+CqOAM095m+FK7P5jJMzN-ohwV_Y6jzGQ@mail.gmail.com>
References: <016e01cc7f42$f92bfb40$eb83f1c0$%kim@samsung.com>
	<20110930120652.GP2138@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:45570 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751036Ab1I3XrJ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Sep 2011 19:47:09 -0400
In-Reply-To: <20110930120652.GP2138@amd.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Roedel, Joerg" <Joerg.Roedel@amd.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Russell King <rmk+kernel@arm.linux.org.uk>, Ohad Ben-Cohen <ohad@wizery.com>, Sanghyun Lee <sanghyun75.lee@samsung.com>, "younglak1004.kim@samsung.com" <younglak1004.kim@samsung.com>

On Fri, Sep 30, 2011 at 9:06 PM, Roedel, Joerg <Joerg.Roedel@amd.com> w=
rote:
> First comment: Pleas remove the 'inline' annotations in this patch. I=
t
> is better to let the compiler decide what to inline and what not.
Ok. Thanks :)

>
> Hmm, may it make sense to store data directly in dev->arch.iommu? Thi=
s
> will save you the list traversals to get the information.
>
That looks better.
However, adding features to dev_archdata of ARM is actively discussed
in Linaro-mm-sig and the features also include iommu_domain.

On the other hand,
I was not able to determine what will be accepted to the mainline kerne=
l
between Linaro's one that is suggested by Marek and Ohad's one.

>> +
>> +static inline bool set_sysmmu_active(struct sysmmu_drvdata *data)
>> +{
>> + =A0 =A0 =A0 /* return true if the System MMU was not active previo=
usly
>> + =A0 =A0 =A0 =A0 =A0and it needs to be initialized */
>> +
>> + =A0 =A0 =A0 data->activations++;
>
> Is this variable only accessed under a lock? If not it should be an
> atomic.
>
All 'sysmmu' functions must be called under a lock because a System MMU
(Samsung's IOMMU) is a shared resource.
I the first patch, I declared the 'data->activations' as atomic_t but
Russell King pointed
that atomic operations on data->activations is not helpful for
preventing to become
a System MMU enabled when its data->activations is 0.

>> + =A0 =A0 =A0 return data->activations =3D=3D 1;
>
> Is that right? Shouldn't it be 'data->activations > 0'?
>
The value returned by set_sysmmu_active() means "The System MMU must be
initialized".
System MMU is initialized when its state is changed from
'inactive(disabled)' to active(enabled).
If data->activations++ becomes 2 or more, the System MMU is already ena=
bled and
must not be initialized again.

>> +static inline void __set_fault_handler(struct sysmmu_drvdata *data,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int (*handler)(enum S5=
P_SYSMMU_INTERRUPT_TYPE itype,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 unsigned long pgtable_base,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 unsigned long fault_addr))
>
> Please typedef the function signature.
>
Ok. thanks.

>> +static int exynos_iommu_domain_init(struct iommu_domain *domain)
>> +{
>> + =A0 =A0 =A0 struct exynos_iommu_domain *priv;
>> +
>> + =A0 =A0 =A0 priv =3D kzalloc(sizeof(*priv), GFP_KERNEL);
>> + =A0 =A0 =A0 if (!priv)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
>> +
>> + =A0 =A0 =A0 priv->pgtable =3D (unsigned long *)__get_free_pages(GF=
P_KERNEL,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 (S5P_LV1TABLE_ENTRIES * sizeof(unsigne=
d long)) >> PAGE_SHIFT);
>
> For __get_free_pages you can't just pass in the number of pages, you
> need the order. Please use get_order.
>
Oh! Thank you.
I didn't notice the problem.
It allocated too large memory so far.

>> + =A0 =A0 =A0 if (!priv->pgtable) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(priv);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
>> + =A0 =A0 =A0 }
>> +
>> + =A0 =A0 =A0 memset(priv->pgtable, 0, S5P_LV1TABLE_ENTRIES * sizeof=
(unsigned long));
>> + =A0 =A0 =A0 pgtable_flush(priv->pgtable, priv->pgtable + S5P_LV1TA=
BLE_ENTRIES);
>> +
>> + =A0 =A0 =A0 spin_lock_init(&priv->lock);
>
> No init for the page-table lock?
>
Thank you. I forgot that.


>> +static void exynos_iommu_domain_destroy(struct iommu_domain *domain=
)
>> +{
>> + =A0 =A0 =A0 struct exynos_iommu_domain *priv =3D domain->priv;
>> +
>> + =A0 =A0 =A0 free_pages((unsigned long)priv->pgtable,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 (S5P_LV1TABLE_ENTRIES * sizeof(unsigne=
d long)) >> PAGE_SHIFT);
>
> Same here, please use get_order.
>
True. I will fix that immediately.

>> +static int __init exynos_iommu_init(void)
>> +{
>> + =A0 =A0 =A0 l2table_cachep =3D kmem_cache_create("SysMMU Lv2 Table=
s",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_LV=
2TABLE_SIZE, S5P_LV2TABLE_SIZE, 0, NULL);
>
> Any reason you allocate a seperate slab-cache? It doesn't have a
> constructor so it would be merged into the kmalloc-slabs anyway (at
> least with SLUB).
>
I found that kmalloc(SZ_1K) returned an address that is not aligned by =
SZ_1K.
I did not understand why it happened and I changed it to the slab cache=
=2E
I will try it again with kmalloc().


Regards,
KyongHo
