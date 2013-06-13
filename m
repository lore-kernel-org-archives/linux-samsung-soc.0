From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 3/3] pinctrl: exynos: ack level-triggered interrupts
 before unmasking
Date: Thu, 13 Jun 2013 09:38:33 -0700
Message-ID: <CAD=FV=U9V-rgjcCusCvgw-SeUH-kDbozr_T-i1DcaXNXv48vxw@mail.gmail.com>
References: <1371058399-31933-1-git-send-email-dianders@chromium.org>
	<1371058399-31933-3-git-send-email-dianders@chromium.org>
	<150901ce682e$1c3fca50$54bf5ef0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f46.google.com ([209.85.215.46]:60279 "EHLO
	mail-la0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758576Ab3FMQif convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Jun 2013 12:38:35 -0400
Received: by mail-la0-f46.google.com with SMTP id eg20so9246606lab.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Jun 2013 09:38:34 -0700 (PDT)
In-Reply-To: <150901ce682e$1c3fca50$54bf5ef0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Olof Johansson <olof@lixom.net>, Simon Glass <sjg@chromium.org>, Luigi Semenzato <semenzato@chromium.org>, Ilho Lee <ilho215.lee@samsung.com>, =?UTF-8?B?6rmA7J2A6riw?= <eunki_kim@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Kukjin,

On Thu, Jun 13, 2013 at 5:04 AM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> Doug Anderson wrote:
>>
>> A level-triggered interrupt should be acked after the interrupt line
>> becomes inactive and before it is unmasked, or else another interrup=
t
>> will be immediately triggered.  Acking before or after calling the
>> handler is not enough.
>>
>> Signed-off-by: Luigi Semenzato <semenzato@chromium.org>
>> Signed-off-by: Doug Anderson <dianders@chromium.org>
>
> BTW, probably we need a similar fixing in the mach-exynos/common.c fi=
le
> before pinct=EA=B8=B0 for distro...

Is anyone using the functions in mach-exynos/common.c file anymore?  I
thought that non-dt exynos support was going away and then we could
just delete a whole lot of code from that file.

-Doug
