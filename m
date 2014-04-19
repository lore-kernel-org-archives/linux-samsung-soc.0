From: YoungJun Cho <yj44.cho@samsung.com>
Subject: Re: [RFC PATCH 02/14] drm/exynos: dsi: delay setting clocks after
 reset
Date: Sun, 20 Apr 2014 07:30:10 +0900
Message-ID: <5352F8F2.9040003@samsung.com>
References: <1397540862-21359-1-git-send-email-yj44.cho@samsung.com>
 <1397540862-21359-3-git-send-email-yj44.cho@samsung.com>
 <53511774.7030607@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <53511774.7030607@samsung.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Andrzej

Thank you for comments.

On 04/18/2014 09:15 PM, Andrzej Hajda wrote:
> Hi YoungJun,
>
> Thanks for the whole patchset.
>
> On 04/15/2014 07:47 AM, YoungJun Cho wrote:
>> Some phy control registers are not kept after software reset.
>> So this patch makes the clocks containing phy control to be set
>> after software reset.
>>
>> Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
>> Signed-off-by: Inki Dae <inki.dae@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>>   drivers/gpu/drm/exynos/exynos_drm_dsi.c |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> index 956e5f3..2cf1f0b 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> @@ -946,10 +946,10 @@ static irqreturn_t exynos_dsi_irq(int irq, void *dev_id)
>>
>>   static int exynos_dsi_init(struct exynos_dsi *dsi)
>>   {
>> -	exynos_dsi_enable_clock(dsi);
>>   	exynos_dsi_reset(dsi);
>>   	enable_irq(dsi->irq);
>>   	exynos_dsi_wait_for_reset(dsi);
>> +	exynos_dsi_enable_clock(dsi);
>>   	exynos_dsi_init_link(dsi);
>>
>>   	return 0;
> Are you sure this sequence is OK? I have observed that sequence:
>
> dsi power off
> dsi power on
> dsi_reset
>
> on 4210 or 4412 resulted in lack of irq after reset, only enabling
> clocks helped.
> And according to documentation reset do not touch registers set by
> exynos_dsi_enable_clock,
> so the current solution should work.

As I mentioned in description, it came from phy control registers.
Fortunately Exynos4 SoCs are safe, but the DSIM_PHYCTRL_REG,
DSIM_PHYTIMING_REG, DSIM_PHYTIMING1_REG and DSIM_PHYTIMING2_REG are
affected which are used in exynos_dsi_set_pll() for Exynos5 SoCs.

So this patch is required for Exynos5 SoCs.

Thank you
best regards YJ

>
> Regards
> Andrzej
>
