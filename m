From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v1 7/9] ASoC: samsung: arndale: Add support for WM1811
 CODEC
Date: Wed, 18 Sep 2019 14:45:53 +0000
Message-ID: <20190918144553.GJ10204@ediswmail.ad.cirrus.com>
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104705eucas1p1c01dc05bff199188677915e2bb8f7472@eucas1p1.samsung.com>
 <20190918104634.15216-8-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190918104634.15216-8-s.nawrocki@samsung.com>
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

On Wed, Sep 18, 2019 at 12:46:32PM +0200, Sylwester Nawrocki wrote:
> The Arndale boards come with different types of the audio daughter
> board.  In order to support the WM1811 one we add new definition of
> an ASoC card which will be registered when the driver matches on
> "samsung,arndale-wm1811" compatible.  There is no runtime detection of
> the audio daughter board type at the moment, compatible string of the
> audio card needs to be adjusted in DT, e.g. by the bootloader,
> depending on actual audio board (CODEC) used.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> -static const struct of_device_id samsung_arndale_rt5631_of_match[] __maybe_unused = {
> -	{ .compatible = "samsung,arndale-rt5631", },
> -	{ .compatible = "samsung,arndale-alc5631", },
> +static const struct of_device_id arndale_audio_of_match[] __maybe_unused = {

If your removing the of_match_ptr below I think the
__maybe_unused should be removed as well.

Thanks,
Charles

> +	{ .compatible = "samsung,arndale-rt5631",  .data = &arndale_rt5631 },
> +	{ .compatible = "samsung,arndale-alc5631", .data = &arndale_rt5631 },
> +	{ .compatible = "samsung,arndale-wm1811",  .data = &arndale_wm1811 },
>  	{},
>  };
> -MODULE_DEVICE_TABLE(of, samsung_arndale_rt5631_of_match);
> +MODULE_DEVICE_TABLE(of, arndale_of_match);
>  
>  static struct platform_driver arndale_audio_driver = {
>  	.driver = {
> -		.name   = "arndale-audio",
> +		.name = "arndale-audio",
>  		.pm = &snd_soc_pm_ops,
> -		.of_match_table = of_match_ptr(samsung_arndale_rt5631_of_match),
> +		.of_match_table = arndale_audio_of_match,
