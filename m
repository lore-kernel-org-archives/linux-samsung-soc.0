Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3019FC433DB
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 13 Jan 2021 07:05:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D883C2312E
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 13 Jan 2021 07:05:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726011AbhAMHEw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 13 Jan 2021 02:04:52 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:34079 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbhAMHEt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 13 Jan 2021 02:04:49 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210113070405euoutp02b083cae4b4c54084a8aea635488547bb~ZuLjRIMGb2157821578euoutp020
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Jan 2021 07:04:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210113070405euoutp02b083cae4b4c54084a8aea635488547bb~ZuLjRIMGb2157821578euoutp020
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1610521445;
        bh=XyOhINqIAjlKeyzqaH6QdfsikSvA26GQXGomvuh25nA=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=TdIGgyPoVQBg2WngElLIPaQkC7PpyXEXQKs++rcf0t+aDYHnlJUTjP1Ao+ClKkKB1
         YNRUIyyV0aOjWqtfRVDXf7+2ANOSxPcx5CHmCyJPRIsSvpcdkh5jxr79POxEBfwFNm
         6cRk6NAV8qpzI8xxPzzMPwIPvsrLDp6Lbd8cRG+c=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210113070405eucas1p116f9b474e92948df2d0479b686a22302~ZuLi9vMw_2776127761eucas1p1x;
        Wed, 13 Jan 2021 07:04:05 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 8D.80.27958.56B9EFF5; Wed, 13
        Jan 2021 07:04:05 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210113070404eucas1p13e3439afd5de299b047a85aaa53d896e~ZuLii2ihu2775927759eucas1p1h;
        Wed, 13 Jan 2021 07:04:04 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210113070404eusmtrp205348b539eb1a9ca984e28358bc8310a~ZuLiiGPoT0636706367eusmtrp2x;
        Wed, 13 Jan 2021 07:04:04 +0000 (GMT)
X-AuditID: cbfec7f2-f15ff70000006d36-a3-5ffe9b6505a8
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 27.B7.21957.46B9EFF5; Wed, 13
        Jan 2021 07:04:04 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210113070404eusmtip29b328805faf4b46bdb114cc6bcff6519~ZuLhu8Pax2109021090eusmtip2W;
        Wed, 13 Jan 2021 07:04:03 +0000 (GMT)
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
Message-ID: <ed32b9c7-b6d6-bf86-5e43-fd0c4aa75dd6@samsung.com>
Date:   Wed, 13 Jan 2021 08:04:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAGETcx_QY3h83q1fSr=h_vMQdH-TMhVYPozPuSr=q4uv2Lr48w@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0xTdxTH+fXe3t7WlF0LyhEWNxpnookgoviLD0Sjy50ucy76h48IFW8A
        pcXcWhHNnBFRKMgWdAXLq46xklJeBao8xFjUCiIlUgwQlqG4R8i0QxsjEHyUC5P/Puec73l8
        k0MTCpc4mE7SHOd4jSpZSclI+71x1wqu8G3sSnetP64rqBHj9LIaChsGzCTumlyBb1wPxOMX
        G0TY5aqV4N7mIgoXuNpEuKmoQ4ztRjOFi70/E1jvmKJi5Ky9xS5mPf0ZEtZk07E2SxbFDj1u
        pdhbxVYJm9tgQWz9g9NsnrubYF/ZFn8r2yfbcJhLTjrB8eHRcbLE3Nxb1LGe6JP5mSWis6hj
        jR5JaWBWQ9+vjcjHCqYCwQX3AT2SfWAvgsnxLokQvEJgqq6TzHacq++fKZgR5LVnUEIwhiBj
        +AqpRzQdwGwDr/NrX0Mgsxxsj0dIHxOMkYT/crCPKSYC9M/1lI/lTDRU/tE6rSGZL6C25bfp
        ZQuYQ+BsyyYEzXzouPpsWiNldkHTj4OUMPMzSG8sJAQOgsFnpSLfPcBUSmHgRd/M1VvhjbdL
        LHAAjDobZvKfwrum2YZ0BE+6qyRCkIOg91wBElTrYah7gvI5I5hlUNMc7kNgNkP76EkB/aH/
        +XzhBn/Is+cTQloOmRcUwoylYHRW/7/1ds8j4iekNM5xZpzjxjjHjfHjWhMiLSiI02nVCZw2
        QsOlhmlVaq1OkxAWn6K2oQ8/9+Ct8+UNVDw6FuZAIho5ENCEMlDOZ0/FKuSHVWmnOD4lltcl
        c1oHCqFJZZDcUmiNVTAJquPcUY47xvGzVREtDT4rKvJD91OSy488/IS96q7s/cETHyVj10YO
        1T7cY/I0w/kTI0hVmnhN9Xnpl1bNvoO/hzJbAvqlKyPnFXSqi8Jtjr0GQ06JdJhCmk7Us1iy
        e+Cbu0vu4dVDl8808jez+izdrf/elZlKEnB9nN2qi5+sG9v4+kWlMo9/apBVV3y3v82SMZKa
        NBETsvdprs6zc+SMX3tZecVA8Ly0vx1HpxTqzZt6lbfbzNvLvr9UsiA0O39XOX2+pi5yZ9Rr
        /nTDYFZUfL503V/0RMydwRDxL2+uLzxitXs3BGQflKaqXZlmcWhc2o5/Oj040HDZLG5JrXLf
        7xmtWrV/eL3fV4te/unIOqUktYmqiOUEr1W9B+dD8sviAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRmVeSWpSXmKPExsVy+t/xe7ops//FG1x5qWOxccZ6VovmxevZ
        LKbdXM5icea3rsWO7SIWP9u3MFmcP7+B3eLyrjlsFjPO72Oy2DnnJKvFtlnL2SzmfpnKbNF1
        6C+bA6/Htt3bWD3e32hl91iwqdRj06pONo871/aweeyfu4bdo2/LKkaPzaerPSZdOcfs8XmT
        XABXlJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpOZllqkb5dgl5G
        X99+toILdhXTO+YxNTCeNO1i5OSQEDCRaNp8g72LkYtDSGApo8TR2ddZIRIyEienNUDZwhJ/
        rnWxQRS9Byp6vpypi5GDQ1jAVeLLcR+QGhEBLYlN1x6zgNQwCyxgkeiYdpgJouEds8T7nccZ
        QarYBAwlut6CTOLk4BWwk1h9fw8LiM0ioCqxYfcydpChogJJEovfOkGUCEqcnPkErIRTIFBi
        Z/8tsFZmATOJeZsfMkPY8hLNW2dD2eISt57MZ5rAKDQLSfssJC2zkLTMQtKygJFlFaNIamlx
        bnpusaFecWJucWleul5yfu4mRmBsbzv2c/MOxnmvPuodYmTiYDzEKMHBrCTCW9T9N16INyWx
        siq1KD++qDQntfgQoynQOxOZpUST84HJJa8k3tDMwNTQxMzSwNTSzFhJnHfr3DXxQgLpiSWp
        2ampBalFMH1MHJxSDUzHH75/9eziqoVGs69UnnVTO6CWEstfGcFqqeImxtbTNu2n1hZXfoWy
        SsEZ+544HWwJSmZ1P39wUewh0Vsr183ob0jZfbqY94nZx8ioq17Xr6qKvc//sf76xKzKdlnh
        Dz5sBt/i4sU7NkZEHo1Zl9QiX35PZ0owu/ybU+sN84XyTJrkeKcbLiq7weksGHrAWnim16+b
        G5doybNHqlt4n35svnHlk51bprSc+xrpdCA6ffZNtYVLf6txcP7er1rmqrxy1/lX91NqZPaF
        cyXkn/cQYL1bHs9lFGNncOq4+J9PQhm/PTOb78xWuBlmeuLgU63u7MjXUUyHJ0jqfDePubHt
        2OWFBc61UuHTFnxQdlFiKc5INNRiLipOBADb70cfdgMAAA==
X-CMS-MailID: 20210113070404eucas1p13e3439afd5de299b047a85aaa53d896e
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
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Saravana,

On 12.01.2021 21:51, Saravana Kannan wrote:
> On Mon, Jan 11, 2021 at 11:11 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> On 11.01.2021 22:47, Saravana Kannan wrote:
>>> On Mon, Jan 11, 2021 at 6:18 AM Marek Szyprowski
>>> <m.szyprowski@samsung.com> wrote:
>>>> On 11.01.2021 12:12, Marek Szyprowski wrote:
>>>>> On 18.12.2020 04:17, Saravana Kannan wrote:
>>>>>> Cyclic dependencies in some firmware was one of the last remaining
>>>>>> reasons fw_devlink=on couldn't be set by default. Now that cyclic
>>>>>> dependencies don't block probing, set fw_devlink=on by default.
>>>>>>
>>>>>> Setting fw_devlink=on by default brings a bunch of benefits (currently,
>>>>>> only for systems with device tree firmware):
>>>>>> * Significantly cuts down deferred probes.
>>>>>> * Device probe is effectively attempted in graph order.
>>>>>> * Makes it much easier to load drivers as modules without having to
>>>>>>      worry about functional dependencies between modules (depmod is still
>>>>>>      needed for symbol dependencies).
>>>>>>
>>>>>> If this patch prevents some devices from probing, it's very likely due
>>>>>> to the system having one or more device drivers that "probe"/set up a
>>>>>> device (DT node with compatible property) without creating a struct
>>>>>> device for it.  If we hit such cases, the device drivers need to be
>>>>>> fixed so that they populate struct devices and probe them like normal
>>>>>> device drivers so that the driver core is aware of the devices and their
>>>>>> status. See [1] for an example of such a case.
>>>>>>
>>>>>> [1] -
>>>>>> https://lore.kernel.org/lkml/CAGETcx9PiX==mLxB9PO8Myyk6u2vhPVwTMsA5NkD-ywH5xhusw@mail.gmail.com/
>>>>>> Signed-off-by: Saravana Kannan <saravanak@google.com>
>>>>> This patch landed recently in linux next-20210111 as commit
>>>>> e590474768f1 ("driver core: Set fw_devlink=on by default"). Sadly it
>>>>> breaks Exynos IOMMU operation, what causes lots of devices being
>>>>> deferred and not probed at all. I've briefly checked and noticed that
>>>>> exynos_sysmmu_probe() is never called after this patch. This is really
>>>>> strange for me, as the SYSMMU controllers on Exynos platform are
>>>>> regular platform devices registered by the OF code. The driver code is
>>>>> here: drivers/iommu/exynos-iommu.c, example dts:
>>>>> arch/arm/boot/dts/exynos3250.dtsi (compatible = "samsung,exynos-sysmmu").
>>>> Okay, I found the source of this problem. It is caused by Exynos power
>>>> domain driver, which is not platform driver yet. I will post a patch,
>>>> which converts it to the platform driver.
>>> Thanks Marek! Hopefully the debug logs I added were sufficient to
>>> figure out the reason.
>> Frankly, it took me a while to figure out that device core waits for the
>> power domain devices. Maybe it would be possible to add some more debug
>> messages or hints? Like the reason of the deferred probe in
>> /sys/kernel/debug/devices_deferred ?
> There's already a /sys/devices/.../<device>/waiting_for_supplier file
> that tells you if the device is waiting for a supplier device to be
> added. That file goes away once the device probes. If the file has 1,
> then it's waiting for the supplier device to be added (like your
> case). If it's 0, then the device is just waiting on one of the
> existing suppliers to probe. You can find the existing suppliers
> through /sys/devices/.../<device>/supplier:*/supplier. Also, flip
> these dev_dbg() to dev_info() if you need more details about deferred
> probing.

Frankly speaking I doubt that anyone will find those. Even experienced 
developer might need some time to figure it out.

I expect that such information will be at least in the mentioned 
/sys/kernel/debug/devices_deferred file. We already have infrastructure 
for putting the deferred probe reason there, see dev_err_probe() 
function. Even such a simple change makes the debugging this issue much 
easier:

diff --git a/drivers/base/core.c b/drivers/base/core.c
index cd8e518fadd6..ceb5aed5a84c 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -937,12 +937,13 @@ int device_links_check_suppliers(struct device *dev)
         mutex_lock(&fwnode_link_lock);
         if (dev->fwnode && !list_empty(&dev->fwnode->suppliers) &&
             !fw_devlink_is_permissive()) {
-               dev_dbg(dev, "probe deferral - wait for supplier %pfwP\n",
+               ret = dev_err_probe(dev, -EPROBE_DEFER,
+                       "probe deferral - wait for supplier %pfwP\n",
list_first_entry(&dev->fwnode->suppliers,
                         struct fwnode_link,
                         c_hook)->supplier);
                 mutex_unlock(&fwnode_link_lock);
-               return -EPROBE_DEFER;
+               return ret;
         }
         mutex_unlock(&fwnode_link_lock);

@@ -955,9 +956,9 @@ int device_links_check_suppliers(struct device *dev)
                 if (link->status != DL_STATE_AVAILABLE &&
                     !(link->flags & DL_FLAG_SYNC_STATE_ONLY)) {
                         device_links_missing_supplier(dev);
-                       dev_dbg(dev, "probe deferral - supplier %s not 
ready\n",
+                       ret = dev_err_probe(dev, -EPROBE_DEFER,
+                               "probe deferral - supplier %s not ready\n",
                                 dev_name(link->supplier));
-                       ret = -EPROBE_DEFER;
                         break;
                 }
                 WRITE_ONCE(link->status, DL_STATE_CONSUMER_PROBE);


After such change:

# cat /sys/kernet/debug/devices_deferred
sound
13620000.sysmmu platform: probe deferral - supplier 
10023c40.power-domain not ready
13630000.sysmmu platform: probe deferral - supplier 
10023c40.power-domain not ready
12e20000.sysmmu platform: probe deferral - supplier 
10023c20.power-domain not ready
11a20000.sysmmu platform: probe deferral - supplier 
10023c00.power-domain not ready
11a30000.sysmmu platform: probe deferral - supplier 
10023c00.power-domain not ready
11a40000.sysmmu platform: probe deferral - supplier 
10023c00.power-domain not ready
11a50000.sysmmu platform: probe deferral - supplier 
10023c00.power-domain not ready
11a60000.sysmmu platform: probe deferral - supplier 
10023c00.power-domain not ready
11e20000.sysmmu platform: probe deferral - supplier 
10023c80.power-domain not ready
12d00000.hdmi   platform: probe deferral - supplier 
10023c20.power-domain not ready
10048000.clock-controller       platform: probe deferral - supplier 
10023ca0.power-domain not ready
12260000.sysmmu platform: probe deferral - supplier 
10048000.clock-controller not ready
12270000.sysmmu platform: probe deferral - supplier 
10048000.clock-controller not ready
122a0000.sysmmu platform: probe deferral - supplier 
10048000.clock-controller not ready
122b0000.sysmmu platform: probe deferral - supplier 
10048000.clock-controller not ready
123b0000.sysmmu platform: probe deferral - supplier 
10048000.clock-controller not ready
123c0000.sysmmu platform: probe deferral - supplier 
10048000.clock-controller not ready
12c10000.mixer  platform: probe deferral - supplier 
10023c20.power-domain not ready
13000000.gpu    platform: probe deferral - supplier 
10023c60.power-domain not ready

Probably the message can be adjusted a bit, this would significantly 
help me finding that is the source of the problem.

Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

