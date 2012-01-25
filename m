From: Karol Lewandowski <k.lewandowsk@samsung.com>
Subject: Re: [PATCH v2 2/2] regulator: add device tree support for max8997
Date: Wed, 25 Jan 2012 10:55:49 +0100
Message-ID: <4F1FD1A5.1060305@samsung.com>
References: <1326353738-26864-1-git-send-email-thomas.abraham@linaro.org>
 <1326353738-26864-3-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1326353738-26864-3-git-send-email-thomas.abraham@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-kernel@vger.kernel.org, rpurdie@rpsys.net, rob.herring@calxeda.com, grant.likely@secretlab.ca, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, myungjoo.ham@samsung.com, kyungmin.park@samsung.com, dg77.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Rajendra Nayak <rnayak@ti.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 12.01.2012 08:35, Thomas Abraham wrote:
> Add device tree based discovery support for max8997.

> +static int max8997_pmic_dt_parse_pdata(struct max8997_dev *iodev,
> +					struct max8997_platform_data *pdata)
> +{

> +	pdata->regulators = rdata;
> +	for_each_child_of_node(regulators_np, reg_np) {
> +		for (i = 0; i<  ARRAY_SIZE(regulators); i++)
> +			if (!of_node_cmp(reg_np->name, regulators[i].name))
> +				break;
> +		rdata->id = i;
> +		rdata->initdata = of_get_regulator_init_data(
> +						iodev->dev, reg_np);

One more thing - of_get_regulator_init_data() will set apply_uV to 1 so 
we need to reset it for BUCK6, which doesn't provide set_voltage() ops, 
like:

	if (rdata->initdata && regulators[i].id == MAX8997_BUCK6)
		rdata->initdata->constraints.apply_uV = 0;

Thanks
