From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 2/3] ARM: exynos5420: dt: add clock entries to watchdog node
Date: Wed, 24 Jul 2013 16:09:58 +0200
Message-ID: <1689874.JhDjmL3yxX@amdc1227>
References: <1374658699-3961-1-git-send-email-l.krishna@samsung.com>
 <CAK9yfHz9-2WeDU8fnsOoQk7FCXoUvM6MnpWNXEd_GXvv=Fd4Cw@mail.gmail.com>
 <0eb001ce8864$cd287190$677954b0$@org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:56616 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751800Ab3GXOKE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 10:10:04 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MQG00BYU1YCNS50@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Jul 2013 15:10:02 +0100 (BST)
In-reply-to: <0eb001ce8864$cd287190$677954b0$@org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: 'Sachin Kamat' <sachin.kamat@linaro.org>, 'Leela Krishna Amudala' <l.krishna@samsung.com>, linux-samsung-soc@vger.kernel.org, dianders@chromium.org, jg1.han@samsung.com, grant.likely@secretlab.ca, swarren@wwwdotorg.org, arnd@arndb.de, olof@lixom.net

On Wednesday 24 of July 2013 20:56:15 Kukjin Kim wrote:
> Sachin Kamat wrote:
> > On 24 July 2013 16:42, Tomasz Figa <t.figa@samsung.com> wrote:
> > > On Wednesday 24 of July 2013 15:31:43 Sachin Kamat wrote:
> > >> Hi Tomasz,
> > >> 
> > >> On 24 July 2013 15:24, Tomasz Figa <t.figa@samsung.com> wrote:
> > >> > Hi Sachin,
> > >> > 
> > >> > On Wednesday 24 of July 2013 15:18:26 Sachin Kamat wrote:
> > >> >> Hi Leela,
> > >> >> 
> > >> >> On 24 July 2013 15:08, Leela Krishna Amudala
> > >> >> <l.krishna@samsung.com>
> > >> > 
> > >> > wrote:
> > >> >> > This patch adds clock entries to watchdog node for exynos5420
> > >> >> > as per the common clock framework of exynos5420
> > >> >> > 
> > >> >> > Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
> > >> >> > Reviewed-by: Doug Anderson <dianders@chromium.org>
> > >> >> > Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> > >> >> > ---
> > >> >> > 
> > >> >> >  arch/arm/boot/dts/exynos5420.dtsi |    6 ++++++
> > >> >> >  1 file changed, 6 insertions(+)
> > >> >> > 
> > >> >> > diff --git a/arch/arm/boot/dts/exynos5420.dtsi
> > >> >> > b/arch/arm/boot/dts/exynos5420.dtsi index 8c54c4b..e1d2d20
> > >> >> > 100644
> > >> >> > --- a/arch/arm/boot/dts/exynos5420.dtsi
> > >> >> > +++ b/arch/arm/boot/dts/exynos5420.dtsi
> > >> >> > @@ -145,4 +145,10 @@
> > >> >> > 
> > >> >> >                 clocks = <&clock 260>, <&clock 131>;
> > >> >> >                 clock-names = "uart", "clk_uart_baud0";
> > >> >> >         
> > >> >> >         };
> > >> >> > 
> > >> >> > +
> > >> >> > +       watchdog {
> > >> >> > +               clocks = <&clock 316>;
> > >> >> > +               clock-names = "watchdog";
> > >> >> > +               status = "okay";
> > >> >> 
> > >> >> Generally you do "okay" in specific board dts files.
> > >> > 
> > >> > Not necessarily. The status property should be set to okay
> > >> > whenever
> > 
> > the
> > 
> > >> > device represented by such node can already work with given set of
> > >> > information (properties).
> > >> > 
> > >> > Given the fact that watchdog driver does not require any board
> > 
> > specific
> > 
> > >> > information, it can be instantiated regardless of the board.
> > >> 
> > >> Yes you are right. But I was thinking of keeping this (enabling) as
> > >> an
> > >> option at the board level.
> > >> We do this for some of the other IPs too where even though we have
> > >> all
> > >> the properties we keep them disabled.
> > > 
> > > Yes and this is wrong. Device tree is only a way to list all the
> > 
> > hardware
> > 
> > > present on particular platform. You don't define which components are
> > 
> > used
> > 
> > > or not depending on use case, but rather all the hardware that can be
> > 
> > used
> > 
> > > on given board should be enabled on DT level.
> > 
> > This is contrary to the fact that we disable everything by default in
> > the top level dt files and only enable them as required in the board
> > dts files.
> > 
> > > To illustrate the problem please consider that in the end, a dtb file
> > 
> > will
> > 
> > > be fused into board ROM (or at most flash memory) and passed to the
> > 
> > kernel
> > 
> > > by the bootloader. If you disable some hardware on DT level even if
> > > it
> > 
> > can
> > 
> > > be physically used on the board, there will be no way to reenable it,
> > > if
> > > some user wanted to use it, because that would require editing the
> > > fused
> > > dtb.
> > 
> > I believe some h/w will be disabled in dt only if it should not be
> > used for whatever reason. If there is no reason then ofcourse they
> > would be enabled IMHO. Whatever be the case the choice of enabling or
> > disabling should be done at the leaf node (at board level). No?
> 
> In my opinion, some IPs can be disabled according to the board manager.
> And if updated DTB is required due to kernel updating or whatever, DTB
> should be updated accordingly.

No, not really. DTB should considered as immutable and modification of which 
should be allowed only in special cases. Currently such huge special case 
is that our DT bindings are still in development and so device tree is 
likely to change, but we are getting towards stabilizing them and so things 
should be done with correct assumptions.

> One more, actually we don't have no general way to fuse DTB in firmware
> when kernel is updated. So board manger who controls/decides what
> features should be supported on their board should consider the board's
> features and environments...

Again, device tree is not a way to specify use cases. It is a way to list 
hardware available on the platform and its parameters. DTB should be set up 
in a way enabling users to use any hardware available on their machines, 
without the need to change DTB.

Best regards,
Tomasz

P.S. CCing more Device Tree people for their opinion on this.
