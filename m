From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 1/3] opp: core: add regulators enable and disable
Date: Tue, 9 Jul 2019 11:10:14 +0530
Message-ID: <20190709054014.o3g4e6gbovrq3vvn@vireshk-i7>
References: <20190708141140.24379-1-k.konieczny@partner.samsung.com>
 <CGME20190708141159eucas1p1751506975ff96a436e14940916623722@eucas1p1.samsung.com>
 <20190708141140.24379-2-k.konieczny@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190708141140.24379-2-k.konieczny@partner.samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: k.konieczny@partner.samsung.com
Cc: Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, devicetree@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 08-07-19, 16:11, k.konieczny@partner.samsung.com wrote:
> From: Kamil Konieczny <k.konieczny@partner.samsung.com>
> 
> Add enable regulators to dev_pm_opp_set_regulators() and disable
> regulators to dev_pm_opp_put_regulators(). This prepares for
> converting exynos-bus devfreq driver to use dev_pm_opp_set_rate().
> 
> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
> ---
>  drivers/opp/core.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> index 0e7703fe733f..947cac452854 100644
> --- a/drivers/opp/core.c
> +++ b/drivers/opp/core.c
> @@ -1580,8 +1580,19 @@ struct opp_table *dev_pm_opp_set_regulators(struct device *dev,
>  	if (ret)
>  		goto free_regulators;
>  
> +	for (i = 0; i < opp_table->regulator_count; i++) {
> +		ret = regulator_enable(opp_table->regulators[i]);
> +		if (ret < 0)
> +			goto disable;
> +	}

I am wondering on why is this really required as this isn't done for
any other platform, probably because the regulators are enabled by
bootloader and are always on.

-- 
viresh
