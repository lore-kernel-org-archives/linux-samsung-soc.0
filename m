From: KyongHo Cho <pullip.cho@samsung.com>
Subject: Re: [PATCH 3/4] iommu/exynos: Add iommu driver for Exynos4 Platforms
Date: Mon, 26 Sep 2011 23:48:41 +0900
Message-ID: <CAHQjnOM_KTiqzYnePScMHQ3bg5X1wqa4zu6=1A1z7UWeDxVZvQ@mail.gmail.com>
References: <15669786.49881316849426265.JavaMail.weblogic@epml24>
	<CAK=WgbYnGjPKs6_nmFRGfMnbh_7wDR-0QcptAGaqDKVOo-x3cg@mail.gmail.com>
	<CAHQjnOOtVHUS3KmBz7LdO88fLQyLA6f-w3ye9nAH0Bx+zh38XA@mail.gmail.com>
	<CAK=Wgbazwz9PRJSpZjopwxJ-PO88FtajmbXL=pVKDHOr1t61fQ@mail.gmail.com>
	<CAHQjnON7dksupFeAYLuYXX2PhgjX-GXEGJiy0dRTmpoBjbURVg@mail.gmail.com>
	<CAK=WgbaOwe8Q19tpZMeHdvyCj8fcV194zA-oSD20tF7j7_MvpQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:56079 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750965Ab1IZOuN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Sep 2011 10:50:13 -0400
In-Reply-To: <CAK=WgbaOwe8Q19tpZMeHdvyCj8fcV194zA-oSD20tF7j7_MvpQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ohad Ben-Cohen <ohad@wizery.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "joerg.roedel@amd.com" <joerg.roedel@amd.com>, =?UTF-8?B?7J207IOB7ZiE?= <sanghyun75.lee@samsung.com>, =?UTF-8?B?6rmA6rWt7KeE?= <kgene.kim@samsung.com>, =?UTF-8?B?6rmA7JiB6529?= <younglak1004.kim@samsung.com>

On Mon, Sep 26, 2011 at 6:36 PM, Ohad Ben-Cohen <ohad@wizery.com> wrote=
:

> It seems your default behavior just prints an error message with the
> details of the fault (addresses, flags, etc..). We can probably have
> this unified.
>
> In case you want to print exonys-specific info when the fault is not
> handled by upper layers, we can change report_iommu_fault() to return
> an error whenever a handler is not installed. This way
> exynos_sysmmu_irq() can easily tell whether to proceed with the
> default behavior or not, without installing a fault handler in the
> driver:
>
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 297893f..dc4b282 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -103,7 +103,7 @@ extern void iommu_set_fault_handler(struct iommu_=
domain *dom
> =A0static inline int report_iommu_fault(struct iommu_domain *domain,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct device *dev, unsigned long iova=
, int flags)
> =A0{
> - =A0 =A0 =A0 int ret =3D 0;
> + =A0 =A0 =A0 int ret =3D -EFAULT;
>
That looks better for me :)
However, I think the irq handler need to identify if the return value
is an error
returned by a fault handler or a notice that no fault handler is instal=
led.

I am sorry but I still think that
installing default fault handler is quite simple and straightforward.

Providing generic default behavior for all architectures is also good
if it is available for other architectures.
My intention with the default behavior for unrecoverable fault from IOM=
MU is
to show what the problem is, where the problem caused and
thus, providing a hint  to solve or catch the problem
for the device drivers and the developers.

>> BTW,
>> I think we need more fault type than IOMMU_FAULT_READ and IOMMU_FAUL=
T_WRITE.
>> We have page fault, access fault(read, write), security fault
>> and bus error (translated physical address is not available)
>
> Initially we had a argument for the type of the fault, but dropped it
> because it was not used. Feel free to add it back if you need it.
>
OK. thanks.

> Thanks,
> Ohad.

Thank you.
Cho KyongHo.
