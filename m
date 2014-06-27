From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] ARM: dts: Add mask-tpm-reset to the device tree
Date: Fri, 27 Jun 2014 12:58:53 -0700
Message-ID: <CAD=FV=VPH+7M+fYWQXM+HNYyMfGfP_RMvg9goZs0s8CPVo_mtA@mail.gmail.com>
References: <1403774127-21892-1-git-send-email-vikas.sajjan@samsung.com>
	<53ABED5B.8010506@samsung.com>
	<CAD=FV=Vwgdis6FzJ8MHDwfuohB1kN8Mf--2N=rxGNeAfKjJMig@mail.gmail.com>
	<53AD60D7.4040404@gmail.com>
	<53AD978D.8060703@wwwdotorg.org>
	<CAD=FV=UUFARvreHdWNsB1O1dEW6nX_E_C92t8Nma0vL=nAT5Rw@mail.gmail.com>
	<53ADB5E5.10102@wwwdotorg.org>
	<CAD=FV=XYFy_QpBtFPc-EURXmV9qMMyOkk0Ybhoy5E6r+hXGywA@mail.gmail.com>
	<53ADCC7E.4000703@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f177.google.com ([209.85.128.177]:33852 "EHLO
	mail-ve0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751001AbaF0T6y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Jun 2014 15:58:54 -0400
Received: by mail-ve0-f177.google.com with SMTP id i13so5725169veh.22
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jun 2014 12:58:53 -0700 (PDT)
In-Reply-To: <53ADCC7E.4000703@wwwdotorg.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Tomasz Figa <t.figa@samsung.com>, Vikas Sajjan <vikas.sajjan@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, sunil joshi <joshi@samsung.com>, Vikas Sajjan <sajjan.linux@gmail.com>, Linus Walleij <linus.walleij@linaro.org>

Stephen,

On Fri, Jun 27, 2014 at 12:56 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> On 06/27/2014 12:30 PM, Doug Anderson wrote:
>> Stephen,
>>
>> On Fri, Jun 27, 2014 at 11:20 AM, Stephen Warren <swarren@wwwdotorg.org> wrote:
>>> On 06/27/2014 10:45 AM, Doug Anderson wrote:
>>>> Stephen,
>>>>
>>>> On Fri, Jun 27, 2014 at 9:10 AM, Stephen Warren <swarren@wwwdotorg.org> wrote:
>>>>> Surely there's a driver (or could be a driver) for the TPM chip, and
>>>>> that driver should have a reset-mask-gpios property, so the driver can
>>>>> call gpio_get() and gpio_set_output() on the GPIO?
>>>>>
>>>>> Faking this out via a not-really-a-regulator or pinctrl hogs seems like
>>>>> an abuse of those features to me.
> ...
>>> As an aside, why do we even care about this? The kernel clearly can
>>> unlock the TPM simply by failing to set the GPIO up correctly, so at
>>> best this is security through obscurity. If someone actively wanted to
>>> do something bad to the TPM, they'd simply comment out this piece of
>>> code in the kernel. At least that's true with usptream kernels which
>>> aren't validated at all during boot. For a downstream signed kernel,
>>> perhaps this patch makes sense (although I haven't thought about all the
>>> security angles), but then it'd make sense to keep this patch downstream.
>>
>> Check out the bullet point about the firmware checking for kernel
>> cheats.  At resume time the chip actually re-loads read only firmware
>> out of SPI flash (no choice about this).  This read only firmware can
>> check the state of the mask pin (which is preserved across sleep wake)
>> to see if the kernel cheated.
>
> Ah, that covers the security issues then.
>
> I'd argue that the RO firmware should be setting up GPIOs like this
> myself (and the pinmux, from a nice big table), and the kernel simply
> not touch it all since it has no direct use for the pin. But I suppose
> if the firmware is already baked and read only, that's not possible.

Yes.  Earlier in this thread I said I had no idea why I didn't have
firmware set this up.  I couldn't come up with a good reason... :(

-Doug
