From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH 1/1] regulator: max77802: set opmode to normal if off is
 read from hw
Date: Thu, 28 Aug 2014 00:44:18 +0200
Message-ID: <CABxcv=k2PH-BksYyWirAoL=DiVuy+O=Y1c+pMO=EK58XNKMsFw@mail.gmail.com>
References: <1409053061-22568-1-git-send-email-javier.martinez@collabora.co.uk>
	<53FE2446.3040402@gmail.com>
	<20140827183733.GN17528@sirena.org.uk>
	<53FE25EB.7060702@gmail.com>
	<20140827184705.GO17528@sirena.org.uk>
	<53FE2901.50508@gmail.com>
	<20140827191526.GS17528@sirena.org.uk>
	<53FE2F9E.80501@gmail.com>
	<20140827194411.GU17528@sirena.org.uk>
	<53FE387F.3030302@gmail.com>
	<20140827202554.GW17528@sirena.org.uk>
	<53FE4286.3050305@gmail.com>
	<53FE47A9.1020701@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f42.google.com ([74.125.82.42]:37803 "EHLO
	mail-wg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932305AbaH0WoU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Aug 2014 18:44:20 -0400
Received: by mail-wg0-f42.google.com with SMTP id b13so88822wgh.13
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Aug 2014 15:44:18 -0700 (PDT)
In-Reply-To: <53FE47A9.1020701@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

Hello Tomasz and Mark,

Sorry for not answering before but I'm on vacations until Sep, 5 and I
have limited access to my email.

On Wed, Aug 27, 2014 at 11:03 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
>>>> From what I know based on my experience with Samsung boards we used, the
>>>> opmodes of regulators are preconfigured by board bootloader to certain
>>>> values based on power design of the board (i.e. there is no need to keep
>>>> a regulator in full power mode, if on given board only a little fraction
>>>> of it is needed).
>>>

This is the case for Chromebooks as well but the solution implemented
in the downstream Chrome OS 3.8 kernel is what Tomasz suggested
before, the max77802/686 PMIC regulator driver has a DT binding that
allows to define the initial opmode for each regulator:

Required properties for each regulator:
- regulator-op-mode : Regulator operating mode, the meaning is regulator-
     dependent. Valid values are 0-3.

>>> Well, presumably the bootloader is going to run again even for a warm
>>> reboot?
>>
>> This is strange, but apparently it's not the case for the hardware which
>> this patch is supposed to fix or at least this is how I understood it.
>>
>
> OK, I just realized that Javier's problem might be caused by the fact
> that the bootloader he use doesn't change the regulators from defaults
> at all. In this case this patch is just fine.
>

Yes, AFAIK the bootloader (none of them because Chromebooks use two
chained U-boots) change the regulators default opmode so once is set
to OFF on .disable, that value is preserved on warm reboot. This made
sense with the Chrome OS kernel since the kernel always set the opmode
defined in the "regulator-op-mode" DT property and did not relied on
the bootloader to set the most efficient default opmode.

As Tomasz said this issue also affects other PMICs, for example a
similar DT binding was proposed [0] for the max77686 PMIC which is
very similar to the max77802. Doug even suggested in that thread a
more generic DT binding that could be part of the regulator core.

At the end that DT binding was not merged and the max77686 driver just
sets the default operating mode for all regulators to NORMAL and does
not even read the value reported by the hardware registers. So in that
regard the max77802 driver (even after this patch) does better since
at least respects the default opmode read from the hardware register
if is not OFF.

Also, other drivers have customs operating mode DT properties, please
take a look at Documentation/devicetree/bindings/regulator/s5m8767-regulator.txt:

The above regulator entries are defined in regulator bindings documentation
except these properties:
        - op_mode: describes the different operating modes of the LDO's with
                power mode change in SOC. The different possible values are,
                0 - always off mode
                1 - on in normal mode
                2 - low power mode
                3 - suspend mode

This is not a great binding IMHO since not only uses a quite generic
"op_mode" for property that is driver specific ("s5m8767,op-mode" or
something would had been better) but also this seems to be a general
issue for many platforms so if we don't try to solve this with a
generic approach, each driver author will try to solve it in its own
way.

> Best regards,
> Tomasz
> --

Best regards,
Javier

[0]: https://patchwork.kernel.org/patch/1855331/
