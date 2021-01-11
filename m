Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10686C433DB
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 11 Jan 2021 11:13:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D55B9224D3
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 11 Jan 2021 11:13:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728452AbhAKLN3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 11 Jan 2021 06:13:29 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:43504 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726734AbhAKLN2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 11 Jan 2021 06:13:28 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210111111246euoutp02b8354c5834dac187c35ceeb92733475d~ZKSGwglWg0070400704euoutp023
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Jan 2021 11:12:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210111111246euoutp02b8354c5834dac187c35ceeb92733475d~ZKSGwglWg0070400704euoutp023
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1610363566;
        bh=Os6YQqidd68CpsiQz2Q8qja9eV+6Zsth1YrEA4TfMyw=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=PIoYck2V/4cWF3iE1+t6XZl0jj375KRP1IJ5StoWhS33BG/aUeAswuh/Iro7lEhgx
         dMMUr3uiK3Ho87lx0MSC5IGslqz511QqNixD8PuX0e8fQlO+Pt5ds5b4By+H43HULf
         gXp/PVE/48n7Lii6J+iA+SB1jPQUcqVNoRIYPjCA=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210111111246eucas1p10fcdbea347d591cd4916f118f713084b~ZKSGXvLHr1798617986eucas1p1H;
        Mon, 11 Jan 2021 11:12:46 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 02.B5.45488.DA23CFF5; Mon, 11
        Jan 2021 11:12:45 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210111111245eucas1p15acde7ecc2ca7f7782beb8ed74c72022~ZKSF1Vo4y1243712437eucas1p1_;
        Mon, 11 Jan 2021 11:12:45 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210111111245eusmtrp12c498b057546e611f45115135c0792b0~ZKSF0f-Zo2586425864eusmtrp1V;
        Mon, 11 Jan 2021 11:12:45 +0000 (GMT)
X-AuditID: cbfec7f5-c77ff7000000b1b0-df-5ffc32ad5ffd
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id D7.B1.16282.DA23CFF5; Mon, 11
        Jan 2021 11:12:45 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210111111244eusmtip24ca4472d228d74cbbee662092e0fcaed~ZKSFBM1sj2971429714eusmtip2f;
        Mon, 11 Jan 2021 11:12:44 +0000 (GMT)
Subject: Re: [PATCH v1 5/5] driver core: Set fw_devlink=on by default
To:     Saravana Kannan <saravanak@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     kernel-team@android.com, linux-kernel@vger.kernel.org,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Kevin Hilman <khilman@baylibre.com>,
        John Stultz <john.stultz@linaro.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Marc Zyngier <maz@kernel.org>,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <5484316b-0f27-6c36-9259-5c765bb6b96c@samsung.com>
Date:   Mon, 11 Jan 2021 12:12:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201218031703.3053753-6-saravanak@google.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAKsWRmVeSWpSXmKPExsWy7djP87prjf7EGzTfsLTYOGM9q0Xz4vVs
        FtNuLmexOPNb12LHdhGLn+1bmCzOn9/AbnF51xw2ixnn9zFZ7JxzktVi26zlbBZzv0xltug6
        9JfNgddj2+5trB7vb7SyeyzYVOqxaVUnm8eda3vYPPbPXcPu0bdlFaPH5tPVHpOunGP2+LxJ
        LoArissmJTUnsyy1SN8ugSujqesMY8ENkYpXP3cxNzD+Euhi5OSQEDCRmHz5HSOILSSwglFi
        7uuILkYuIPsLo8S51+9YIJzPjBKb/yxlgen4/Xc+G0THckaJYzcEIYo+MkqceTeFvYuRg0NY
        wFXiy3EfkLiIQBujxMN9P8GamQUWMktMuJIFYrMJGEp0ve0CG8QrYCcx/RBILycHi4CqxKLG
        7WAniQokSRzf180MUSMocXLmE7A5nAI2EssftbFCzJSX2P52DjOELS5x68l8JpDFEgKrOSXu
        nfvIBHG1i8Tkr9/ZIWxhiVfHt0DZMhKnJ/ewQDQ0A116bi07hNPDKHG5aQYjRJW1xJ1zv9hA
        XmMW0JRYv0sfIuwosfr1FmaQsIQAn8SNt4IQR/BJTNo2HSrMK9HRJgRRrSYx6/g6uLUHL1xi
        nsCoNAvJa7OQvDMLyTuzEPYuYGRZxSieWlqcm55abJyXWq5XnJhbXJqXrpecn7uJEZjoTv87
        /nUH44pXH/UOMTJxMB5ilOBgVhLhXbjrR7wQb0piZVVqUX58UWlOavEhRmkOFiVx3l1b18QL
        CaQnlqRmp6YWpBbBZJk4OKUamGZJdbFMW2RkzPd5wiedQyusqr9OC5ESiXTaMSuKmU/4afvx
        cuvd5j/7Z12rd2TwP2Xz3+/S/CuCegpeV5deatI45Xhp7bnNgXcDrho3Hl6V7Jejkh6+8rFB
        gFlD6BWmS+f2LxKZmd3gqi0mtuDzamf9oPKSy92eS8V0FlumOoS+3H2Hfxbz1M4Nvx4fzNp8
        5P8tUXfmKOn5/GYC15S/ei9VNomy+JTJd5Hl8hbX8+ZT58/5qnaeK/Rjk73e1bgnQfNyTI7u
        vHD5v/ad9SYrtFjD82PjTZaq7dva+vPTkfoqIR1e1t5Fkj0WbhJT2OPl2vq1yizWsG3WeCaf
        bbW/T0Gu/a4E04SLkxj/Wu2vU2Ipzkg01GIuKk4EAFT2VtPjAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRmVeSWpSXmKPExsVy+t/xe7prjf7EG8x4ImSxccZ6VovmxevZ
        LKbdXM5icea3rsWO7SIWP9u3MFmcP7+B3eLyrjlsFjPO72Oy2DnnJKvFtlnL2SzmfpnKbNF1
        6C+bA6/Htt3bWD3e32hl91iwqdRj06pONo871/aweeyfu4bdo2/LKkaPzaerPSZdOcfs8XmT
        XABXlJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpOZllqkb5dgl5G
        U9cZxoIbIhWvfu5ibmD8JdDFyMkhIWAi8fvvfLYuRi4OIYGljBLXur+xQCRkJE5Oa2CFsIUl
        /lzrgip6zyixcHsXUBEHh7CAq8SX4z4gcRGBDkaJb1evgxUxCyxlllh46BozSLeQQK7Egp4F
        7CA2m4ChRNdbkEmcHLwCdhLTD00Bi7MIqEosatzOCDJUVCBJYvFbJ4gSQYmTM5+AHcQpYCOx
        /FEb2EHMAmYS8zY/ZIaw5SW2v50DZYtL3Hoyn2kCo9AsJO2zkLTMQtIyC0nLAkaWVYwiqaXF
        uem5xUZ6xYm5xaV56XrJ+bmbGIGxve3Yzy07GFe++qh3iJGJg/EQowQHs5II78JdP+KFeFMS
        K6tSi/Lji0pzUosPMZoCvTORWUo0OR+YXPJK4g3NDEwNTcwsDUwtzYyVxHlNjqyJFxJITyxJ
        zU5NLUgtgulj4uCUamDauuiClm5SS8j9iT4Fd/SrN9xod2ctVBG9ahef+uk1qwxHpnDw/wVa
        pxYuY+7euW7O/EsRCUn3NTij/ablHzimFMC1M/FUblMxS5uMaIG1AN/C1tW7Psxc8Pp3V/4u
        7wdM7rNdBfg4n/ptmp1kqvV+f41m1dpi0QnF7ZN8LFd9V5wTMkP8kOfvg3te9KQ0JdqdDnrt
        KOX/LTlTKyDq9N6YzW8cdcRZf36+fPe3Vti0K4f3lKyV8OlRu3xtAoP3hZi+qHNLpzEnNVcx
        JJyWXbHPUebFCpFd64XjXZaYBnNubfHl3vH44VbeBj6/M9q5QkxbfeZ2Xu3ddnf/pl+rvXdZ
        uO/8lxuy+uIkmR8ON8OVWIozEg21mIuKEwFnoYWadgMAAA==
X-CMS-MailID: 20210111111245eucas1p15acde7ecc2ca7f7782beb8ed74c72022
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210111111245eucas1p15acde7ecc2ca7f7782beb8ed74c72022
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210111111245eucas1p15acde7ecc2ca7f7782beb8ed74c72022
References: <20201218031703.3053753-1-saravanak@google.com>
        <20201218031703.3053753-6-saravanak@google.com>
        <CGME20210111111245eucas1p15acde7ecc2ca7f7782beb8ed74c72022@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Saravana,

On 18.12.2020 04:17, Saravana Kannan wrote:
> Cyclic dependencies in some firmware was one of the last remaining
> reasons fw_devlink=on couldn't be set by default. Now that cyclic
> dependencies don't block probing, set fw_devlink=on by default.
>
> Setting fw_devlink=on by default brings a bunch of benefits (currently,
> only for systems with device tree firmware):
> * Significantly cuts down deferred probes.
> * Device probe is effectively attempted in graph order.
> * Makes it much easier to load drivers as modules without having to
>    worry about functional dependencies between modules (depmod is still
>    needed for symbol dependencies).
>
> If this patch prevents some devices from probing, it's very likely due
> to the system having one or more device drivers that "probe"/set up a
> device (DT node with compatible property) without creating a struct
> device for it.  If we hit such cases, the device drivers need to be
> fixed so that they populate struct devices and probe them like normal
> device drivers so that the driver core is aware of the devices and their
> status. See [1] for an example of such a case.
>
> [1] - https://lore.kernel.org/lkml/CAGETcx9PiX==mLxB9PO8Myyk6u2vhPVwTMsA5NkD-ywH5xhusw@mail.gmail.com/
> Signed-off-by: Saravana Kannan <saravanak@google.com>

This patch landed recently in linux next-20210111 as commit e590474768f1 
("driver core: Set fw_devlink=on by default"). Sadly it breaks Exynos 
IOMMU operation, what causes lots of devices being deferred and not 
probed at all. I've briefly checked and noticed that 
exynos_sysmmu_probe() is never called after this patch. This is really 
strange for me, as the SYSMMU controllers on Exynos platform are regular 
platform devices registered by the OF code. The driver code is here: 
drivers/iommu/exynos-iommu.c, example dts: 
arch/arm/boot/dts/exynos3250.dtsi (compatible = "samsung,exynos-sysmmu").

> ---
>   drivers/base/core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 4cc030361165..803bfa6eb823 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -1457,7 +1457,7 @@ static void device_links_purge(struct device *dev)
>   #define FW_DEVLINK_FLAGS_RPM		(FW_DEVLINK_FLAGS_ON | \
>   					 DL_FLAG_PM_RUNTIME)
>   
> -static u32 fw_devlink_flags = FW_DEVLINK_FLAGS_PERMISSIVE;
> +static u32 fw_devlink_flags = FW_DEVLINK_FLAGS_ON;
>   static int __init fw_devlink_setup(char *arg)
>   {
>   	if (!arg)

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

