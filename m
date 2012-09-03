From: Sangsu Park <sangsu4u.park@samsung.com>
Subject: Re: [PATCH] ASoC: SAMSUNG: Add SND_SOC_DAIFMT_CONT
 option for snd_soc_set_fmt()
Date: Mon, 03 Sep 2012 11:10:03 +0900
Message-ID: <001001cd8979$3b260d10$b1722730$@samsung.com>
References: <003101cd8367$3476e650$9d64b2f0$@samsung.com>
 <20120827204550.GA4400@opensource.wolfsonmicro.com>
 <001d01cd85d6$59298040$0b7c80c0$@samsung.com>
 <20120830174317.GG4356@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-reply-to: <20120830174317.GG4356@opensource.wolfsonmicro.com>
Content-language: ko
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, sbkim73@samsung.com, 'Kukjin Kim' <kgene.kim@samsung.com>, ben-linux@fluff.org, lrg@ti.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org


On Sun, Aug 31, 2012 at 2:43 AM +0900, Mark Brown wrote:
> On Wed, Aug 29, 2012 at 08:06:32PM +0900, Sangsu Park wrote:
> 
> Please check your mailer configuration, it looks like it's reformatting
> all the text with much longer line widths.

I've changed line width configuration. Is it ok now?

> 
> > On Sun, Aug 26, 2012 at 05:45:54PM +0900, Mark Brown wrote:
> 
> > > a whole lot of sense on the slave side, it's related to the clock
> generation so should have no
> > > effect at all on the slave side.  The driver code looks reasonably
> sensible though.
> 
> > You mean cpu side is slave?
> 
> Yes.

But, Samsung pcm is working only for cpu master. 

> 
> 
> > > What specifically is going wrong here?
> 
> > SND_SOC_DAIFMT_CONT is used sound/soc/Samsung/pcm.c (s3c_pcm_set_fmt()) like
> below.
> 
> > switch (fmt & SND_SOC_DAIFMT_CLOCK_MASK) {
> >         case SND_SOC_DAIFMT_CONT:
> >                 pcm->idleclk = 1;
> >                 break;
> >         case SND_SOC_DAIFMT_GATED:
> >                 pcm->idleclk = 0;
> >                 break;
> >         default:
> >                 dev_err(pcm->dev, "Invalid Clock gating request!\n");
> >                 ret = -EINVAL;
> >                 goto exit;
> >         }
> 
> > If fmt argument has no SND_SOC_DAIFMT_ option, s3c_pcm_set_fmt() return -
> EINVAL.
> 
> So, clearly this is unrelated to the change you mentioned in your commit
> message - it looks like this is just a plain issue in the machine
> driver.  That said the above code should be changed to at least ignore
> the setting in slave mode (since the clock shouldn't be being driven and
> it doesn't matter).

Do you think that changing pcm driver is right approach?
Then I'll fix pcm driver. (I think that pcm driver has some strange code.)

> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
