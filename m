From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: Problems booting exynos5420 with >1 CPU
Date: Fri, 6 Jun 2014 17:48:21 -0400 (EDT)
Message-ID: <alpine.LFD.2.11.1406061740280.25775@knanqh.ubzr>
References: <CAD=FV=UX90hgyojW3k_kpT=mt8eX9=AyHr+AGjhK=MrE1hHbUA@mail.gmail.com> <539145B4.5000200@gmail.com> <CAD=FV=XqwEQNJmij-4Gh62OY+B66AjdQjZC0=f_6tbot3UfQaA@mail.gmail.com> <CAM4voaknx3+X4O8MUwaruUFPyquY8Opq61ucKX08xTrv8PqfLg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f52.google.com ([209.85.192.52]:43955 "EHLO
	mail-qg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752075AbaFFVsY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Jun 2014 17:48:24 -0400
Received: by mail-qg0-f52.google.com with SMTP id a108so5817994qge.11
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Jun 2014 14:48:23 -0700 (PDT)
In-Reply-To: <CAM4voaknx3+X4O8MUwaruUFPyquY8Opq61ucKX08xTrv8PqfLg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Cc: Doug Anderson <dianders@google.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "Turquette, Mike" <mturquette@linaro.org>, Kevin Hilman <khilman@linaro.org>, Tushar Behera <trblinux@gmail.com>, Thomas Abraham <thomas.abraham@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Olof Johansson <olof@lixom.net>, Sonny Rao <sonnyrao@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Arun Kumar <arun.kk@samsung.com>

On Fri, 6 Jun 2014, Abhilash Kesavan wrote:

> Hi Doug,
> 
> The first change in the kernel (clearing an iRAM location) is needed
> because of an unnecessary change that we are carrying in the Chrome
> U-boot. There is no reason for us to have the workaround in the
> mainline kernel. Rather, we should remove the check from our u-boot.
> However AFAIR a clean-up patch that I had posted internally was not
> accepted as we had frozen the SPL at the time.
> 
> The second change is to enable snoops for boot cluster. Internally, we
> were disabling the snoops for both the clusters at power off and
> enabling it in power_up_setup and power_up. However, I dropped the
> approach due to problems pointed out by Nicolas here
> http://www.spinics.net/lists/arm-kernel/msg324091.html related to
> cpuidle. Hence, we turn it on at the u-boot.

You should never *ever* play with the CCI from U-Boot.  That's for the 
MCPM layer to decide when it is safe to do so.  That's mainly the 
_whole_ reason why MCPM exists in the first place.


Nicolas
