From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 3/4] clk: exynos4: enable clk_set_parent() propagation for
 sclk_hdmi and sclk_mixer clocks
Date: Tue, 08 Apr 2014 17:49:38 +0200
Message-ID: <53441A92.7010108@samsung.com>
References: <1396623201-26000-1-git-send-email-t.stanislaws@samsung.com>
 <1396623201-26000-4-git-send-email-t.stanislaws@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1396623201-26000-4-git-send-email-t.stanislaws@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Tomasz Stanislawski <t.stanislaws@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, mturquette@linaro.org, sw0312.kim@samsung.com, rob.herring@calxeda.com, kishon@ti.com, a.hajda@samsung.com, kyungmin.park@samsung.com, sylvester.nawrocki@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

On 04.04.2014 16:53, Tomasz Stanislawski wrote:
> This patch enables clk_set_parent() propagation for clocks used
> by s5p-tv and exynos-drm drivers.
>
> Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
> ---
>   drivers/clk/samsung/clk-exynos4.c |    6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
> index 528f8eb..87b8264 100644
> --- a/drivers/clk/samsung/clk-exynos4.c
> +++ b/drivers/clk/samsung/clk-exynos4.c
> @@ -680,7 +680,8 @@ static struct samsung_gate_clock exynos4_gate_clks[] __initdata = {
>   	 * the device name and clock alias names specified below for some
>   	 * of the clocks can be removed.
>   	 */
> -	GATE(CLK_SCLK_HDMI, "sclk_hdmi", "mout_hdmi", SRC_MASK_TV, 0, 0, 0),
> +	GATE(CLK_SCLK_HDMI, "sclk_hdmi", "mout_hdmi", SRC_MASK_TV, 0,
> +		CLK_SET_PARENT_PARENT, 0),
>   	GATE(CLK_SCLK_SPDIF, "sclk_spdif", "mout_spdif", SRC_MASK_PERIL1, 8, 0,
>   		0),
>   	GATE(CLK_JPEG, "jpeg", "aclk160", GATE_IP_CAM, 6, 0, 0),
> @@ -880,7 +881,8 @@ static struct samsung_gate_clock exynos4210_gate_clks[] __initdata = {
>   			E4210_SRC_MASK_LCD1, 12, CLK_SET_RATE_PARENT, 0),
>   	GATE(CLK_SCLK_SATA, "sclk_sata", "div_sata",
>   			SRC_MASK_FSYS, 24, CLK_SET_RATE_PARENT, 0),
> -	GATE(CLK_SCLK_MIXER, "sclk_mixer", "mout_mixer", SRC_MASK_TV, 4, 0, 0),
> +	GATE(CLK_SCLK_MIXER, "sclk_mixer", "mout_mixer", SRC_MASK_TV, 4,
> +			CLK_SET_PARENT_PARENT, 0),
>   	GATE(CLK_SCLK_DAC, "sclk_dac", "mout_dac", SRC_MASK_TV, 8, 0, 0),
>   	GATE(CLK_TSADC, "tsadc", "aclk100", GATE_IP_PERIL, 15,
>   			0, 0),
>

Looks fine, but since it depends on patch 1/4, which needs to be 
discussed a bit, I'll hold on with applying it for now.

Best regards,
Tomasz
