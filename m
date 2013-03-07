From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: State of pinctrl and exynos5250?
Date: Thu, 07 Mar 2013 15:38:53 -0700
Message-ID: <513916FD.3050906@wwwdotorg.org>
References: <CAD=FV=XTHs5De3hrZu5BMPD3sTzBLikHwdS88XA0KOn-XG499Q@mail.gmail.com> <1534249.MsU3ROUVJz@flatron> <CAD=FV=XMpL7z-UX4UgqaUv-=QcJAPOD3bKbLVTRsR15RTG1A2Q@mail.gmail.com> <CAJuYYwR41V4m_tZU5Usksb7L8ynOAQpK2i3QP33JDmW9YDkvPw@mail.gmail.com> <CACRpkdaCzmW5C1tEm5D=WRyoZc5+gGf2gVtTt1QSkF8SNKrjRg@mail.gmail.com> <CAD=FV=XGm+aeb2VFsbUit13VaoQFVd6vz3-_4zjQUCc0PPOLCg@mail.gmail.com> <CAD=FV=V0x9kz9BhHnJUT6FUN6u2n9NMZX0mCJZEmaFxXObx3Mg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:53201 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751599Ab3CGWi6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Mar 2013 17:38:58 -0500
In-Reply-To: <CAD=FV=V0x9kz9BhHnJUT6FUN6u2n9NMZX0mCJZEmaFxXObx3Mg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Tomasz Figa <t.figa@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, Prathyush <prathyush.k@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Olof Johansson <olofj@chromium.org>, Simon Glass <sjg@chromium.org>, Katie Roberts-Hoffman <katierh@chromium.org>, Jaehoon Chung <jh80.chung@samsung.com>, Seungwon Jeon <tgih.jun@samsung.com>, Will Newton <will.newton@gmail.com>

On 03/07/2013 09:27 AM, Doug Anderson wrote:
> +the proper address for Will.  Sorry...
> 
> 
> On Thu, Mar 7, 2013 at 8:13 AM, Doug Anderson <dianders@chromium.org
> <mailto:dianders@chromium.org>> wrote:
> 
>     Linus,
> 
>     +dw_mmc folks and Stephen Warren : for context here, we are discussing
>     device tree bindings for pinmux for dw_mmc.  The issue at hand is
>     whether they belong under the slot node or under the top-level device
>     node.

There's no need for dynamic pin-muxing for MMC AFAIK, so I'd expect a
single pinctrl state "default" to exist that covers any/all requirements
of both slots' pinmux configuration.

>     On Wed, Mar 6, 2013 at 11:57 PM, Linus Walleij
>     <linus.walleij@linaro.org <mailto:linus.walleij@linaro.org>> wrote:
>     > I don't quite understand the above. Is it such that there is one
>     device,
>     > with two slots, and in the device model you have represented this
>     > two-slot device with a single struct device?
> 
>     Yes, that's the issue.  That's dw_mmc that has been in the kernel for
>     a bit of time now (looks like Jan 2011) and has had a single struct
>     device for as long as I've been looking at it.
> 
>     Relevant links for convenience:
>     *
>     https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/drivers/mmc/host/dw_mmc.c
>     *
>     https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/mmc/synopsis-dw-mshc.txt
>     *
>     https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/exynos5250.dtsi#n243
>     *
>     https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/cros5250-common.dtsi#n92
> 
> 
>     > Have you considered just registering one device for each slot?
>     >
>     > That would make things quite a lot simpler, just a single pinctrl
>     > handle per device, right?
> 
>     I don't know why the original decision was made to just have one
>     struct device.  ...that would be a pretty big code change at this
>     point, I think.
> 
>     ...I think the most important issue at hand is the device tree
>     bindings for pinmux on this device.  It sounds like you are in
>     agreement that the best thing is to have a pinmux specified per-slot.
>     If the code is a bit awkward now (due to not having a struct device
>     per slot) then that's just something we have to live with.
> 
> 
>     -Doug
> 
> 
