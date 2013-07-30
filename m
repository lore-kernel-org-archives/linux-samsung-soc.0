From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH V2 7/8] ARM: dts: wm8994: Add wm8994 support on smdk5420
Date: Tue, 30 Jul 2013 08:58:39 +0530
Message-ID: <CAAgF-BeDYm1jNJpkyfTeS5HjpEuaHiumFq+D_PNs=QYG6-Px+w@mail.gmail.com>
References: <1374845812-7803-1-git-send-email-padma.v@samsung.com>
	<1374845812-7803-8-git-send-email-padma.v@samsung.com>
	<20130726151902.GL9858@sirena.org.uk>
	<CAAgF-Be8SNxTZv1yFCwH6yJ-O_3R4reh=3y+pSCLJYW7S9TkUg@mail.gmail.com>
	<CAAgF-Bexp_fGT8KV+TQ0_kZLJBtq7UK=TG4eYRA6qpTSL+scxg@mail.gmail.com>
	<20130729134311.GX9858@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f45.google.com ([209.85.219.45]:56436 "EHLO
	mail-oa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754623Ab3G3D2k (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Jul 2013 23:28:40 -0400
Received: by mail-oa0-f45.google.com with SMTP id m1so4758615oag.18
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jul 2013 20:28:39 -0700 (PDT)
In-Reply-To: <20130729134311.GX9858@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, abrestic@chromium.org, Tomasz Figa <tomasz.figa@gmail.com>

Hi Mark,

On Mon, Jul 29, 2013 at 7:13 PM, Mark Brown <broonie@kernel.org> wrote:
> On Mon, Jul 29, 2013 at 05:31:16PM +0530, Padma Venkat wrote:
>> On Sat, Jul 27, 2013 at 6:46 AM, Padma Venkat <padma.kvr@gmail.com> wrote:
>
>> >>> +     vdd: fixed-regulator@0 {
>> >>> +             compatible = "regulator-fixed";
>> >>> +             regulator-name = "vdd-supply";
>
>> >> These names look wrong - they should reflect the names in the schematic
>> >> as they're for human comprehensibility.  This may just be a case of
>> >> dropping the -supply.
>
>> When I posted the same patch for smdk5250, you asked me to club all
>> the same supply regulators. So I clubbed AVDD2 and CPVDD. So any other
>> better name for representing both supplies?
>
> No, I'd have told you to combine things taht come from the same supply
> on the board - things like the speaker supplies for example aren't going
> to be coming from separate places.  The names should reflect whatever
> the names on the schemaric are, like I say that's probably just removing
> the -supply.
>
>> >> documentation update the other day, it's in my tree now) but it's not
>> >> essential and I suspect it needs some work on the clock driver side
>> >> still.
>
>> > OK. I will check this.
>
>> As per schemata, input clock to MCLK1 is an oscillator clock with
>> 16.9MHz and MCLK2 not showing any input clock. So here I need to add a
>> fixed rate clock with 16.9MHz as MCLK1 in the smdk board file.
>
>> Is it correct?
>
> Yes, in the DTS (or to XCLKOUT on the AP?).

On smdk boards(atleast on smdk5250 and smdk5420) there is no XCLKOUT
funda. Codec MCLK can get clock from oscillator clock in codec master
mode or i2scdclk in codec slave mode. XCLKOUT is there in some other
variants of 5250 and 5420 where it is using other codecs than wm8994.
But the mux and divider of XCLKOUT is out of CMU. As Sylwester told it
is there in PMU registers.

Thanks
Padma
