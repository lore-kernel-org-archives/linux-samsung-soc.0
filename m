From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH 1/1] regulator: max77802: set opmode to normal if off is read from hw
Date: Thu, 28 Aug 2014 11:59:16 +0200
Message-ID: <12F88867-EF9E-4BCA-9209-6879A39F3DEA@collabora.co.uk>
References: <CABxcv=k2PH-BksYyWirAoL=DiVuy+O=Y1c+pMO=EK58XNKMsFw@mail.gmail.com> <20140828082838.GH17528@sirena.org.uk>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:48125 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934503AbaH1J7L convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Aug 2014 05:59:11 -0400
In-Reply-To: <20140828082838.GH17528@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Javier Martinez Canillas <javier@dowhile0.org>, Tomasz Figa <tomasz.figa@gmail.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

Hello Mark,

> On 28/08/2014, at 10:28, Mark Brown <broonie@kernel.org> wrote:
>> Yes, AFAIK the bootloader (none of them because Chromebooks use two
>> chained U-boots) change the regulators default opmode so once is set
>> to OFF on .disable, that value is preserved on warm reboot. This made
>> sense with the Chrome OS kernel since the kernel always set the opmode
>> defined in the "regulator-op-mode" DT property and did not relied on
>> the bootloader to set the most efficient default opmode.
> 
> I'm sorry but this is just really unclear.  Does the bootloader change
> the mode or does it not change the mode?

I meant that the boot loader *does not* change the mode and is Linux who change it, sorry for the confusion.

Best regards,
Javier