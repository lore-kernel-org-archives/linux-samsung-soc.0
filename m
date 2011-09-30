From: KyongHo Cho <pullip.cho@samsung.com>
Subject: Re: [PATCH v2 5/5] iommu/exynos: Use bus_set_iommu instead of register_iommu
Date: Sat, 1 Oct 2011 08:52:45 +0900
Message-ID: <CAHQjnOPiAOA_RiHnF-aVEYnWcdkwNzVD1BTNua+-ztZrW_+6_A@mail.gmail.com>
References: <017001cc7f43$04a2db60$0de89220$%kim@samsung.com>
	<20110930134643.GS2138@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:61593 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754291Ab1I3Xwr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Sep 2011 19:52:47 -0400
In-Reply-To: <20110930134643.GS2138@amd.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Roedel, Joerg" <Joerg.Roedel@amd.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Russell King <rmk+kernel@arm.linux.org.uk>, Ohad Ben-Cohen <ohad@wizery.com>, Sanghyun Lee <sanghyun75.lee@samsung.com>, "younglak1004.kim@samsung.com" <younglak1004.kim@samsung.com>

On Fri, Sep 30, 2011 at 10:46 PM, Roedel, Joerg <Joerg.Roedel@amd.com> wrote:
> On Fri, Sep 30, 2011 at 03:31:49AM -0400, Kukjin Kim wrote:
>> From: KyongHo Cho <pullip.cho@samsung.com>
>>
>> This replaces register_iommu() with bus_set_iommu() according to the
>> suggestion of Joerg Roedel.
>
> This should be part of patch 3 already when the bus_set_iommu() change
> is merged. Otherwise it breaks bisectability too.
>
Ok.
Should I include fault handling feature (patch 4) in the patch 3 also?

Thanks.
KyongHo.
