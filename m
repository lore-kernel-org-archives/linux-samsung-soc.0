From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: Re: [PATCH v4 3/5] drivers: devfreq: events: extend events by type
 of counted data
Date: Wed, 24 Jul 2019 12:15:45 +0200
Message-ID: <37af143f-a585-a28a-a36f-2ed25c5b6d3b@partner.samsung.com>
References: <20190605091236.24263-1-l.luba@partner.samsung.com>
        <CGME20190605091303eucas1p27177d349e0f2bd37bf582dbd7266321a@eucas1p2.samsung.com>
        <20190605091236.24263-4-l.luba@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190605091236.24263-4-l.luba@partner.samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, cw00.choi@samsung.com
Cc: b.zolnierkie@samsung.com, krzk@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, kgene@kernel.org, willy.mh.wolff.ml@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Chanwoo,

Could you have a look a this patch, please?
This patch has been rewritten accorifing to your suggestion.
Krzysztof tried to apply 5/5 DT patch on his current branch,
but it is missing earlier stuff.
The other patches have needed ACKs so could go through devfreq tree
probably, but this one left.

Regards,
Lukasz

On 6/5/19 11:12 AM, Lukasz Luba wrote:
> This patch adds posibility to choose what type of data should be counted
> by the PPMU counter. Now the type comes from DT where the event has been
> defined. When there is no 'event-data-type' the default value is used,
> which is 'read+write data in bytes'.
> It is needed when you want to know not only read+write data bytes but
> i.e. only write data in byte, or number of read requests, etc.
> 
> Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
> ---
>   drivers/devfreq/event/exynos-ppmu.c | 60 ++++++++++++++++++++---------
>   include/linux/devfreq-event.h       |  6 +++
>   2 files changed, 47 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/devfreq/event/exynos-ppmu.c b/drivers/devfreq/event/exynos-ppmu.c
> index 17f3c86a6f00..12f637320e9e 100644
> --- a/drivers/devfreq/event/exynos-ppmu.c
> +++ b/drivers/devfreq/event/exynos-ppmu.c
> @@ -161,9 +161,9 @@ static int exynos_ppmu_set_event(struct devfreq_event_dev *edev)
>   	if (ret < 0)
>   		return ret;
>   
> -	/* Set the event of Read/Write data count  */
> +	/* Set the event of proper data type monitoring */
>   	ret = regmap_write(info->regmap, PPMU_BEVTxSEL(id),
> -				PPMU_RO_DATA_CNT | PPMU_WO_DATA_CNT);
> +			   edev->desc->data_type);
>   	if (ret < 0)
>   		return ret;
>   
> @@ -375,23 +375,11 @@ static int exynos_ppmu_v2_set_event(struct devfreq_event_dev *edev)
>   	if (ret < 0)
>   		return ret;
>   
> -	/* Set the event of Read/Write data count  */
> -	switch (id) {
> -	case PPMU_PMNCNT0:
> -	case PPMU_PMNCNT1:
> -	case PPMU_PMNCNT2:
> -		ret = regmap_write(info->regmap, PPMU_V2_CH_EVx_TYPE(id),
> -				PPMU_V2_RO_DATA_CNT | PPMU_V2_WO_DATA_CNT);
> -		if (ret < 0)
> -			return ret;
> -		break;
> -	case PPMU_PMNCNT3:
> -		ret = regmap_write(info->regmap, PPMU_V2_CH_EVx_TYPE(id),
> -				PPMU_V2_EVT3_RW_DATA_CNT);
> -		if (ret < 0)
> -			return ret;
> -		break;
> -	}
> +	/* Set the event of proper data type monitoring */
> +	ret = regmap_write(info->regmap, PPMU_V2_CH_EVx_TYPE(id),
> +			   edev->desc->data_type);
> +	if (ret < 0)
> +		return ret;
>   
>   	/* Reset cycle counter/performance counter and enable PPMU */
>   	ret = regmap_read(info->regmap, PPMU_V2_PMNC, &pmnc);
> @@ -507,6 +495,7 @@ static int of_get_devfreq_events(struct device_node *np,
>   	struct device_node *events_np, *node;
>   	int i, j, count;
>   	const struct of_device_id *of_id;
> +	int ret;
>   
>   	events_np = of_get_child_by_name(np, "events");
>   	if (!events_np) {
> @@ -556,6 +545,39 @@ static int of_get_devfreq_events(struct device_node *np,
>   		desc[j].driver_data = info;
>   
>   		of_property_read_string(node, "event-name", &desc[j].name);
> +		ret = of_property_read_u32(node, "event-data-type",
> +					   &desc[j].data_type);
> +		if (ret) {
> +			/* Set the event of proper data type counting.
> +			 * Check if the data type has been defined in DT,
> +			 * use default if not.
> +			 */
> +			if (info->ppmu_type == EXYNOS_TYPE_PPMU_V2) {
> +				struct devfreq_event_dev edev;
> +				int id;
> +				/* Not all registers take the same value for
> +				 * read+write data count.
> +				 */
> +				edev.desc = &desc[j];
> +				id = exynos_ppmu_find_ppmu_id(&edev);
> +
> +				switch (id) {
> +				case PPMU_PMNCNT0:
> +				case PPMU_PMNCNT1:
> +				case PPMU_PMNCNT2:
> +					desc[j].data_type = PPMU_V2_RO_DATA_CNT
> +						| PPMU_V2_WO_DATA_CNT;
> +					break;
> +				case PPMU_PMNCNT3:
> +					desc[j].data_type =
> +						PPMU_V2_EVT3_RW_DATA_CNT;
> +					break;
> +				}
> +			} else {
> +				desc[j].data_type = PPMU_RO_DATA_CNT |
> +					PPMU_WO_DATA_CNT;
> +			}
> +		}
>   
>   		j++;
>   	}
> diff --git a/include/linux/devfreq-event.h b/include/linux/devfreq-event.h
> index 4db00b02ca3f..cc160b1274c0 100644
> --- a/include/linux/devfreq-event.h
> +++ b/include/linux/devfreq-event.h
> @@ -81,14 +81,20 @@ struct devfreq_event_ops {
>    * struct devfreq_event_desc - the descriptor of devfreq-event device
>    *
>    * @name	: the name of devfreq-event device.
> + * @data_type	: the data type which is going to be counted in the register.
>    * @driver_data	: the private data for devfreq-event driver.
>    * @ops		: the operation to control devfreq-event device.
>    *
>    * Each devfreq-event device is described with a this structure.
>    * This structure contains the various data for devfreq-event device.
> + * The data_type describes what is going to be counted in the register.
> + * It might choose to count e.g. read requests, write data in bytes, etc.
> + * The full supported list of types is present in specyfic header in:
> + * include/dt-bindings/pmu/.
>    */
>   struct devfreq_event_desc {
>   	const char *name;
> +	u32 data_type;
>   	void *driver_data;
>   
>   	const struct devfreq_event_ops *ops;
> 
