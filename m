From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH 3/6] ARM: EXYNOS: add Exynos Dual Cluster Support
Date: Mon, 7 Oct 2013 18:06:27 -0400 (EDT)
Message-ID: <alpine.LFD.2.03.1310071804030.3023@syhkavp.arg>
References: <20131007140343.GA12030@localhost.localdomain>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20131007140343.GA12030@localhost.localdomain>
Sender: linux-doc-owner@vger.kernel.org
To: Dave Martin <Dave.Martin@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, linux-samsung-soc@vger.kernel.org, Vyacheslav Tyrtov <v.tyrtov@samsung.com>, Rob Landley <rob@landley.net>, Stephen Warren <swarren@wwwdotorg.org>, Tarek Dakhran <t.dakhran@samsung.com>, Thomas Gleixner <tglx@linutronix.de>, Naour Romain <romain.naour@openwide.fr>, Mike Turquette <mturquette@linaro.org>, linux-arm-kernel@lists.infradead.org, Heiko Stuebner <heiko@sntech.de>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 7 Oct 2013, Dave Martin wrote:

> On Fri, Oct 04, 2013 at 03:51:31PM -0400, Nicolas Pitre wrote:
> > No FIQs are supposed to ever race with this code.
> 
> There is an anomaly though: FIQ and external abort don't seem to get
> explicitly masked anywhere, either on the suspend or powerdown paths.
> Sometimes either or both remains unmasked (I tried some trace in the
> TC2 MCPM backend to confirm this.)
> 
> Looks like a possible omission in the arch/arm/ suspend and shutdown
> code, rather than a problem specific to MCPM.

Possibly, yes.

Feel free to post a patch.


Nicolas
