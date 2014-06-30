From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH V3 1/7] drm/exynos: Support DP CLKCON register in FIMD
 driver
Date: Mon, 30 Jun 2014 10:14:17 +0900
Message-ID: <00a501cf9400$9d396950$d7ac3bf0$%han@samsung.com>
References: <1403863946-15492-1-git-send-email-ajaykumar.rs@samsung.com>
 <1403863946-15492-2-git-send-email-ajaykumar.rs@samsung.com>
 <53AD53E4.2020706@samsung.com>
 <CAEC9eQMXEEq_VBiZY+BHUuVWvbi7q4MkbbQ-XkcigtZBdgwO9w@mail.gmail.com>
 <53AD6734.9080909@samsung.com>
 <CAEC9eQPY+W_Wni7PLtWkHr0QrHW+G8x_+XWapV5tDiKebn=zpA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <CAEC9eQPY+W_Wni7PLtWkHr0QrHW+G8x_+XWapV5tDiKebn=zpA@mail.gmail.com>
Content-language: ko
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: 'Ajay kumar' <ajaynumb@gmail.com>, 'Andrzej Hajda' <a.hajda@samsung.com>
Cc: "'open list:OPEN FIRMWARE AND...'" <devicetree@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, 'Sean Paul' <seanpaul@google.com>, 'sunil joshi' <joshi@samsung.com>, dri-devel@lists.freedesktop.org, 'Prashanth G' <prashanth.g@samsung.com>, 'Ajay Kumar' <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Friday, June 27, 2014 10:03 PM, Ajay kumar wrote:
> On Fri, Jun 27, 2014 at 6:14 PM, Andrzej Hajda <a.hajda@samsung.com> wrote:
> > On 06/27/2014 01:48 PM, Ajay kumar wrote:
> >> On Fri, Jun 27, 2014 at 4:52 PM, Andrzej Hajda <a.hajda@samsung.com> wrote:
> >>> +CC DT
> >>>
> >>> On 06/27/2014 12:12 PM, Ajay Kumar wrote:
> >>>> Add the missing setting for DP CLKCON register.
> >>>>
> >>>> This register is present on Exynos5 based FIMD controllers,
> >>>> and needs to be set if we are using DP.
> >>>>
> >>>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> >>>> ---
> >>>>  .../devicetree/bindings/video/samsung-fimd.txt     |    1 +
> >>>>  drivers/gpu/drm/exynos/exynos_drm_fimd.c           |   23 ++++++++++++++++++++
> >>>>  include/video/samsung_fimd.h                       |    4 ++++
> >>>>  3 files changed, 28 insertions(+)

[.....]

> >>>>  static const struct of_device_id fimd_driver_dt_match[] = {
> >>>> @@ -331,6 +341,10 @@ static void fimd_commit(struct exynos_drm_manager *mgr)
> >>>>       if (clkdiv > 1)
> >>>>               val |= VIDCON0_CLKVAL_F(clkdiv - 1) | VIDCON0_CLKDIR;
> >>>>
> >>>> +     if (ctx->driver_data->has_dp_clkcon &&
> >>>> +             ctx->exynos_fimd_output_type == EXYNOS_FIMD_OUTPUT_DP)
> >>>> +             writel(DP_CLK_ENABLE, ctx->regs + DP_CLKCON);
> >>>> +
> >>>>       writel(val, ctx->regs + VIDCON0);
> >
> > New code should not split VIDCON0 related code.It should be moved few
> > lines above or few lines below.
> Ok, for better readability.
> 
> > Anyway this code should be rather placed in power related functions of
> > dp encoder, as it enables dp. The only question
> > is if DP_CLKCON update can be performed after VIDCON0 update. If yes the
> > solution of the whole problem
> I will check this.
> 
> > seems to be simple:
> > - fimd should provide function fimd_set_dp_clk_gate or sth similar,
> > - this function should be called in exynos_dp_poweron/exynos_dp_poweroff.
> > I hope I have not missed anything this time.
> But, it won't look good to export a FIMD function which sets a FIMD register,
> and call it in DP driver!
> What does Inki/Jingoo have to say about this?

I agree with Ajay Kumar's opinion.
It doesn't look good to export the function to set FIMD register
and call it by DP driver.

Best regards,
Jingoo Han
> 
> Regards,
> Ajay
> 
[....]
