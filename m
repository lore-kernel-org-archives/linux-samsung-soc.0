Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02ADBC4338F
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 Aug 2021 11:29:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DAAC560F6F
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 Aug 2021 11:29:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237604AbhHDL3r (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 Aug 2021 07:29:47 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:35805 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237450AbhHDL3q (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Aug 2021 07:29:46 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20210804112932euoutp01db3bb300d9d7f17ff61c50b6b8a4dcf7~YFwRojVAM2756327563euoutp012
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Aug 2021 11:29:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20210804112932euoutp01db3bb300d9d7f17ff61c50b6b8a4dcf7~YFwRojVAM2756327563euoutp012
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1628076573;
        bh=dOEN0tk1osUaU772dt/Niq21qviHY5f0ZYg4meME/Dc=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=LbPH9D6wIYZrlfE7ibTZGL58EM9ygS9Fr5bLe5KvO+F6/fr7fGsvo7WJ4YCOx/CKo
         /s7A8rGbj1zVAIZXpVUdJ0xbro9K/LlkRkwjkvaAnvktu3JsFCV1b5Pk7z8HcYr+q4
         2S4Oo565MfqI2ONmhX24NCUdEWn1FcLXsbqx3DyU=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210804112932eucas1p158635743f7f3fff8e92c4ed951113b43~YFwRWtiTj1613516135eucas1p1j;
        Wed,  4 Aug 2021 11:29:32 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id A6.B1.56448.C1A7A016; Wed,  4
        Aug 2021 12:29:32 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210804112932eucas1p1b73a41f6c35689aca57cfe8216f7dafb~YFwRACSdq2660826608eucas1p1F;
        Wed,  4 Aug 2021 11:29:32 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210804112932eusmtrp17e729c921da5fb8a7f61eba54a295c0e~YFwQ-XeSs1693416934eusmtrp1g;
        Wed,  4 Aug 2021 11:29:32 +0000 (GMT)
X-AuditID: cbfec7f5-d3bff7000002dc80-15-610a7a1c2f6a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id DA.7B.31287.C1A7A016; Wed,  4
        Aug 2021 12:29:32 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210804112931eusmtip2ce61a9fa77b83e56bc8c0a4a36d9c7bf~YFwQdjt0a1011110111eusmtip2t;
        Wed,  4 Aug 2021 11:29:31 +0000 (GMT)
Subject: Re: [PATCH] usb: dwc2: Skip clock gating on Samsung SoCs
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc:     Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <26099de1-826f-42bf-0de7-759a47faf4a0@samsung.com>
Date:   Wed, 4 Aug 2021 13:29:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <19ddcd51-1f1c-52a8-8eaf-dabf7425d395@synopsys.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTcRTH++3ucV1Nfi7LU0nFykRFzRo0emkQNUXDLCWi0KtdH+SjdrWy
        l1lUU5eFGs5pmRPNrFyJm2aUOM2pC42U8h3VSNJWmRq9jJq3h/99z/l9zvmeL/xIQqzmLSTj
        EpNpRSIVL+ELuYaWrx2ezkeF1Ep97jLZhQGp7K5ax5N1dt4RyLrqi/gydedDjkxbfpaQvc/r
        J/wE8urKDL48u6YSyWsaxpF8vHpxMHe3cP0+Oj7uEK3w3hghjO1t7+YfqPA7UnKjinMKNUgz
        kR0JWAo3jVVEJhKSYlyBQDU4zGOLCQSFysc8GyXG4wg+NpF/JyY7dX+g6wj61WY+W4whaDvf
        zLdRc/EmMLQPTVOOeAqB6YZy2oTAeQgu9yoFNoqPfSDTmjk9IcIbIe+++TdEkly8HJ69cbW1
        5+EoGDB/+IM4QFuBhWvTdtgP+r7UIpsm8BI4oy8kWO0EfZZijs0LcA8JBm0h37YT8GZ4PuXP
        RpgLI6YaAaudwZyr4rL8GQQvO24L2EKFoOu0GrHUOhjo+Da9iMBuoKv3ZtubYPRqBo/dbw89
        Vgf2BnvIMeQTbFsEynNill4BGlPVP9vGJ0+JS0iimZFMMyONZkYazX/fa4hbiZzoFCYhhmZW
        J9KHvRgqgUlJjPGKSkqoRr8/j/mnabIOVYyMeRkRh0RGBCQhcRSF9pCUWLSPSj1KK5LCFSnx
        NGNEi0iuxElUr78VLsYxVDK9n6YP0Iq/rxzSbuEpTnBQ94/WoMosS/LerHQmmlGqdrq5DXv2
        LvdvGuhfqrQIs8+lRzZEuL7Ne/AhQL9dpDvxrX8ipP6urmmVZ3OJdVaAPjri9WeLNiqjqOXL
        Id/BlLIFgl2zN+y/6ZneTm6ZvCbJPh7t6P+uJ200tHp9myJMqsnSXvQmQkxja0JSz1qGhMfW
        UoN1ZeWK0lKHV9ZIee51fXq2/GHglsZuDxeiqHZrcP6Oq9tUe4YCH7kYTsQ22rea5pWX+75A
        DmnOc4al398U631P3jPpZh1MbrXuio+bCLsyUhAnmFNiTNVObPcdSyuuDV3yKTinLjCnbLKu
        yHhnfr7r6JRHmHsF9oi0fLon4TKxlI87oWCoX7ciSACrAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRmVeSWpSXmKPExsVy+t/xe7oyVVyJBq++8Fj03jGx2DhjPavF
        +fMb2C0u75rDZjHj/D4mi0XLWpkt3k25zezA7rFpVSebR9+WVYweW/Z/ZvT4vEkugCVKz6Yo
        v7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng81srIVEnfziYlNSezLLVI3y5BL+PmqStsBSsc
        KhauXMfUwLjfpIuRk0NCwETi6/n1rCC2kMBSRonrE+sh4jISJ6c1sELYwhJ/rnWxdTFyAdW8
        Z5RoOX6FESQhLOAose3UPVaQhIjAX0aJW3tus4M4zAJTGCVWHr7PCtGykUni1YwfbCAtbAKG
        El1vu8BsXgE7iSm7TzN3MXJwsAioSFx7pg4SFhVIluj7MoERokRQ4uTMJywgNqeAg8StH9vB
        4swCZhLzNj9khrDlJZq3zoayxSVuPZnPNIFRaBaS9llIWmYhaZmFpGUBI8sqRpHU0uLc9Nxi
        Q73ixNzi0rx0veT83E2MwFjbduzn5h2M81591DvEyMTBeIhRgoNZSYQ39AZHohBvSmJlVWpR
        fnxRaU5q8SFGU6B3JjJLiSbnA6M9ryTe0MzA1NDEzNLA1NLMWEmcd+vcNfFCAumJJanZqakF
        qUUwfUwcnFINTJYVTvuuqOXlyZRkm7wSjwm4ttPlQ1bvpKK3O2cZ7gsw3dV3MfC4i0nzlbR/
        NbGVf42t82oZlLWey3oLmE2UmNp66mme6Vf233v4OuJ4b+b1pWRE1Niu3aOn/tDlgheLVr19
        RtmXovsn+id/6Ozu02A4Vb7uQYRQe4Xwr1N/ovarxVyZtlzlhvbCt9x1bMr6bNxHBYMsNvPI
        qnnv1YsIsAxhP8ofd9XoNCuTta1KZyL/lVcTe1yKJfI2b1KIKo59xLgitGL1rlUyKx9osm93
        m6y5ehJDwKPPwj863E9f6d5lcPS/7DvJb5kFvUIyujkiPz8VX10VW3H4ix+r5+P6jeanu2dM
        9+TclPXp9mwlluKMREMt5qLiRABCArkDPgMAAA==
X-CMS-MailID: 20210804112932eucas1p1b73a41f6c35689aca57cfe8216f7dafb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210716050132eucas1p285949f9a73764b173c29ad0fa8502f23
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210716050132eucas1p285949f9a73764b173c29ad0fa8502f23
References: <CGME20210716050132eucas1p285949f9a73764b173c29ad0fa8502f23@eucas1p2.samsung.com>
        <20210716050127.4406-1-m.szyprowski@samsung.com>
        <a7efdf13-48bb-db21-5755-ebbbe2614f78@synopsys.com>
        <0d8de3e0-341b-f751-909d-22aa16e91717@samsung.com>
        <19ddcd51-1f1c-52a8-8eaf-dabf7425d395@synopsys.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi

On 03.08.2021 12:08, Minas Harutyunyan wrote:
> On 8/3/2021 1:40 PM, Marek Szyprowski wrote:
>> On 16.07.2021 16:54, Minas Harutyunyan wrote:
>>> On 7/16/2021 9:01 AM, Marek Szyprowski wrote:
>>>> Commit 0112b7ce68ea ("usb: dwc2: Update dwc2_handle_usb_suspend_intr
>>>> function.") changed the way the driver handles power down modes in a such
>>>> way that it uses clock gating when no other power down mode is available.
>>>>
>>>> This however doesn't work well on the DWC2 implementation used on the
>>>> Samsung SoCs. When a clock gating is enabled, system hangs. It looks that
>>>> the proper clock gating requires some additional glue code in the shared
>>>> USB2 PHY and/or Samsung glue code for the DWC2. To restore driver
>>>> operation on the Samsung SoCs simply skip enabling clock gating mode
>>>> until one finds what is really needed to make it working reliably.
>>>>
>>>> Fixes: 0112b7ce68ea ("usb: dwc2: Update dwc2_handle_usb_suspend_intr function.")
>>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>> ---
>>>>      drivers/usb/dwc2/core.h      | 4 ++++
>>>>      drivers/usb/dwc2/core_intr.c | 3 ++-
>>>>      drivers/usb/dwc2/hcd.c       | 6 ++++--
>>>>      drivers/usb/dwc2/params.c    | 1 +
>>>>      4 files changed, 11 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
>>>> index ab6b815e0089..483de2bbfaab 100644
>>>> --- a/drivers/usb/dwc2/core.h
>>>> +++ b/drivers/usb/dwc2/core.h
>>>> @@ -383,6 +383,9 @@ enum dwc2_ep0_state {
>>>>       *			0 - No (default)
>>>>       *			1 - Partial power down
>>>>       *			2 - Hibernation
>>>> + * @no_clock_gating:	Specifies whether to avoid clock gating feature.
>>>> + *			0 - No (use clock gating)
>>>> + *			1 - Yes (avoid it)
>>>>       * @lpm:		Enable LPM support.
>>>>       *			0 - No
>>>>       *			1 - Yes
>>>> @@ -480,6 +483,7 @@ struct dwc2_core_params {
>>>>      #define DWC2_POWER_DOWN_PARAM_NONE		0
>>>>      #define DWC2_POWER_DOWN_PARAM_PARTIAL		1
>>>>      #define DWC2_POWER_DOWN_PARAM_HIBERNATION	2
>>>> +	bool no_clock_gating;
>>>>      
>>>>      	bool lpm;
>>>>      	bool lpm_clock_gating;
>>>> diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
>>>> index a5ab03808da6..a5c52b237e72 100644
>>>> --- a/drivers/usb/dwc2/core_intr.c
>>>> +++ b/drivers/usb/dwc2/core_intr.c
>>>> @@ -556,7 +556,8 @@ static void dwc2_handle_usb_suspend_intr(struct dwc2_hsotg *hsotg)
>>>>      				 * If neither hibernation nor partial power down are supported,
>>>>      				 * clock gating is used to save power.
>>>>      				 */
>>>> -				dwc2_gadget_enter_clock_gating(hsotg);
>>>> +				if (!hsotg->params.no_clock_gating)
>>>> +					dwc2_gadget_enter_clock_gating(hsotg);
>>>>      			}
>>>>      
>>>>      			/*
>>>> diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
>>>> index 035d4911a3c3..2a7828971d05 100644
>>>> --- a/drivers/usb/dwc2/hcd.c
>>>> +++ b/drivers/usb/dwc2/hcd.c
>>>> @@ -3338,7 +3338,8 @@ int dwc2_port_suspend(struct dwc2_hsotg *hsotg, u16 windex)
>>>>      		 * If not hibernation nor partial power down are supported,
>>>>      		 * clock gating is used to save power.
>>>>      		 */
>>>> -		dwc2_host_enter_clock_gating(hsotg);
>>>> +		if (!hsotg->params.no_clock_gating)
>>>> +			dwc2_host_enter_clock_gating(hsotg);
>>>>      		break;
>>>>      	}
>>>>      
>>>> @@ -4402,7 +4403,8 @@ static int _dwc2_hcd_suspend(struct usb_hcd *hcd)
>>>>      		 * If not hibernation nor partial power down are supported,
>>>>      		 * clock gating is used to save power.
>>>>      		 */
>>>> -		dwc2_host_enter_clock_gating(hsotg);
>>>> +		if (!hsotg->params.no_clock_gating)
>>>> +			dwc2_host_enter_clock_gating(hsotg);
>>>>      
>>>>      		/* After entering suspend, hardware is not accessible */
>>>>      		clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
>>>> diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
>>>> index 67c5eb140232..59e119345994 100644
>>>> --- a/drivers/usb/dwc2/params.c
>>>> +++ b/drivers/usb/dwc2/params.c
>>>> @@ -76,6 +76,7 @@ static void dwc2_set_s3c6400_params(struct dwc2_hsotg *hsotg)
>>>>      	struct dwc2_core_params *p = &hsotg->params;
>>>>      
>>>>      	p->power_down = DWC2_POWER_DOWN_PARAM_NONE;
>>>> +	p->no_clock_gating = true;
>>>>      	p->phy_utmi_width = 8;
>>>>      }
>>>>      
>>>>
>>> In which mode host/device you see the issue?
>> I do my test in my device mode.
>>> What is your core version? Please provide GHWCFG1-4 registers values.
>> This is a result of dwc2_dump_global_registers() added just after
>> dwc2_lowlevel_hw_enable() in dwc2_driver_probe():
>>
>> dwc2 12480000.hsotg: Core Global Registers
>>
>> dwc2 12480000.hsotg: GOTGCTL      @0xE0260000 : 0x000D0000
>> dwc2 12480000.hsotg: GOTGINT      @0xE0260004 : 0x00000000
>> dwc2 12480000.hsotg: GAHBCFG      @0xE0260008 : 0x00000027
>> dwc2 12480000.hsotg: GUSBCFG      @0xE026000C : 0x0000540F
>> dwc2 12480000.hsotg: GRSTCTL      @0xE0260010 : 0x80000040
>> dwc2 12480000.hsotg: GINTSTS      @0xE0260014 : 0x54008428
>> dwc2 12480000.hsotg: GINTMSK      @0xE0260018 : 0x800C3800
>> dwc2 12480000.hsotg: GRXSTSR      @0xE026001C : 0x616EC77D
>> dwc2 12480000.hsotg: GRXFSIZ      @0xE0260024 : 0x00000400
>> dwc2 12480000.hsotg: GNPTXFSIZ    @0xE0260028 : 0x04000400
>> dwc2 12480000.hsotg: GNPTXSTS     @0xE026002C : 0x00080400
>> dwc2 12480000.hsotg: GI2CCTL      @0xE0260030 : 0x00000000
>> dwc2 12480000.hsotg: GPVNDCTL     @0xE0260034 : 0x00000000
>> dwc2 12480000.hsotg: GGPIO        @0xE0260038 : 0x00000000
>> dwc2 12480000.hsotg: GUID         @0xE026003C : 0x00000000
>> dwc2 12480000.hsotg: GSNPSID      @0xE0260040 : 0x4F54281A
>> dwc2 12480000.hsotg: GHWCFG1      @0xE0260044 : 0x00000000
>> dwc2 12480000.hsotg: GHWCFG2      @0xE0260048 : 0x228FFC50
>> dwc2 12480000.hsotg: GHWCFG3      @0xE026004C : 0x1E8084E8
>> dwc2 12480000.hsotg: GHWCFG4      @0xE0260050 : 0xFFF08030
>> dwc2 12480000.hsotg: GLPMCFG      @0xE0260054 : 0x00000000
>> dwc2 12480000.hsotg: GPWRDN       @0xE0260058 : 0x00000000
>> dwc2 12480000.hsotg: GDFIFOCFG    @0xE026005C : 0x00000000
>> dwc2 12480000.hsotg: HPTXFSIZ     @0xE0260100 : 0x00000000
>> dwc2 12480000.hsotg: PCGCTL       @0xE0260E00 : 0x00000000
>> dwc2 12480000.hsotg: dwc2_check_params: Invalid parameter besl=1
>> dwc2 12480000.hsotg: dwc2_check_params: Invalid parameter
>> g_np_tx_fifo_size=1024
>> dwc2 12480000.hsotg: EPs: 16, dedicated fifos, 7808 entries in SPRAM
>>> Is the issue seen because of programming PCGCTL.PCGCTL_GATEHCLK bit
>>> only? To check it, could you please comment this bit setting/resetting
>>> in clock gating functions:
>>> dwc2_host_exit_clock_gating()
>>> dwc2_host_enter_clock_gating()
>>> dwc2_gadget_exit_clock_gating()
>>> dwc2_gadget_enter_clock_gating()
>> After removing programming PCGCTL.PCGCTL_GATEHCLK bit in the above
>> functions, everything works fine.
>>
>> Best regards
>>
> Thank you for testing and confirm my expectations.
>
> There are 3 options:
> 1. Do not update your patch and accept it
> 2. Update your patch to exclude programming of PCGCTL.PCGCTL_GATEHCLK
> bit based on hsotg->params.no_clock_gating in all
> ..._exit/enter_clock_gating functions
> 3. More radical solution, to have really ...POWER_DOWN_NONE case:
> - rename DWC2_POWER_DOWN_PARAM_NONE to DWC2_POWER_DOWN_CLOCK_GATING in
> whole driver;
> - define new power state "#define DWC2_POWER_DOWN_PARAM_NONE	-1"
> - and for all platforms who doesn't want to have any power optimization
> keep:
>       p->power_down = DWC2_POWER_DOWN_PARAM_NONE;
>
>
> I would prefer option 3. What you think about this solution? Can you
> implement it (I guess it required 5 min) and test on your platform.

Okay, I will do the 3rd option. However, the $subject patch has been 
already merged to v5.14-rc3 some time ago, so I will do that on top of 
v5.14-rc3.

Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

