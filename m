From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: Disable I2C controllers by default on Exynos5250
Date: Fri, 13 Sep 2013 01:02:11 +0200
Message-ID: <1462876.u3JagxpM84@flatron>
References: <1378982427-5802-1-git-send-email-broonie@kernel.org> <1657964.f1bIFjAZ98@amdc1227> <20130912200013.GU29403@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130912200013.GU29403-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linaro-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thursday 12 of September 2013 21:00:13 Mark Brown wrote:
> On Thu, Sep 12, 2013 at 05:55:59PM +0200, Tomasz Figa wrote:
> > On Thursday 12 of September 2013 14:52:33 Mark Brown wrote:
> > > Please delete unneeded context from your mails, it makes it much
> > > easier
> > > to find the new content.
> > 
> > I always snip unnecessary parts of quoted message if its really long,
> > but if its length is in acceptable range then I try to keep the whole
> > message just for reference.
> 
> I tend to say that when I find myself paging through entire screens of
> quote and can't see the relevance to any content I eventually find.

Hmm, looking at it here from my desktop, I could have dropped some of the 
context between second and third reply indeed.

> > i2c@12CA0000 does look like a normal hardware I2C controller, which
> > needs some extra properties like samsung,i2c-sda-delay or
> > samsung,i2c-max-bus-
> Shouldn't these have sane defaults?

AFAIK those parameters are highly board specific so it would be hard to 
set any reasonable default for them.

> > freq. However they are specified in cros5250-common.dtsi, so I'd say
> > that this might be better place for the status override as well.
> 
> Can we rename that file to something like exynos5250-cros-common.dtsi
> so that it's obvious it's relevant to exynos?  I had completely failed
> to notice that it was anything to do with Exynos when I was searching
> for affected DTS files.
> 
> Especially given that it's included in exactly one DTS at the minute...

Yes, it would surely make sense to do so, unless there is another cros 
board that could use this dtsi and is based on another SoC, which I doubt, 
because there are multiple SoC specific values specified inside it.

Best regards,
Tomasz

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
