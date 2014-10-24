From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 0/6] Add initial support for pinctrl on Exynos7
Date: Fri, 24 Oct 2014 14:01:18 +0200
Message-ID: <CACRpkdYDETw8NMOp-yT129ffDz-aFDpgo5xy-8bfcOVbd9TbeA@mail.gmail.com>
References: <1412862874-9335-1-git-send-email-a.kesavan@samsung.com>
	<54397DAA.4020607@gmail.com>
	<CAM4voa=k=bq67mTMtaQiFp-m2byY=U-gMyWoeckvhW-HTaRhag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f178.google.com ([209.85.216.178]:34377 "EHLO
	mail-qc0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933209AbaJXMBT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 Oct 2014 08:01:19 -0400
Received: by mail-qc0-f178.google.com with SMTP id b13so594655qcw.23
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Oct 2014 05:01:18 -0700 (PDT)
In-Reply-To: <CAM4voa=k=bq67mTMtaQiFp-m2byY=U-gMyWoeckvhW-HTaRhag@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, devicetree <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>, Naveen Krishna <naveenkrishna.ch@gmail.com>, Tomasz Figa <tomasz.figa@gmail.com>

On Mon, Oct 20, 2014 at 4:01 PM, Abhilash Kesavan
<kesavan.abhilash@gmail.com> wrote:

> Can you please pick this series up.

Yes, sorry for the delay. I've applied patches
1,2,3,4. The patches to the DTS files should be taken
through whatever tree funnels arm64 dts files.

I hope Tomasz can rebase his nice
clean-up patches on top of this now.

Yours,
Linus Walleij
