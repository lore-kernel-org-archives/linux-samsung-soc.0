From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 0/9] Exynos Adaptive Supply Voltage support
Date: Mon, 19 Aug 2019 13:16:19 +0200
Message-ID: <b831d7c5-c830-fd65-20cf-02e209889c28@samsung.com>
References: <CGME20190718143117eucas1p1e534b9075d10fbbbe427c66192205eb1@eucas1p1.samsung.com>
        <20190718143044.25066-1-s.nawrocki@samsung.com>
        <20190723020450.z2pqwetkn2tfhacq@vireshk-i7>
        <5ef302a4-5bbf-483d-dfdf-cf76f6f69cee@samsung.com>
        <20190725022343.p7lqalrh5svxvtu2@vireshk-i7>
        <562dd2e7-2b24-8492-d1c1-2dc4973f07be@samsung.com>
        <20190819090928.pke6cov52n4exlbp@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190819090928.pke6cov52n4exlbp@vireshk-i7>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, krzk@kernel.org, robh+dt@kernel.org, vireshk@kernel.org, devicetree@vger.kernel.org, kgene@kernel.org, pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, b.zolnierkie@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 8/19/19 11:09, Viresh Kumar wrote:
> Will something like this help ?
> 
> https://lore.kernel.org/lkml/1442623929-4507-3-git-send-email-sboyd@codeaurora.org/
> 
> This never got merged but the idea was AVS only.

It's quite interesting work, it seems to be for a more advanced use case 
where OPP voltage is being adjusted at runtime.

We could use it instead of removing an OPP and then adding with updated 
voltage. On Exynos there is there is just a need to update OPPs once at boot 
time, so it is more "static". However the requirements could presumably 
change in future.

If that's your preference I could switch to that notifier approach.
AFAICS the API would still need to be extended to support multiple voltages,
when in future we add support for the Body Bias regulator. 

-- 
Thanks,
Sylwester
