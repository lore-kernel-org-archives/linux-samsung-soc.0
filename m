From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: dapm: Check for NULL widget in
 dapm_update_dai_unlocked
Date: Wed, 6 Feb 2019 11:45:45 +0000
Message-ID: <20190206114545.GR3837@imbe.wolfsonmicro.main>
References: <CGME20190205211638epcas3p409823d4acac8073473153d745151ea5f@epcas3p4.samsung.com>
 <20190205211622.GA5891@kozik-lap>
 <844c3f34-f7db-6b26-169a-994922367c78@samsung.com>
 <20190206100549.GO3837@imbe.wolfsonmicro.main>
 <CAJKOXPejBO_9iBHg1R8M2=tcuTck72DjxTYEUyQOp8cPV-0xTg@mail.gmail.com>
 <20190206105955.GP3837@imbe.wolfsonmicro.main>
 <CAJKOXPcQfsNnuns1BprEPy4=ggW7fU+_-O_VksrWuT4GPPgAwg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
Content-Disposition: inline
In-Reply-To: <CAJKOXPcQfsNnuns1BprEPy4=ggW7fU+_-O_VksrWuT4GPPgAwg@mail.gmail.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: alsa-devel@alsa-project.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Feb 06, 2019 at 12:14:56PM +0100, Krzysztof Kozlowski wrote:
> On Wed, 6 Feb 2019 at 12:00, Charles Keepax
> <ckeepax@opensource.cirrus.com> wrote:
> >
> > On Wed, Feb 06, 2019 at 11:22:33AM +0100, Krzysztof Kozlowski wrote:
> > > On Wed, 6 Feb 2019 at 11:05, Charles Keepax
> > > <ckeepax@opensource.cirrus.com> wrote:
> > > >
> > > > DAIs linked to the dummy will not have an associated playback/capture
> > > > widget, so we need to skip the update in that case.
> > > >
> > > > Fixes: 078a85f2806f ("ASoC: dapm: Only power up active channels from a DAI")
> > > > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > > > ---
> > > >
> > > > Ok so that all makes sense, this patch is probably the best fix?
> > > >
> > > > Thanks,
> > > > Charles
> > >
> > > For this particular issue (NULL-pointer):
> > > Reported-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > Tested-by: Krzysztof Kozlowski <krzk@kernel.org>
> > >
> > > However now I see bug sleeping in atomic context:
> > >
> > > [   64.000828] BUG: sleeping function called from invalid context at
> > > ../kernel/locking/mutex.c:908
> >
> > Does this probably definitely get fixed by reverting my patch?
> > It's just a bit odd as this seems to be complaining about a clock
> > operation in i2s_trigger and I don't think my patch should have
> > any affect on the trigger callback. It should get run from either
> > the dai_link DAPM event or hw_params, neither of which should
> > happen in an atomic context.
> 
> Before this fixup, probably NULL pointer happened before any of this.
> I tried it now few times and the possible deadlock and sleeping in
> invalid context did not appear. It might be random/racy or totally
> unrelated to your change.
> 

Looking through I think this is an unrelated issue. Assuming the
driver in question is (sound/soc/samsung/i2s.c). Inside
i2s_trigger, there is a call to config_setup(i2s), which in turn
will call clk_get_rate if i2s->quirks contains the flag
QUIRK_NO_MUXPSR.

The trigger callback can be made from an atomic context and
clk_get_rate will take the prepare lock of the clock. The clock
prepare lock is always a mutex which shouldn't be locked from an
atomic context. So it seems like this will fail whenever that
QUIRK_NO_MUXPSR flag is set, no idea what causes that to be set.

It looks like this bug was introduced by this change:

647d04f8e07a ("ASoC: samsung: i2s: Ensure the RCLK rate is properly determined")

Thanks,
Charles
