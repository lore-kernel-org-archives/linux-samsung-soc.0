From: Wanlong Gao <gaowanlong@cn.fujitsu.com>
Subject: Re: [PATCH 3/4] iommu/exynos: Add iommu driver for Exynos4 Platforms
Date: Mon, 26 Sep 2011 10:17:08 +0800
Message-ID: <4E7FE0A4.4050105@cn.fujitsu.com>
References: <5525949.50001316849744994.JavaMail.weblogic@epml24>	<20110924093851.GB17169@n2100.arm.linux.org.uk> <CAHQjnOPMRQetGF5VnwsMD=_JxWC5C-LQ5WRyZhPs2HtCzis2Tg@mail.gmail.com>
Reply-To: gaowanlong@cn.fujitsu.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cn.fujitsu.com ([222.73.24.84]:62637 "EHLO song.cn.fujitsu.com"
	rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1750800Ab1IZCS3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 25 Sep 2011 22:18:29 -0400
In-Reply-To: <CAHQjnOPMRQetGF5VnwsMD=_JxWC5C-LQ5WRyZhPs2HtCzis2Tg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: KyongHo Cho <pullip.cho@samsung.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ohad@wizery.com" <ohad@wizery.com>, =?UTF-8?B?6rmA6rWt7KeE?= <kgene.kim@samsung.com>, "joerg.roedel@amd.com" <joerg.roedel@amd.com>, =?UTF-8?B?6rmA7JiB6529?= <younglak1004.kim@samsung.com>, =?UTF-8?B?7J207IOB?= =?UTF-8?B?7ZiE?= <sanghyun75.lee@samsung.com>

On 09/26/2011 08:44 AM, KyongHo Cho wrote:

> Hi.
>=20
> On Sat, Sep 24, 2011 at 6:38 PM, Russell King - ARM Linux
> <linux@arm.linux.org.uk> wrote:
>> On Sat, Sep 24, 2011 at 07:35:45AM +0000, =EC=A1=B0=EA=B2=BD=ED=98=B8=
 wrote:
>>> +# EXYNOS IOMMU support
>>> +config EXYNOS_IOMMU
>>> + bool "Exynos IOMMU Support"
>>> + depends on ARCH_EXYNOS4
>>> + select IOMMU_API
>>> + select EXYNOS4_DEV_SYSMMU
>>> + help
>>
>> Looks like your mailer converted tabs to one space.  This makes it m=
ore
>> difficult to read this patch as a whole.  Don't expect good reviews =
as
>> long as your mailer breaks stuff in this way.
> Sorry for that :(
> I will try another way to send patches correctly.


Use *git send-email* instead.

Thanks
