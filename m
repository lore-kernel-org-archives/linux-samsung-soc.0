From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] ARM: dts: Specify default clocks for Exynos4 FIMC devices
Date: Fri, 26 Sep 2014 13:01:10 +0200
Message-ID: <54254776.7070803@samsung.com>
References: <1410367054-30926-1-git-send-email-s.nawrocki@samsung.com>
 <5424900D.2070709@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:27265 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754482AbaIZLB0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Sep 2014 07:01:26 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NCI002OJ9F3II20@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 26 Sep 2014 12:04:15 +0100 (BST)
In-reply-to: <5424900D.2070709@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com

Hi Tomasz,

On 25/09/14 23:58, Tomasz Figa wrote:
> On 10.09.2014 18:37, Sylwester Nawrocki wrote:
>> > The default mux and divider clocks are specified in device tree
>> > so that the FIMC devices in Exynos4210 and Exynos4x12 SoCs are
>> > clocked from recommended clock source and with maximum supported
>> > frequency. If needed these settings could be overrode in board
>> > specific dts files, however they are in practice optimal in most
>> > cases.
>> > 
>> > Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> > ---
>> >  arch/arm/boot/dts/exynos4210.dtsi |   16 ++++++++++++++++
>> >  arch/arm/boot/dts/exynos4x12.dtsi |   16 ++++++++++++++++
>> >  2 files changed, 32 insertions(+)
>> > 
>> > diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
>> > index 807bb5b..0969d2e 100644
>> > --- a/arch/arm/boot/dts/exynos4210.dtsi
>> > +++ b/arch/arm/boot/dts/exynos4210.dtsi
>> > @@ -154,18 +154,30 @@
>> >  			samsung,pix-limits = <4224 8192 1920 4224>;
>> >  			samsung,mainscaler-ext;
>> >  			samsung,cam-if;
>> > +			assigned-clocks = <&clock CLK_MOUT_FIMC0>,
>> > +					<&clock CLK_SCLK_FIMC0>;
>> > +			assigned-clock-parents = <&clock CLK_SCLK_MPLL>;
>> > +			assigned-clock-rates = <0>, <160000000>;
>
> I wonder whether such settings shouldn't really be set up on a per-board
> basis.
> 
> As Daniel already pointed, we have cases when MPLL frequency differs
> across boards, but we might also have boards that differ in power budget
> and so having different desired operating frequencies for various IP blocks.
> 
> What do you think?

This patch provides sane default values for Exynos4210, MPLL is recommended
clock source for FIMC devices. If any other clock frequency is needed for 
selected boards the clocks setup could be simply overwritten in board dts 
file. Otherwise similar changes would have to be done in each board dts.

Alternatively I could split it and leave only parent clock assignment in 
SoC dts, moving assigned-clock-rates properties to board dts. I'm going 
to leave the functional clock frequency setting in the driver as it is done 
now, and to just modify the fallback to driver data, to have also 
'assigned-clock-rates' considered in the driver.

So parent clock assignment independently of the IP block driver in dts, 
and the functional clock frequency set in the driver from driver data.

-- 
Regards,
Sylwester
