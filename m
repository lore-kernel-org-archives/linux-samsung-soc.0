From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH] ASoC: Samsung: Modify the I2S driver to support I2S on Exynos5420
Date: Tue, 23 Jul 2013 09:38:00 +0530
Message-ID: <CAAgF-BfdfuhoFDH+SeZogXh1wju34hGp-T9N7_+mnapHfc2yww@mail.gmail.com>
References: <1373526505-27115-1-git-send-email-padma.v@samsung.com>
	<29860116.IF545KsGYb@thinkpad>
	<20130711112023.GM24508@sirena.org.uk>
	<2214161.FSfscAvpna@thinkpad>
	<20130711130139.GQ24508@sirena.org.uk>
	<CAAgF-BdM4jw0o4+ELVo_N029tbgMJBBqJxU91e=TgBNiiREyaA@mail.gmail.com>
	<20130712084932.GY24508@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:33449 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752572Ab3GWEIB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Jul 2013 00:08:01 -0400
Received: by mail-ob0-f180.google.com with SMTP id eh20so9113297obb.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jul 2013 21:08:00 -0700 (PDT)
In-Reply-To: <20130712084932.GY24508@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, alsa-devel@alsa-project.org, Sangbeom Kim <sbkim73@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, abrestic@chromium.org

Hi Mark,

On Fri, Jul 12, 2013 at 2:19 PM, Mark Brown <broonie@kernel.org> wrote:
> On Fri, Jul 12, 2013 at 10:07:22AM +0530, Padma Venkat wrote:
>
>> A new version number is added when a there was some change in the IP
>> like adding a internal mux to the IP, adding multi channel support,
>> adding reset control bit. This was done in the older code with
>> platform device.
>> Same thing is followed here. So as previously done, adding a new
>> compatible name like "samsung,i2s-v6" with new quirk
>> "samsung,supports-tdm" is okey?
>
> Yes, this is good but the quirk should just be found by software based
> on the compatible string rather than in the DT.

You mean I just need to initialize the quirks in the driver based on
the compatible string?
So what about the quirks that I added previously on 5250? Should I
also follow the same thing for other quirks?

Or it need to be passed via driver data as it is done in spi driver?
Please clarify me.

Thanks
Padma
