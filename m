From: Doug Anderson <dianders@google.com>
Subject: Re: Problems booting exynos5420 with >1 CPU
Date: Fri, 6 Jun 2014 16:03:50 -0700
Message-ID: <CAD=FV=WWNs7wQCjthmtGrRh=rB5jZo448c55D+WVtxKZ_iJC8w@mail.gmail.com>
References: <539145B4.5000200@gmail.com>
	<CAD=FV=XqwEQNJmij-4Gh62OY+B66AjdQjZC0=f_6tbot3UfQaA@mail.gmail.com>
	<CAM4voaknx3+X4O8MUwaruUFPyquY8Opq61ucKX08xTrv8PqfLg@mail.gmail.com>
	<CAD=FV=Vo1JR6n496Q3FqXjRBkbTBRg89_fJQNsqeRx8WQW_a9w@mail.gmail.com>
	<CAM4voakAMN4jdAZDPz55tnc3woZDieZ5aL3TVU2kYsNHT+AMqg@mail.gmail.com>
	<CAD=FV=UjmN5AwWMPy7mQt-J4A_niO8Ug4r15Ez2ZWPT1g3L=VA@mail.gmail.com>
	<20140606203721.GA10422@quad.lixom.net>
	<CAM4voanSpTd=dAXLZhdZKRP4Z_YShbD4Hr-6UWn3DFYueoxeTA@mail.gmail.com>
	<20140606210126.GA10219@quad.lixom.net>
	<alpine.LFD.2.11.1406061717520.25775@knanqh.ubzr>
	<20140606214921.GA10969@quad.lixom.net>
	<CAD=FV=WSEBRH-Py8oGXp0soAx_Y=j8NdoX89YiPGYeTBzQdOyw@mail.gmail.com>
	<alpine.LFD.2.11.1406061836130.25775@knanqh.ubzr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f173.google.com ([209.85.128.173]:57703 "EHLO
	mail-ve0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752269AbaFFXDv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Jun 2014 19:03:51 -0400
Received: by mail-ve0-f173.google.com with SMTP id pa12so4130377veb.32
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Jun 2014 16:03:50 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.11.1406061836130.25775@knanqh.ubzr>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Olof Johansson <olof@lixom.net>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, Tushar Behera <trblinux@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "Turquette, Mike" <mturquette@linaro.org>, Kevin Hilman <khilman@linaro.org>, Thomas Abraham <thomas.abraham@linaro.org>, Arun Kumar <arun.kk@samsung.com>, Sonny Rao <sonnyrao@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

Nicolas,

On Fri, Jun 6, 2014 at 3:38 PM, Nicolas Pitre <nicolas.pitre@linaro.org> wrote:
> On Fri, 6 Jun 2014, Doug Anderson wrote:
>
>> Note that handling CPU resume in a way that can be updated by RW
>> firmware is non-trivial and requires some SRAM to be saved across
>> suspend/resume.
>
> Saved by the kernel or the firmware?

By the SoC / board.

The problem on the original ARM Chromebook:

1. After resume, the boot CPU comes up just as if it were booting from
a cold boot.  All clocks are back at their default and the SDRAM
controller is no longer initted.  SDRAM is sitting in self refresh.

2. CPU loads boot code from SPI flash.

3. Boot code needs to be read only for security reasons.  You can have
RW updates for some portion of boot code, but only the part _after_
clock init (needed for SDRAM), SDRAM reinit, cache init.  That's
because you need those parts to (quickly) run crypto verification
code.


If the SoC / board can keep its internal SRAM powered across suspend
resume you've got an out.  Now you can have the firmware stash its
"wakeup" code into a location in SRAM.  At wakeup time you can jump
straight there and that code can worry about everything.  Now a
read-write firmware update can update the wakeup code and you're all
set.  In this case wakeup code doesn't survive a full power cycle /
reboot so you don't need any extra verification like you do if you
load from persistent storage.


That all still means you need to qualify a rw firmware update, but
that's better than nothing.

-Doug
