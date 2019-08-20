From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v2 0/9] Exynos Adaptive Supply Voltage support
Date: Tue, 20 Aug 2019 08:31:14 +0530
Message-ID: <20190820030114.6flnn2omeys3lih3@vireshk-i7>
References: <CGME20190718143117eucas1p1e534b9075d10fbbbe427c66192205eb1@eucas1p1.samsung.com>
 <20190718143044.25066-1-s.nawrocki@samsung.com>
 <20190723020450.z2pqwetkn2tfhacq@vireshk-i7>
 <5ef302a4-5bbf-483d-dfdf-cf76f6f69cee@samsung.com>
 <20190725022343.p7lqalrh5svxvtu2@vireshk-i7>
 <562dd2e7-2b24-8492-d1c1-2dc4973f07be@samsung.com>
 <20190819090928.pke6cov52n4exlbp@vireshk-i7>
 <b831d7c5-c830-fd65-20cf-02e209889c28@samsung.com>
 <20190819112533.bvfyinw7fsebkufr@vireshk-i7>
 <b7093aaf-ea56-c390-781f-6f9d0780bd8e@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b7093aaf-ea56-c390-781f-6f9d0780bd8e@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, krzk@kernel.org, robh+dt@kernel.org, vireshk@kernel.org, devicetree@vger.kernel.org, kgene@kernel.org, pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, b.zolnierkie@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 19-08-19, 15:39, Sylwester Nawrocki wrote:
> Unfortunately not, the patch set as I see it is another way of updating 
> an OPP after it was parsed from DT.  OPP remove/add could work equally 
> well in our use case.

Adding OPPs dynamically has limitations, you can't set many values which are
otherwise possible with DT. And removing/adding is not the right thing to do
technically.

> The problem is that we have the information on how to translate the 
> common OPP voltage to a voltage specific to given silicon encoded jointly 
> in the ASV tables and the CHIPID registers (efuse/OTP memory). 
> Additionally, algorithm of selecting ASV data (OPP voltage) based on 
> the "key" data from registers is not generic, it is usually different 
> per each SoC type.
> 
> I tried to identify some patterns in those tables in order to simplify 
> possible DT binding, but that was not really successful. I ended up just 
> keeping whole tables.

Sorry but I am unable to understand the difficulty you are facing now. So what I
suggest is something like this.

- Use DT to get a frequency and voltage for each frequency.
- At runtime, based on SoC, registers, efuses, etc, update the voltage of the
  OPPs.
- This algo can be different for each SoC, no one is stopping you from doing
  that.

Am I missing something ?

-- 
viresh
