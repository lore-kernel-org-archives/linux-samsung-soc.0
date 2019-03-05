From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH 01/15] ARM: actions: fix a leaked reference by
 addingmissing of_node_put
Date: Tue, 5 Mar 2019 09:55:05 +0000
Message-ID: <20190305095505.znposuv6avjtbfwf@shell.armlinux.org.uk>
References: <1551430616-42014-1-git-send-email-wen.yang99@zte.com.cn>
 <20190301155523.GA1915@Mani-XPS-13-9360>
 <CACRpkdb=E9_rm4_7DQV3dS5uOs1gozxEwN9MtWr0tTwmjcYe=A@mail.gmail.com>
 <20190304144829.GA5265@Mani-XPS-13-9360>
 <CACRpkda+8QZnaT-YoeccQGjg78y9-E-JoWBr3LJs62T03H4wQw@mail.gmail.com>
 <CAOZjjhnDYHkWCd-zDqkFpg5FPoj-UxxNwVxfbg6QEahiASm10w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOZjjhnDYHkWCd-zDqkFpg5FPoj-UxxNwVxfbg6QEahiASm10w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Wen Yang <wen.yang99@zte.com.cn>, Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Michal Simek <michal.simek@xilinx.com>, Dinh Nguyen <dinguyen@kernel.org>, Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Mar 05, 2019 at 07:21:19AM +0530, Manivannan Sadhasivam wrote:
> On Tue, 5 Mar, 2019, 4:08 AM Linus Walleij <linus.walleij@linaro.org wrote:
> 
> > On Mon, Mar 4, 2019 at 3:48 PM Manivannan Sadhasivam
> > <manivannan.sadhasivam@linaro.org> wrote:
> > > On Mon, Mar 04, 2019 at 01:29:33PM +0100, Linus Walleij wrote:
> > > > On Fri, Mar 1, 2019 at 4:55 PM Manivannan Sadhasivam
> > > > <manivannan.sadhasivam@linaro.org> wrote:
> > > > > Hi Wen,
> > > > >
> > > > > On Fri, Mar 01, 2019 at 04:56:42PM +0800, Wen Yang wrote:
> > > > > > The call to of_get_next_child returns a node pointer with refcount
> > > > > > incremented thus it must be explicitly decremented after the last
> > > > > > usage.
> > > > > >
> > > > > > Detected by coccinelle with the following warnings:
> > > > > > ./arch/arm/mach-actions/platsmp.c:112:2-8: ERROR: missing
> > of_node_put; acquired a node pointer with refcount incremented on line 103,
> > but without a corresponding object release within this function.
> > > > > > ./arch/arm/mach-actions/platsmp.c:124:2-8: ERROR: missing
> > of_node_put; acquired a node pointer with refcount incremented on line 115,
> > but without a corresponding object release within this function.
> > > > > > ./arch/arm/mach-actions/platsmp.c:137:3-9: ERROR: missing
> > of_node_put; acquired a node pointer with refcount incremented on line 128,
> > but without a corresponding object release within this function.
> > > > > >
> > > > >
> > > > > We have a floating patch for this:
> > > > > https://www.spinics.net/lists/arm-kernel/msg694544.html
> > > > >
> > > > > Andreas: Can you please take a second look at the patchset submitted
> > by Linus
> > > > > Walleij and Russel for simplifying the Actions startup code?
> > > >
> > > > Andreas wrote a version of simplifying secondary startup in the
> > > > same spirit as Russell's patches, and it's merged and all
> > > > is fine I think.
> > > >
> > >
> > > Oops. I think I missed that! Can you please point me to that patch? And
> > how it
> > > got merged? I did the PR for actions stuff this time and haven't
> > included any
> > > mach-actions patches.
> >
> > I just did git log arch/arm/mach-actions but I think it came in quite some
> > time
> > ago, not last merge window:
> >
> > But you see:
> > commit 6c2eb3e76fb84e2eb46d484f71fab469c0d9532c
> > "ARM: owl: smp: Drop owl_secondary_boot()"
> > commit bad29933fef76fb6ee577f4a0b6d145c1f52f663
> > "ARM: owl: smp: Use __pa_symbol()"
> > commit 18cfd9429d8a82c49add8f3ca9d366599bfcac45
> > "ARM: owl: smp: Drop bogus holding pen"
> >
> > platsmp.c looks just fine these days. Except for what Wei's patch is
> > fixing,
> > of_node_put().
> >
> 
> Nope. platsmp.c still requires some cleanup like removing the redundant
> bootlock and pen_release flag as pointed out by Russel. Andreas just
> replied to your cleanup patches but there was no follow up since that. So,
> I guess we can just apply Russell's patches and this patch once Andreas is
> fine with it (it looks good to me though).

No.  My patches are in my tree queued for this merge window.  They
are part of a series that can not be broken up and merged separately
because all the per-platform patches need to be merged before the final
patch "ARM: smp: remove arch-provided "pen_release"" otherwise the
platforms break.  I thought that was already explained.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
