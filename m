From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH] ASoC: Samsung: Modify the I2S driver to support I2S on Exynos5420
Date: Fri, 12 Jul 2013 10:07:22 +0530
Message-ID: <CAAgF-BdM4jw0o4+ELVo_N029tbgMJBBqJxU91e=TgBNiiREyaA@mail.gmail.com>
References: <1373526505-27115-1-git-send-email-padma.v@samsung.com>
	<29860116.IF545KsGYb@thinkpad>
	<20130711112023.GM24508@sirena.org.uk>
	<2214161.FSfscAvpna@thinkpad>
	<20130711130139.GQ24508@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:46329 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750783Ab3GLEhX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Jul 2013 00:37:23 -0400
Received: by mail-ob0-f170.google.com with SMTP id ef5so10917089obb.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Jul 2013 21:37:22 -0700 (PDT)
In-Reply-To: <20130711130139.GQ24508@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, alsa-devel@alsa-project.org, Sangbeom Kim <sbkim73@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, abrestic@chromium.org

Hi,

On Thu, Jul 11, 2013 at 6:31 PM, Mark Brown <broonie@kernel.org> wrote:
> On Thu, Jul 11, 2013 at 01:41:40PM +0200, Tomasz Figa wrote:
>> On Thursday 11 of July 2013 12:20:23 Mark Brown wrote:
>
>> > This is a bit of a larger project sadly, there was resistance to doing
>> > the DT bindings based on compatible strings using the IP version :(
>
>> I'm not sure if this case is related to this problem in any way. I just
>> suggested introducing a new include like samsung,exynos5420-i2s, a opposed to
>> using samsung,exynos5250-i2s and adding flags, since the I2S in Exynos5420 is
>
> Well, it *should* be samsung,i2s-vN where N is the version number of the
> IP but documentation on the versioning has been patchy hence this whole
> thinng.
>

A new version number is added when a there was some change in the IP
like adding a internal mux to the IP, adding multi channel support,
adding reset control bit. This was done in the older code with
platform device.
Same thing is followed here. So as previously done, adding a new
compatible name like "samsung,i2s-v6" with new quirk
"samsung,supports-tdm" is okey?

I will mention about this versioning info in the Documentation in the
next patch.

>> the first one to have this TDM or whatever mode. (I'd still like to hear what
>> it is...)
>
> What it *should* be is the option to send more than one audio stream
> down a link using time division multiplexing.

Thanks
Padma
