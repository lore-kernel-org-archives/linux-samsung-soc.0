From: Bjorn Andersson <bjorn@kryo.se>
Subject: Re: [PATCH 3/3] ARM: dts: Add peach-pi board support
Date: Thu, 8 May 2014 14:55:14 -0700
Message-ID: <CAJAp7Og6Bqnbq5b=Ki5vLaVkvSXxqsKaFaxCoqbX+fRkgouh=A@mail.gmail.com>
References: <1399035821-25096-1-git-send-email-arun.kk@samsung.com>
	<1399035821-25096-4-git-send-email-arun.kk@samsung.com>
	<5363D176.80601@gmail.com>
	<CAD=FV=XYjMg7V9=OzAy_ifwaM83QS0tiTrp5+nxvG236kkSjRQ@mail.gmail.com>
	<53644DDB.7050503@gmail.com>
	<CAD=FV=U_b_n=V_mEFYNPFZ1wyrgjjr5jEGrVb5TviP0Z33popg@mail.gmail.com>
	<5367D5E1.9070709@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f54.google.com ([209.85.219.54]:58484 "EHLO
	mail-oa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755814AbaEHVzP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 May 2014 17:55:15 -0400
Received: by mail-oa0-f54.google.com with SMTP id j17so3880104oag.41
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 May 2014 14:55:14 -0700 (PDT)
In-Reply-To: <5367D5E1.9070709@ti.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tom Rini <trini@ti.com>
Cc: Doug Anderson <dianders@chromium.org>, Tomasz Figa <tomasz.figa@gmail.com>, Arun Kumar K <arun.kk@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olofj@google.com>, Tomasz Figa <t.figa@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, Tushar Behera <tushar.behera@linaro.org>, Arun Kumar <arunkk.samsung@gmail.com>

On Mon, May 5, 2014 at 11:18 AM, Tom Rini <trini@ti.com> wrote:
[...]
> The problem I was raising at the ELC BoF is that today we can't just
> stop overwriting values in the non-zero case as many boards lie about
> their memory size, in non-zero ways, but no one noticed as they only
> tested with U-Boot which was performing the fixup.

So, should we conclude are we stuck being bug-compatible forever?

I was hoping to add this logic to the kernel by [1], but of course
this won't fly
based on the argument you highlighted (as was pointed out by Uwe).

[1] https://lkml.org/lkml/2014/5/7/28

Regards,
Bjorn
