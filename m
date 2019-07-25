From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v2 0/9] Exynos Adaptive Supply Voltage support
Date: Thu, 25 Jul 2019 07:53:43 +0530
Message-ID: <20190725022343.p7lqalrh5svxvtu2@vireshk-i7>
References: <CGME20190718143117eucas1p1e534b9075d10fbbbe427c66192205eb1@eucas1p1.samsung.com>
 <20190718143044.25066-1-s.nawrocki@samsung.com>
 <20190723020450.z2pqwetkn2tfhacq@vireshk-i7>
 <5ef302a4-5bbf-483d-dfdf-cf76f6f69cee@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5ef302a4-5bbf-483d-dfdf-cf76f6f69cee@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, krzk@kernel.org, robh+dt@kernel.org, vireshk@kernel.org, devicetree@vger.kernel.org, kgene@kernel.org, pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, b.zolnierkie@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 24-07-19, 15:10, Marek Szyprowski wrote:
> Hi Viresh,
> 
> On 2019-07-23 04:04, Viresh Kumar wrote:
> > On 18-07-19, 16:30, Sylwester Nawrocki wrote:
> >> This is second iteration of patch series adding ASV (Adaptive Supply
> >> Voltage) support for Exynos SoCs. The first one can be found at:
> >> https://lore.kernel.org/lkml/20190404171735.12815-1-s.nawrocki@samsung.com
> >>
> >> The main changes comparing to the first (RFC) version are:
> >>   - moving ASV data tables from DT to the driver,
> >>   - converting the chipid and the ASV drivers to use regmap,
> >>   - converting the ASV driver to proper platform driver.
> >>
> >> I tried the opp-supported-hw bitmask approach as in the Qualcomm CPUFreq
> >> DT bindings but it resulted in too many OPPs and DT nodes, around 200
> >> per CPU cluster. So the ASV OPP tables are now in the ASV driver, as in
> >> downstream kernels.
> > Hmm. Can you explain why do you have so many OPPs? How many
> > frequencies do you actually support per cluster and what all varies
> > per frequency based on hw ? How many hw version do u have ?
> 
> For big cores there are 20 frequencies (2100MHz .. 200MHz). Each SoC 
> might belong to one of the 3 production 'sets' and each set contains 14 
> so called 'asv groups', which assign the certain voltage values for each 
> of those 20 frequencies (the lower asv group means lower voltage needed 
> for given frequency).

There is another property which might be useful in this case:
"opp-microvolt-<name>" and then you can use API
dev_pm_opp_set_prop_name() to choose which voltage value to apply to
all OPPs.

opp-supported-hw property is more useful for the cases where only a
subset of frequencies will be supported for different versions of the
SoC. And what you need is a different voltage value for all
frequencies based on some h/w version.

-- 
viresh
