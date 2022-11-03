Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84038C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  3 Nov 2022 16:26:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231688AbiKCQ0K (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 3 Nov 2022 12:26:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbiKCQ0D (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Nov 2022 12:26:03 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E85391AD85
        for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Nov 2022 09:26:02 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 5DEB18519D;
        Thu,  3 Nov 2022 17:25:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1667492761;
        bh=XyGlCckHVL9Mp4qbwYrY3wTxsiY5XVy50GuuK2Hwr38=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=zcrxY9K5YKhjpJHBv4/GXrJ9WLCPqi32lTd/+V+eGVyleZTYmoIJEkOI05rtgcUPB
         ey+lYsICO6LDNhpfLVQIiww19x0grg81w0qUfFba9fCtWUKo60BIGwp7BdeQS277Df
         J/WnhG2OLJ9oYpVliHJ1FwHT92TKNW4k1xYSPiqlnn3SFVTzE4waLL2OLbErNzzqjy
         D4CmmJx7yNLN7CW62a/6I1s7m8OkI0Yn1ZX8lgYvnZHGTTlGGzjG2q4J75Z8uyHsxK
         rYTQZsdi485ZHlKCVOoABddUM4CqnR7IqFPonPPuXdOnvBjW5v5FDoW1tJBWOes8hc
         6NBJJcQ20ZVUw==
Message-ID: <9262c207-2b72-6638-0274-0ce1d0d830c9@denx.de>
Date:   Thu, 3 Nov 2022 17:02:13 +0100
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
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <CAMty3ZDQCsJF+EuG_gvZ-MbkePO55GHfX_yvmKdzqE1fdAR55g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 11/3/22 10:39, Jagan Teki wrote:
> On Sun, Oct 16, 2022 at 3:31 AM Marek Vasut <marex@denx.de> wrote:
>>
>> On 10/5/22 17:13, Jagan Teki wrote:
>>
>> [...]
>>
>>> @@ -1321,6 +1322,32 @@ static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
>>>        pm_runtime_put_sync(dsi->dev);
>>>    }
>>>
>>> +#define MAX_INPUT_SEL_FORMATS        1
>>> +
>>> +static u32 *
>>> +samsung_dsim_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>>> +                                    struct drm_bridge_state *bridge_state,
>>> +                                    struct drm_crtc_state *crtc_state,
>>> +                                    struct drm_connector_state *conn_state,
>>> +                                    u32 output_fmt,
>>> +                                    unsigned int *num_input_fmts)
>>> +{
>>> +     u32 *input_fmts;
>>> +
>>> +     *num_input_fmts = 0;
>>> +
>>> +     input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
>>> +                          GFP_KERNEL);
>>> +     if (!input_fmts)
>>> +             return NULL;
>>> +
>>> +     /* This is the DSI-end bus format */
>>> +     input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
>>> +     *num_input_fmts = 1;
>>
>> Is this the only supported format ? NXP AN13573 lists the following:
>>
>> i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
>> 3.7.4 Pixel formats
>> Table 14. DSI pixel packing formats
>>
>> Loosely Packed Pixel Stream, 20-bit YCbCr, 4:2:2
>> Packed Pixel Stream, 24-bit YCbCr, 4:2:2
>> Packed Pixel Stream, 16-bit YCbCr, 4:2:2
> 
> Look like these are unsupported in media-bus-format.h list.

Aren't those:

MEDIA_BUS_FMT_UYVY12_1X24
MEDIA_BUS_FMT_UYVY8_1X16

?

Those are packed, and subsampled 4:2:2

>> Packed Pixel Stream, 30-bit RGB, 10-10-10

MEDIA_BUS_FMT_RGB101010_1X30

>> Packed Pixel Stream, 36-bit RGB, 12-12-12

MEDIA_BUS_FMT_RGB121212_1X36

>> Packed Pixel Stream, 12-bit YCbCr, 4:2:0
> 
> Same issue, unsupported.

The 12-bit packed 4:2:0 might be something along the lines of

drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
MEDIA_BUS_FMT_YUYV8_1_5X8, /* YUV420 */

>> Packed Pixel Stream, 16-bit RGB, 5-6-5
> 
> MEDIA_BUS_FMT_RGB565_1X16
> 
>> Packed Pixel Stream, 18-bit RGB, 6-6-6
> 
> Same issue, unsupported.

MEDIA_BUS_FMT_RGB666_1X18

>> Loosely Packed Pixel Stream, 18-bit RGB, 6-6-6
>> Packed Pixel Stream, 24-bit RGB, 8-8-8 Format
> 
> MEDIA_BUS_FMT_RGB666_1X18
> MEDIA_BUS_FMT_RGB888_1X24
> 
>>
>> The MX8MM/MN LCDIF can generate all of those RGB formats , the MX8MP
>> LCDIFv3 can also generate the 16bit YCbCr .
> 
> Is YCbCr denoted as UYVY in media-bus-format.h ?
I think this applies:

https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/colorspaces.html
"
Sometimes people confuse Y’CbCr as being a colorspace. This is not 
correct, it is just an encoding of an R’G’B’ color into luma and chroma 
values.
"

And esp. this:

"
In order to correctly interpret a color you need to know the 
quantization range, whether it is R’G’B’ or Y’CbCr, the used Y’CbCr 
encoding and the colorspace. From that information you can calculate the 
corresponding CIE XYZ color and map that again to whatever colorspace 
your display device uses.
"

Which means that in order to properly describe or interpret the data, 
you need the entire v4l2_mbus_framefmt content, not just the pixel code:

https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/subdev-formats.html

But this information is not passed across the bus, that's metadata 
internal to the kernel.
