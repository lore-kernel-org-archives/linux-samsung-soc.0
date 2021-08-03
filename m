Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F63C4338F
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Aug 2021 09:41:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2FC516052B
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Aug 2021 09:41:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235000AbhHCJlZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 Aug 2021 05:41:25 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:42989 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235125AbhHCJlU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Aug 2021 05:41:20 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210803094002euoutp0238818e0f22d607a4bf00297d3c89f100~XwnX32bTj1269312693euoutp026
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Aug 2021 09:40:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210803094002euoutp0238818e0f22d607a4bf00297d3c89f100~XwnX32bTj1269312693euoutp026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1627983602;
        bh=SZTXHGoRmkwSqVOXx87SZrS5ZSG033Yq8X6Zml/TvN8=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=ZRDH7aDDz4AMm1Mk3rD972uiCBIPM6NHv2RxW+klz5cJo1ZmBcuteimGXLy6Qkd6d
         1/Cpaddk5m1HRYwlz9T7G/WBQ4bg8Lft6N7TZhzL6wWQ9BYSlR16tLzeWTzES2j8hO
         kWSErc6juAIgahMAexbkcgZKHHlzW/jsMNwsI35w=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210803094001eucas1p2a978bc07316ec8b3c7372ae8f4e1e74a~XwnXWOUM82740227402eucas1p2Q;
        Tue,  3 Aug 2021 09:40:01 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 98.5B.45756.1FE09016; Tue,  3
        Aug 2021 10:40:01 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210803094001eucas1p2ec7f1c27d5cc7dab023be10dbfee5d6e~XwnWzLk8D2704327043eucas1p2T;
        Tue,  3 Aug 2021 09:40:01 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210803094001eusmtrp11adaacd93f12956032e42cf7d13bc78a~XwnWyLPJ21640416404eusmtrp1Y;
        Tue,  3 Aug 2021 09:40:01 +0000 (GMT)
X-AuditID: cbfec7f2-7bdff7000002b2bc-6f-61090ef15607
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id B5.44.31287.0FE09016; Tue,  3
        Aug 2021 10:40:00 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210803094000eusmtip1ac448e864c03c0a7f75d31e057a24325~XwnWNQ3Iw1281212812eusmtip16;
        Tue,  3 Aug 2021 09:40:00 +0000 (GMT)
Subject: Re: [PATCH] usb: dwc2: Skip clock gating on Samsung SoCs
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <0d8de3e0-341b-f751-909d-22aa16e91717@samsung.com>
Date:   Tue, 3 Aug 2021 11:40:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <a7efdf13-48bb-db21-5755-ebbbe2614f78@synopsys.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0xSYRju43A5ktAJdbwzyqKLluVlWrF0ll0Ws8t0zR9dNiM7Mw3UQC37
        4bSy6ckuo1oIpcVcFywtQyqmplSSutBks1JWWeTUpkZ0tTseK/89z/M+7/e+z7sPxwR6lj+e
        mp5FKtNlcjGbyzQ1f7UtcvG9ZGG2U7MlRx2Rkhuaapak/NkOSXv7dY7Ebj7LlmjaGxgS/cVC
        TDJ8qgdbgUtrDMVsaVlLgvSY0YCkxrtuJHXXzIhnbeFG7yTlqTmkMjRmO3fXy1tdrMyByH0X
        qls5+aghmEJeOBCRUHX6M5tCXFxAXEbQMVyAaPIBQbuzf5y4EVQO6zkUwsdaWnW5tH4JQZ1T
        y6CJ6w8p62V43vUhYsHU+pzlKfgSPxBYrxRhHoIRTQgq6r+zPC42EQ7UEMX2YB4RA/c7j2Ie
        zCTmwJfG5jGPH5EMjraRcc9UaCl1Mj3Yi1gBzaVPxvwYEQAHa3XjWAjdzvKxlYBw4jA8UMSi
        o66Guj7aBIQPDFqNHBqLoO1kCZNuOIig13aNQ5MSBPYDGkS7osBhG2V7LoAR86HaHErLsfC2
        rJhFH4YPT4em0kvwQW06g9EyD4oOC2j3PNBaq/6NberoxE4gsXZCNO2EONoJcbT/555HTAMS
        ktkqRQqpCk8n94aoZApVdnpKSHKGogb9+UZtP63vb6Nzg64QC2LgyIIAx8S+vMSnuEzA2ynL
        3U8qM5KU2XJSZUHTcKZYyDPoriYJiBRZFrmbJDNJ5d8qA/fyz2coXIcGLC3vFI/ULdRKy021
        y3t9yd1PfV1BZYwl9oDXsxZvnpsmj2e70VC/KFk0uMGc5SjaRpne6Zrk77V18ZVpOvP+Xy+5
        1wMagp05W6PVh0qffBQI+4VVy0NSA+zrHJXBM/Nigpr3HAmdF4R/s7/qW5U0KVpYYO16sSGM
        OjDSPalC/MuoOdfZFNGzp/aN08g3bBzl+y3qHqn/bJ4RZ4oy3siLlHr35HsbUXj5wkQzkTHw
        c0ruBZf7dcfVpQ9irQ/vIV8OI27Z3CNhuoQ7vfg6UWAxWhu41N9bU7jJ1pi4dU1phOimXv0w
        bzAu87G+8A21Y3JjxPGo89MrjiXcacsRM1W7ZOELMKVK9hsWUyKLtQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRmVeSWpSXmKPExsVy+t/xu7of+DgTDX5NsrHovWNisXHGelaL
        +TeTLM6f38BucXnXHDaLGef3MVksWtbKbPFuym1mBw6PTas62TzmnQz06NuyitFjy/7PjB6f
        N8kFsEbp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXo
        ZTzYfo214KVJxcL1p9gbGPdpdzFycEgImEicml3ZxcjFISSwlFHiwe07zF2MnEBxGYmT0xpY
        IWxhiT/Xutggit4zSjz7cYgNJCEs4Cix7dQ9VpCEiMBfRolbe26zgzjMAocZJf4tPcsO0XKM
        UeL16kOMIC1sAoYSXW+7wNp5BewkjlzqBdvHIqAi8ePAMbB9ogLJEn1fJjBC1AhKnJz5hAXE
        5hRwkDg28zpYPbOAmcS8zQ+hbHmJ5q2zoWxxiVtP5jNNYBSahaR9FpKWWUhaZiFpWcDIsopR
        JLW0ODc9t9hQrzgxt7g0L10vOT93EyMw+rYd+7l5B+O8Vx/1DjEycTAeYpTgYFYS4Q29wZEo
        xJuSWFmVWpQfX1Sak1p8iNEU6J+JzFKiyfnA+M8riTc0MzA1NDGzNDC1NDNWEufdOndNvJBA
        emJJanZqakFqEUwfEwenVANT3fQUmdb8+6v2C/bOKDZlvf780ewP5hfzjJk/5bzbl+LktOie
        x7FtDdNNHFZEFLQLOWxZvchzhkH4r2sPdN7oREy2abJnePvCWyy48kx8xIv4BJEzPfl30ue7
        Kl/0Fng9u+/uaZXHQnNT/wcUnLpfVfV0iYFEbNmrRbw/euTZt4ROnHyQ5XCe29oNpR2aVW6C
        2q0iAZGiOb3zXkZ94tx1PfHelBnid25p/Pn5YM2PdTJuyRNe7HCuv9nFMVX1VMeCc9OXlv78
        HXU8tuvldmm3jarbJl1xcVR+csm7t3m20VKTJ5NamXv23lB6Me/7pKtCPRHKzyW2vz8U/8u3
        ft9sc9mp6tfEP3u9mHOlybLqjBJLcUaioRZzUXEiAJ0zJFVHAwAA
X-CMS-MailID: 20210803094001eucas1p2ec7f1c27d5cc7dab023be10dbfee5d6e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210716050132eucas1p285949f9a73764b173c29ad0fa8502f23
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210716050132eucas1p285949f9a73764b173c29ad0fa8502f23
References: <CGME20210716050132eucas1p285949f9a73764b173c29ad0fa8502f23@eucas1p2.samsung.com>
        <20210716050127.4406-1-m.szyprowski@samsung.com>
        <a7efdf13-48bb-db21-5755-ebbbe2614f78@synopsys.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Minas,

On 16.07.2021 16:54, Minas Harutyunyan wrote:
> On 7/16/2021 9:01 AM, Marek Szyprowski wrote:
>> Commit 0112b7ce68ea ("usb: dwc2: Update dwc2_handle_usb_suspend_intr
>> function.") changed the way the driver handles power down modes in a such
>> way that it uses clock gating when no other power down mode is available.
>>
>> This however doesn't work well on the DWC2 implementation used on the
>> Samsung SoCs. When a clock gating is enabled, system hangs. It looks that
>> the proper clock gating requires some additional glue code in the shared
>> USB2 PHY and/or Samsung glue code for the DWC2. To restore driver
>> operation on the Samsung SoCs simply skip enabling clock gating mode
>> until one finds what is really needed to make it working reliably.
>>
>> Fixes: 0112b7ce68ea ("usb: dwc2: Update dwc2_handle_usb_suspend_intr function.")
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>    drivers/usb/dwc2/core.h      | 4 ++++
>>    drivers/usb/dwc2/core_intr.c | 3 ++-
>>    drivers/usb/dwc2/hcd.c       | 6 ++++--
>>    drivers/usb/dwc2/params.c    | 1 +
>>    4 files changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
>> index ab6b815e0089..483de2bbfaab 100644
>> --- a/drivers/usb/dwc2/core.h
>> +++ b/drivers/usb/dwc2/core.h
>> @@ -383,6 +383,9 @@ enum dwc2_ep0_state {
>>     *			0 - No (default)
>>     *			1 - Partial power down
>>     *			2 - Hibernation
>> + * @no_clock_gating:	Specifies whether to avoid clock gating feature.
>> + *			0 - No (use clock gating)
>> + *			1 - Yes (avoid it)
>>     * @lpm:		Enable LPM support.
>>     *			0 - No
>>     *			1 - Yes
>> @@ -480,6 +483,7 @@ struct dwc2_core_params {
>>    #define DWC2_POWER_DOWN_PARAM_NONE		0
>>    #define DWC2_POWER_DOWN_PARAM_PARTIAL		1
>>    #define DWC2_POWER_DOWN_PARAM_HIBERNATION	2
>> +	bool no_clock_gating;
>>    
>>    	bool lpm;
>>    	bool lpm_clock_gating;
>> diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
>> index a5ab03808da6..a5c52b237e72 100644
>> --- a/drivers/usb/dwc2/core_intr.c
>> +++ b/drivers/usb/dwc2/core_intr.c
>> @@ -556,7 +556,8 @@ static void dwc2_handle_usb_suspend_intr(struct dwc2_hsotg *hsotg)
>>    				 * If neither hibernation nor partial power down are supported,
>>    				 * clock gating is used to save power.
>>    				 */
>> -				dwc2_gadget_enter_clock_gating(hsotg);
>> +				if (!hsotg->params.no_clock_gating)
>> +					dwc2_gadget_enter_clock_gating(hsotg);
>>    			}
>>    
>>    			/*
>> diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
>> index 035d4911a3c3..2a7828971d05 100644
>> --- a/drivers/usb/dwc2/hcd.c
>> +++ b/drivers/usb/dwc2/hcd.c
>> @@ -3338,7 +3338,8 @@ int dwc2_port_suspend(struct dwc2_hsotg *hsotg, u16 windex)
>>    		 * If not hibernation nor partial power down are supported,
>>    		 * clock gating is used to save power.
>>    		 */
>> -		dwc2_host_enter_clock_gating(hsotg);
>> +		if (!hsotg->params.no_clock_gating)
>> +			dwc2_host_enter_clock_gating(hsotg);
>>    		break;
>>    	}
>>    
>> @@ -4402,7 +4403,8 @@ static int _dwc2_hcd_suspend(struct usb_hcd *hcd)
>>    		 * If not hibernation nor partial power down are supported,
>>    		 * clock gating is used to save power.
>>    		 */
>> -		dwc2_host_enter_clock_gating(hsotg);
>> +		if (!hsotg->params.no_clock_gating)
>> +			dwc2_host_enter_clock_gating(hsotg);
>>    
>>    		/* After entering suspend, hardware is not accessible */
>>    		clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
>> diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
>> index 67c5eb140232..59e119345994 100644
>> --- a/drivers/usb/dwc2/params.c
>> +++ b/drivers/usb/dwc2/params.c
>> @@ -76,6 +76,7 @@ static void dwc2_set_s3c6400_params(struct dwc2_hsotg *hsotg)
>>    	struct dwc2_core_params *p = &hsotg->params;
>>    
>>    	p->power_down = DWC2_POWER_DOWN_PARAM_NONE;
>> +	p->no_clock_gating = true;
>>    	p->phy_utmi_width = 8;
>>    }
>>    
>>
> In which mode host/device you see the issue?
I do my test in my device mode.
> What is your core version? Please provide GHWCFG1-4 registers values.

This is a result of dwc2_dump_global_registers() added just after 
dwc2_lowlevel_hw_enable() in dwc2_driver_probe():

dwc2 12480000.hsotg: Core Global Registers

dwc2 12480000.hsotg: GOTGCTL      @0xE0260000 : 0x000D0000
dwc2 12480000.hsotg: GOTGINT      @0xE0260004 : 0x00000000
dwc2 12480000.hsotg: GAHBCFG      @0xE0260008 : 0x00000027
dwc2 12480000.hsotg: GUSBCFG      @0xE026000C : 0x0000540F
dwc2 12480000.hsotg: GRSTCTL      @0xE0260010 : 0x80000040
dwc2 12480000.hsotg: GINTSTS      @0xE0260014 : 0x54008428
dwc2 12480000.hsotg: GINTMSK      @0xE0260018 : 0x800C3800
dwc2 12480000.hsotg: GRXSTSR      @0xE026001C : 0x616EC77D
dwc2 12480000.hsotg: GRXFSIZ      @0xE0260024 : 0x00000400
dwc2 12480000.hsotg: GNPTXFSIZ    @0xE0260028 : 0x04000400
dwc2 12480000.hsotg: GNPTXSTS     @0xE026002C : 0x00080400
dwc2 12480000.hsotg: GI2CCTL      @0xE0260030 : 0x00000000
dwc2 12480000.hsotg: GPVNDCTL     @0xE0260034 : 0x00000000
dwc2 12480000.hsotg: GGPIO        @0xE0260038 : 0x00000000
dwc2 12480000.hsotg: GUID         @0xE026003C : 0x00000000
dwc2 12480000.hsotg: GSNPSID      @0xE0260040 : 0x4F54281A
dwc2 12480000.hsotg: GHWCFG1      @0xE0260044 : 0x00000000
dwc2 12480000.hsotg: GHWCFG2      @0xE0260048 : 0x228FFC50
dwc2 12480000.hsotg: GHWCFG3      @0xE026004C : 0x1E8084E8
dwc2 12480000.hsotg: GHWCFG4      @0xE0260050 : 0xFFF08030
dwc2 12480000.hsotg: GLPMCFG      @0xE0260054 : 0x00000000
dwc2 12480000.hsotg: GPWRDN       @0xE0260058 : 0x00000000
dwc2 12480000.hsotg: GDFIFOCFG    @0xE026005C : 0x00000000
dwc2 12480000.hsotg: HPTXFSIZ     @0xE0260100 : 0x00000000
dwc2 12480000.hsotg: PCGCTL       @0xE0260E00 : 0x00000000
dwc2 12480000.hsotg: dwc2_check_params: Invalid parameter besl=1
dwc2 12480000.hsotg: dwc2_check_params: Invalid parameter 
g_np_tx_fifo_size=1024
dwc2 12480000.hsotg: EPs: 16, dedicated fifos, 7808 entries in SPRAM
> Is the issue seen because of programming PCGCTL.PCGCTL_GATEHCLK bit
> only? To check it, could you please comment this bit setting/resetting
> in clock gating functions:
> dwc2_host_exit_clock_gating()
> dwc2_host_enter_clock_gating()
> dwc2_gadget_exit_clock_gating()
> dwc2_gadget_enter_clock_gating()

After removing programming PCGCTL.PCGCTL_GATEHCLK bit in the above 
functions, everything works fine.

Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

