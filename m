From: YoungJun Cho <yj44.cho@samsung.com>
Subject: Re: [RFC v3 PATCH v2 10/16] drm/exynos: dsi: add driver data to
 support Exynos5420
Date: Wed, 07 May 2014 09:48:25 +0900
Message-ID: <536982D9.2040309@samsung.com>
References: <1398563412-21781-1-git-send-email-yj44.cho@samsung.com>
 <1398563412-21781-11-git-send-email-yj44.cho@samsung.com>
 <536775A9.3010005@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <536775A9.3010005@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrzej Hajda <a.hajda@samsung.com>, airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Andrzej,

Thank you for comments.

On 05/05/2014 08:27 PM, Andrzej Hajda wrote:
> On 04/27/2014 03:50 AM, YoungJun Cho wrote:
>> The offset of register DSIM_PLLTMR_REG in Exynos5420 is different
>> from the one in Exynos4 SoC.
>>
>> In case of Exynos5420 SoC, there is no frequency band bit in DSIM_PLLCTRL_REG,
>> and it uses DSIM_PHYCTRL_REG and DSIM_PHYTIMING*_REG instead.
>> So this patch adds driver data to distinguish it.
>>
>> Changelog v2:
>> - Moves exynos_dsi_enable_clocks() after exynos_dsi_reset()
>>    (commented by Andrzej Hajda)
>> - Splits D-PHY control setting routines from PLL setting one
>>    (commented by Andrzej Hajda)
>>
>> Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
>> Acked-by: Inki Dae <inki.dae@samsung.com>
>> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>>   drivers/gpu/drm/exynos/exynos_drm_dsi.c |  154 ++++++++++++++++++++++++++-----
>>   1 file changed, 132 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> index 4a918ec..c18dba3 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> @@ -17,6 +17,7 @@
>>
>>   #include <linux/clk.h>
>>   #include <linux/irq.h>
>> +#include <linux/of_device.h>
>>   #include <linux/phy/phy.h>
>>   #include <linux/regulator/consumer.h>
>>
>> @@ -54,9 +55,12 @@
>>
>>   /* FIFO memory AC characteristic register */
>>   #define DSIM_PLLCTRL_REG	0x4c	/* PLL control register */
>> -#define DSIM_PLLTMR_REG		0x50	/* PLL timer register */
>>   #define DSIM_PHYACCHR_REG	0x54	/* D-PHY AC characteristic register */
>>   #define DSIM_PHYACCHR1_REG	0x58	/* D-PHY AC characteristic register1 */
>> +#define DSIM_PHYCTRL_REG	0x5c
>> +#define DSIM_PHYTIMING_REG	0x64
>> +#define DSIM_PHYTIMING1_REG	0x68
>> +#define DSIM_PHYTIMING2_REG	0x6c
>>
>>   /* DSIM_STATUS */
>>   #define DSIM_STOP_STATE_DAT(x)		(((x) & 0xf) << 0)
>> @@ -200,6 +204,21 @@
>>   #define DSIM_PLL_M(x)			((x) << 4)
>>   #define DSIM_PLL_S(x)			((x) << 1)
>>
>> +/* DSIM_PHYTIMING */
>> +#define DSIM_PHYTIMING_LPX(x)		((x) << 8)
>> +#define DSIM_PHYTIMING_HS_EXIT(x)	((x) << 0)
>> +
>> +/* DSIM_PHYTIMING1 */
>> +#define DSIM_PHYTIMING1_CLK_PREPARE(x)	((x) << 24)
>> +#define DSIM_PHYTIMING1_CLK_ZERO(x)	((x) << 16)
>> +#define DSIM_PHYTIMING1_CLK_POST(x)	((x) << 8)
>> +#define DSIM_PHYTIMING1_CLK_TRAIL(x)	((x) << 0)
>> +
>> +/* DSIM_PHYTIMING2 */
>> +#define DSIM_PHYTIMING2_HS_PREPARE(x)	((x) << 16)
>> +#define DSIM_PHYTIMING2_HS_ZERO(x)	((x) << 8)
>> +#define DSIM_PHYTIMING2_HS_TRAIL(x)	((x) << 0)
>> +
>>   #define DSI_MAX_BUS_WIDTH		4
>>   #define DSI_NUM_VIRTUAL_CHANNELS	4
>>   #define DSI_TX_FIFO_SIZE		2048
>> @@ -233,6 +252,12 @@ struct exynos_dsi_transfer {
>>   #define DSIM_STATE_INITIALIZED		BIT(1)
>>   #define DSIM_STATE_CMD_LPM		BIT(2)
>>
>> +struct exynos_dsi_driver_data {
>> +	unsigned int plltmr_reg;
>> +
>> +	unsigned int has_freqband:1;
>> +};
>> +
>>   struct exynos_dsi {
>>   	struct mipi_dsi_host dsi_host;
>>   	struct drm_connector connector;
>> @@ -262,11 +287,39 @@ struct exynos_dsi {
>>
>>   	spinlock_t transfer_lock; /* protects transfer_list */
>>   	struct list_head transfer_list;
>> +
>> +	struct exynos_dsi_driver_data *driver_data;
>>   };
>>
>>   #define host_to_dsi(host) container_of(host, struct exynos_dsi, dsi_host)
>>   #define connector_to_dsi(c) container_of(c, struct exynos_dsi, connector)
>>
>> +static struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
>> +	.plltmr_reg = 0x50,
>> +	.has_freqband = 1,
>> +};
>> +
>> +static struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
>> +	.plltmr_reg = 0x58,
>> +};
>> +
>> +static struct of_device_id exynos_dsi_of_match[] = {
>> +	{ .compatible = "samsung,exynos4210-mipi-dsi",
>> +	  .data = &exynos4_dsi_driver_data },
>> +	{ .compatible = "samsung,exynos5420-mipi-dsi",
>> +	  .data = &exynos5_dsi_driver_data },
>> +	{ }
>> +};
>
> I raise again issue of compatible string.
> Since exynos5410 DSIM contains DSIM_VERSION register, it is better
> to use this register instead of compatible string to distinguish
> device versions. So as a compatible we should use the first exynos
> chipset containing this field. AFAIK it is exynos5410.
> So the only thing you should do is to change compatible string from
> samsung,exynos5420-mipi-dsi to samsung,exynos5410-mipi-dsi.
>
>>
>> I posted RFC v3 without this try.
>>
>> Because there is no exynos5410 relevant DTS yet,
>> and making exynos5410 DTS is out of scope for this RFC.
>
>
> It is irrelevant.
>

Ok, I'll fix it.

Thank you.
Best regards YJ

> Regards
> Andrzej
>
>
>> +
>> +static inline struct exynos_dsi_driver_data *exynos_dsi_get_driver_data(
>> +						struct platform_device *pdev)
>> +{
>> +	const struct of_device_id *of_id =
>> +			of_match_device(exynos_dsi_of_match, &pdev->dev);
>> +
>> +	return (struct exynos_dsi_driver_data *)of_id->data;
>> +}
>> +
>>   static void exynos_dsi_wait_for_reset(struct exynos_dsi *dsi)
>>   {
>>   	if (wait_for_completion_timeout(&dsi->completed, msecs_to_jiffies(300)))
>> @@ -340,14 +393,9 @@ static unsigned long exynos_dsi_pll_find_pms(struct exynos_dsi *dsi,
>>   static unsigned long exynos_dsi_set_pll(struct exynos_dsi *dsi,
>>   					unsigned long freq)
>>   {
>> -	static const unsigned long freq_bands[] = {
>> -		100 * MHZ, 120 * MHZ, 160 * MHZ, 200 * MHZ,
>> -		270 * MHZ, 320 * MHZ, 390 * MHZ, 450 * MHZ,
>> -		510 * MHZ, 560 * MHZ, 640 * MHZ, 690 * MHZ,
>> -		770 * MHZ, 870 * MHZ, 950 * MHZ,
>> -	};
>> +	struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
>>   	unsigned long fin, fout;
>> -	int timeout, band;
>> +	int timeout;
>>   	u8 p, s;
>>   	u16 m;
>>   	u32 reg;
>> @@ -368,18 +416,30 @@ static unsigned long exynos_dsi_set_pll(struct exynos_dsi *dsi,
>>   			"failed to find PLL PMS for requested frequency\n");
>>   		return -EFAULT;
>>   	}
>> +	dev_dbg(dsi->dev, "PLL freq %lu, (p %d, m %d, s %d)\n", fout, p, m, s);
>>
>> -	for (band = 0; band < ARRAY_SIZE(freq_bands); ++band)
>> -		if (fout < freq_bands[band])
>> -			break;
>> +	writel(500, dsi->reg_base + driver_data->plltmr_reg);
>> +
>> +	reg = DSIM_PLL_EN | DSIM_PLL_P(p) | DSIM_PLL_M(m) | DSIM_PLL_S(s);
>> +
>> +	if (driver_data->has_freqband) {
>> +		static const unsigned long freq_bands[] = {
>> +			100 * MHZ, 120 * MHZ, 160 * MHZ, 200 * MHZ,
>> +			270 * MHZ, 320 * MHZ, 390 * MHZ, 450 * MHZ,
>> +			510 * MHZ, 560 * MHZ, 640 * MHZ, 690 * MHZ,
>> +			770 * MHZ, 870 * MHZ, 950 * MHZ,
>> +		};
>> +		int band;
>> +
>> +		for (band = 0; band < ARRAY_SIZE(freq_bands); ++band)
>> +			if (fout < freq_bands[band])
>> +				break;
>>
>> -	dev_dbg(dsi->dev, "PLL freq %lu, (p %d, m %d, s %d), band %d\n", fout,
>> -		p, m, s, band);
>> +		dev_dbg(dsi->dev, "band %d\n", band);
>>
>> -	writel(500, dsi->reg_base + DSIM_PLLTMR_REG);
>> +		reg |= DSIM_FREQ_BAND(band);
>> +	}
>>
>> -	reg = DSIM_FREQ_BAND(band) | DSIM_PLL_EN
>> -			| DSIM_PLL_P(p) | DSIM_PLL_M(m) | DSIM_PLL_S(s);
>>   	writel(reg, dsi->reg_base + DSIM_PLLCTRL_REG);
>>
>>   	timeout = 1000;
>> @@ -433,6 +493,59 @@ static int exynos_dsi_enable_clock(struct exynos_dsi *dsi)
>>   	return 0;
>>   }
>>
>> +static void exynos_dsi_set_phy_ctrl(struct exynos_dsi *dsi)
>> +{
>> +	struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
>> +	u32 reg;
>> +
>> +	if (driver_data->has_freqband)
>> +		return;
>> +
>> +	/* B D-PHY */
>> +	reg = 0x0af & 0x1ff;
>> +	writel(reg, dsi->reg_base + DSIM_PHYCTRL_REG);
>> +
>> +	/*
>> +	 * T LPX: Transmitted length of any Low-Power state period
>> +	 * T HS-EXIT: Time that the transmitter drives LP-11 following a HS
>> +	 *	burst
>> +	 */
>> +	reg = DSIM_PHYTIMING_LPX(0x06) | DSIM_PHYTIMING_HS_EXIT(0x0b);
>> +	writel(reg, dsi->reg_base + DSIM_PHYTIMING_REG);
>> +
>> +	/*
>> +	 * T CLK-PREPARE: Time that the transmitter drives the Clock Lane LP-00
>> +	 *	Line state immediately before the HS-0 Line state starting the
>> +	 *	HS transmission
>> +	 * T CLK-ZERO: Time that the transmitter drives the HS-0 state prior to
>> +	 *	transmitting the Clock.
>> +	 * T CLK_POST: Time that the transmitter continues to send HS clock
>> +	 *	after the last associated Data Lane has transitioned to LP Mode
>> +	 *	Interval is defined as the period from the end of T HS-TRAIL to
>> +	 *	the beginning of T CLK-TRAIL
>> +	 * T CLK-TRAIL: Time that the transmitter drives the HS-0 state after
>> +	 *	the last payload clock bit of a HS transmission burst
>> +	 */
>> +	reg = DSIM_PHYTIMING1_CLK_PREPARE(0x07) |
>> +			DSIM_PHYTIMING1_CLK_ZERO(0x27) |
>> +			DSIM_PHYTIMING1_CLK_POST(0x0d) |
>> +			DSIM_PHYTIMING1_CLK_TRAIL(0x08);
>> +	writel(reg, dsi->reg_base + DSIM_PHYTIMING1_REG);
>> +
>> +	/*
>> +	 * T HS-PREPARE: Time that the transmitter drives the Data Lane LP-00
>> +	 *	Line state immediately before the HS-0 Line state starting the
>> +	 *	HS transmission
>> +	 * T HS-ZERO: Time that the transmitter drives the HS-0 state prior to
>> +	 *	transmitting the Sync sequence.
>> +	 * T HS-TRAIL: Time that the transmitter drives the flipped differential
>> +	 *	state after last payload data bit of a HS transmission burst
>> +	 */
>> +	reg = DSIM_PHYTIMING2_HS_PREPARE(0x09) | DSIM_PHYTIMING2_HS_ZERO(0x0d) |
>> +			DSIM_PHYTIMING2_HS_TRAIL(0x0b);
>> +	writel(reg, dsi->reg_base + DSIM_PHYTIMING2_REG);
>> +}
>> +
>>   static void exynos_dsi_disable_clock(struct exynos_dsi *dsi)
>>   {
>>   	u32 reg;
>> @@ -947,10 +1060,11 @@ static irqreturn_t exynos_dsi_irq(int irq, void *dev_id)
>>
>>   static int exynos_dsi_init(struct exynos_dsi *dsi)
>>   {
>> -	exynos_dsi_enable_clock(dsi);
>>   	exynos_dsi_reset(dsi);
>>   	enable_irq(dsi->irq);
>> +	exynos_dsi_enable_clock(dsi);
>>   	exynos_dsi_wait_for_reset(dsi);
>> +	exynos_dsi_set_phy_ctrl(dsi);
>>   	exynos_dsi_init_link(dsi);
>>
>>   	return 0;
>> @@ -1412,6 +1526,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
>>   	dsi->dsi_host.dev = &pdev->dev;
>>
>>   	dsi->dev = &pdev->dev;
>> +	dsi->driver_data = exynos_dsi_get_driver_data(pdev);
>>
>>   	ret = exynos_dsi_parse_dt(dsi);
>>   	if (ret)
>> @@ -1516,11 +1631,6 @@ static const struct dev_pm_ops exynos_dsi_pm_ops = {
>>   	SET_SYSTEM_SLEEP_PM_OPS(exynos_dsi_suspend, exynos_dsi_resume)
>>   };
>>
>> -static struct of_device_id exynos_dsi_of_match[] = {
>> -	{ .compatible = "samsung,exynos4210-mipi-dsi" },
>> -	{ }
>> -};
>> -
>>   struct platform_driver dsi_driver = {
>>   	.probe = exynos_dsi_probe,
>>   	.remove = exynos_dsi_remove,
>>
>
>
