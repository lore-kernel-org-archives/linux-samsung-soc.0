From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 1/3 v5] usb: phy-samsung-usb: Simplify PMU register handling
Date: Tue, 17 Sep 2013 17:53:31 +0200
Message-ID: <2133285.Y3nsFRsUq0@amdc1227>
References: <1375812017-6287-1-git-send-email-jwerner@chromium.org>
 <CAODwPW8KG2ZxOFf936H233g35KVPjDp+f8e3qgkd4Z7NN9RAtQ@mail.gmail.com>
 <20130917153616.GG15645@radagast>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20130917153616.GG15645@radagast>
Sender: linux-kernel-owner@vger.kernel.org
To: balbi@ti.com
Cc: Julius Werner <jwerner@chromium.org>, Tomasz Figa <tomasz.figa@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Pawel Moll <Pawel.Moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Kukjin Kim <kgene.kim@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Vivek Gautam <gautam.vivek@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Felipe,

On Tuesday 17 of September 2013 10:36:16 Felipe Balbi wrote:
> Hi,
> 
> On Tue, Aug 27, 2013 at 01:27:48PM -0700, Julius Werner wrote:
> > *Ping!*
> > 
> > Are there still unanswered concerns left with this patch? I hope my
> > prior mails could clear up why I think that the PMU register
> > description in the device tree for a specific PHY is represents the
> > hardware more accurately after my patch, and my analysis of the
> > Exynos4 situation currently not being implemented (and therefore not
> > needing to be addressed by this patch) was correct. Please let me know
> > if you have further objections... and if not, could we agree to have
> > this picked up somewhere?
> 
> I need acks for DTS part...

This patch breaks Exynos 4, so it's a NAK from me.

Anyway, a new, completely redesigned PHY driver supporting most of the PHY 
features (as opposed to only the basic subset currently) developed by Kamil 
Debski should show up soon, so I don't think there is any reason to apply 
any patches to this old driver.

Best regards,
Tomasz
