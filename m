Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE79C4167B
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  3 Nov 2022 18:58:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231246AbiKCS60 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 3 Nov 2022 14:58:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbiKCS6Z (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Nov 2022 14:58:25 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24850F40
        for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Nov 2022 11:58:23 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 1D85A84EF0;
        Thu,  3 Nov 2022 19:58:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1667501900;
        bh=ftckN5vaZOrLCBxzERkC05Xp9LWxMmtC41/5oUzKBiE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=xy9nrcaWAD0Uvxs5GdYKYtQqgpPobNuvJG6mPSh/yZ8OfXXIwIn8lGwe8TSSc3sjC
         ughvOjL/DP54qJ6w1t7q2+1PM11sK+MktQqNC50RCjCwWV2VFyIlsAUtFSLfQ6lyMv
         v4MezbW/N6M8UrDfUK9pxqz+wecGr0fbgSA33oD4rFNTQy9icOroeaSdMb4sl4NNZ0
         x5WoQ0DNTgJbFAujW1AoFb380jLpeDFiyJhe3uXlOTF2l2NLWPxcR/k26vncDblMD2
         M4g5nQzD1J/7TQfdwZzfvwmiDrxn3cqFXx+FMS/xF5vvnFwJn+hNtMrAM3QFCjwD0b
         VhmmBnbOsDvCA==
Message-ID: <2f0c2dae-07c9-814b-a252-5fdd3e0d9dda@denx.de>
Date:   Thu, 3 Nov 2022 19:58:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v7 07/10] drm: bridge: samsung-dsim: Add
 atomic_get_input_bus_fmts
Content-Language: en-US
To:     Jagan Teki <jagan@amarulasolutions.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Fancy Fang <chen.fang@nxp.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
        Neil Armstrong <narmstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
 <20221005151309.7278-8-jagan@amarulasolutions.com>
 <d837f6e3-d869-6543-2361-a7843c00ed8a@denx.de>
 <CAMty3ZDQCsJF+EuG_gvZ-MbkePO55GHfX_yvmKdzqE1fdAR55g@mail.gmail.com>
 <9262c207-2b72-6638-0274-0ce1d0d830c9@denx.de>
 <CAMty3ZAzDMRYiWWRwKvA+QSaXRHYgadJ7d4JwKnJWHPqPBua7A@mail.gmail.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <CAMty3ZAzDMRYiWWRwKvA+QSaXRHYgadJ7d4JwKnJWHPqPBua7A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 11/3/22 18:27, Jagan Teki wrote:
> On Thu, Nov 3, 2022 at 9:56 PM Marek Vasut <marex@denx.de> wrote:
>>
>> On 11/3/22 10:39, Jagan Teki wrote:
>>> On Sun, Oct 16, 2022 at 3:31 AM Marek Vasut <marex@denx.de> wrote:
>>>>
>>>> On 10/5/22 17:13, Jagan Teki wrote:
>>>>
>>>> [...]
>>>>
>>>>> @@ -1321,6 +1322,32 @@ static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
>>>>>         pm_runtime_put_sync(dsi->dev);
>>>>>     }
>>>>>
>>>>> +#define MAX_INPUT_SEL_FORMATS        1
>>>>> +
>>>>> +static u32 *
>>>>> +samsung_dsim_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>>>>> +                                    struct drm_bridge_state *bridge_state,
>>>>> +                                    struct drm_crtc_state *crtc_state,
>>>>> +                                    struct drm_connector_state *conn_state,
>>>>> +                                    u32 output_fmt,
>>>>> +                                    unsigned int *num_input_fmts)
>>>>> +{
>>>>> +     u32 *input_fmts;
>>>>> +
>>>>> +     *num_input_fmts = 0;
>>>>> +
>>>>> +     input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
>>>>> +                          GFP_KERNEL);
>>>>> +     if (!input_fmts)
>>>>> +             return NULL;
>>>>> +
>>>>> +     /* This is the DSI-end bus format */
>>>>> +     input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
>>>>> +     *num_input_fmts = 1;
>>>>
>>>> Is this the only supported format ? NXP AN13573 lists the following:
>>>>
>>>> i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
>>>> 3.7.4 Pixel formats
>>>> Table 14. DSI pixel packing formats
>>>>
>>>> Loosely Packed Pixel Stream, 20-bit YCbCr, 4:2:2
>>>> Packed Pixel Stream, 24-bit YCbCr, 4:2:2
>>>> Packed Pixel Stream, 16-bit YCbCr, 4:2:2
>>>
>>> Look like these are unsupported in media-bus-format.h list.
>>
>> Aren't those:
>>
>> MEDIA_BUS_FMT_UYVY12_1X24
> 
> Why is UYVY12 - YCbCr, 4:2:2 is 4+2+2 = 8 then it has UYVY8 ?

(someone please correct me if I'm totally wrong here)

The 12 is channel width (12 bit for each Y1/Y2/U/V channel sample).
The 4:2:2 is subsampling (where are the color components sampled 
relative to brightness component).

Picture is here:
https://upload.wikimedia.org/wikipedia/commons/f/f2/Common_chroma_subsampling_ratios.svg

Each Y square of the left is 12bit sample.
Each U+V square is 12bit sample for U and 12bit sample for V.

In case of 4:4:4 subsampling, each luminance (brightness) component has 
matching chrominance (color) components.

In case of the 4:2:2 subsampling, two neighboring luminance components 
share two chrominance components. To transfer one pixel including color 
information, you have to transfer two pixels, Y0+U as 2x12bit sample in 
one cycle of 24bit bus, and then Y1+V as 2x12bit sample in another cycle 
of 24bit bus (2 clock cycles total, 4 samples total). From that you can 
reconstruct the two top-left squares (purple pixels) in the rightmost 
YUV column of 4:2:2 row.

The entire trick is that because eye is less sensitive to color than it 
is to light, you can transfer less color information and thus save 
bandwidth without anyone noticing (much of it).

>> MEDIA_BUS_FMT_UYVY8_1X16
> 
> If YCbCr is UYVY (I still don't get this notation, sorry) then Packed
> Pixel Stream, 24-bit YCbCr, 4:2:2 with 2 Pixels per packet from Table
> 14 can be
> 
> MEDIA_BUS_FMT_UYVY8_2X24
> (YCbCr 4:2:2 is UYVY8)
> 
>   " based on a reference example from media bus format doc
> 4.13.3.4.1.1.3. Packed YUV Formats, For instance, a format where
> pixels are encoded as 8-bit YUV values downsampled to 4:2:2 and
> transferred as 2 8-bit bus samples per pixel in the U, Y, V, Y order
> will be named MEDIA_BUS_FMT_UYVY8_2X8."

The way I read the above is that the channel width of each channel is 
8-bit , so you start with two pixels Y0/U/Y1/V which add up to 32bit 
total. That is transferred over 8-bit bus, in 4 bus cycles total. One 
pixel therefore takes 2 cycles of the 8 bit bus to transfer, even if you 
cannot transfer one pixel separately .

> https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/subdev-formats.html
> 
> _2X24 here 2 Pixels per packet is the exact packets to consider or we
> can consider 1 Pixel per packet also. If later is true then _1X24 from
> your notation is correct.

Since the DSIM input bus is 32bit wide, to transfer one such 4:2:2 
pixel, you need 1 bus cycle (2x12 bits per half of two pixels).

[...]
