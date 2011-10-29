From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 3/3] ARM: EXYNOS: Support ASV for Exynos4210
Date: Sat, 29 Oct 2011 09:38:12 +0100
Message-ID: <20111029083812.GV19187@n2100.arm.linux.org.uk>
References: <1319677938-25732-1-git-send-email-boyko.lee@samsung.com>
	<1319677938-25732-4-git-send-email-boyko.lee@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1319677938-25732-4-git-send-email-boyko.lee@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jongpill Lee <boyko.lee@samsung.com>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Oct 27, 2011 at 10:12:18AM +0900, Jongpill Lee wrote:
> +static int exynos4210_asv_pre_clock_init(void)
> +{
> +	struct clk *clk_hpm;
> +	struct clk *clk_copy;
> +	struct clk *clk_parent;
> +
> +	/* PWI clock setting */
> +	clk_copy = clk_get(NULL, "sclk_pwi");
> +	if (IS_ERR(clk_copy)) {
> +		pr_info("EXYNOS4210: ASV : SCLK_PWI clock get error\n");
> +		return -EINVAL;
> +	} else {
> +		clk_parent = clk_get(NULL, "xusbxti");
> +
> +		if (IS_ERR(clk_parent)) {
> +			pr_info("EXYNOS4210: ASV: MOUT_APLL clock get error\n");
> +			clk_put(clk_copy);
> +			return -EINVAL;
> +		}
> +		if (clk_set_parent(clk_copy, clk_parent))
> +			pr_info("EXYNOS4210: ASV: Unable to set parent %s of clock %s.\n",
> +					clk_parent->name, clk_copy->name);
> +
> +		clk_put(clk_parent);
> +	}
> +	clk_set_rate(clk_copy, 4800000);
> +
> +	clk_put(clk_copy);

This looks really weird - if something is using a clock, the reference
to the struct clk is supposed to be held all the time that the clock is
being used.  Plus there's nothing to enable the clock itself (so it's
probably disabled).
