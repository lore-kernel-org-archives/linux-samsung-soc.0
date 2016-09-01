From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 0/7] ARM: dts: exynos: Remove skeleton.dtsi usage and fix
 memory node DTC warnings
Date: Thu, 01 Sep 2016 13:59:34 +0200
Message-ID: <9206996.z0QQMGk4HW@amdc1976>
References: <1472645679-5696-1-git-send-email-javier@osg.samsung.com>
 <11690712.d89FASKYvI@amdc1976> <20160901114046.GB4220@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20160901114046.GB4220@leverpostej>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org


Hi,

On Thursday, September 01, 2016 12:40:46 PM Mark Rutland wrote:
> On Thu, Sep 01, 2016 at 11:59:48AM +0200, Bartlomiej Zolnierkiewicz wrote:
> > On Thursday, September 01, 2016 10:35:15 AM Javier Martinez Canillas wrote:
> > > On 08/31/2016 07:40 PM, Bartlomiej Zolnierkiewicz wrote:
> > > > On Wednesday, August 31, 2016 03:45:24 PM Javier Martinez Canillas wrote:
> > > >> The idea is to get rid of skeleton.dtsi [0], but that will of course take
> > > >> time until the dtsi is removed from all the files. So this patch is a step
> > > >> in the right direction so at least Exynos is not a blocker to remove it.
> > > > 
> > > > Krzysztof's point is valid.  If you are going to convert all DTS/DTSI
> > > > then it is okay to apply Exynos specific changes, otherwise the code
> > > > should stay as it is currently.
> > > > 
> > > > Exynos won't be a blocker since we have your patches now and they can
> > > > be applied when/if needed ;)..
> > > 
> > > Sorry but I disagree. I see no reasons to need this to be an atomic, rather
> > > than incremental change. Deprecated things are usually handled by removing
> > > the usage and once there are no users, finally removing them.
> > 
> > Yes, given that there is agreement on the direction and people are aware
> > of the needed changes.  This doesn't seem to be a case yet as there is
> > no comment in skeleton.dtsi about being deprecated and other platforms'
> > Maintainers are not aware of the need for the change.
> 
> On the DT side we're all agreed that skeleton.dtsi should die. I'll send
> a patch adding a note to skeleton.dtsi to make this more obvious, but
> that shouldn't be a blocker for removing existing uses.

Thank you for clarifying this, I see no problem with applying Javier's
Exynos DTS/DTSI changes now.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
