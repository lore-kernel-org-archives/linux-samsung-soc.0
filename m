From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH] drm/exynos: Support DP CLKCON register in FIMD driver
Date: Tue, 24 Jun 2014 16:15:02 +0200
Message-ID: <53A987E6.8090609@samsung.com>
References: <1403608164-23728-1-git-send-email-ajaykumar.rs@samsung.com>
 <53A9769A.5030907@samsung.com>
 <CAEC9eQNWrejZmXtYNoc3w6SF05kOXh2QPjDM0A73pssE=kEeTQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <CAEC9eQNWrejZmXtYNoc3w6SF05kOXh2QPjDM0A73pssE=kEeTQ@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ajay kumar <ajaynumb@gmail.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 06/24/2014 03:14 PM, Ajay kumar wrote:
> On Tue, Jun 24, 2014 at 9:01 AM, Andrzej Hajda <a.hajda@samsung.com> wrote:
>> Hi Ajay,
>>
>> On 06/24/2014 01:09 PM, Ajay Kumar wrote:
>>> Add the missing setting for DP CLKCON register.
>>>
>>> This register is present on Exynos5 based FIMD controllers,
>>> and needs to be used if we are using DP.
>>>
>>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>>> ---
>>>  drivers/gpu/drm/exynos/exynos_drm_fimd.c |    5 +++++
>>>  include/video/samsung_fimd.h             |    4 ++++
>>>  2 files changed, 9 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>>> index 33161ad..5d3045d 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>>> @@ -72,6 +72,7 @@ struct fimd_driver_data {
>>>       unsigned int has_shadowcon:1;
>>>       unsigned int has_clksel:1;
>>>       unsigned int has_limited_fmt:1;
>>> +     unsigned int has_dp_clkcon:1;
>>>  };
>>>
>>>  static struct fimd_driver_data s3c64xx_fimd_driver_data = {
>>> @@ -88,6 +89,7 @@ static struct fimd_driver_data exynos4_fimd_driver_data = {
>>>  static struct fimd_driver_data exynos5_fimd_driver_data = {
>>>       .timing_base = 0x20000,
>>>       .has_shadowcon = 1,
>>> +     .has_dp_clkcon = 1,
>>>  };
>>>
>>>  struct fimd_win_data {
>>> @@ -331,6 +333,9 @@ static void fimd_commit(struct exynos_drm_manager *mgr)
>>>       if (clkdiv > 1)
>>>               val |= VIDCON0_CLKVAL_F(clkdiv - 1) | VIDCON0_CLKDIR;
>>>
>>> +     if (ctx->driver_data->has_dp_clkcon)
>>> +             writel(DP_CLK_ENABLE, ctx->regs + DP_CLKCON);
>>> +
>> This code always enables the clock on exynos5. As I understand it should
>> be enabled only if DP is used.
> Right!
> But, when I searched for the display interface,
> only exynos4 based boards use MIPI/DPI, and all exynos5 based boards use DP.
> So, I thought adding this in driver_data for exynos5 should be fine.

Arndale and Arndale-Octa have MIPI/DSI interface with MIPI/LVDS bridge.

>
> Inki/Andrej - Shall I add it as an optional DT property?

No, property is redundant. The simplest solution could be to use
CONFIG_DRM_EXYNOS_DP
macro but it is quite ugly.
I guess extending little bit exynos_drm framework to allow detection of
DP in fimd would be better.

Regards
Andrzej

>
> Ajay
>>
>>>       writel(val, ctx->regs + VIDCON0);
>>>  }
>>>
>>> diff --git a/include/video/samsung_fimd.h b/include/video/samsung_fimd.h
>>> index b039320..d8f4b0b 100644
>>> --- a/include/video/samsung_fimd.h
>>> +++ b/include/video/samsung_fimd.h
>>> @@ -435,6 +435,10 @@
>>>  #define BLENDCON_NEW_8BIT_ALPHA_VALUE                (1 << 0)
>>>  #define BLENDCON_NEW_4BIT_ALPHA_VALUE                (0 << 0)
>>>
>>> +/* Video clock enable for DP */
>>> +#define DP_CLKCON                            0x27C
>>> +#define DP_CLK_ENABLE                                0x2
>>> +
>>>  /* Notes on per-window bpp settings
>>>   *
>>>   * Value     Win0     Win1     Win2     Win3     Win 4
>>>
