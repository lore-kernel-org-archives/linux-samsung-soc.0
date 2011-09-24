From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 3/4] iommu/exynos: Add iommu driver for Exynos4
	Platforms
Date: Sat, 24 Sep 2011 10:38:51 +0100
Message-ID: <20110924093851.GB17169@n2100.arm.linux.org.uk>
References: <5525949.50001316849744994.JavaMail.weblogic@epml24>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:59130 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751739Ab1IXJjL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 24 Sep 2011 05:39:11 -0400
Content-Disposition: inline
In-Reply-To: <5525949.50001316849744994.JavaMail.weblogic@epml24>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?utf-8?B?7KGw6rK97Zi4?= <pullip.cho@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ohad@wizery.com" <ohad@wizery.com>, =?utf-8?B?6rmA6rWt7KeE?= <kgene.kim@samsung.com>, "joerg.roedel@amd.com" <joerg.roedel@amd.com>, =?utf-8?B?6rmA7JiB6529?= <younglak1004.kim@samsung.com>, =?utf-8?B?7J207IOB7ZiE?= <sanghyun75.lee@samsung.com>

On Sat, Sep 24, 2011 at 07:35:45AM +0000, =EC=A1=B0=EA=B2=BD=ED=98=B8 w=
rote:
> +# EXYNOS IOMMU support
> +config EXYNOS_IOMMU
> + bool "Exynos IOMMU Support"
> + depends on ARCH_EXYNOS4
> + select IOMMU_API
> + select EXYNOS4_DEV_SYSMMU
> + help

Looks like your mailer converted tabs to one space.  This makes it more
difficult to read this patch as a whole.  Don't expect good reviews as
long as your mailer breaks stuff in this way.

> diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
> index 4d4d77d..1eb924f 100644
> --- a/drivers/iommu/Makefile
> +++ b/drivers/iommu/Makefile
> @@ -3,3 +3,4 @@ obj-$(CONFIG_MSM_IOMMU) +=3D msm_iommu.o msm_iommu_de=
v.o
> obj-$(CONFIG_AMD_IOMMU) +=3D amd_iommu.o amd_iommu_init.o
> obj-$(CONFIG_DMAR) +=3D dmar.o iova.o intel-iommu.o
> obj-$(CONFIG_INTR_REMAP) +=3D dmar.o intr_remapping.o

Looks like your mailer eliminated spaces at the start of these lines.

> +obj-$(CONFIG_EXYNOS_IOMMU) +=3D exynos_iommu.o
> diff --git a/drivers/iommu/exynos_iommu.c b/drivers/iommu/exynos_iomm=
u.c
> new file mode 100644
> index 0000000..fe5b5d8
> --- /dev/null
> +++ b/drivers/iommu/exynos_iommu.c
> @@ -0,0 +1,859 @@
> +/* linux/drivers/iommu/exynos_iommu.c
> + *
> + * Copyright (c) 2011 Samsung Electronics Co., Ltd.
> + * http://www.samsung.com
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include=20
> +#include=20
> +#include=20
> +#include=20
> +#include=20
> +#include=20
> +#include=20
> +#include=20
> +#include=20
> +#include=20
> +#include=20
> +
> +#include=20
> +#include=20
> +
> +#include=20
> +#include=20
> +#include=20

Looks like your mailer... well... is totally broken beyond belief.

> +static inline struct sysmmu_platdata *get_platdata(struct device *de=
v)
> +{
> + return dev_get_platdata(dev);
> +}
> +
> +static inline bool set_sysmmu_active(struct sysmmu_platdata *mmudata=
)
> +{
> + /* return true if the System MMU was not active previously
> +    and it needs to be initialized */
> +
> + return atomic_inc_return(&mmudata->activations) =3D=3D 1;
> +}
> +
> +static inline bool set_sysmmu_inactive(struct sysmmu_platdata *mmuda=
ta)
> +{
> + /* return true if the System MMU is needed to be disabled */
> + int ref;
> +
> + ref =3D atomic_dec_return(&mmudata->activations);
> +
> + if (ref =3D=3D 0)
> + return true;
> +
> + if (WARN_ON(ref < 0)) {
> + /* System MMU is already disabled */
> + atomic_set(&mmudata->activations, 0);
> + ref =3D 0;
> + }
> +
> + return false;
> +}
> +
> +static inline bool is_sysmmu_active(struct sysmmu_platdata *mmudata)
> +{
> + return atomic_read(&mmudata->activations) !=3D 0;
> +}

This use of an atomic type is total rubbish.  There's nothing magical
about 'atomic_*' stuff which suddenly makes the rest of your code
magically correct.  Think about this:

	Thread0			Thread1
	atomic_inc_return(&v)
		=3D=3D 1
				atomic_dec_return(&v)
					=3D=3D 0
				disables MMU
	enables MMU

Now you have the situation where the atomic value is '0' yet the MMU is
enabled.

Repeat after me: atomic types do not make code atomic.  atomic types
just make modifications to the type itself atomic.  Never use atomic
types for code synchronization.

> +static irqreturn_t exynos_sysmmu_irq(int irq, void *dev_id)
> +{
> + /* SYSMMU is in blocked when interrupt occurred. */
> + unsigned long addr;
> + struct sysmmu_platdata *mmudata =3D dev_id;
> + enum S5P_SYSMMU_INTERRUPT_TYPE itype;
> +
> + WARN_ON(!is_sysmmu_active(mmudata));
> +
> + itype =3D (enum S5P_SYSMMU_INTERRUPT_TYPE)
> + __ffs(__raw_readl(mmudata->sfrbase + S5P_INT_STATUS));
> +
> + BUG_ON(!((itype >=3D 0) && (itype < 8)));
> +
> + dev_alert(mmudata->dev, "SYSTEM MMU FAULT!!!.\n");

Do the exclaimation marks do anything for this error message?

> +
> + if (!mmudata->domain)
> + return IRQ_NONE;
> +
> + addr =3D __raw_readl(mmudata->sfrbase + fault_reg_offset[itype]);
> +
> + if (!report_iommu_fault(mmudata->domain, mmudata->owner, addr, ityp=
e)) {
> + __raw_writel(1 << itype, mmudata->sfrbase + S5P_INT_CLEAR);
> + dev_notice(mmudata->dev,
> + "%s is resolved. Retrying translation.\n",

So, this is a notice severity, yet we've printed at alert level.  Eithe=
r
this condition satisfies being an alert or not.

> + sysmmu_fault_name[itype]);
> + sysmmu_unblock(mmudata->sfrbase);
> + } else {
> + dev_notice(mmudata->dev, "%s is not handled.\n",
> + sysmmu_fault_name[itype]);
> + }
> +
> + return IRQ_HANDLED;
> +}
> +
> +void exynos_sysmmu_set_tablebase_pgd(struct device *owner, unsigned =
long pgd)
> +{
> + struct sysmmu_platdata *mmudata =3D NULL;
> +
> + while ((mmudata =3D get_sysmmu_data(owner, mmudata))) {
> + if (is_sysmmu_active(mmudata)) {
> + sysmmu_block(mmudata->sfrbase);
> + __sysmmu_set_ptbase(mmudata->sfrbase, pgd);
> + sysmmu_unblock(mmudata->sfrbase);
> + dev_dbg(mmudata->dev, "New page table base is %p\n",
> + (void *)pgd);

If it's unsigned long use %08lx and don't cast.

> +static int exynos_sysmmu_probe(struct platform_device *pdev)
> +{
> + struct resource *res, *ioarea;
> + int ret;
> + int irq;
> + struct device *dev;
> + void *sfr;

void __iomem *sfr;

> +
> + dev =3D &pdev->dev;
> + if (!get_platdata(dev) || (get_platdata(dev)->owner =3D=3D NULL)) {
> + dev_err(dev, "Failed to probing system MMU: "
> + "Owner device is not set.");
> + return -ENXIO;
> + }
> +
> + res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> + if (!res) {
> + dev_err(dev,
> + "Failed probing system MMU: failed to get resource.");
> + return -ENOENT;
> + }
> +
> + ioarea =3D request_mem_region(res->start, resource_size(res), pdev-=
>name);
> + if (ioarea =3D=3D NULL) {
> + dev_err(dev, "Failed probing system MMU: "
> + "failed to request memory region.");
> + return -ENOMEM;
> + }
> +
> + sfr =3D ioremap(res->start, resource_size(res));
> + if (!sfr) {
> + dev_err(dev, "Failed probing system MMU: "
> + "failed to call ioremap().");
> + ret =3D -ENOENT;
> + goto err_ioremap;
> + }
> +
> + irq =3D platform_get_irq(pdev, 0);
> + if (irq <=3D 0) {
> + dev_err(dev, "Failed probing system MMU: "
> + "failed to get irq resource.");
> + ret =3D irq;
> + goto err_irq;
> + }
> +
> + if (request_irq(irq, exynos_sysmmu_irq, 0, dev_name(&pdev->dev),
> + dev_get_platdata(dev))) {
> + dev_err(dev, "Failed probing system MMU: "
> + "failed to request irq.");
> + ret =3D -ENOENT;
> + goto err_irq;
> + }
> +
> + get_platdata(dev)->clk =3D clk_get(dev, "sysmmu");

It's rather horrible to see drivers modifying their platform data, rath=
er
than drivers using the driver data pointer in struct device.  As far as
drivers are concerned, the platform data should only ever be read.

> +
> + if (IS_ERR_OR_NULL(get_platdata(dev)->clk)) {

IS_ERR() only please.  The *only* allowable failure value for drivers t=
o
be concerned about here is if the return value is an error pointer.
Drivers have no business rejecting a NULL pointer here.

> +static int exynos_sysmmu_remove(struct platform_device *pdev)
> +{
> + return 0;
> +}

That doesn't look good.  If you can't remove it don't provide the
function at all.

> +
> +int exynos_sysmmu_runtime_suspend(struct device *dev)
> +{
> + if (WARN_ON(is_sysmmu_active(dev_get_platdata(dev))))
> + return -EFAULT;
> +
> + return 0;
> +}
> +
> +int exynos_sysmmu_runtime_resume(struct device *dev)
> +{
> + if (WARN_ON(is_sysmmu_active(dev_get_platdata(dev))))
> + return -EFAULT;
> +
> + return 0;
> +}

Is there much point to having runtime PM support in this driver?

> +static int exynos_iommu_fault_handler(struct iommu_domain *domain,
> + struct device *dev, unsigned long iova, int flags)
> +{
> + struct exynos_iommu_domain *priv =3D domain->priv;
> +
> + dev_err(priv->dev, "%s occured at %p(Page table base: %p)\n",
> + sysmmu_fault_name[flags], (void *)iova,
> + (void *)(__pa(priv->pgtable)));

Again, you want to get rid of these casts and use a proper format strin=
g
for what these are.

> +static int exynos_iommu_attach_device(struct iommu_domain *domain,
> +    struct device *dev)
> +{
> + struct exynos_iommu_domain *priv =3D domain->priv;
> + int ret;
> +
> + spin_lock(&priv->lock);
> +
> + priv->dev =3D dev;
> +
> + ret =3D exynos_sysmmu_enable(domain);
> + if (ret)
> + return ret;
> +
> + spin_unlock(&priv->lock);
> +
> + return 0;

This function has an indeterminant return state for the spinlock - it
sometimes returns with it locked and sometimes with it unlocked.  That'=
s
bad practice.

Getting rid of the 'if (ret) return ret;' and changing this 'return 0;'
to 'return ret;' is a simple way of solving it - and results in less
complex code.

> +static int exynos_iommu_map(struct iommu_domain *domain, unsigned lo=
ng iova,
> + phys_addr_t paddr, int gfp_order, int prot)
> +{
> + struct exynos_iommu_domain *priv =3D domain->priv;
> + unsigned long *start_entry, *entry, *end_entry;
> + int num_entry;
> + int ret =3D 0;
> + unsigned long flags;
> +
> + BUG_ON(priv->pgtable =3D=3D NULL);
> +
> + spin_lock_irqsave(&priv->pgtablelock, flags);
> +
> + start_entry =3D entry =3D priv->pgtable + (iova >> S5P_SECTION_SHIF=
T);
> +
> + if (gfp_order >=3D S5P_SECTION_ORDER) {
> + BUG_ON((paddr | iova) & ~S5P_SECTION_MASK);
> + /* 1MiB mapping */
> +
> + num_entry =3D 1 << (gfp_order - S5P_SECTION_ORDER);
> + end_entry =3D entry + num_entry;
> +
> + while (entry !=3D end_entry) {
> + if (!section_available(domain, entry))
> + break;
> +
> + MAKE_SECTION_ENTRY(*entry, paddr);
> +
> + paddr +=3D S5P_SECTION_SIZE;
> + entry++;
> + }
> +
> + if (entry !=3D end_entry)
> + goto mapping_error;
> +
> + pgtable_flush(start_entry, entry);
> + goto mapping_done;
> + }
> +
> + if (S5P_FAULT_LV1_ENTRY(*entry)) {
> + unsigned long *l2table;
> +
> + l2table =3D kmem_cache_zalloc(l2table_cachep, GFP_KERNEL);
> + if (!l2table) {
> + ret =3D -ENOMEM;
> + goto nomem_error;
> + }
> +
> + pgtable_flush(entry, entry + S5P_LV2TABLE_ENTRIES);
> +
> + MAKE_LV2TABLE_ENTRY(*entry, virt_to_phys(l2table));
> + pgtable_flush(entry, entry + 1);
> + }
> +
> + /* 'entry' points level 2 entries, hereafter */
> + entry =3D GET_LV2ENTRY(*entry, iova);
> +
> + start_entry =3D entry;
> + num_entry =3D 1 << gfp_order;
> + end_entry =3D entry + num_entry;
> +
> + if (gfp_order >=3D S5P_LPAGE_ORDER) {
> + /* large page(64KiB) mapping */
> + BUG_ON((paddr | iova) & ~S5P_LPAGE_MASK);
> +
> + while (entry !=3D end_entry) {
> + if (!write_lpage(entry, paddr)) {
> + pr_err("%s: Failed to allocate large page"
> + " entry.\n", __func__);

Don't wrap error messages, irrespective of what checkpatch may tell you=
=2E
They make them impossible to grep for.
