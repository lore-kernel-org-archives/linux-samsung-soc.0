From: Shirish S <shirish@chromium.org>
Subject: Re: [PATCH 4/4] drm: exynos: hdmi: Add dt support for hdmiphy settings
Date: Thu, 19 Dec 2013 17:38:27 +0530
Message-ID: <CAHvYUDCGuVRuUXa9prau+_1byCA_EG2Dbw7mVf8ZFy2wEsWo9A@mail.gmail.com>
References: <1385369679-4337-1-git-send-email-s.shirish@samsung.com>
	<1385369679-4337-6-git-send-email-s.shirish@samsung.com>
	<1833774.8yzP7um1x8@amdc1227>
	<CAHvYUDCCbr8G0wfyYbEiOG3ArPEywv09rCAhdhO74WRFK00pRg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f182.google.com ([74.125.82.182]:33023 "EHLO
	mail-we0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755730Ab3LSMIa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Dec 2013 07:08:30 -0500
Received: by mail-we0-f182.google.com with SMTP id q59so966584wes.27
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Dec 2013 04:08:28 -0800 (PST)
In-Reply-To: <CAHvYUDCCbr8G0wfyYbEiOG3ArPEywv09rCAhdhO74WRFK00pRg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, Shirish S <s.shirish@samsung.com>, InKi Dae <inki.dae@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Dave Airlie <airlied@redhat.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

+ linux-samsung-soc mailing list.

On Wed, Dec 4, 2013 at 10:05 AM, Shirish S <shirish@chromium.org> wrote:
> Hi Tomasz,
> Thanks for the reivew, please see my replies inline.
>
> On Fri, Nov 29, 2013 at 10:56 PM, Tomasz Figa <t.figa@samsung.com> wrote:
>> Hi Shirish,
>>
>> Please see my comments inline.
>>
>> On Monday 25 of November 2013 14:24:39 Shirish S wrote:
>>> This patch adds dt support to hdmiphy config settings
>>> as it is board specific and depends on the signal pattern
>>> of board.
>>>
>>> Signed-off-by: Shirish S <s.shirish@samsung.com>
>>> ---
>>>  .../devicetree/bindings/video/exynos_hdmi.txt      |   31 ++++++++
>>>  drivers/gpu/drm/exynos/exynos_hdmi.c               |   77 +++++++++++++++++++-
>>>  2 files changed, 104 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/video/exynos_hdmi.txt b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
>>> index 323983b..6eeb333 100644
>>> --- a/Documentation/devicetree/bindings/video/exynos_hdmi.txt
>>> +++ b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
>>> @@ -13,6 +13,30 @@ Required properties:
>>>       b) pin number within the gpio controller.
>>>       c) optional flags and pull up/down.
>>>
>>> +- hdmiphy-configs: following information about the hdmiphy config settings.
>>
>> Is this node required or optional? If it's required, then it breaks
>> compatibility with already existing DTBs, which is not desirable.
>>
> Yes its an Optional-but-recommended node, and i have mentioned the same
> in this document in next patch set(v9).
>>> +     a) "config<N>: config<N>" specifies the phy configuration settings,
>>> +             where 'N' denotes the number of configuration, since every
>>> +             pixel clock can have its unique configuration.
>>
>> Node names should not have any semantic meaning for parsing code. I know
>> that there are already existing bindings which rely on presence of
>> particularly named nodes, but that's not right and new bindings should
>> not follow that.
>>
> I referred Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
> for the implementation, am not clear with what you want me to do here, however
> the requirement seems similar as pinctrl, can u kindly suggest any
> existing newer
> implementations to refer.
>> Also what do you need the label of each config node for?
>>
> Each label here is a different pixel clock and corresponding phy setting, and
> it may vary from one pixel clock to other hence i need one for each config node.
>> Generally from parsing perspective you shouldn't really care about node
>> names. All you seem to do in the driver is iterating over all specified
>> nodes and matching them with internal driver data using pixel clock
>> frequency.
>>
> True, that is what i intended to do.I think for the requirement
> at hand, this should be fine.
>>> +             "pixel-clock" specifies the pixel clock
>>
>> Vendor-specific properties should have vendor prefix, so this one should
>> be called "samsung,pixel-clock".
>>
> Agreed, updated in the next patch set(v9).
>>> +             "conifig-de-emphasis-level" provides fine control of TMDS data
>>
>> Typo: s/conifig/config
>>
>> Also it should be called "samsung,de-emphasis-level".
>>
> Agreed, updated in the next patch set(v9).
>>> +              pre emphasis, below shown is example for
>>> +             data de-emphasis register at address 0x145D0040.
>>> +                     hdmiphy@38[16] for bits[3:0] permitted values are in
>>> +                     the range of 760 mVdiff to 1400 mVdiff at 20mVdiff
>>> +                     increments for every LSB
>>> +                     hdmiphy@38[16] for bits[7:4] permitted values are in
>>> +                     the range of 0dB to -7.45dB at increments of -0.45dB
>>> +                     for every LSB.
>>> +             "config-clock-level" provides fine control of TMDS data
>>
>> "samsung,clock-level"
>>
> Agreed, updated in the next patch set(v9).
>>> +             amplitude for each channel,
>>> +             for example if 0x145D005C is the address of clock level
>> [snip]
>>> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
>>> index 32ce9a6..5f599e3 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
>>> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
>> [snip]
>>> +static int drm_hdmi_dt_parse_phy_conf(struct platform_device *pdev,
>>> +                                             struct hdmi_context *hdata)
>>> +{
>>> +     struct device *dev = &pdev->dev;
>>> +     struct device_node *dev_np = dev->of_node;
>>> +     struct device_node *phy_conf, *cfg_np;
>>> +     int i, pixel_clock = 0;
>>> +
>>> +     /* Initialize with default config */
>>> +     hdata->confs = hdmiphy_v14_configs;
>>> +     hdata->nr_confs = ARRAY_SIZE(hdmiphy_v14_configs);
>>> +
>>> +     phy_conf = of_find_node_by_name(dev_np, "hdmiphy-configs");
>>
>> of_find_node_by_name() does not do what you need here. Please refer to
>> its implementation to learn why.
>>
>> What you need here is of_get_child_by_name().
>>
> Agreed, updated in the next patch set(v9).
>>> +     if (phy_conf == NULL) {
>>> +             hdata->nr_confs = ARRAY_SIZE(hdmiphy_v14_configs);
>>> +             DRM_ERROR("Did not find hdmiphy-configs node\n");
>>> +             return -ENODEV;
>>> +     }
>>> +
>>> +     for_each_child_of_node(phy_conf, cfg_np) {
>>> +             if (!of_find_property(cfg_np, "pixel-clock", NULL))
>>> +                     continue;
>>
>> This check is not needed. You can simply check the return value of
>> of_property_read_u32() below (as you already do anyway).
>>
> Agreed, updated in the next patch set(v9).
>>> +
>>> +             if (of_property_read_u32(cfg_np, "pixel-clock",
>>> +                                                     &pixel_clock, 1)) {
>>> +                             DRM_ERROR("Failed to get pixel clock\n");
>>> +                             return -EINVAL;
>>> +             }
>>> +
>>> +             for (i = 0; i < ARRAY_SIZE(hdmiphy_v14_configs); i++) {
>>
>> The code would be much cleaner if you simply used the loop to find the
>> config you need and then do the rest outside of the loop.
>>
> As you can see below, i need to update 2 values in the phy array,
> which are 16 and 23 indexed values,
> for me to move this out of the for loop would need to add a 3
> dimensional array and run this
> for loop again. Can we consider the below to be ok for the requirement at hand?
>>> +                     if (hdata->confs[i].pixel_clock == pixel_clock)
>>> +                             /* Update the data de-emphasis and data level */
>>> +                             if (of_property_read_u8_array(cfg_np,
>>> +                                      "config-de-emphasis-level",
>>> +                                     &hdata->confs[i].conf[16], 1)) {
>>> +                                     DRM_ERROR("Failed to get conf\n");
>>> +                                     return -EINVAL;
>>> +                             }
>>> +                             if (of_property_read_u8_array(cfg_np,
>>> +                                      "config-de-emphasis-level",
>>> +                                     &hdata->confs[i].conf[16], 1)) {
>>> +                                     DRM_ERROR("Failed to get conf\n");
>>> +                                     return -EINVAL;
>>> +                             }
>>
>> Why do you parse this property twice?
>>
> My bad, have updated in the next patch set.
>>> +                             /* Update the clock level diff */
>>> +                             if (of_property_read_u8_array(cfg_np,
>>> +                                      "config-clock-level",
>>> +                                     &hdata->confs[i].conf[23], 1)) {
>>> +                                     DRM_ERROR("Failed to get conf\n");
>>> +                                     return -EINVAL;
>>> +                             }
>>> +             }
>>> +     }
>>> +     return 0;
>>> +
>>> +}
>>> +
>>>  static struct s5p_hdmi_platform_data *drm_hdmi_dt_parse_pdata
>>>                                       (struct device *dev)
>>>  {
>>> @@ -2024,6 +2084,15 @@ static int hdmi_probe(struct platform_device *pdev)
>>>               goto err_hdmiphy;
>>>       }
>>>
>>> +     /* get hdmiphy confs */
>>> +     if (hdata->type == HDMI_TYPE14) {
>>
>> Why is this used only for HDMI_TYPE14?
>>
> Have extended it to both HDMI_TYPE13 and 14.However i dont have tested
> values for TYPE13,
> hence this would be dummy for that version.
>
>> Best regards,
>> Tomasz
>>
> Thanks & Regards,
> Shirish S
