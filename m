From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/5] pinctrl: exynos: Generalize the eint16_31 demux code
Date: Tue, 23 Sep 2014 17:18:20 +0200
Message-ID: <CACRpkdZcN0Zszt9QmW309fYDjOm-syA9kpL8nhRK640eKNB1Aw@mail.gmail.com>
References: <1411460169-30536-1-git-send-email-a.kesavan@samsung.com>
	<1411460169-30536-2-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f178.google.com ([209.85.223.178]:52857 "EHLO
	mail-ie0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932156AbaIWPSV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Sep 2014 11:18:21 -0400
Received: by mail-ie0-f178.google.com with SMTP id at20so9735647iec.9
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Sep 2014 08:18:20 -0700 (PDT)
In-Reply-To: <1411460169-30536-2-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <a.kesavan@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Naveen Krishna <naveenkrishna.ch@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Thomas Abraham <thomas.ab@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>

On Tue, Sep 23, 2014 at 10:16 AM, Abhilash Kesavan
<a.kesavan@samsung.com> wrote:

> The function exynos_irq_demux_eint16_31 uses pre-defined offsets for external
> interrupt pending status and mask registers. So this function is not extensible
> for Exynos7 SoC which have these registers at different offsets. So generalize
> the exynos_irq_demux_eint16_31 function by using the pending/mask register
> offset values from the exynos_irq_chip structure.
>
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> Reviewed-by: Thomas Abraham <thomas.ab@samsung.com>
> Tested-by: Thomas Abraham <thomas.ab@samsung.com>
> Cc: Thomas Abraham <thomas.ab@samsung.com>
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>

I'm waiting for the maintainers to ACK these patches
before I take them.

Yours,
Linus Walleij
