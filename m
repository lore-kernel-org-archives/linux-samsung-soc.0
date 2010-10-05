From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [alsa-devel] [PATCH 10/10] ASoC: SAMSUNG: Add Machine driver for
 S/PDIF PCM audio
Date: Tue, 5 Oct 2010 14:39:00 +0900
Message-ID: <AANLkTi=x_fi5HTBBmMUv8YTxSdbgcnJ=ZbacJQj6rcgf@mail.gmail.com>
References: <1286191550-22197-1-git-send-email-sw.youn@samsung.com>
	<1286194583-19937-1-git-send-email-sw.youn@samsung.com>
	<20101004224159.GA4972@opensource.wolfsonmicro.com>
	<AANLkTi=FHGw+qzL507K546vr8zEZgXBP3Mk=O__Rpd4H@mail.gmail.com>
	<AANLkTincwL_nQAmu7Dcmht0FV43BiN7OoecE_60QJhS2@mail.gmail.com>
	<20101005044304.GA26509@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:64345 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753852Ab0JEFjB convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Oct 2010 01:39:01 -0400
Received: by bwz11 with SMTP id 11so4297181bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Oct 2010 22:39:00 -0700 (PDT)
In-Reply-To: <20101005044304.GA26509@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Seungwhan Youn <sw.youn@samsung.com>, alsa-devel@alsa-project.org, kgene.kim@samsung.com, jassi.brar@samsung.com, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, lrg@slimlogic.co.uk

On Tue, Oct 5, 2010 at 1:43 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Tue, Oct 05, 2010 at 11:19:35AM +0900, Jassi Brar wrote:
>> On Tue, Oct 5, 2010 at 10:10 AM, Jassi Brar <jassisinghbrar@gmail.co=
m> wrote:
>> > On Tue, Oct 5, 2010 at 7:42 AM, Mark Brown

> The reason I'm concerned about this is that I've had actual problems
> with users of your out of tree BSPs getting confused by similar code
> there.
Yes, past mistakes haunt us still.

> Since the clock API currently doesn't have a good way of resolving th=
is
> perhaps a config option or something which masks the EPLL behaviour
> controllable and leaves it alone by default? =C2=A0That would show pe=
ople how
> to use this chip feature without affecting the other subsystems so
> non-obviously.
Yes we can have a kconfig entry for 'Controllable EPLL' but that seems
orthogonal to ASoC because, for SMDKs, we choose to produce
accurate signals hence need to manipulate EPLL. The only point is
where to do it.
(our priority is accuracy of each IP's functioning rather than having
all parts of
SMDK playing nice with each other on such h/w design issues)

>> Btw, another important reason is that having EPLL manipulation in bo=
ard-int
>> would result in code-duplication on other SMDK platforms as most hav=
e the
>> same clock routing options available in h/w and we want to use the s=
ame ASoC
>> machine driver for SoCs whenever possible.
>
> This doesn't seem such a big deal - you could create a shared file fo=
r
> the code under arch/arm.

I hope you noticed that this clock hierarchy is a _very_ board specific=
 thing.
We can easily place SoCs' shared stuff in arch/arm/plat-samsung (or sim=
ilar)
Any suggestions, where do we place code shared by SMDK-boards ?

Thanks
