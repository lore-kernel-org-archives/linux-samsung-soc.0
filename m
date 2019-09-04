From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 0/9] Exynos Adaptive Supply Voltage support
Date: Wed, 4 Sep 2019 14:37:39 +0200
Message-ID: <4e6379a7-0d4b-8e0d-c225-49976b2587e0@samsung.com>
References: <20190723020450.z2pqwetkn2tfhacq@vireshk-i7>
        <5ef302a4-5bbf-483d-dfdf-cf76f6f69cee@samsung.com>
        <20190725022343.p7lqalrh5svxvtu2@vireshk-i7>
        <562dd2e7-2b24-8492-d1c1-2dc4973f07be@samsung.com>
        <20190819090928.pke6cov52n4exlbp@vireshk-i7>
        <b831d7c5-c830-fd65-20cf-02e209889c28@samsung.com>
        <20190819112533.bvfyinw7fsebkufr@vireshk-i7>
        <b7093aaf-ea56-c390-781f-6f9d0780bd8e@samsung.com>
        <20190820030114.6flnn2omeys3lih3@vireshk-i7>
        <06ccff05-2152-4bcc-7537-8f24da75f163@samsung.com>
        <CGME20190820092123epcas2p2170ae19467a5fb19fcfc1acdbecf9381@epcas2p2.samsung.com>
        <20190820092113.gojhe3romdnvm7eu@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190820092113.gojhe3romdnvm7eu@vireshk-i7>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, krzk@kernel.org, robh+dt@kernel.org, vireshk@kernel.org, devicetree@vger.kernel.org, kgene@kernel.org, pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, b.zolnierkie@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On 8/20/19 11:21, Viresh Kumar wrote:
> On 20-08-19, 11:03, Sylwester Nawrocki wrote:
>> On 8/20/19 05:01, Viresh Kumar wrote:
>>> Sorry but I am unable to understand the difficulty you are facing now. So what I
>>> suggest is something like this.
>>
>> The difficulty was about representing data from tables asv_{arm,kfc}_table[][]
>> added in patch 3/9 of the series in devicetree.  If you have no objections
>> about keeping those tables in the driver then I can't see any difficulties. 
> 
> The problem with keeping such tables in kernel is that they contain too much
> magic values which very few people understand. And after some amount of time,
> even they don't remember any of it.
>
> What I was expecting was to remove as much of these tables as possible and do
> the calculations to get them at runtime with some logical code which people can
> understand later on.

It might be indeed far from a good design but this is all what we get from the 
SoC vendor. AFAIU those tables are generated based on data from the production
process, likely from some measurements.

I am afraid I will not get more information for that fairly old SoCs in order to 
replace those tables with some sensible code generating the data programmatically,
I'm not sure it would be at all possible to do.

I could add some more comments, similar to description as in my previous RFC 
DT binding (https://patchwork.kernel.org/patch/10886013).

The tables are rather simple, it's mostly all voltage values, only selecting 
values per each frequency and chip revision might get a bit complex. 
I'm not sure we could change that now though.
>> Then IIUC what I would need to change is to modify exynos_asv_update_cpu_opps() 
>> function in patch 3/9 to use dev_pm_opp_adjust_voltage() rather than 
>> dev_pm_opp_remove(), dev_pm_opp_add().
> 
> That and somehow add code to get those tables if possible.

I have changed the code to use dev_pm_opp_adjust_voltage(). I was wondering 
though, what did you mean by "triplet" when commenting on this patch
https://patchwork.kernel.org/patch/11092245 ?

-- 
Regards,
Sylwester
