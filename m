From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH] drm/exynos: don't use HW trigger for Exynos5420/5422/5800
Date: Thu, 9 Jun 2016 20:24:44 -0400
Message-ID: <CABxcv=nuw7ZUF0bDC1PZfP0WVQhRY3HSoO5LdwT8_FvNi9N+aQ@mail.gmail.com>
References: <CGME20160602142058epcas1p4f26bc6ab2acd0012962f90bb2c6c4141@epcas1p4.samsung.com>
	<1464877210-27207-1-git-send-email-javier@osg.samsung.com>
	<5758A58D.7050106@samsung.com>
	<6e24059d-16f3-210a-8dd2-f8dcb89213a1@osg.samsung.com>
	<5759EF32.5040302@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:33054 "EHLO
	mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751119AbcFJAYp convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Jun 2016 20:24:45 -0400
Received: by mail-it0-f66.google.com with SMTP id i6so382694ith.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Jun 2016 17:24:45 -0700 (PDT)
In-Reply-To: <5759EF32.5040302@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Linux Kernel <linux-kernel@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Kukjin Kim <kgene@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, David Airlie <airlied@linux.ie>, Joonyoung Shim <jy0922.shim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hello Inki,

On Thu, Jun 9, 2016 at 6:35 PM, Inki Dae <inki.dae@samsung.com> wrote:

[snip]

>> I know that removing .trg_type is enough but I also removed those lines
>> because the fields are not used if .trg_type != I80_HW_TRG. So there is
>> no point to leave a set for unused fields.
>>
>> We can latter add those one HW trigger support is fixed for Exynos5420.
>>
>
> As of now, I can merge it but I think it would be not reasonable solution because potential problem still exists even we use SW trigger mode in default - ie., in case of using HW trigger mode at bootloader, same problem would happen as long as we don't support PSR mode support.
>

Yes, I understand that the problem will show again if the bootloader
uses HW trigger mode and that we need proper Panel Self Refresh
support but I think that's a separate issue. That's why I said that
those can be addressed for v4.8 but revert to SW trigger for v4.7 as a
short term fix for the regression.

In other words, enabling HW trigger mode breaks the display for the
Exynos5420 and Exynos5800 Peach Pi Chromebooks with the shipped
bootloaders (which are probably the most popular Exynos5 devices with
display and mainline support so is likely to affect users).

Best regards,
Javier
