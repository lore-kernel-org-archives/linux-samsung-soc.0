From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v2 0/9] Exynos Adaptive Supply Voltage support
Date: Mon, 19 Aug 2019 15:36:42 +0530
Message-ID: <20190819100642.tvnzt6d5rikugycr@vireshk-i7>
References: <CGME20190718143117eucas1p1e534b9075d10fbbbe427c66192205eb1@eucas1p1.samsung.com>
 <20190718143044.25066-1-s.nawrocki@samsung.com>
 <20190723020450.z2pqwetkn2tfhacq@vireshk-i7>
 <5ef302a4-5bbf-483d-dfdf-cf76f6f69cee@samsung.com>
 <20190725022343.p7lqalrh5svxvtu2@vireshk-i7>
 <562dd2e7-2b24-8492-d1c1-2dc4973f07be@samsung.com>
 <20190819090928.pke6cov52n4exlbp@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190819090928.pke6cov52n4exlbp@vireshk-i7>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, krzk@kernel.org, robh+dt@kernel.org, vireshk@kernel.org, devicetree@vger.kernel.org, kgene@kernel.org, pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, b.zolnierkie@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 19-08-19, 14:39, Viresh Kumar wrote:
> On 09-08-19, 17:58, Sylwester Nawrocki wrote:
> > Thank you for your suggestions.
> > 
> > For some Exynos SoC variants the algorithm of selecting CPU voltage supply
> > is a bit more complex than just selecting a column in the frequency/voltage 
> > matrix, i.e. selecting a set of voltage values for whole frequency range.
> > 
> > Frequency range could be divided into sub-ranges and to each such a sub-range 
> > part of different column could be assigned, depending on data fused in 
> > the CHIPID block registers.
> > 
> > We could create OPP node for each frequency and specify all needed voltages 
> > as a list of "opp-microvolt-<name>" properties but apart from the fact that 
> > it would have been quite many properties, e.g. 42 (3 tables * 14 columns), 
> > only for some SoC types the dev_pm_opp_set_prop_name() approach could be 
> > used. We would need to be able to set opp-microvolt-* property name 
> > separately for each frequency (OPP).
> > 
> > Probably most future proof would be a DT binding where we could still 
> > re-create those Exynos-specific ASV tables from DT. For example add named 
> > opp-microvolt-* properties or something similar to hold rows of each ASV 
> > table. But that conflicts with "operating-points-v2" binding, where 
> > multiple OPP voltage values are described by just named properties and 
> > multiple entries correspond to min/target/max.
> > 
> > opp_table0 {
> > 	compatible = "...", "operating-points-v2";
> > 	opp-shared;
> > 	opp-2100000000 {
> > 		opp-hz = /bits/ 64 <1800000000>;
> > 		opp-microvolt = <...>;
> > 		opp-microvolt-t1 = <1362500>, <1350000>, ....;
> > 		opp-microvolt-t2 = <1362500>, <1360000>, ....;
> > 		opp-microvolt-t3 = <1362500>, <1340000>, ....;
> > 	};
> > 	...
> > 	opp-200000000 {
> > 		opp-hz = /bits/ 64 <200000000>;
> > 		opp-microvolt = <...>;
> > 		opp-microvolt-t1 = <900000>, <900000>, ....;
> > 		opp-microvolt-t2 = <900000>, <900000>, ....;
> > 		opp-microvolt-t3 = <900000>, <900000>, ....;
> > 	};
> > };
> > 
> > I might be missing some information now on how those Exynos ASV tables 
> > are used on other SoCs that would need to be supported.
> > 
> > There will be even more data to include when adding support for the Body
> > Bias voltage, for each CPU supply voltage we could possibly have 
> > corresponding Body Bias voltage.
> 
> Will something like this help ?
> 
> https://lore.kernel.org/lkml/1442623929-4507-3-git-send-email-sboyd@codeaurora.org/
> 
> This never got merged but the idea was AVS only.

Here is a recent version under review.

https://lore.kernel.org/lkml/1565703113-31479-1-git-send-email-andrew-sh.cheng@mediatek.com

-- 
viresh
