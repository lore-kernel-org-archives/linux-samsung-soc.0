From: KyongHo Cho <pullip.cho@samsung.com>
Subject: Re: [PATCH v5 2/2] iommu/exynos: Add iommu driver for Exynos Platforms
Date: Sat, 15 Oct 2011 10:55:52 +0900
Message-ID: <CAHQjnOPsBr5sV=08CaO0bpvjVXA9y_rE5tumVuseRU-N6uHx-Q@mail.gmail.com>
References: <000501cc897f$fa0204f0$ee060ed0$%cho@samsung.com>
	<20111014141714.GD2198@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:57110 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753701Ab1JOBzy convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Oct 2011 21:55:54 -0400
In-Reply-To: <20111014141714.GD2198@amd.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Roedel, Joerg" <Joerg.Roedel@amd.com>
Cc: Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Russell King <rmk+kernel@arm.linux.org.uk>, Ohad Ben-Cohen <ohad@wizery.com>, Sanghyun Lee <sanghyun75.lee@samsung.com>, "younglak1004.kim@samsung.com" <younglak1004.kim@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

On Fri, Oct 14, 2011 at 11:17 PM, Roedel, Joerg <Joerg.Roedel@amd.com> =
wrote:
> On Thu, Oct 13, 2011 at 04:13:23AM -0400, KyongHo Cho wrote:
>> +struct exynos_iommu_domain {
>> + =A0 =A0 =A0 struct device *dev;
>> + =A0 =A0 =A0 unsigned long *pgtable;
>> + =A0 =A0 =A0 spinlock_t lock;
>> + =A0 =A0 =A0 spinlock_t pgtablelock;
>> +};
>
> Can you please add comments to document what these spinlocks protect?
>
'lock' protects race condition on the domain private data.
'pgtablelock' does it on the page table of the domain.
Since updating page table does not need to be synchronized with
domain private data, I defined those 2 locks seperately.

I will add this information in the source code as comments.

>> +static int exynos_iommu_attach_device(struct iommu_domain *domain,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
struct device *dev)
>> +{
>> + =A0 =A0 =A0 struct exynos_iommu_domain *priv =3D domain->priv;
>> + =A0 =A0 =A0 int ret;
>> +
>> + =A0 =A0 =A0 spin_lock(&priv->lock);
>> +
>> + =A0 =A0 =A0 priv->dev =3D dev;
>> +
>> + =A0 =A0 =A0 spin_unlock(&priv->lock);
>> +
>> + =A0 =A0 =A0 ret =3D exynos_iommu_enable(domain);
>> +
>> + =A0 =A0 =A0 return ret;
>> +}
>> +
>> +static void exynos_iommu_detach_device(struct iommu_domain *domain,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 struct device *dev)
>> +{
>> + =A0 =A0 =A0 struct exynos_iommu_domain *priv =3D domain->priv;
>> +
>> + =A0 =A0 =A0 spin_lock(&priv->lock);
>> +
>> + =A0 =A0 =A0 if (priv->dev =3D=3D dev) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 priv->dev =3D NULL;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock(&priv->lock);
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 exynos_iommu_disable(domain);
>> + =A0 =A0 =A0 } else {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock(&priv->lock);
>> + =A0 =A0 =A0 }
>> +}
>
> That looks weird. As I read this code there is a 1-1 mapping between =
a
> device and a domain. This breaks semantics of the iommu-api where a
> domain can contain multiple devices.

I agree.
I will implement it soon.


Thank you

KyongHo
