From: KyongHo Cho <pullip.cho@samsung.com>
Subject: Re: [PATCH v6 2/2] iommu/exynos: Add iommu driver for Exynos Platforms
Date: Tue, 15 Nov 2011 16:26:43 +0900
Message-ID: <CAHQjnOPMxtQFn1LMsXg7JKeW-iGe87jTN_kA+6BK9MGeF=0qDw@mail.gmail.com>
References: <1321333132-17662-1-git-send-email-pullip.cho@samsung.com>
	<1321333132-17662-3-git-send-email-pullip.cho@samsung.com>
	<CAH9JG2U1L1st_D+jp0Qm42HR8Ur7JpdYz6gFJSv+z_ZkGAQv8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:39479 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753136Ab1KOH0o convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Nov 2011 02:26:44 -0500
In-Reply-To: <CAH9JG2U1L1st_D+jp0Qm42HR8Ur7JpdYz6gFJSv+z_ZkGAQv8A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-samsung-soc@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, linux-kernel@vger.kernel.org, YoungLak Kim <younglak1004.kim@samsung.com>, iommu@lists.linux-foundation.org, Kukjin Kim <kgene.kim@samsung.com>, Sanghyun Lee <sanghyun75.lee@samsung.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, linux-arm-kernel@lists.infradead.org

On Tue, Nov 15, 2011 at 3:05 PM, Kyungmin Park <kmpark@infradead.org> w=
rote:
>> +static bool set_sysmmu_active(struct sysmmu_drvdata *data)
>> +{
>> + =A0 =A0 /* return true if the System MMU was not active previously
>> + =A0 =A0 =A0 =A0and it needs to be initialized */
>> + =A0 =A0 data->activations++;
>> + =A0 =A0 return data->activations =3D=3D 1;
>> +}
> If it calls the twice, then caller get the active failed return value=
=2E
> Are there no case to call the multiple activation?

Return value of set_sysmmu_active() does not mean that activation is su=
ccessful
but that System MMU H/W is needed to be initialized.

System MMU driver only initializes System MMU H/W when data->activation
becomes 1 from 0 and deinitializes when it becomes 0 from 1.

>> +void exynos_sysmmu_set_tablebase_pgd(struct device *owner, unsigned=
 long
>> pgd)
>> +{
>> + =A0 =A0 struct sysmmu_drvdata *data =3D NULL;
>> +
>> + =A0 =A0 while ((data =3D get_sysmmu_data(owner, data))) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 unsigned long flags;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 read_lock_irqsave(&data->lock, flags);
> It should be 'write_lock_irqsave'

data->lock just protects contents of 'data' from race condition.
It does not care about control registers of System MMU.
Since no contents in 'data' is modified in this function,
I think read_lock is more proper.

However, suddenly, I think exynos_sysmmu_set_tablebase_pgd()
must be removed because it modifies page table base
that is already set with exynos_sysmmu_enable().

>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (is_sysmmu_active(data)) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sysmmu_block(data->sfrbase=
);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __sysmmu_set_ptbase(data->=
sfrbase, pgd);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sysmmu_unblock(data->sfrba=
se);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_dbg(data->dev, "New pa=
ge table base is %p\n",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (void *)pgd);
>> + =A0 =A0 =A0 =A0 =A0 =A0 } else {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_dbg(data->dev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Disabled: Skipping settin=
g page table base.\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 read_unlock_irqrestore(&data->lock, flags)=
;
> It should be 'write_unlock_irqrestore'

Ditto.

>> +void exynos_sysmmu_tlb_invalidate(struct device *owner)
>> +{
>> + =A0 =A0 struct sysmmu_drvdata *data =3D NULL;
>> +
>> + =A0 =A0 while ((data =3D get_sysmmu_data(owner, data))) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 unsigned long flags;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 read_lock_irqsave(&data->lock, flags);
> doesn't use the write_lock_irqsave here?

Ditto.

>> +static void exynos_iommu_domain_destroy(struct iommu_domain *domain=
)
>> +{
>> + =A0 =A0 struct exynos_iommu_domain *priv =3D domain->priv;
>> + =A0 =A0 struct list_head *pos, *n;
>> +
>> + =A0 =A0 WARN_ON(!list_empty(&priv->clients));
>> +
>> + =A0 =A0 spin_lock(&priv->lock);
>> +
>> + =A0 =A0 list_for_each_safe(pos, n, &priv->clients) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 struct iommu_client *client;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 client =3D list_entry(pos, struct iommu_cl=
ient, node);
>> + =A0 =A0 =A0 =A0 =A0 =A0 exynos_sysmmu_disable(client->dev);
> I think It occurs sleeping lock error message since it calls the
> write_lock within spin_lock.

Sorry, I don't understand why it makes problem.

I also tested it with various devices.
It is also not a condition of neither deadlock nor livelock.

Thank you.

KyongHo.
