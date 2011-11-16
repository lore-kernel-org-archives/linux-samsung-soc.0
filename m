From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH] pinctrl: add a gpio and pinctrl driver for samsung io-pad controllers
Date: Wed, 16 Nov 2011 17:32:06 +0530
Message-ID: <CAJuYYwQb-Ut=bDx6BYeRrHapvBbqt6rAisg87jyo0iosp3+DNA@mail.gmail.com>
References: <1321387600-21033-1-git-send-email-thomas.abraham@linaro.org>
	<20111116112305.GA773@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:59638 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756388Ab1KPMCH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Nov 2011 07:02:07 -0500
Received: by ywt32 with SMTP id 32so4673139ywt.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Nov 2011 04:02:06 -0800 (PST)
In-Reply-To: <20111116112305.GA773@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linaro-kernel@lists.linaro.org, linux-samsung-soc@vger.kernel.org, linus.walleij@linaro.org, kgene.kim@samsung.com

On 16 November 2011 16:53, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Wed, Nov 16, 2011 at 01:36:40AM +0530, Thomas Abraham wrote:
>
>> +/* Note: The pin group list needs to be further populated */
>> +static unsigned int exynos4210_spi0_pins[] =3D {
>> + =A0 =A0 EXYNOS4_GPB(0), EXYNOS4_GPB(1), EXYNOS4_GPB(2), EXYNOS4_GP=
B(3),
>> +};
>
> Given the large number of SoCs in play here might it not be better to
> arrange things so that the data part can go in the SoC directory, or =
at
> least in a file separate to the main driver. =A0Otherwise the file is
> going to get enormous but that's mostly going to be data tables.

I share the same concern here and listed a todo in the driver file to
handle this case. As you said, a separate file to hold this data would
be needed until all the samsung platforms switch to using device tree.

>
> Also, I'd expect these pin lists to include information on the functi=
on
> number.
>

Yes, the function number is included for all the pins. It is in
'struct samsung_pin_group' with the member name 'func'. The function
number is expected to be same for all the pins in a group (atleast,
that works for exynos4). If pins in a group need different function
numbers, then I modify this.

Thank you Mark for having a look.

Regards,
Thomas.
