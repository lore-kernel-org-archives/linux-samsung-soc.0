From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 2/2] arm: dt: Exynos5420: populate cpu node enteries to 8
 cpus
Date: Thu, 05 Sep 2013 12:10:26 +0200
Message-ID: <1772890.cJdvnBcfyj@amdc1227>
References: <1378373086-30676-1-git-send-email-chander.kashyap@linaro.org>
 <3875313.jvPsk6a1oV@amdc1227>
 <CANuQgHGSAGhA_LzU1aP05J86wjjS0qibPTXZM8ka0O3jZz8Kpw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:43293 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932066Ab3IEKKb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Sep 2013 06:10:31 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MSN00M9VDL23W40@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 05 Sep 2013 11:10:28 +0100 (BST)
In-reply-to: <CANuQgHGSAGhA_LzU1aP05J86wjjS0qibPTXZM8ka0O3jZz8Kpw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chander Kashyap <chander.kashyap@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>

On Thursday 05 of September 2013 15:33:17 Chander Kashyap wrote:
> Hi Tomasz,
> 
> On 5 September 2013 15:25, Tomasz Figa <t.figa@samsung.com> wrote:
> > Hi Chander,
> > 
> > On Thursday 05 of September 2013 14:54:46 Chander Kashyap wrote:
> >> Exynos5420 is octacore SoC from samsung.
> >> Hence populate all the cpu node enteries.
> >> 
> >> Signed-off-by: Chander Kashyap <chander.kashyap@linaro.org>
> >> ---
> >> 
> >>  arch/arm/boot/dts/exynos5420.dtsi |   28 ++++++++++++++++++++++++++++
> >>  1 file changed, 28 insertions(+)
> >> 
> >> diff --git a/arch/arm/boot/dts/exynos5420.dtsi
> >> b/arch/arm/boot/dts/exynos5420.dtsi index e97c87b..59489f6 100644
> >> --- a/arch/arm/boot/dts/exynos5420.dtsi
> >> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> >> @@ -57,6 +57,34 @@
> >> 
> >>                       reg = <0x3>;
> >>                       clock-frequency = <1800000000>;
> >>               
> >>               };
> >> 
> >> +
> >> +             cpu4: cpu@4 {
> > 
> > I believe this is a typo. The @unit-address suffix should match the
> > value of reg property.
> 
> No this is not typo. It is the MPIDR value of the cpu. (24 bits of
> MPIDR register).

Right. This is what the reg property should be set to. However, the @unit-
address prefix of node name should match the value of reg property, so if 
the value of reg property is 0x100, then the node should be named cpu@100.

Best regards,
Tomasz
