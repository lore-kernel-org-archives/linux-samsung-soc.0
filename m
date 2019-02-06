From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ASoC: dapm: Check for NULL widget in dapm_update_dai_unlocked
Date: Wed, 6 Feb 2019 12:14:56 +0100
Message-ID: <CAJKOXPcQfsNnuns1BprEPy4=ggW7fU+_-O_VksrWuT4GPPgAwg@mail.gmail.com>
References: <CGME20190205211638epcas3p409823d4acac8073473153d745151ea5f@epcas3p4.samsung.com>
 <20190205211622.GA5891@kozik-lap> <844c3f34-f7db-6b26-169a-994922367c78@samsung.com>
 <20190206100549.GO3837@imbe.wolfsonmicro.main> <CAJKOXPejBO_9iBHg1R8M2=tcuTck72DjxTYEUyQOp8cPV-0xTg@mail.gmail.com>
 <20190206105955.GP3837@imbe.wolfsonmicro.main>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190206105955.GP3837@imbe.wolfsonmicro.main>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, 6 Feb 2019 at 12:00, Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> On Wed, Feb 06, 2019 at 11:22:33AM +0100, Krzysztof Kozlowski wrote:
> > On Wed, 6 Feb 2019 at 11:05, Charles Keepax
> > <ckeepax@opensource.cirrus.com> wrote:
> > >
> > > DAIs linked to the dummy will not have an associated playback/capture
> > > widget, so we need to skip the update in that case.
> > >
> > > Fixes: 078a85f2806f ("ASoC: dapm: Only power up active channels from a DAI")
> > > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > > ---
> > >
> > > Ok so that all makes sense, this patch is probably the best fix?
> > >
> > > Thanks,
> > > Charles
> >
> > For this particular issue (NULL-pointer):
> > Reported-by: Krzysztof Kozlowski <krzk@kernel.org>
> > Tested-by: Krzysztof Kozlowski <krzk@kernel.org>
> >
> > However now I see bug sleeping in atomic context:
> >
> > [   64.000828] BUG: sleeping function called from invalid context at
> > ../kernel/locking/mutex.c:908
>
> Does this probably definitely get fixed by reverting my patch?
> It's just a bit odd as this seems to be complaining about a clock
> operation in i2s_trigger and I don't think my patch should have
> any affect on the trigger callback. It should get run from either
> the dai_link DAPM event or hw_params, neither of which should
> happen in an atomic context.

Before this fixup, probably NULL pointer happened before any of this.
I tried it now few times and the possible deadlock and sleeping in
invalid context did not appear. It might be random/racy or totally
unrelated to your change.

Best regards,
Krzysztof
