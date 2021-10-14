Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CDA7C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Oct 2021 18:40:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA439611C8
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Oct 2021 18:40:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233155AbhJNSmU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 14 Oct 2021 14:42:20 -0400
Received: from h03mx16.reliablemail.org ([173.236.90.20]:26049 "EHLO
        h03mx16.reliablemail.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233988AbhJNSmS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 Oct 2021 14:42:18 -0400
X-Halon-Out: 284e3bd3-2d1e-11ec-a67c-00163c72d6d3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=grimler.se;
        s=default; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=xWuSLLDQK3bmsp6fReNTqiPlde9m5Pr1/bVcaTiCQ1w=; b=dntantpBFDGpkCtyt32ftHFMWm
        4pFENwu8mcYDalt7qYNa7eS3Rz8OTt0FBvEzvptMSAOP/LpjSYbIRuvsmjPraIG+RrSHSmQv7DvPI
        4DJp/XHniUPdbVMOhY7I0Y3aKrIhAe2dzJRkzQuNNiPO4IuCbqc8+2n7/KAVBcx1rj7SZTuRzQowE
        SIwL069qyZU9BJ++s1d24/MQxFt/YRxVOhtDjThlTIfc5T3ou1IT88lVam1LFNTWO+AEzD6kClw3C
        gxouVPvDlUmKhGzDNFFOQ8rTgDjaRvQ+rD4Mua3n8pkNnb25P5/ILhT26/sQ9YUUEt5txxGVJz7i8
        h5UZnNEA==;
Date:   Thu, 14 Oct 2021 20:40:05 +0200
From:   Henrik Grimler <henrik@grimler.se>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] soc: samsung: exynos-chipid: Pass revision reg
 offsets
Message-ID: <YWh5hSvUpdFA85Ct@grimlerstat.localdomain>
References: <20211014133508.1210-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211014133508.1210-1-semen.protsenko@linaro.org>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpsrv07.misshosting.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - grimler.se
X-Get-Message-Sender-Via: cpsrv07.misshosting.com: authenticated_id: henrik@grimler.se
X-Authenticated-Sender: cpsrv07.misshosting.com: henrik@grimler.se
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Sam,

On Thu, Oct 14, 2021 at 04:35:06PM +0300, Sam Protsenko wrote:
> Old Exynos SoCs have both Product ID and Revision ID in one single
> register, while new SoCs tend to have two separate registers for those
> IDs. Implement handling of both cases by passing Revision ID register
> offsets in driver data.
> 
> Previously existing macros for Exynos4210 (removed in this patch) were
> incorrect:
> 
>     #define EXYNOS_SUBREV_MASK         (0xf << 4)
>     #define EXYNOS_MAINREV_MASK        (0xf << 0)
> 
> Actual format of PRO_ID register in Exynos4210 (offset 0x0):
> 
>     [31:12] Product ID
>       [9:8] Package information
>       [7:4] Main Revision Number
>       [3:0] Sub Revision Number
> 
> This patch doesn't change the behavior on existing platforms, so
> '/sys/devices/soc0/revision' will show the same string as before.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
> Changes in v2:
>   - Renamed *_rev_bit fields in 'struct exynos_chipid_variant' to
>     *_rev_shift
>   - Renamed EXYNOS_REV_PART_LEN to EXYNOS_REV_PART_MASK
>   - Renamed EXYNOS_REV_PART_OFF to EXYNOS_REV_PART_SHIFT
> 
> Changes in v3:
>   - Rebased on top of krzk/for-next tree
>   - Fixed wrong *_rev_shift values in exynos4210_chipid_drv_data
>   - Implemented reading the register only once in case when both
>     Product ID and Revision ID are stored in the same register
>   - Tested all possible cases by emulating read register values
>   - Provided more detailed explanation in commit message
> 
>  drivers/soc/samsung/exynos-chipid.c       | 69 +++++++++++++++++++----
>  include/linux/soc/samsung/exynos-chipid.h |  6 +-
>  2 files changed, 60 insertions(+), 15 deletions(-)
> 

I tested this on exynos4412-i9300 and an exynos5420 tablet that is not
yet in mainline.  /sys/devices/soc0/* looks identical, I have:

$ cat /sys/devices/soc0/{family,revision,soc_id}
Samsung Exynos
11
EXYNOS4412

and

$ cat /sys/devices/soc0/{family,revision,soc_id}
Samsung Exynos
20
EXYNOS5420

before and after these patches.  The printed PRO_ID in dmesg changed
though, before I had:

[    0.894683] soc soc0: Exynos: CPU[EXYNOS4412] PRO_ID[0xe4412211] REV[0x11] Detected

[    4.964215] soc soc0: Exynos: CPU[EXYNOS5420] PRO_ID[0xe5420020] REV[0x20] Detected

But after it looks like package information and revision is missing
from the reported PRO_ID:

[    0.885515] soc soc0: Exynos: CPU[EXYNOS4412] PRO_ID[0xe4412000] REV[0x11] Detected

[    4.965560] soc soc0: Exynos: CPU[EXYNOS5420] PRO_ID[0xe5420000] REV[0x20] Detected

Best regards,
Henrik Grimler
