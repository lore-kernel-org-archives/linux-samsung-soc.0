From: YoungJun Cho <yj44.cho@samsung.com>
Subject: Re: [RFC v2 PATCH 02/14] drm/exynos: dsi: delay setting clocks after
 reset
Date: Wed, 23 Apr 2014 10:01:20 +0900
Message-ID: <535710E0.40702@samsung.com>
References: <1398083321-8668-1-git-send-email-yj44.cho@samsung.com>
 <1398083321-8668-3-git-send-email-yj44.cho@samsung.com>
 <53565D54.1050609@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <53565D54.1050609@samsung.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sachin.kamat@linaro.org, sw0312.kim@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Andrzej

Thank you for comments.

On 04/22/2014 09:15 PM, Andrzej Hajda wrote:
> Hi YoungJun,
>
> On 04/21/2014 02:28 PM, YoungJun Cho wrote:
>> Some phy control registers are not kept after software reset.
>> So this patch makes the clocks containing phy control to be set
>> after software reset.
>>
>> Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
>> Acked-by: Inki Dae <inki.dae@samsung.com>
>> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
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
>
> I have commented it in the previous version of the patchset. I repeat it
> again.
> This is a regression, on exynos4210-trats I have 'timeout waiting for
> reset' message after dpms off, on.

I'm really sorry for that. I misunderstood last time.

I think the original codes were correct, because the reset timeout would
be occurred without clock activation.

I'll check and fix again.
(By the way, why am I ok?)

>
> I will comment your previous answer here to make the discussion easier:
>> As I mentioned in description, it came from phy control registers.
>> Fortunately Exynos4 SoCs are safe, but the DSIM_PHYCTRL_REG,
>> DSIM_PHYTIMING_REG, DSIM_PHYTIMING1_REG and DSIM_PHYTIMING2_REG are
>> affected which are used in exynos_dsi_set_pll() for Exynos5 SoCs.
>>
>> So this patch is required for Exynos5 SoCs.
>
> In the moment this patch is applied exynos_dsi_set_pll do not touch phy
> registers you have mentioned.
> Your change would be more clear if it will be merged together with the
> patch adding PHYCTRL settings.
>
> Anyway, solution is simple - please set PHY registers after reset and
> configure clocks before reset to avoid
> reset timeouts, is there any reason to not do it this way?

The only reason is that the PHY control is related with PLL control and
that was in exynos_dsi_enable_clock() call path.
So I just wanted to keep current sequence.

If there is no way to use previous one, I'll consider your approach.

Thank you.
Best regards YJ

>
> Regards
> Andrzej
>
