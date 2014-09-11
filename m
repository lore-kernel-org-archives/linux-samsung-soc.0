From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: Unable to boot mainline on snow chromebook since 3.15
Date: Thu, 11 Sep 2014 10:22:32 +0100
Message-ID: <20140911092233.CBC5CC40738@trevor.secretlab.ca>
References: <540C8577.2070907@gmail.com> <20140908112112.GK26030@arm.com>
 <CACxGe6v40wMSW8LJRtyZ3C6PinRMcQM-Zog+XpTJ-QG3HHJknw@mail.gmail.com>
 <CAD=FV=VAqzvJQDQMjjeQ1p5okyDzE=ff_sguObZxh59qbzcaTQ@mail.gmail.com>
 <CACxGe6t_ex1bU=CvTpXR4VJgNf1hAq33hr6ykbHy_sMXEk4h-g@mail.gmail.com>
 <CAOesGMipX3MV6sMWLuY=D+bQ6qe8P17YFbTFwZOHPeSc3Pw9Cg@mail.gmail.com>
 <20140910143144.GF7960@sirena.org.uk>
 <CACxGe6u=QkGTKGfaE_jJ5VFMhdVKQNggp3qVBUgNP7rDbZss_A@mail.gmail.com>
 <20140910153919.GH7960@sirena.org.uk>
 <CACxGe6uBcTPMh4p=oi7m_TVpjUrkgbQvxbStAn27HXEJxYe5fw@mail.gmail.com>
 <20140910165723.GK7960@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140910165723.GK7960@sirena.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Brown <broonie@kernel.org>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Will Deacon <will.deacon@arm.com>, Doug Anderson <dianders@chromium.org>, Tomasz Figa <tomasz.figa@gmail.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Prashanth G <prashanth.g@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "rahul.sharma@samsung.com" <rahul.sharma@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, 10 Sep 2014 17:57:23 +0100, Mark Brown <broonie@kernel.org> wrote:
> On Wed, Sep 10, 2014 at 05:29:32PM +0100, Grant Likely wrote:
> 
> > What we can do is have an inhibit flag for
> > simplefb/simpleuart/simplewhatever that holds off PM. When a real
> > driver, or a stub that understands parsing the resource dependencies,
> > takes ownership of the device (or userspace tells the kernel to stop
> > caring) it can clear the inhibit.
> 
> It's not quite as simple as just disabling PM - for example in the
> clocks case we've also got to worry about what happens with rate changes
> (which is going to get more and more risky as we get smarter about being
> able to push configuration changes back up the tree), regulators have a
> similar thing with voltage changes.  With simple enables and disables we
> have to worry about things like handling users who actively want to
> power things on and and off but may potentially be sharing a resource
> with an undeclared dependency.

I think we can be okay with the above. This is a best-effort situation
where we don't want to tear down how firmware has set up the board if
it can be reasonably assumed that something depends on it (simplefb).
However, if clocks or regulators are shared with other devices and those
drivers ask for other settings, then there is simply no recourse. In
that situation there must be a driver for the video device that takes
care of any constraints.

g.
