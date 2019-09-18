From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v1 4/9] ASoC: wm8994: Add support for MCLKn clock gating
Date: Wed, 18 Sep 2019 14:31:57 +0000
Message-ID: <20190918143157.GH10204@ediswmail.ad.cirrus.com>
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104700eucas1p1ef0775632f5c7259fb54cab8efc96c50@eucas1p1.samsung.com>
 <20190918104634.15216-5-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190918104634.15216-5-s.nawrocki@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com, broonie@kernel.org, lgirdwood@gmail.com, krzk@kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Sep 18, 2019 at 12:46:29PM +0200, Sylwester Nawrocki wrote:
> As an intermediate step before covering the clocking subsystem
> of the CODEC entirely by the clk API add handling of external CODEC's
> master clocks in DAPM events when the AIFn clocks are sourced directly
> from MCLKn; when FLLn are used we enable/disable respective MCLKn
> before/after FLLn is enabled/disabled.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> @@ -2260,8 +2321,28 @@ static int _wm8994_set_fll(struct snd_soc_component *component, int id, int src,
>  	/* Clear any pending completion from a previous failure */
>  	try_wait_for_completion(&wm8994->fll_locked[id]);
>  
> +	switch (src) {
> +	case WM8994_FLL_SRC_MCLK1:
> +		mclk = control->mclk[0].clk;
> +		break;
> +	case WM8994_FLL_SRC_MCLK2:
> +		mclk = control->mclk[1].clk;
> +		break;
> +	default:
> +		mclk = NULL;
> +	}
> +
>  	/* Enable (with fractional mode if required) */
>  	if (freq_out) {
> +		if (mclk) {
> +			ret = clk_prepare_enable(mclk);
> +			if (ret < 0) {
> +				dev_err(component->dev,
> +					"Failed to enable MCLK for FLL%d\n",
> +					id + 1);
> +				return ret;
> +			}
> +		}
>  		/* Enable VMID if we need it */
>  		if (!was_enabled) {
>  			active_reference(component);
> @@ -2315,6 +2396,8 @@ static int _wm8994_set_fll(struct snd_soc_component *component, int id, int src,
>  
>  			active_dereference(component);
>  		}
> +		if (mclk)
> +			clk_disable_unprepare(mclk);

I don't think this works in the case of changing active FLLs.
The driver looks like it allows changing the FLL configuration
whilst the FLL is already active in which case it you would have
two wm8994_set_fll calls enabling the FLL but only a single one
disabling it. Resulting in the FLL being off but the MCLK being
left enabled.

Thanks,
Charles
