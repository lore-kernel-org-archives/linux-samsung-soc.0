From: Kamil Konieczny <k.konieczny@partner.samsung.com>
Subject: Re: [PATCH v2 1/4] opp: core: add regulators enable and disable
Date: Wed, 17 Jul 2019 16:12:42 +0200
Message-ID: <297179a4-a542-0836-6192-e06369fdcae5@partner.samsung.com>
References: <20190715120416.3561-1-k.konieczny@partner.samsung.com>
        <CGME20190715120430eucas1p19dddcc93756e6a110d3476229f9428b3@eucas1p1.samsung.com>
        <20190715120416.3561-2-k.konieczny@partner.samsung.com>
        <9acc7dd0-614b-ccd3-a485-eeca3dab494b@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9acc7dd0-614b-ccd3-a485-eeca3dab494b@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Mark Rutland <mark.rutland@arm.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 16.07.2019 06:03, Chanwoo Choi wrote:
> Hi Kamil,
> 
> On 19. 7. 15. 오후 9:04, Kamil Konieczny wrote:
>> Add enable regulators to dev_pm_opp_set_regulators() and disable
>> regulators to dev_pm_opp_put_regulators(). This prepares for
>> converting exynos-bus devfreq driver to use dev_pm_opp_set_rate().
> 
> IMHO, it is not proper to mention the specific driver name.
> If you explain the reason why enable the regulator before using it,
> it is enough description.
> 
>>
>> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
>> --
>> Changes in v2:
>>
>> - move regulator enable and disable into loop
>>
>> ---
>>  drivers/opp/core.c | 18 +++++++++++++++---
>>  1 file changed, 15 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
>> index 0e7703fe733f..069c5cf8827e 100644
>> --- a/drivers/opp/core.c
>> +++ b/drivers/opp/core.c
>> @@ -1570,6 +1570,10 @@ struct opp_table *dev_pm_opp_set_regulators(struct device *dev,
>>  			goto free_regulators;
>>  		}
>>  
>> +		ret = regulator_enable(reg);
>> +		if (ret < 0)
>> +			goto disable;
>> +
>>  		opp_table->regulators[i] = reg;
>>  	}
>>  
>> @@ -1582,9 +1586,15 @@ struct opp_table *dev_pm_opp_set_regulators(struct device *dev,
>>  
>>  	return opp_table;
>>  
>> +disable:
>> +	regulator_put(reg);
>> +	--i;
>> +
>>  free_regulators:
>> -	while (i != 0)
>> -		regulator_put(opp_table->regulators[--i]);
>> +	for (; i >= 0; --i) {
>> +		regulator_disable(opp_table->regulators[i]);
>> +		regulator_put(opp_table->regulators[i]);
>> +	}
>>  
>>  	kfree(opp_table->regulators);
>>  	opp_table->regulators = NULL;
>> @@ -1610,8 +1620,10 @@ void dev_pm_opp_put_regulators(struct opp_table *opp_table)
>>  	/* Make sure there are no concurrent readers while updating opp_table */
>>  	WARN_ON(!list_empty(&opp_table->opp_list));
>>  
>> -	for (i = opp_table->regulator_count - 1; i >= 0; i--)
>> +	for (i = opp_table->regulator_count - 1; i >= 0; i--) {
>> +		regulator_disable(opp_table->regulators[i]);
>>  		regulator_put(opp_table->regulators[i]);
>> +	}
>>  
>>  	_free_set_opp_data(opp_table);
>>  
>>
> 
> I agree to enable the regulator before using it.
> The bootloader might not enable the regulators
> and the kernel need to enable regulator in order to increase
> the reference count explicitly event if bootloader enables it.
> 
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

Thank you, I will change commit description and send v3.

-- 
Best regards,
Kamil Konieczny
Samsung R&D Institute Poland
