Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49F32C56202
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 13 Nov 2020 09:27:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C93C32224C
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 13 Nov 2020 09:26:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="rc0dMYBa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726176AbgKMJ07 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 13 Nov 2020 04:26:59 -0500
Received: from mailout2.samsung.com ([203.254.224.25]:36122 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726160AbgKMJ04 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 13 Nov 2020 04:26:56 -0500
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20201113092652epoutp020d55fb59045922b94d9465879fe3281d~HBxzWRGP91203012030epoutp022
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2020 09:26:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20201113092652epoutp020d55fb59045922b94d9465879fe3281d~HBxzWRGP91203012030epoutp022
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1605259612;
        bh=yMmN2vobIFv20zP1PHp7NMtbPrlOwMfcljsM4EICIH4=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=rc0dMYBaY3zuJWzlz8co+UHAiCBIvjSGSGI9KL21TBuNiX2hADj4odN2jmffirFz9
         av4G5kJa5BHg1NZtEbcqCBFelGDD5jTy1yu4ShOgfk5OC8WThrrXSSZt49xH5+lA/b
         B9nRiyh1kK1DgE8WLpp2TCbdzUO73b7bLA8JGu1Y=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201113092651epcas1p1f1c5cbaff8539240bbf593a72e6d5cfa~HBxyZGQkP2852728527epcas1p1g;
        Fri, 13 Nov 2020 09:26:51 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.153]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4CXY515nyWzMqYkV; Fri, 13 Nov
        2020 09:26:45 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
        epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        FC.F1.63458.5515EAF5; Fri, 13 Nov 2020 18:26:45 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201113092644epcas1p1f8a70c75b695b749b1426cb52b28cc15~HBxsQR5zM2320823208epcas1p1D;
        Fri, 13 Nov 2020 09:26:44 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201113092644epsmtrp1d925e3c948f79a028fc544716bb7ba46~HBxsOTpJf0876608766epsmtrp18;
        Fri, 13 Nov 2020 09:26:44 +0000 (GMT)
X-AuditID: b6c32a36-6dfff7000000f7e2-3f-5fae5155d450
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        77.F7.13470.4515EAF5; Fri, 13 Nov 2020 18:26:44 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20201113092644epsmtip26af54f76cb14aad0ad632f5418a0b2a6~HBxr4FfD00863108631epsmtip2a;
        Fri, 13 Nov 2020 09:26:44 +0000 (GMT)
Subject: Re: [PATCH v2 00/16] drm/exynos: Convert driver to drm bridge
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        kernel@pengutronix.de, Laurent.pinchart@ideasonboard.com,
        krzk@kernel.org, narmstrong@baylibre.com, b.zolnierkie@samsung.com,
        sylvester.nawrocki@gmail.com, a.hajda@samsung.com,
        jy0922.shim@samsung.com, sw0312.kim@samsung.com
From:   Inki Dae <inki.dae@samsung.com>
Message-ID: <b71c47f6-9c18-b778-4e50-01041e1c9291@samsung.com>
Date:   Fri, 13 Nov 2020 18:34:07 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
        Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20201111101808.GA16630@pengutronix.de>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIJsWRmVeSWpSXmKPExsWy7bCmnm5o4Lp4gxVvtS1urTvHarFxxnpW
        iytf37NZvLh3kcVi1dSdLBbnz29gt+icuITdYsb5fUwW21YA1R3qi7aYMfklm8W8zzuZHHg8
        3t9oZffYOesuu8fsjpmsHptWdbJ53O8+zuTR/9fAo2/LKkaPz5vkAjiism0yUhNTUosUUvOS
        81My89JtlbyD453jTc0MDHUNLS3MlRTyEnNTbZVcfAJ03TJzgI5VUihLzCkFCgUkFhcr6dvZ
        FOWXlqQqZOQXl9gqpRak5BRYFugVJ+YWl+al6yXn51oZGhgYmQIVJmRnPJndwVjQZVwx691y
        1gbGBs0uRk4OCQETic8t81i7GLk4hAR2MEoc3fMTyvnEKLHy8nx2COcbo8Tn2XtYYFoe7Gpm
        g0jsZZTo3LqCGcJ5zyix/cNtsCphATeJJ2eOM4HYIgJ6EvtXzgLrYBbYwCSxde89sCI2AVWJ
        iSvus4HYvAJ2ErsaHjGD2CxA8YOL54A1iwpESBzvnswOUSMocXLmE7BeTqAzti47zwpiMwuI
        S9x6Mp8JwpaXaN46G+wiCYEjHBJd3T3sEHe7SMw88QvKFpZ4dXwLlC0l8bK/jR2ioZlRYuKM
        00wQTgejxN3H16G+NpbYv3QyUIIDaIWmxPpd+hBhRYmdv+cyQmzmk3j3tYcVpERCgFeio00I
        okRJ4tjFG4wQtoTEhSUT2SBsD4lDy1+xTWBUnIXkt1lI/pmF5J9ZCIsXMLKsYhRLLSjOTU8t
        NiwwQo7wTYzgtKxltoNx0tsPeocYmTgYDzFKcDArifAqO6yJF+JNSaysSi3Kjy8qzUktPsRo
        CgzticxSosn5wMyQVxJvaGpkbGxsYWJoZmpoqCTO+0e7I15IID2xJDU7NbUgtQimj4mDU6qB
        KX/GxScCfHbe0xKEvn37Z22+tvJFytf/PWHfAgLvPo3XXb9wG7es9M2HDqdOlWn1xvJXGSuz
        f/910m/C7wQLSeO+I7oFHhdtb8XE7r8gIjzpP1tzRf8/1bj+/i2qYSe3ibjVnf3Bff6awOfp
        jZ+L14S8vn9/f8L1kz9W3E2YcuIa6/8H+7/s9N1bvey/XwnntUzXJBEbtvCNU9c213rKGWyr
        95rxaf3eRu7DfkITY861ZAtP73u9vF5peXsqpwrvq60Gk5csvHbrW9CmWb7874KuvfJ4fm7y
        WnU9m7Cf69Xv/DF57hgq/PT9wsXMH9TcjZPCfzQ03ptxe9KVp3PshNJyOSdM12rWeXQvWrt9
        YZESS3FGoqEWc1FxIgBryTqSVAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLIsWRmVeSWpSXmKPExsWy7bCSvG5I4Lp4g4bV+ha31p1jtdg4Yz2r
        xZWv79ksXty7yGKxaupOFovz5zewW3ROXMJuMeP8PiaLbSuA6g71RVvMmPySzWLe551MDjwe
        72+0snvsnHWX3WN2x0xWj02rOtk87ncfZ/Lo/2vg0bdlFaPH501yARxRXDYpqTmZZalF+nYJ
        XBlPZncwFnQZV8x6t5y1gbFBs4uRk0NCwETiwa5mti5GLg4hgd2MEnvfbWLqYuQASkhIbNnK
        AWEKSxw+XAxR8pZR4kXPYlaQXmEBN4knZ44zgdgiAnoS+1fOApvDLLCBSWLy6UuMEB1tzBLP
        rzSyg1SxCahKTFxxnw3E5hWwk9jV8IgZxGYBih9cPAdskqhAhETL/T/sEDWCEidnPmEBsTmB
        Lt267DzYZmYBdYk/8y4xQ9jiEreezGeCsOUlmrfOZp7AKDQLSfssJC2zkLTMQtKygJFlFaNk
        akFxbnpusWGBYV5quV5xYm5xaV66XnJ+7iZGcAxqae5g3L7qg94hRiYOxkOMEhzMSiK8yg5r
        4oV4UxIrq1KL8uOLSnNSiw8xSnOwKInz3ihcGCckkJ5YkpqdmlqQWgSTZeLglGpg4hLs3/Pr
        u+FpDu0V/Stf7N2yc1m90XKXMqeQN/8imqfPvVGzeM7y88Fr68OMeAQLbmZcm7MmdtXp+GKO
        Uj4R3hDVN2r2lWdM+xb8u5ZQx+Qb5Pzmv5eLuGii+vr7u5622N+Q61oeJaX/2UhdZtvnOGXG
        vak83/ccfcg0Z5XglFpF4ee7+BJ9d22q6S4pyraLW//b1qz6V7sEv9TmxWnN3sfO3TqX3/np
        5oLPFUq/Y1ed2lx5MnjF6ox31e0Gud5XP5QkXoo6+OHk6vuezrsT4vRnnJ4z1TKeV60pz+Tw
        k1ijrVIT5p+4pNIsdkifpU1i7rO7al4dHzdqF01R3Z1uzVzYsIpRrstIxXrvVftNSizFGYmG
        WsxFxYkAu7OJJjADAAA=
X-CMS-MailID: 20201113092644epcas1p1f8a70c75b695b749b1426cb52b28cc15
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200911165401epcas1p3c7ee84dd01db93f472d6fa21c1100f29
References: <CGME20200911165401epcas1p3c7ee84dd01db93f472d6fa21c1100f29@epcas1p3.samsung.com>
        <20200911135413.3654800-1-m.tretter@pengutronix.de>
        <fa535450-cd68-415f-5c48-a4f753b2b70b@samsung.com>
        <20201110081336.GB13669@pengutronix.de>
        <fd177674-b22e-6743-9886-5590ccade2f5@samsung.com>
        <c56586b0-f616-6a57-3628-5840a99f6c1a@samsung.com>
        <20201111101808.GA16630@pengutronix.de>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org



20. 11. 11. 오후 7:18에 Michael Tretter 이(가) 쓴 글:
> On Wed, 11 Nov 2020 12:11:15 +0900, Inki Dae wrote:
>> 20. 11. 11. 오후 12:04에 Inki Dae 이(가) 쓴 글:
>>> 20. 11. 10. 오후 5:13에 Michael Tretter 이(가) 쓴 글:
>>>> On Mon, 09 Nov 2020 12:15:39 +0900, Inki Dae wrote:
>>>>> 20. 9. 11. 오후 10:53에 Michael Tretter 이(가) 쓴 글:
>>>>>> This is v2 of the series to convert the Exynos MIPI DSI driver into a drm
>>>>>> bridge and make it usable with other drivers. Although the driver is
>>>>>> converted, it still supports the component framework API to stay compliant
>>>>>> with the Exynos DRM driver.
>>>>>>
>>>>>> The Exynos MIPI DSI Phy is also found on the i.MX8M Mini. However, on the
>>>>>> i.MX8M Mini, the bridge is driven by an LCDIF display controller instead of
>>>>>> the Exynos Decon. The driver for the LCDIF does not use the component
>>>>>> framework, but uses drm bridges.
>>>>>>
>>>>>> I don't have any Exynos SoC to actually test the series. I build a dummy to
>>>>>> test the bridge with a component driver, to make sure that at least the
>>>>>> initialization is working. Furthermore, tested the driver as a bridge with a
>>>>>> few additional unfinished patches on the i.MX8M Mini EVK. However, somebody
>>>>>> should verify that the driver is still working on Exynos hardware.
>>>>>>
>>>>>> I also changed the order of the patches to first make the driver more platform
>>>>>> independent (patches 2 to 8), then convert to a drm bridge driver (patches 10
>>>>>
>>>>> Just a fundamental question, A MIPI-DSI(Display Serial Interface) bus device
>>>>> would be one of an encoder type of devices not bridge such as DSI to LVDS
>>>>> and LVDS to DSI bridge devices, and also image enhancer and image compressor
>>>>> in case of Exynos.
>>>>
>>>> I don't understand, why the MIPI-DSI bus device would be an encoder type and
>>>> DSI to LVDS or MIPI-DSI to HDMI would be bridges. For example, the device tree
>>>> documentation for the DSIM states that the DSIM receives RGB video as input
>>>> and produces MIPI-DSI as output. Thus, the DSIM is basically a parallel RGB to
>>>
>>> MIPI-DSI receives RGB video as input and encodes it to MIPI packet and then transfers the packet to MIPI panel.
>>> And finally, MIPI panel decodes the packet and updates it - RGB data - on its SRAM.
>>>
>>> MIPI-DSI driver programs how the RGB video should be made as MIPI packet. For more detail, you could refer to MIPI-DSI spec.
>>> This would be why we handle MIPI-DSI driver as an encoder like other ARM SoC DRM drivers did.
>>>
>>>> MIPI-DSI bridge and the encoder is the LCD controller that encodes the video
>>>> data as parallel RGB.
>>>>
>>>> On the i.MX8MM, the LCDIF is already the encoder. On Exynos, the series
>>>> implements the encoder in the platform glue, but in the end the encoder can
>>>> probably be moved to the DECON.
>>>
>>> As you know, Display controller can transfer RGB video to various devices such as RGB panel, CPU panel, LVDS panel via LVDS bridge, MIPI panel via MIPI-DSI bus device, and so on like below,
>>>
>>> Display Controller --> RGB panel or CPU panel.
>>> Display Controller --> LVDS bridge --> LVDS panel.
>>> Display Controller --> MIPI DSI bus device --> MIPI Panel.
>>> ...
>>>
>>> Display controller drivers such as FIMD and DECON series in case of Exynos don't create an encoder driver-internally instead of it depends on Display pipeline configuration - what kind of Display panel is used.
>>> In fact, if the Display pipeline uses RGB panel or CPU panel without Display bus device such as MIPI-DSI, then FIMD and DECON drivers create an encoder for it internally - just we separated the code to consider other type of panels.
> 
> What happens if I add a MIPI-DSI --> HDMI bridge to the Display pipeline? Then
> the Pipeline is
> 
> Display Controller --> MIPI DSI bus device --> HDMI bridge --> HDMI Panel
> 
> If the type of the Display panel decides which part of the pipeline provides
> the encoder, the HDMI bridge driver would be responsible for creating the

HDMI bridge driver will create only an bridge because this is not encoder device but bridge device such as LVDS bridge.

Display Controller(CRTC) --> MIPI DSI bus device(Encoder) --> HDMI bridge(Bridge) --> HDMI Panel(Connector)

> encoder, right? Thus, the MIPI-DSI driver would not be responsible for
> creating the encoder and would also get the encoder from another driver.

I think MIPI-DSI is an encoder device as I mentioned earlier so MIPI-DSI driver would be responsible for creating the encoder.

> Therefore, I prefer to think of the Display Controller as the encoder and
> other bridges are just bridges.

So crtc driver will create an encoder internally in case of parallel RGB Panel *because encoder device isn't used*. On the other hand, each encoder driver will be an encoder in case of other type of panel - which is needed for Display bus device such as MIPI-DSI device.

Thanks,
Inki Dae

> 
> BTW, this is exactly the Display pipeline that is used on the i.MX8MM EVK.
> 
>>>
>>> On the I.MX8MM, could you share how to handle an encoder if some board has only MIPI-DSI panel, and in this case, where is an encoder for it created? I looked into I.MX8MM DRM driver but didn't find MIPI-DSI driver.
>>> Seems that they support only parallel display, HDMI and LVDS panel.
>>
>> One more thing, If I saw correctly, the LVDS driver of IMX DRM - lmx_ldb - creates an encoder internally like MIPI-DSI driver of Exynos DRM did.
> 
> Yes, but the IMX DRM driver is not used on the i.MX8MM. The i.MX8MM uses the
> LCDIF display controller instead of the IPU of the i.MX6. The driver for the
> LCDIF is the mxsfb driver, which in turn uses the drm_simple_display_pipe,
> which already provides the encoder. Therefore, to use a bridge driver with a
> driver based on a drm_simple_display_pipe, the bridge driver must accept other
> encoders.
> 
> Michael
> 
>>
>>>
>>> Thanks,
>>> Inki Dae
>>>
>>>>
>>>>> Why do you want to convert such MIPI-DSI driver to bridge type of driver?
>>>>> Seems not sensible. The reason would be just to share MIPI-DSI phy driver
>>>>> for Exynos with i.MX8M Mini?
>>>>
>>>> Yes, the reason is that the driver should be shared between Exynos and
>>>> i.MX8MM. It is the same IP and I don't see a reason why we should introduce
>>>> another driver for the same IP if the driver works for both SoCs.
>>>>
>>>> Michael
>>>>
>>>
>>
> 
