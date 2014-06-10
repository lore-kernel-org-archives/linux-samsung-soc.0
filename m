From: Doug Anderson <dianders@google.com>
Subject: Re: exynos5420-peach-pi: linux-next boot fails unless mau_epll left enabled?
Date: Tue, 10 Jun 2014 10:39:32 -0700
Message-ID: <CAD=FV=UsVQm_pLNtPwZMNCQQSSVrx=6M8eJrNRS8VyWMQzYtAQ@mail.gmail.com>
References: <7hoay6sxjl.fsf@paris.lan>
	<CAGa+x86ko1N+T+QAqnY+md4+nyzza_cDt0wa-s06TdCX+27fSA@mail.gmail.com>
	<CAOD6ATpZWEg9d7WnZ8tg9_uQJ29vMoucaOwh0_tbdRSDRj25cw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f169.google.com ([209.85.220.169]:43239 "EHLO
	mail-vc0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752068AbaFJRjd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Jun 2014 13:39:33 -0400
Received: by mail-vc0-f169.google.com with SMTP id la4so8403653vcb.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Jun 2014 10:39:33 -0700 (PDT)
In-Reply-To: <CAOD6ATpZWEg9d7WnZ8tg9_uQJ29vMoucaOwh0_tbdRSDRj25cw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Shaik Ameer Basha <shaik.samsung@gmail.com>
Cc: Kevin Hilman <khilman@linaro.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Olof Johansson <olof@lixom.net>, "Turquette, Mike" <mturquette@linaro.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

Hi,

On Mon, Jun 9, 2014 at 11:48 PM, Shaik Ameer Basha
<shaik.samsung@gmail.com> wrote:
> Hi Kevin,
>
> We tested on 3 "peach-pi" boards. We are not observing this issue.
>
> Even I tried with the below defconfig mentioned by you. No issues observed.
> https://chromium.googlesource.com/chromiumos/overlays/chromiumos-overlay/+/master/eclass/cros-kernel/exynos5_defconfig
>
> This is the u-boot version currently we are using.
> U-Boot 2013.04 (Feb 13 2014 - 16:35:03) for Peach
>
> Can you provide us more inputs like uboot version or any extra patches
> you applied?
> Also try removing all power domain nodes from exynos5420.dtsi and
> check whether it is reproduced.

OK, we've narrowed it down so you can reproduce this and debug it...

To reproduce, simply run "sound init" at the U-Boot command prompt
before booting the kernel.  ...or, alternatively, run "mw.l 03810000
1".

Can you please confirm and then send up some patches to fix this?

--

I'm still a little confused about how Javier didn't run into this.
Both Kevin and Javier are (I think) chain-booting nv-U-Boot from a
kernel partition.  It appears that chain-booting U-Boot somehow runs
the sound init code (at least for me).

-Doug
