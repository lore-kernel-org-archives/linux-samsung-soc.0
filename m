From: Vivek Gautam <gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 3/4] ARM: Exynos5250: Add clock information for
 dwc3-exynos
Date: Wed, 23 Jan 2013 18:45:09 +0530
Message-ID: <CAFp+6iE+WvQz_rbKY2L4N2KoUeTTZYhwc3v3wU5iua_bEPN1ng@mail.gmail.com>
References: <1358257112-19595-1-git-send-email-gautam.vivek@samsung.com>
 <1358257112-19595-4-git-send-email-gautam.vivek@samsung.com>
 <3963234.Gb249i4a6U@flatron>
 <CAFp+6iHd66_dvj_M5zOpJZ7sEy-pYa-CdWKUZBYc3Dfn3JHtfg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAFp+6iHd66_dvj_M5zOpJZ7sEy-pYa-CdWKUZBYc3Dfn3JHtfg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Tomasz,


On Wed, Jan 16, 2013 at 8:35 PM, Vivek Gautam <gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Tomasz,
>
>
> On Wed, Jan 16, 2013 at 1:19 PM, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Hi Vivek,
>>
>> Don't you need also some clkdev lookup entry to make the clock available
>> in the driver?
>>
>
> This clock source we added with a motive of completion, however it's
> not being used as of now.
> As far as i could see the lookup structure contains clocks for devices
> having multiple instances.
> Do you feel that i should be adding an entry in clk_lookup structure ?
> May be i am missing here something. Can you please elaborate on the
> use-case of clk_lookup
> entries.
>

Any suggestions on this please ?

>>
>> On Tuesday 15 of January 2013 19:08:31 Vivek Gautam wrote:
>>> Adding necessary device clock to exynos5 needed for
>>> the DWC3 controller.
>>>
>>> Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>> ---
>>>  arch/arm/mach-exynos/clock-exynos5.c |   24 ++++++++++++++++++++++++
>>>  1 files changed, 24 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/arch/arm/mach-exynos/clock-exynos5.c
>>> b/arch/arm/mach-exynos/clock-exynos5.c index 0208c3a..13af020 100644
>>> --- a/arch/arm/mach-exynos/clock-exynos5.c
>>> +++ b/arch/arm/mach-exynos/clock-exynos5.c
>>> @@ -757,6 +757,11 @@ static struct clk exynos5_init_clocks_off[] = {
>>>               .enable         = exynos5_clk_ip_fsys_ctrl ,
>>>               .ctrlbit        = (1 << 18),
>>>       }, {
>>> +             .name           = "usbdrd30",
>>> +             .parent         = &exynos5_clk_aclk_200.clk,
>>> +             .enable         = exynos5_clk_ip_fsys_ctrl,
>>> +             .ctrlbit        = (1 << 19),
>>> +     }, {
>>>               .name           = "usbotg",
>>>               .enable         = exynos5_clk_ip_fsys_ctrl,
>>>               .ctrlbit        = (1 << 7),
>>> @@ -1035,6 +1040,16 @@ static struct clksrc_sources exynos5_clkset_group
>>> = { .nr_sources       = ARRAY_SIZE(exynos5_clkset_group_list),
>>>  };
>>>
>>> +struct clk *exynos5_clkset_usbdrd30_list[] = {
>>> +     [0] = &exynos5_clk_mout_mpll.clk,
>>> +     [1] = &exynos5_clk_mout_cpll.clk,
>>> +};
>>> +
>>> +struct clksrc_sources exynos5_clkset_usbdrd30 = {
>>> +     .sources        = exynos5_clkset_usbdrd30_list,
>>> +     .nr_sources     = ARRAY_SIZE(exynos5_clkset_usbdrd30_list),
>>> +};
>>> +
>>>  /* Possible clock sources for aclk_266_gscl_sub Mux */
>>>  static struct clk *clk_src_gscl_266_list[] = {
>>>       [0] = &clk_ext_xtal_mux,
>>> @@ -1329,6 +1344,15 @@ static struct clksrc_clk exynos5_clksrcs[] = {
>>>                       .parent         = &exynos5_clk_mout_cpll.clk,
>>>               },
>>>               .reg_div = { .reg = EXYNOS5_CLKDIV_GEN, .shift = 4, .size = 3
>> },
>>> +     }, {
>>> +             .clk    = {
>>> +                     .name           = "sclk_usbdrd30",
>>> +                     .enable         = exynos5_clksrc_mask_fsys_ctrl,
>>> +                     .ctrlbit        = (1 << 28),
>>> +             },
>>> +             .sources = &exynos5_clkset_usbdrd30,
>>> +             .reg_src = { .reg = EXYNOS5_CLKSRC_FSYS, .shift = 28, .size =
>> 1 },
>>> +             .reg_div = { .reg = EXYNOS5_CLKDIV_FSYS0, .shift = 24, .size =
>> 4 },
>>>       },
>>>  };
>
>



-- 
Thanks & Regards
Vivek
