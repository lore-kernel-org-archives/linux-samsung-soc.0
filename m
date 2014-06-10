From: Doug Anderson <dianders@google.com>
Subject: Re: exynos5420-peach-pi: linux-next boot fails unless mau_epll left enabled?
Date: Tue, 10 Jun 2014 13:26:22 -0700
Message-ID: <CAD=FV=UdCp0dG7tnzaSnWxhtnU46ttMOUht00DL=bfvbbt7mXQ@mail.gmail.com>
References: <7hoay6sxjl.fsf@paris.lan>
	<CAGa+x86ko1N+T+QAqnY+md4+nyzza_cDt0wa-s06TdCX+27fSA@mail.gmail.com>
	<CAOD6ATpZWEg9d7WnZ8tg9_uQJ29vMoucaOwh0_tbdRSDRj25cw@mail.gmail.com>
	<CAD=FV=UsVQm_pLNtPwZMNCQQSSVrx=6M8eJrNRS8VyWMQzYtAQ@mail.gmail.com>
	<539764AF.4090409@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f171.google.com ([209.85.128.171]:57576 "EHLO
	mail-ve0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754271AbaFJU0X (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Jun 2014 16:26:23 -0400
Received: by mail-ve0-f171.google.com with SMTP id jz11so4790206veb.16
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Jun 2014 13:26:22 -0700 (PDT)
In-Reply-To: <539764AF.4090409@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Shaik Ameer Basha <shaik.samsung@gmail.com>, Kevin Hilman <khilman@linaro.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Olof Johansson <olof@lixom.net>, "Turquette, Mike" <mturquette@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

Javier,

On Tue, Jun 10, 2014 at 1:03 PM, Javier Martinez Canillas
<javier.martinez@collabora.co.uk> wrote:
> Yes, I did not have this issue before. However... I installed the latest Peach
> pit recovery image you provided me and mainline kernel started to hang on boot.
> I remembered this thread so tested Kevin's patch which make it boot again.
>
> You said that chain-booting u-boot runs the sound init code but did you try
> booting a signed FIT image using the verified u-boot?

Right, I'd bet that it's actually verified boot that's calling the
sound init code (probably just in case it needs to beep at the user).
...so this would happen even without chain booting.  I haven't tried
signing / booting without chain booting, but I can totally believe it
would hang just as easily.


> I'm asking because I'm see the hang both when chain-booting nv-u-boot from a
> kernel partition and booting a signed FIT image with the verified u-boot.
>
> So it seems this is a regression in latest U-boot and I didn't run into this
> before due having an older RW U-Boot on my Peach pit?

You must have had a very old RW U-Boot, possibly one before audio
support was added.  I think we just need to fix this in the kernel so
it doesn't hang.

-Doug
