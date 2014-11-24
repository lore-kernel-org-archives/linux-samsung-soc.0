From: Vivek Gautam <gautamvivek1987@gmail.com>
Subject: Re: screen blank causing lockup in exynos-reference/exynos5-v3.18-rc2
Date: Mon, 24 Nov 2014 14:57:08 +0530
Message-ID: <CAFp+6iFAHz7iMboC1xfF8KKMkeHGZDhUXx_9obW0nTPgKwBR1g@mail.gmail.com>
References: <8C.59.15273.8FB5F645@epcpsbgx1.samsung.com>
	<7h4mtsnys9.fsf@deeprootsystems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f172.google.com ([209.85.216.172]:43743 "EHLO
	mail-qc0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750759AbaKXJ1J (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Nov 2014 04:27:09 -0500
Received: by mail-qc0-f172.google.com with SMTP id m20so6610333qcx.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Nov 2014 01:27:08 -0800 (PST)
In-Reply-To: <7h4mtsnys9.fsf@deeprootsystems.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kevin Hilman <khilman@kernel.org>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, Vivek Gautam <gautam.vivek@samsung.com>, PANKAJ KUMAR DUBEY <pankaj.dubey@samsung.com>, In-Ki Dae <inki.dae@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Amit Kucheria <amit.kucheria@linaro.org>, "bhushan.r@samsung.com" <bhushan.r@samsung.com>

Hi Kevin,


On Sat, Nov 22, 2014 at 12:53 AM, Kevin Hilman <khilman@kernel.org> wrote:
> Hi Ajay,
>
> AJAY KUMAR RAMAKRISHNA SHYMALAMMA <ajaykumar.rs@samsung.com> writes:
>
>> I tried to reproduce the issue which you reported,
>>
>> but I am sorry I am not able to reproduce it.
>>
>> I tried with my patches for DRM on top of Linux-next.
>
> I don't see the issue on linux-next either.  As I mentioned in the
> original post, I only see it on the v3.18 branch in the exynos-reference
> tree.

While checking the issue along with Ajay on "exynos5-v3.18-rc2" branch
on exynos-reference
tree, we found out the culprit to be FIMD-SYSMMU.
The IOMMU on exynos systems is still WIP, and that's the reason it is
disabled in
exynos_defconfig too.
So we have a small workaround in this branch to stop using FIMD-SYSMMUs.

Now, at the bootup time things are OK, since the FIMD-SMMU clocks
(CLK_SMMU_FIMD**)
are still available. But after bootup all unused clocks are disabled
(since we don't want to
use clk_ignore_unused in boot arguments), and the consequent blanking-unblanking
causes the system to hang.

So we have pushed a patch on the same branch "exynos5-v3.18-rc2" which sets
CLK_IGNORE_UNUSED flag for these SMMU_FIMD** clocks.

This fixes the issue of hang what we were seeing.

There's another branch "exynos5-v3.18-rc5" available, and we have
pushed the same patch
on that branch too.
Please test on your side, and do let us know if things are working fine for you.



-- 
Best Regards
Vivek Gautam
Samsung R&D Institute, Bangalore
India
