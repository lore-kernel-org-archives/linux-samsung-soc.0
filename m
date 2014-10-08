From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 0/6] Add initial support for pinctrl on Exynos7
Date: Wed, 8 Oct 2014 12:22:20 +0200
Message-ID: <CACRpkdZ1zH9NBpCLnvzv6g1Ja01kgrdV0GU8_FY2Hak-5GT_ZQ@mail.gmail.com>
References: <1412087450-10495-1-git-send-email-a.kesavan@samsung.com>
	<CAM4voamZhSzEANSpij6oHjEjouqCL+shxHv11Qb8ZiLG81P37g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f179.google.com ([209.85.213.179]:34731 "EHLO
	mail-ig0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754805AbaJHKWV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Oct 2014 06:22:21 -0400
Received: by mail-ig0-f179.google.com with SMTP id h18so7880505igc.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Oct 2014 03:22:21 -0700 (PDT)
In-Reply-To: <CAM4voamZhSzEANSpij6oHjEjouqCL+shxHv11Qb8ZiLG81P37g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <kesavan.abhilash@gmail.com>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Naveen Krishna <naveenkrishna.ch@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, "robh@kernel.org" <robh@kernel.org>, devicetree <devicetree@vger.kernel.org>

On Mon, Oct 6, 2014 at 5:42 AM, Abhilash Kesavan
<kesavan.abhilash@gmail.com> wrote:
> On Tue, Sep 30, 2014 at 8:00 PM, Abhilash Kesavan <a.kesavan@samsung.com> wrote:
>> Changes since v3:
>>         - Changed variable name from exynos_wkup_irq_chip to irq_chip
>>         - Added acked-by tag from Tomasz Figa
>>
>> Changes since v2:
>>         - Added a .irq_chip field to the samsung_pin_bank struct
>>         - Consolidated the wakeup and gpio irqd_ops
>>
>> Changes since v1:
>>         - Marked the newly created irq_chip instances as __initdata
>>         - Used kmemdup to keep a copy of the irq_chip
>>         - Change the pinctrl name from sd0_rdqs to sd0_ds as per UM
>>         - Moved the pinctrl enablement for exynos7 into a separate patch
>>         - Added tested-by and reviewed-by tags from Thomas Abraham

OK...

> Does this series look OK to you ?

I'm waiting for review comments form Tomasz Figa.

I have just applied his 5 refactoring patches as the first base
for v3.19, I don't know if this stuff will fit nicely on top of these
or not, expect to find out during review. Tomasz patches have
priority since they have been in-flight for a while and he is listed
as maintainer for this driver.

So could you make sure to get Tomasz review tag and make
sure that these patches work on top of his patches? His
patches are on my "devel" branch in the pin control tree, but
will not be pushed to linux-next until the merge window ends.

Yours,
Linus Walleij
