From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V5 2/2] ASoC: SAMSUNG: Add DT support for i2s
Date: Wed, 19 Dec 2012 09:37:28 -0800
Message-ID: <007401cdde0f$86096210$921c2630$@samsung.com>
References: <1355395373-22058-1-git-send-email-padma.v@samsung.com>
 <1355395373-22058-3-git-send-email-padma.v@samsung.com>
 <20121219132414.2CF653E0AD7@localhost>
 <20121219170937.GV4985@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: 
Content-language: en-us
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Grant Likely' <grant.likely@secretlab.ca>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, 'Padmavathi Venna' <padma.v@samsung.com>, sbkim73@samsung.com, devicetree-discuss@lists.ozlabs.org, jassisinghbrar@gmail.com, tiwai@suse.de, ben-linux@fluff.org, lrg@ti.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Kukjin Kim wrote:
> 
> Mark Brown wrote:
> >
> > On Wed, Dec 19, 2012 at 01:24:14PM +0000, Grant Likely wrote:
> > > On Thu, 13 Dec 2012 16:12:53 +0530, Padmavathi Venna
> > <padma.v@samsung.com> wrote:
> >
> > > > +- compatible : "samsung,samsung-i2s"
> >
> > > Isn't that kind of redundant?  :-)
> >
> > > The format of the compatible strings should be "<vendor>,<part-
> number>-
> > i2s".
> > > Please be specific about the part number that you're doing the binding
> > > for. For example; use "samsung,exynos4210-i2s" instead of
> > "samsung,exynos-i2s".
> >
> > There are actually versioned IPs here (where the versions are used
> > publically in a few places) but it's not clearly documented which is
> > which.  It would be reasonable to use the IP versions here I think.
> 
Oops, I'm resending due to problem of my e-mail client.

> I agree with Mark Brown. That makes sense, for example, see mfc.
> 	compatible = "samsung,mfc-v6"
> Same versioned IPs can be used on different SoCs, so in my opinion, in
this
> case, to use version is more clear.
> 

- Kukjin
