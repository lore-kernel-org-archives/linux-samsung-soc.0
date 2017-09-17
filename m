From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] ARM: dts: exynos: fix incomplete Odroid-XU3/4
 thermal-zones definition
Date: Sun, 17 Sep 2017 09:34:05 +0200
Message-ID: <20170917073405.GB19716@kozik-book>
References: <CGME20170907161007epcas1p316fba6e329eaabedde8a98628ebb9751@epcas1p3.samsung.com>
 <1848394.K3C0KxojUN@amdc3058>
 <20170908164015.rayfh2kluy45ktfi@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170908164015.rayfh2kluy45ktfi@kozik-lap>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Willy Wolff <willy.mh.wolff@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Sep 08, 2017 at 06:40:15PM +0200, Krzysztof Kozlowski wrote:
> On Thu, Sep 07, 2017 at 06:10:00PM +0200, Bartlomiej Zolnierkiewicz wrote:
> > From: Willy Wolff <willy.mh.wolff@gmail.com>
> > 
> > Odroid XU3/4 boards have thermal sensors per 4 pairs of A7+A15
> > cores but currently there is only one thermal-zone (including
> > cooling maps) defined (for the first pair of cores - the first
> > core of the A7 cluster and the first core of A15 cluster) so
> > i.e. if the task is running on any of A15 cores but the first
> > one, such core can reach high temperature without any proper
> > cooling action.
> > 
> > Fix it by adding missing thermal-zones definitions.
> > 
> > Also while at it fix the number of steps in cpufreq cooling for
> > cpu4 (11 steps for A15 corresponds to 700MHz, for 600MHz 12 steps
> > should be used).
> > 
> > Signed-off-by: Willy Wolff <willy.mh.wolff@gmail.com>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Russell King <linux@armlinux.org.uk>
> > Cc: Kukjin Kim <kgene@kernel.org>
> > [b.zolnierkie: rewrote patch subject & description + minor fixups]
> > Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> 
> Thanks for taking care of this. I'll take it after merge window.

Thanks, applied.

Best regards,
Krzysztof
