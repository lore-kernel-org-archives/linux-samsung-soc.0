From: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH V2 6/7] ARM: EXYNOS5: Add the bus clock for FIMD
Date: Tue, 24 Jul 2012 08:55:55 +0900
Message-ID: <000601cd692e$b2ba7a70$182f6f50$%han@samsung.com>
References: <1342591053-7092-1-git-send-email-l.krishna@samsung.com>
 <1342591053-7092-7-git-send-email-l.krishna@samsung.com>
 <500D0C8B.3080007@samsung.com> <500D1F59.9030807@samsung.com>
 <000301cd6928$e5021660$af064320$%han@samsung.com>
 <500DE22F.5010006@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <500DE22F.5010006-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Content-language: ko
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: 'Joonyoung Shim' <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, 'Leela Krishna Amudala' <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tuesday, July 24, 2012 8:46 AM, Joonyoung Shim Wrote:
> 
> On 07/24/2012 08:14 AM, Jingoo Han wrote:
> > On Monday, July 23, 2012 6:55 PM, Joonyoung Shim wrote:
> >> Hi, Jingoo.
> >>
> >> On 07/23/2012 05:34 PM, Joonyoung Shim wrote:
> >>> On 07/18/2012 02:57 PM, Leela Krishna Amudala wrote:
> >>>> This patch adds the bus clock for FIMD and changes
> >>>> the device name for lcd clock
> >>> Please refer below patch for exynos4.
> >>>
> >>> http://lists.linaro.org/pipermail/linaro-dev/2011-December/008872.html
> >>>
> >>>> Signed-off-by: Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> >>>> ---
> >>>>    arch/arm/mach-exynos/clock-exynos5.c |    7 ++++++-
> >>>>    1 files changed, 6 insertions(+), 1 deletions(-)
> >>>>
> >>>> diff --git a/arch/arm/mach-exynos/clock-exynos5.c
> >>>> b/arch/arm/mach-exynos/clock-exynos5.c
> >>>> index 774533c..f001876 100644
> >>>> --- a/arch/arm/mach-exynos/clock-exynos5.c
> >>>> +++ b/arch/arm/mach-exynos/clock-exynos5.c
> >>>> @@ -634,6 +634,11 @@ static struct clk exynos5_init_clocks_off[] = {
> >>>>            .enable        = exynos5_clk_ip_disp1_ctrl,
> >>>>            .ctrlbit    = (1 << 3),
> >>>>        }, {
> >>>> +        .name           = "fimd",
> >>>> +        .devname        = "exynos5-fb",
> >>>> +        .enable         = exynos5_clk_ip_disp1_ctrl,
> >>>> +        .ctrlbit        = (1 << 0),
> >>>> +    }, {
> >> With this patch, it causes below error at the DP driver because fimd
> >> clock is disabled.
> >>
> >> [    0.210000] exynos-dp exynos-dp: Timeout of video streamclk ok
> >> [    0.210000] exynos-dp exynos-dp: unable to config video
> >> [    0.210000] exynos-dp: probe of exynos-dp failed with error -110
> >>
> >> I wonder fimd clock has any dependency with DP
> > FIMD pixel clock is necessary to enable DP.
> 
> So then, i think DP driver also should control FIMD pixel clock.
> Do you have any patch or plan for it?

Um, I don't think so.
Because, DP cannot work by itself.
In order to use DP, FIMD should be enabled.

If FIMD is enabled, FIMD pixel clock is enabled;
therefore, DP driver does not need to control FIMD pixel clock.

In my opinion, adding config dependency would be better, such as FB_S3C or DRM_EXYNOS_FIMD.

> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
