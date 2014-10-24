From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: [PATCH v5 0/6] Add initial support for pinctrl on Exynos7
Date: Fri, 24 Oct 2014 20:03:06 +0530
Message-ID: <CAM4voamzXmEsk28O04Pozw4ZeWJ=H25G3TSK_KBmrff4NuCLiA@mail.gmail.com>
References: <1412862874-9335-1-git-send-email-a.kesavan@samsung.com>
	<54397DAA.4020607@gmail.com>
	<CAM4voa=k=bq67mTMtaQiFp-m2byY=U-gMyWoeckvhW-HTaRhag@mail.gmail.com>
	<CACRpkdYDETw8NMOp-yT129ffDz-aFDpgo5xy-8bfcOVbd9TbeA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f179.google.com ([209.85.216.179]:52582 "EHLO
	mail-qc0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751729AbaJXOdH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 Oct 2014 10:33:07 -0400
In-Reply-To: <CACRpkdYDETw8NMOp-yT129ffDz-aFDpgo5xy-8bfcOVbd9TbeA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, devicetree <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>, Naveen Krishna <naveenkrishna.ch@gmail.com>, Tomasz Figa <tomasz.figa@gmail.com>

Hi Linus,

On Fri, Oct 24, 2014 at 5:31 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Mon, Oct 20, 2014 at 4:01 PM, Abhilash Kesavan
> <kesavan.abhilash@gmail.com> wrote:
>
>> Can you please pick this series up.
>
> Yes, sorry for the delay. I've applied patches
> 1,2,3,4. The patches to the DTS files should be taken
> through whatever tree funnels arm64 dts files.

Thank you for applying my patches. However, this version (v5) was
based on Tomasz's clean-up series and makes use of structures such as
"samsung_pin_bank_data" introduced by his series. It also marks the
samsung_pin_ctrl instance as __initconst. Thus, patch 4 would cause
compilation issues if Tomasz's clean-up patches have not been applied
before it.

My v4 version was independent of Tomasz's patch series and could be
applied directly.

Regards,
Abhilash
>
> I hope Tomasz can rebase his nice
> clean-up patches on top of this now.
>
> Yours,
> Linus Walleij
