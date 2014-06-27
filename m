From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH V3 1/7] drm/exynos: Support DP CLKCON register in FIMD
 driver
Date: Fri, 27 Jun 2014 15:09:09 +0200
Message-ID: <53AD6CF5.7080904@gmail.com>
References: <1403863946-15492-1-git-send-email-ajaykumar.rs@samsung.com>	<1403863946-15492-2-git-send-email-ajaykumar.rs@samsung.com>	<53AD53E4.2020706@samsung.com>	<CAEC9eQMXEEq_VBiZY+BHUuVWvbi7q4MkbbQ-XkcigtZBdgwO9w@mail.gmail.com>	<53AD6734.9080909@samsung.com>
 <CAEC9eQPY+W_Wni7PLtWkHr0QrHW+G8x_+XWapV5tDiKebn=zpA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAEC9eQPY+W_Wni7PLtWkHr0QrHW+G8x_+XWapV5tDiKebn=zpA@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ajay kumar <ajaynumb@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>
Cc: "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 27.06.2014 15:02, Ajay kumar wrote:
> Hi Andrej,
> 
> On Fri, Jun 27, 2014 at 6:14 PM, Andrzej Hajda <a.hajda@samsung.com> wrote:
>> On 06/27/2014 01:48 PM, Ajay kumar wrote:
>>> Hi Andrej,
>>>
>>> On Fri, Jun 27, 2014 at 4:52 PM, Andrzej Hajda <a.hajda@samsung.com> wrote:
>>>> Hi Ajay,
>>>>
>>>> +CC DT
>>>>
>>>> On 06/27/2014 12:12 PM, Ajay Kumar wrote:
>>>>> Add the missing setting for DP CLKCON register.
>>>>>
>>>>> This register is present on Exynos5 based FIMD controllers,
>>>>> and needs to be set if we are using DP.
>>>>>
>>>>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>>>>> ---
>>>>>  .../devicetree/bindings/video/samsung-fimd.txt     |    1 +
>>>>>  drivers/gpu/drm/exynos/exynos_drm_fimd.c           |   23 ++++++++++++++++++++
>>>>>  include/video/samsung_fimd.h                       |    4 ++++
>>>>>  3 files changed, 28 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/video/samsung-fimd.txt b/Documentation/devicetree/bindings/video/samsung-fimd.txt
>>>>> index 2dad41b..12f3d7a 100644
>>>>> --- a/Documentation/devicetree/bindings/video/samsung-fimd.txt
>>>>> +++ b/Documentation/devicetree/bindings/video/samsung-fimd.txt
>>>>> @@ -41,6 +41,7 @@ Optional Properties:
>>>>>  - samsung,power-domain: a phandle to FIMD power domain node.
>>>>>  - samsung,invert-vden: video enable signal is inverted
>>>>>  - samsung,invert-vclk: video clock signal is inverted
>>>>> +- samsung,output-type: Type of display output interface(DPI=0, DSI=1, DP=2)
>>>> There is no point in introducing this property. Exynos DRM have already
>>>> logic which creates pipeline: fimd --> DPI|DSI|DP, this logic can be
>>>> reused to determine display type. It can be done even without any
>>>> additional callbacks, just by checking if there is connector of
>>>> DRM_MODE_CONNECTOR_eDP type connected to fimd.
>>> The mapping between crtc(struct exynos_drm_manager) and encoder(struct
>>> exynos_drm_display)
>>> in exynos drm happens by matching the exynos_drm_output_type variable in each
>>> structure.
>>> exynos_drm_output_type supports 3 types: LCD, HDMI and VIDI.
>>> FIMD statically chooses EXYNOS_DISPLAY_TYPE_LCD as the output type,
>>> and both DP and MIPI statically choose the same enum EXYNOS_DISPLAY_TYPE_LCD,
>>> as output type.
>>> So, we cannot use that logic to differentiate between DP/MIPI DSI.
>>>
>>> Also, checking based on connector type doesn't hold good.
>>> The connector type will be DRM_MODE_CONNECTOR_LVDS in case of
>>> DP->LVDS or MIPI->LVDS panels!
>>
>> True, I forgot about bridges. So additional callback/field is necessary.
>> See below.
>>
>>>
>>> Thanks and regards,
>>> Ajay Kumar
>>>
>>>> Regards
>>>> Andrzej
>>>>
>>>>>  - display-timings: timing settings for FIMD, as described in document [1].
>>>>>               Can be used in case timings cannot be provided otherwise
>>>>>               or to override timings provided by the panel.
>>>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>>>>> index 33161ad..aa74e90 100644
>>>>> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>>>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>>>>> @@ -72,6 +72,7 @@ struct fimd_driver_data {
>>>>>       unsigned int has_shadowcon:1;
>>>>>       unsigned int has_clksel:1;
>>>>>       unsigned int has_limited_fmt:1;
>>>>> +     unsigned int has_dp_clkcon:1;
>>>>>  };
>>>>>
>>>>>  static struct fimd_driver_data s3c64xx_fimd_driver_data = {
>>>>> @@ -88,6 +89,13 @@ static struct fimd_driver_data exynos4_fimd_driver_data = {
>>>>>  static struct fimd_driver_data exynos5_fimd_driver_data = {
>>>>>       .timing_base = 0x20000,
>>>>>       .has_shadowcon = 1,
>>>>> +     .has_dp_clkcon = 1,
>>>>> +};
>>>>> +
>>>>> +enum exynos_fimd_output_type {
>>>>> +     EXYNOS_FIMD_OUTPUT_DPI,
>>>>> +     EXYNOS_FIMD_OUTPUT_DSI,
>>>>> +     EXYNOS_FIMD_OUTPUT_DP,
>>>>>  };
>>>>>
>>>>>  struct fimd_win_data {
>>>>> @@ -125,6 +133,8 @@ struct fimd_context {
>>>>>       struct exynos_drm_panel_info panel;
>>>>>       struct fimd_driver_data *driver_data;
>>>>>       struct exynos_drm_display *display;
>>>>> +
>>>>> +     enum exynos_fimd_output_type exynos_fimd_output_type;
>>>>>  };
>>>>>
>>>>>  static const struct of_device_id fimd_driver_dt_match[] = {
>>>>> @@ -331,6 +341,10 @@ static void fimd_commit(struct exynos_drm_manager *mgr)
>>>>>       if (clkdiv > 1)
>>>>>               val |= VIDCON0_CLKVAL_F(clkdiv - 1) | VIDCON0_CLKDIR;
>>>>>
>>>>> +     if (ctx->driver_data->has_dp_clkcon &&
>>>>> +             ctx->exynos_fimd_output_type == EXYNOS_FIMD_OUTPUT_DP)
>>>>> +             writel(DP_CLK_ENABLE, ctx->regs + DP_CLKCON);
>>>>> +
>>>>>       writel(val, ctx->regs + VIDCON0);
>>
>> New code should not split VIDCON0 related code.It should be moved few
>> lines above or few lines below.
> Ok, for better readability.
> 
>> Anyway this code should be rather placed in power related functions of
>> dp encoder, as it enables dp. The only question
>> is if DP_CLKCON update can be performed after VIDCON0 update. If yes the
>> solution of the whole problem
> I will check this.
> 
>> seems to be simple:
>> - fimd should provide function fimd_set_dp_clk_gate or sth similar,
>> - this function should be called in exynos_dp_poweron/exynos_dp_poweroff.
>> I hope I have not missed anything this time.
> But, it won't look good to export a FIMD function which sets a FIMD register,
> and call it in DP driver!
> What does Inki/Jingoo have to say about this?

It looks much better than exporting knowledge already existing in Exynos
DRM subsystem to firmware interface, though, and this approach can be
easily modified in future, as opposed to _stable_ DT bindings.

Best regards,
Tomasz
