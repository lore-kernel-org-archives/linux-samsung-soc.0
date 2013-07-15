From: Grant Grundler <grundler@chromium.org>
Subject: Re: [PATCH v7 3/9] iommu/exynos: fix page table maintenance
Date: Mon, 15 Jul 2013 09:18:41 -0700
Message-ID: <CANEJEGs_8a9dPCYtDT8u2NEv5HUUD5gcdmRmbsrKU-_aagztgg@mail.gmail.com>
References: <002b01ce797b$44d4ad10$ce7e0730$@samsung.com>
	<1933986.4vddYccClk@amdc1032>
	<009a01ce814d$840b48c0$8c21da40$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:45603 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932584Ab3GOQSl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Jul 2013 12:18:41 -0400
Received: by mail-oa0-f53.google.com with SMTP id k14so15660682oag.26
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Jul 2013 09:18:41 -0700 (PDT)
In-Reply-To: <009a01ce814d$840b48c0$8c21da40$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Cho KyongHo <pullip.cho@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>, Linux IOMMU <iommu@lists.linux-foundation.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>, Hyunwoong Kim <khw0178.kim@samsung.com>, Joerg Roedel <joro@8bytes.org>, Kukjin Kim <kgene.kim@samsung.com>, Prathyush <prathyush.k@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>, Subash Patel <supash.ramaswamy@linaro.org>, Keyyoung Park <keyyoung.park@samsung.com>, Grant Grundler <grundler@chromium.org>

On Mon, Jul 15, 2013 at 4:21 AM, Cho KyongHo <pullip.cho@samsung.com> wrote:
...
>> Maybe you could add LV1TABLE_SIZE define and use it here (there is
>> already a LV2TABLE_SIZE define)?
>
> Yes. But, LV2TABLE_SIZE is used in more places than one.
> I do not feel that it is needed to define LV1TABLE_SIZE for the single line.

Cho,
#define's are part of the code "documentation". Doesn't really matter
how often it's used. I think Bartlomiej's suggestion is a good one.

Key is to use "consistent" names so they makes sense to someone not
familiar with the code. In this case, we want to show this use is the
same way LV2TABLE_SIZE is used and serves the same purpose.

cheers.
grant
