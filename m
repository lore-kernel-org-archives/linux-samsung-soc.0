From: Inha Song <ideal.song@samsung.com>
Subject: Re: [alsa-devel] [PATCH v3 3/4] ARM: dts: set clock out parent to
 XUSBXTI
Date: Fri, 23 Jan 2015 09:49:16 +0900
Message-ID: <20150123094916.32beb50f@songinha-Samsung-DeskTop-System>
References: <1421925482-15861-1-git-send-email-ideal.song@samsung.com>
 <1421925482-15861-4-git-send-email-ideal.song@samsung.com>
 <54C0EC23.9070209@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:19949 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752527AbbAWAtU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Jan 2015 19:49:20 -0500
In-reply-to: <54C0EC23.9070209@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: alsa-devel@alsa-project.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sbkim73@samsung.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com, tiwai@suse.de, broonie@kernel.org, kgene@kernel.org, galak@codeaurora.org, grant.likely@linaro.org, linux-arm-kernel@lists.infradead.org

Hi,
Thanks for your comment.

On Thu, 22 Jan 2015 13:25:07 +0100
Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:

> On 22/01/15 12:18, Inha Song wrote:
> > This patch set clock out parent to XUSBXTI.
> > 
> > Signed-off-by: Inha Song <ideal.song@samsung.com>
> > ---
> >  arch/arm/boot/dts/exynos4.dtsi | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
> > index b8168f1..020bbaf 100644
> > --- a/arch/arm/boot/dts/exynos4.dtsi
> > +++ b/arch/arm/boot/dts/exynos4.dtsi
> > @@ -141,6 +141,8 @@
> >  	pmu_system_controller: system-controller@10020000 {
> >  		compatible = "samsung,exynos4210-pmu", "syscon";
> >  		reg = <0x10020000 0x4000>;
> > +		assigned-clocks = <&pmu_system_controller 0>;
> > +		assigned-clock-parents =  <&clock CLK_XUSBXTI>;
> >  	};
> 
> Looks good, except it needs to be done only for the Trats2 board, i.e.
> the PMU device node including these properties should be added to
> exynos4412-trats2.dts.  I think it's fine to make it a one patch including
> all dts changes.

Opps! I understand. I will move this node to exynos4412-trats2.dts.

&pmu_system_controller {
   assigned-clocks = <&pmu_system_controller 0>;
   assigned-clock-parents =  <&clock CLK_XUSBXTI>;
};

Thanks!

Best Regards,
Inha Song.

> 
> 
> -- 
> Regards,
> Sylwester
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> http://mailman.alsa-project.org/mailman/listinfo/alsa-devel
