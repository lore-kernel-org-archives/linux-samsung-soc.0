From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 0/9] Exynos Adaptive Supply Voltage support
Date: Tue, 20 Aug 2019 11:03:09 +0200
Message-ID: <06ccff05-2152-4bcc-7537-8f24da75f163@samsung.com>
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
        <20190820030114.6flnn2omeys3lih3@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190820030114.6flnn2omeys3lih3@vireshk-i7>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, krzk@kernel.org, robh+dt@kernel.org, vireshk@kernel.org, devicetree@vger.kernel.org, kgene@kernel.org, pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, b.zolnierkie@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 8/20/19 05:01, Viresh Kumar wrote:
> On 19-08-19, 15:39, Sylwester Nawrocki wrote:
>> Unfortunately not, the patch set as I see it is another way of updating 
>> an OPP after it was parsed from DT.  OPP remove/add could work equally 
>> well in our use case.
> 
> Adding OPPs dynamically has limitations, you can't set many values which are
> otherwise possible with DT. And removing/adding is not the right thing to do
> technically.

Thanks for explanation, I was not aware of that.

>> The problem is that we have the information on how to translate the 
>> common OPP voltage to a voltage specific to given silicon encoded jointly 
>> in the ASV tables and the CHIPID registers (efuse/OTP memory). 
>> Additionally, algorithm of selecting ASV data (OPP voltage) based on 
>> the "key" data from registers is not generic, it is usually different 
>> per each SoC type.
>>
>> I tried to identify some patterns in those tables in order to simplify 
>> possible DT binding, but that was not really successful. I ended up just 
>> keeping whole tables.
> 
> Sorry but I am unable to understand the difficulty you are facing now. So what I
> suggest is something like this.

The difficulty was about representing data from tables asv_{arm,kfc}_table[][]
added in patch 3/9 of the series in devicetree.  If you have no objections
about keeping those tables in the driver then I can't see any difficulties. 
 
> - Use DT to get a frequency and voltage for each frequency.

Yes, this is what happens now, we have common OPPs in DT that work for each SoC
revision. 

> - At runtime, based on SoC, registers, efuses, etc, update the voltage of the
>   OPPs.
> - This algo can be different for each SoC, no one is stopping you from doing
>   that.
> 
> Am I missing something ?

Not really, this is basically what happens in the $subject patch series. 

Then IIUC what I would need to change is to modify exynos_asv_update_cpu_opps() 
function in patch 3/9 to use dev_pm_opp_adjust_voltage() rather than 
dev_pm_opp_remove(), dev_pm_opp_add().

-- 
Thanks,
Sylwester
