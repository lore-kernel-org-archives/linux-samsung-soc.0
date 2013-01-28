From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 5/6] ARM: dts: Add basic dts include files for Samsung
 S3C64xx SoCs
Date: Mon, 28 Jan 2013 09:02:40 +0000
Message-ID: <20130128090240.GA7754@e106331-lin.cambridge.arm.com>
References: <1358039458-31960-1-git-send-email-tomasz.figa@gmail.com>
 <20130114150531.GE21142@e102568-lin.cambridge.arm.com>
 <20130116105957.GA1963@linaro.org>
 <3747315.IyCCRDXgbD@flatron>
 <016c01cdfb30$64f80430$2ee80c90$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from service87.mimecast.com ([91.220.42.44]:37524 "EHLO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751067Ab3A1JCt convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jan 2013 04:02:49 -0500
In-Reply-To: <016c01cdfb30$64f80430$2ee80c90$@samsung.com>
Content-Language: en-US
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Dave Martin' <dave.martin@linaro.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "kwangwoo.lee@gmail.com" <kwangwoo.lee@gmail.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "broonie@opensource.wolfsonmicro.com" <broonie@opensource.wolfsonmicro.com>, "mcuelenaere@gmail.com" <mcuelenaere@gmail.com>, "augulis.darius@gmail.com" <augulis.darius@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Fri, Jan 25, 2013 at 07:15:48PM +0000, Kukjin Kim wrote:
> Tomasz Figa wrote:
> 
> [...]
> 
> > > Well, the number of CPU types does not grow rapidly.  It will be much
> > > less than one per SoC -- so keeping the list up to date shouldn't be
> > > that much effort.
> > >
> > > For ARM1176JZF-S, it could make sense for the comatible list to be
> > >
> > > 	"arm,arm1176jzf-s", "arm,arm1176"
> > >
> > > ...since the differences between 1176 variants are software probeable
> > > (i.e., whether there is an FPU or not).  AFAIK the J, Z apply to all
> > > ARM1176, and the -S (synthesisable RTL) is nothing to do with software.
> > > The kernel probably only really needs to know "arm,arm1176".
> > 
> > OK. So the conclusion is that I should change the cpus node to following:
> > 
> >        cpus {
> >                cpu {
> 
> cpu@0 { ?

As the CPU has no MPIDR, and thus doesn't have a reg property, there's no reason
to have a unit address. Just "cpu" should be fine.

> 
> >                        compatible = "arm,arm1176jzf-s", "arm,arm1176";
> >                };
> >        };
> > 
> > Am I right?
> > 
> I think so :-)
> 
> - Kukjin
> 

As Dave pointed out, the "jzf-s" portion might be superfluous. It's worth
having the "arm,arm1176", though.

Thanks,
Mark.
