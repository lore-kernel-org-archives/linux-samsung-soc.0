From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH 1/2] ARM: dts: Enable PMIC interrupts on ODROID
Date: Tue, 19 Aug 2014 12:15:41 +0200
Message-ID: <CABxcv=mkqmg_b+vwbVPAW7AaB86Fxx+LTuMSyC7L_mUy6u2+TQ@mail.gmail.com>
References: <1405500606-5752-1-git-send-email-drake@endlessm.com>
	<CAAObsKAokjDmpVy5cm_iFD52bCq+3jYeGDWzACsmh-JKktyjDw@mail.gmail.com>
	<53F22D1B.4010900@samsung.com>
	<3413299.OcpyWkc82q@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f46.google.com ([74.125.82.46]:63213 "EHLO
	mail-wg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750779AbaHSKPn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Aug 2014 06:15:43 -0400
Received: by mail-wg0-f46.google.com with SMTP id m15so6173645wgh.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Aug 2014 03:15:42 -0700 (PDT)
In-Reply-To: <3413299.OcpyWkc82q@amdc1032>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomeu Vizoso <tomeu@tomeuvizoso.net>, Daniel Drake <drake@endlessm.com>, liquid.acid@gmx.net, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>

Hello,

On Tue, Aug 19, 2014 at 11:57 AM, Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:
>
> IMHO they should go to upstream ASAP as they fix the boot for
> ODROID boards and they cannot break anything as they are limited
> to ODROID dts files.
>

Agreed, this is definitely -rc material IMHO.

Best regards,
Javier
