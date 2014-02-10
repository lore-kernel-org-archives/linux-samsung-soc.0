From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH 14/28] Remove MACH_SMDKC210
Date: Mon, 10 Feb 2014 14:31:12 +0100
Message-ID: <1392039072.3585.15.camel@x220>
References: <1391971686-9517-1-git-send-email-richard@nod.at>
 <1391971686-9517-15-git-send-email-richard@nod.at>
 <20140210114154.GQ1757@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20140210114154.GQ1757@sirena.org.uk>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, linux-kernel@vger.kernel.org, Sangbeom Kim <sbkim73@samsung.com>, Richard Weinberger <richard@nod.at>, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.de>, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 2014-02-10 at 11:41 +0000, Mark Brown wrote:
> On Sun, Feb 09, 2014 at 07:47:52PM +0100, Richard Weinberger wrote:
> Please fix whatever script you're using to generate your mails, it's
> generating corrupt headers.

I think Richard's mail didn't end up on lkml. But it's pretty clear what
it must have looked like.

> >  config SND_SOC_SAMSUNG_SMDK_WM9713
> >  	tristate "SoC AC97 Audio support for SMDK with WM9713"
> > -	depends on SND_SOC_SAMSUNG && (MACH_SMDK6410 || MACH_SMDKC100 || MACH_SMDKV210 || MACH_SMDKC110 || MACH_SMDKV310 || MACH_SMDKC210)
> > +	depends on SND_SOC_SAMSUNG && (MACH_SMDK6410 || MACH_SMDKC100 || MACH_SMDKV210 || MACH_SMDKC110 || MACH_SMDKV310)
> 
> Like I said to Paul this isn't fixing the actual issue - think about why
> the symbol was there in the first place and why it was removed.  There
> is a problem here but this would make it less likely that it would be
> properly fixed.

Would you mind going through this one step at a time, just to make sure
_I_ understand what it is that you'd like to see?

If so, to be absolutely sure we start from the same point: do you agree
that the above line now effectively reads
    depends on SND_SOC_SAMSUNG && (MACH_SMDK6410 || MACH_SMDKC100 || MACH_SMDKV210 || MACH_SMDKC110 || false || false)

because there's neither a Kconfig symbol MACH_SMDKV310 nor a Kconfig
symbol MACH_SMDKC210?


Paul Bolle
