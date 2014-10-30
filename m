From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [RFT v3 06/14] regulator: max77802: Remove support for board
 files
Date: Thu, 30 Oct 2014 13:21:00 +0100
Message-ID: <54522D2C.9050002@collabora.co.uk>
References: <1414668053-31370-1-git-send-email-k.kozlowski@samsung.com> <1414668053-31370-7-git-send-email-k.kozlowski@samsung.com> <54522615.7040002@collabora.co.uk> <1414671037.23399.2.camel@AMDC1943>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1414671037.23399.2.camel@AMDC1943>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 10/30/2014 01:10 PM, Krzysztof Kozlowski wrote:
>> 
>> I may be missing something but I don't understand why a compatible string
>> for the regulators sub-node is needed. Isn't enough to just fill the
>> .regulators_node field in the struct regulator_desc? e.g:
>> 
>>     .regulators_node = of_match_ptr("regulators") for max77802
>>     .regulators_node = of_match_ptr("voltage-regulators") for max77686
>> 
>> AFAIU this should be enough for the core to extract the init_data and will
>> make your change much more simpler and you can drop patches 1-3 and 13-14.
>> 
>> Or maybe I misread the regulator_of_get_init_data() function?
> 
> The regulator_of_get_init_data() searches from dev->of_node or its child
> node.
> 
> But dev->of_node is NULL.
> 
> That's why of_compatible is needed.

Yes but regulator_register() does dev = config->dev and config->dev is set
to config.dev = iodev->dev in the driver probe function which is the
pdev->dev.parent (the PMIC struct device) that has an associated of_node.

So, regulator_of_get_init_data() will call of_get_child_by_name() passing
the PMIC of_node and the sub-node name that contains the regulators. That
is, whatever was set in desc->regulators_node and that should be enough.

Best regards,
Javier
