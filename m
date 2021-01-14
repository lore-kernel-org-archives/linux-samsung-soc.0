Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01020C433DB
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Jan 2021 07:37:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD56A238EC
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Jan 2021 07:37:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727418AbhANHhR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 14 Jan 2021 02:37:17 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:35033 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726182AbhANHhQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 Jan 2021 02:37:16 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210114073634euoutp023a73b9055896dab4408017fc8eb98e02~aCRMFAV0l3147031470euoutp02W
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Jan 2021 07:36:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210114073634euoutp023a73b9055896dab4408017fc8eb98e02~aCRMFAV0l3147031470euoutp02W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1610609794;
        bh=27Ksu8z8We/ReFaH03s10aKJZB0DFe03HxOquroB3uA=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=PawX9/+pPQQq0ufA+NHOZrrXEFWSUE/laX3kXuyNTRmEbtFOHV6vgvD9SMRnssRne
         +n2DFD4L4qY2e9xGzd6slI0rKHqqGVkhJIBk0mQrTd3Swd9pwHkEoC0ECC+qWzGtSO
         oRFV1AD6DcIBz3Yv7xfSlvc1V0nXv6nxh95kMpsU=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210114073633eucas1p1fd7026a82e5febd9013f0fc5e2dd5870~aCRL0Pf4_0637406374eucas1p1K;
        Thu, 14 Jan 2021 07:36:33 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 56.EA.45488.184FFFF5; Thu, 14
        Jan 2021 07:36:33 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210114073633eucas1p1f9af0e646b3dcfa3d4f6145a7fe93080~aCRLdu5Tc0047700477eucas1p1Z;
        Thu, 14 Jan 2021 07:36:33 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210114073633eusmtrp1d5fa7d3a3d7a6a9841b477a850143354~aCRLcygm-1783417834eusmtrp1T;
        Thu, 14 Jan 2021 07:36:33 +0000 (GMT)
X-AuditID: cbfec7f5-c5fff7000000b1b0-79-5ffff4815781
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 3E.29.21957.184FFFF5; Thu, 14
        Jan 2021 07:36:33 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210114073632eusmtip255a8f68844205fec0fc59c28f287c860~aCRKskKGo0146901469eusmtip2C;
        Thu, 14 Jan 2021 07:36:32 +0000 (GMT)
Subject: Re: [PATCH v1 5/5] driver core: Set fw_devlink=on by default
To:     Saravana Kannan <saravanak@google.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Kevin Hilman <khilman@baylibre.com>,
        John Stultz <john.stultz@linaro.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Marc Zyngier <maz@kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <3db354fb-28e8-78c7-cf73-a9042228d50b@samsung.com>
Date:   Thu, 14 Jan 2021 08:36:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAGETcx-aEitKpU0r-iYG-AaKMd4bZmNFWKfKeUNeq3m+TKjtjA@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPKsWRmVeSWpSXmKPExsWy7djP87qNX/7HGyw8omGxccZ6VovmxevZ
        LKbdXM5icea3rsWO7SIWP9u3MFmcP7+B3eLyrjlsFjPO72Oy2DnnJKvFtlnL2SzmfpnKbNF1
        6C+bA6/Htt3bWD3e32hl91iwqdRj06pONo871/aweeyfu4bdo2/LKkaPzaerPSZdOcfs8XmT
        XABXFJdNSmpOZllqkb5dAlfGk+0rmQu+WlS0nPjL3sC4SaeLkZNDQsBE4tP77YxdjFwcQgIr
        GCWm/JnDCuF8YZRo6L8E5XxmlFi67B0TTMv1M+ugEssZJfasOArV/5FRYv2SOcxdjBwcwgKu
        El+O+4A0iAhoSWy69pgFxGYWmMUi8aHHAsRmEzCU6HrbxQZi8wrYSSxd1AZmswioSlxddpwd
        xBYVSJK4e+cwE0SNoMTJmU9YQMZzCgRKrGyuhhgpL7H9LchWEFtc4taT+Uwg50gIrOaUODVx
        JxvE0S4SL47OZoSwhSVeHd/CDmHLSJye3MMC0dDMKPHw3Fp2CKeHUeJy0wyoDmuJO+d+sYFs
        ZhbQlFi/Sx/ElBBwlDj8qgLC5JO48VYQ4gY+iUnbpjNDhHklOtqEIGaoScw6vg5u68ELl5gn
        MCrNQvLYLCTfzELyzSyEtQsYWVYxiqeWFuempxYb56WW6xUn5haX5qXrJefnbmIEprnT/45/
        3cG44tVHvUOMTByMhxglOJiVRHiLuv/GC/GmJFZWpRblxxeV5qQWH2KU5mBREufdtXVNvJBA
        emJJanZqakFqEUyWiYNTqoFpVbrX2cMRL/U1U3bLvMip29/if3DqTt7gY64Nv4VNFFU+yHNs
        c4xkVfrQZhI3NVmglCEm42r7//6iv/klCUbnXitJPMi191KK194mPOUp+1fJ+Slq611OPG2I
        LvPct+BD092LD+u+iP4yFZV85D7Lb5G875rNAkwHis5537h5T83zUhXbFdvZ73drrg1edF32
        Y9m8hGU3P8bZn4yc8+RZqJ7++WtBLPEb2PZGtv/g673E+chk4V2HnWXJG5Vr2VfsTnkos4RR
        MnvemcLjwXv7lwRN+iY79XZQ1bHty49c/+umuMrOyMCgINhxQ7mL1szbje3X5q6a/XhqpuY5
        jf6g81//L3BsMXO7onuMseKJEktxRqKhFnNRcSIArc6F1uIDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRmVeSWpSXmKPExsVy+t/xe7qNX/7HG3z6xWOxccZ6VovmxevZ
        LKbdXM5icea3rsWO7SIWP9u3MFmcP7+B3eLyrjlsFjPO72Oy2DnnJKvFtlnL2SzmfpnKbNF1
        6C+bA6/Htt3bWD3e32hl91iwqdRj06pONo871/aweeyfu4bdo2/LKkaPzaerPSZdOcfs8XmT
        XABXlJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpOZllqkb5dgl7G
        k+0rmQu+WlS0nPjL3sC4SaeLkZNDQsBE4vqZdaxdjFwcQgJLGSVmHHvNApGQkTg5rYEVwhaW
        +HOtiw2i6D2jRMPLWUAOB4ewgKvEl+M+IDUiAloSm649ZgGpYRZYwCLRMe0wE0TDKxaJw5O/
        s4NUsQkYSnS9BZnEycErYCexdFEbmM0ioCpxddlxsBpRgSSJE7M+MUPUCEqcnPmEBWQZp0Cg
        xMrmapAws4CZxLzND5khbHmJ7W/nQNniEreezGeawCg0C0n3LCQts5C0zELSsoCRZRWjSGpp
        cW56brGhXnFibnFpXrpecn7uJkZgbG879nPzDsZ5rz7qHWJk4mA8xCjBwawkwlvU/TdeiDcl
        sbIqtSg/vqg0J7X4EKMp0DsTmaVEk/OBySWvJN7QzMDU0MTM0sDU0sxYSZx369w18UIC6Ykl
        qdmpqQWpRTB9TBycUg1MaZwe9g4rDdk2rheYtPVPsGBaV+b3z0Fv7Q7zfvF58ev/F1u2IzPT
        rb9cUzwXl3t3X+V/f8cns4QfrWlpfip4+EVp+bf7T95y7ffparWdVOwaOZvnwoGECJtq26XX
        bL97sc/n/nRlTkv8r5exe/sYj63J+5Z69fzEj/fPpP4WDbnswRf70y1QQH39h2my7MrG6/5v
        u6HPeOPdy9DdJqHCp76aV3dYTA6uFmA1TPwtfr2gT9P5u+dyTS1+N6Ess4q2Frusgz6pk9kW
        dp/dMWFtypnM75yVaWpa+y4f0WgIvL6HN1Da542Y8OSTLncncK+OUgx8lXFZt/jBsQumfTX5
        z34VdF99rGWgZyajFeajxFKckWioxVxUnAgAzTDxRXYDAAA=
X-CMS-MailID: 20210114073633eucas1p1f9af0e646b3dcfa3d4f6145a7fe93080
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210111141814eucas1p1f388df07b789693a999042b27f0d8c2a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210111141814eucas1p1f388df07b789693a999042b27f0d8c2a
References: <20201218031703.3053753-1-saravanak@google.com>
        <20201218031703.3053753-6-saravanak@google.com>
        <CGME20210111141814eucas1p1f388df07b789693a999042b27f0d8c2a@eucas1p1.samsung.com>
        <5484316b-0f27-6c36-9259-5c765bb6b96c@samsung.com>
        <2556a69b-5da5-bf80-e051-df2d02fbc40f@samsung.com>
        <CAGETcx8-1YzF2Br0sszJROLAWo3DSm27K071Md9wY5SOwUeLdw@mail.gmail.com>
        <fde65185-fd00-1f79-0f80-245eaa6c95cb@samsung.com>
        <CAGETcx_QY3h83q1fSr=h_vMQdH-TMhVYPozPuSr=q4uv2Lr48w@mail.gmail.com>
        <ed32b9c7-b6d6-bf86-5e43-fd0c4aa75dd6@samsung.com>
        <CAGETcx-aEitKpU0r-iYG-AaKMd4bZmNFWKfKeUNeq3m+TKjtjA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Saravana,

On 13.01.2021 20:23, Saravana Kannan wrote:
> On Tue, Jan 12, 2021 at 11:04 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> On 12.01.2021 21:51, Saravana Kannan wrote:
>>> On Mon, Jan 11, 2021 at 11:11 PM Marek Szyprowski
>>> <m.szyprowski@samsung.com> wrote:
>>>> On 11.01.2021 22:47, Saravana Kannan wrote:
>>>>> On Mon, Jan 11, 2021 at 6:18 AM Marek Szyprowski
>>>>> <m.szyprowski@samsung.com> wrote:
>>>>>> On 11.01.2021 12:12, Marek Szyprowski wrote:
>>>>>>> On 18.12.2020 04:17, Saravana Kannan wrote:
>>>>>>>> Cyclic dependencies in some firmware was one of the last remaining
>>>>>>>> reasons fw_devlink=on couldn't be set by default. Now that cyclic
>>>>>>>> dependencies don't block probing, set fw_devlink=on by default.
>>>>>>>>
>>>>>>>> Setting fw_devlink=on by default brings a bunch of benefits (currently,
>>>>>>>> only for systems with device tree firmware):
>>>>>>>> * Significantly cuts down deferred probes.
>>>>>>>> * Device probe is effectively attempted in graph order.
>>>>>>>> * Makes it much easier to load drivers as modules without having to
>>>>>>>>       worry about functional dependencies between modules (depmod is still
>>>>>>>>       needed for symbol dependencies).
>>>>>>>>
>>>>>>>> If this patch prevents some devices from probing, it's very likely due
>>>>>>>> to the system having one or more device drivers that "probe"/set up a
>>>>>>>> device (DT node with compatible property) without creating a struct
>>>>>>>> device for it.  If we hit such cases, the device drivers need to be
>>>>>>>> fixed so that they populate struct devices and probe them like normal
>>>>>>>> device drivers so that the driver core is aware of the devices and their
>>>>>>>> status. See [1] for an example of such a case.
>>>>>>>>
>>>>>>>> [1] -
>>>>>>>> https://protect2.fireeye.com/v1/url?k=68f5d8ba-376ee1f5-68f453f5-0cc47a30d446-324e64700545ab93&q=1&e=fb455b9e-c8c7-40d0-8e3c-d9d3713d519b&u=https%3A%2F%2Flore.kernel.org%2Flkml%2FCAGETcx9PiX%3D%3DmLxB9PO8Myyk6u2vhPVwTMsA5NkD-ywH5xhusw%40mail.gmail.com%2F
>>>>>>>> Signed-off-by: Saravana Kannan <saravanak@google.com>
>>>>>>> This patch landed recently in linux next-20210111 as commit
>>>>>>> e590474768f1 ("driver core: Set fw_devlink=on by default"). Sadly it
>>>>>>> breaks Exynos IOMMU operation, what causes lots of devices being
>>>>>>> deferred and not probed at all. I've briefly checked and noticed that
>>>>>>> exynos_sysmmu_probe() is never called after this patch. This is really
>>>>>>> strange for me, as the SYSMMU controllers on Exynos platform are
>>>>>>> regular platform devices registered by the OF code. The driver code is
>>>>>>> here: drivers/iommu/exynos-iommu.c, example dts:
>>>>>>> arch/arm/boot/dts/exynos3250.dtsi (compatible = "samsung,exynos-sysmmu").
>>>>>> Okay, I found the source of this problem. It is caused by Exynos power
>>>>>> domain driver, which is not platform driver yet. I will post a patch,
>>>>>> which converts it to the platform driver.
>>>>> Thanks Marek! Hopefully the debug logs I added were sufficient to
>>>>> figure out the reason.
>>>> Frankly, it took me a while to figure out that device core waits for the
>>>> power domain devices. Maybe it would be possible to add some more debug
>>>> messages or hints? Like the reason of the deferred probe in
>>>> /sys/kernel/debug/devices_deferred ?
>>> There's already a /sys/devices/.../<device>/waiting_for_supplier file
>>> that tells you if the device is waiting for a supplier device to be
>>> added. That file goes away once the device probes. If the file has 1,
>>> then it's waiting for the supplier device to be added (like your
>>> case). If it's 0, then the device is just waiting on one of the
>>> existing suppliers to probe. You can find the existing suppliers
>>> through /sys/devices/.../<device>/supplier:*/supplier. Also, flip
>>> these dev_dbg() to dev_info() if you need more details about deferred
>>> probing.
>> Frankly speaking I doubt that anyone will find those. Even experienced
>> developer might need some time to figure it out.
>>
>> I expect that such information will be at least in the mentioned
>> /sys/kernel/debug/devices_deferred file. We already have infrastructure
>> for putting the deferred probe reason there, see dev_err_probe()
>> function. Even such a simple change makes the debugging this issue much
>> easier:
>>
>> diff --git a/drivers/base/core.c b/drivers/base/core.c
>> index cd8e518fadd6..ceb5aed5a84c 100644
>> --- a/drivers/base/core.c
>> +++ b/drivers/base/core.c
>> @@ -937,12 +937,13 @@ int device_links_check_suppliers(struct device *dev)
>>           mutex_lock(&fwnode_link_lock);
>>           if (dev->fwnode && !list_empty(&dev->fwnode->suppliers) &&
>>               !fw_devlink_is_permissive()) {
>> -               dev_dbg(dev, "probe deferral - wait for supplier %pfwP\n",
>> +               ret = dev_err_probe(dev, -EPROBE_DEFER,
>> +                       "probe deferral - wait for supplier %pfwP\n",
>> list_first_entry(&dev->fwnode->suppliers,
>>                           struct fwnode_link,
>>                           c_hook)->supplier);
>>                   mutex_unlock(&fwnode_link_lock);
>> -               return -EPROBE_DEFER;
>> +               return ret;
>>           }
>>           mutex_unlock(&fwnode_link_lock);
>>
>> @@ -955,9 +956,9 @@ int device_links_check_suppliers(struct device *dev)
>>                   if (link->status != DL_STATE_AVAILABLE &&
>>                       !(link->flags & DL_FLAG_SYNC_STATE_ONLY)) {
>>                           device_links_missing_supplier(dev);
>> -                       dev_dbg(dev, "probe deferral - supplier %s not
>> ready\n",
>> +                       ret = dev_err_probe(dev, -EPROBE_DEFER,
>> +                               "probe deferral - supplier %s not ready\n",
>>                                   dev_name(link->supplier));
>> -                       ret = -EPROBE_DEFER;
>>                           break;
>>                   }
>>                   WRITE_ONCE(link->status, DL_STATE_CONSUMER_PROBE);
>>
>>
>> After such change:
>>
>> # cat /sys/kernet/debug/devices_deferred
> Sweet! I wasn't aware of this file at all.
>
> However, on a side note, one of my TODO items is to not add devices to
> the deferred probe list if they'll never probe yet (due to suppliers
> not having probed). On a board I tested on, it cut down really_probe()
> calls by 75%! So the probe attempt itself effectively happens in graph
> order (which I think is pretty cool). So that's going to conflict with
> this file. I'll have to see what to do about that.
>
> Thanks for this pointer. Let me sit on this for 2 weeks and see how I
> can incorporate your suggestion while allowing for the above. And then
> I'll send out a patch. Does that work?

Fine for me.

Even if you want to change the core not to probe devices that miss their 
suppliers (what's good imho), the 'devices_deferred' file might still 
contain all of them. For user it is just a list of devices that are not 
yet available in the system with the optional reasons for that.

Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

