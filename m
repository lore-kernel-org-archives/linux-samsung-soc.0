Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 184A6C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 10 Jan 2022 11:08:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244419AbiAJLIz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 10 Jan 2022 06:08:55 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:34007 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239571AbiAJLIo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 10 Jan 2022 06:08:44 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20220110110841euoutp0228d824161240c252a1d8e9aabbc0f0ac~I5CdhhZrk0129901299euoutp02J
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Jan 2022 11:08:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20220110110841euoutp0228d824161240c252a1d8e9aabbc0f0ac~I5CdhhZrk0129901299euoutp02J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1641812922;
        bh=vfJN9qXsLzdmiJkxf0cKKLnMign+JyjSOrL6jW+vGUc=;
        h=Date:Subject:To:From:In-Reply-To:References:From;
        b=qlLltjyaxOm1yoFOgURrGQ/PvtbW4OMgC7B4VwC/H6fKmrO8s57BTQmVFcIHJ9U1U
         A7naApcY95vI8aKhgXceWdE73MMVKNC8DMN/QQm4fczNXJEFAvC51UF/F+jia0FXTi
         FXr62U4Clx4oM8cw9pp5Eg6h63dsAhdxGXiqkwD4=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20220110110841eucas1p219dd1e6490323bd43a965c8fede3b03e~I5CdQFgaw3109831098eucas1p2z;
        Mon, 10 Jan 2022 11:08:41 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id FC.98.10009.9B31CD16; Mon, 10
        Jan 2022 11:08:41 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20220110110841eucas1p1083af0dc54a4ce2658c8332b98230bd8~I5CcxQ87c1391313913eucas1p1U;
        Mon, 10 Jan 2022 11:08:41 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220110110841eusmtrp2e31e1dfc1b1ec4b552789bf6b20ab473~I5CcwL6eg3063530635eusmtrp2E;
        Mon, 10 Jan 2022 11:08:41 +0000 (GMT)
X-AuditID: cbfec7f2-e7fff70000002719-67-61dc13b95c7a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 79.F3.09404.8B31CD16; Mon, 10
        Jan 2022 11:08:41 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220110110840eusmtip209c412701d4035db740c43ed0614fe72~I5CcVW8Kv3137631376eusmtip2k;
        Mon, 10 Jan 2022 11:08:40 +0000 (GMT)
Message-ID: <2202f06f-e901-44bb-b6dc-7225dd093e1b@samsung.com>
Date:   Mon, 10 Jan 2022 12:08:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [RFC PATCH 1/1] ARM: exynos: only do SMC_CMD_CPU1BOOT call on
 Exynos4
Content-Language: en-US
To:     Henrik Grimler <henrik@grimler.se>, linux@armlinux.org.uk,
        krzysztof.kozlowski@canonical.com, semen.protsenko@linaro.org,
        martin.juecker@gmail.com, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
From:   Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20220108215733.705865-2-henrik@grimler.se>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se1BMcRT2u/e2e2tm13XbpjMeGY23aYn+2DB5jMc1Y4zXGGM8unJbjUp2
        y6Mhi/VapBDbLaKaWmaoXWmtFJZkyRZL0lRErDJrqi0TEdob+u/7zvnO73zfmR+J0wavoWRU
        bDynimWjA0U+RPHDb1VBFt96dkpJ/hiFK/cWUhhd3ZjC9L7GS6GvKsMU1rRSpKjsTSMUzuQy
        bLaYcdQ8wxlec0LEWPgGMVP+otGLqa+5LWKu5+5l3KaApeI1PjM3cdFR2znV5LBwn80pDos4
        7oJs52d7E65BlsE65E0CFQKZxgxCh3xImjIgaMprEQukE0FhRwcuEDeCd6Y08d+RrxYtJjTy
        EZTWdvaTdgRH8swiHSJJCRUG5pbhfQMENQZ6stuJPiyhhoAtvdmD/aiN0PT2uwf7UivhY1G3
        Vx/GKX+oa87yvCmjPiB4adJ4RCIqGHQunagPe1MKOJhmw4WBkWB2ZXqsAvWJhH03DLhgdR48
        OJjVj32htaKoP8Jw+GURNgB14E9q+1WxQI4jcOzXI0E1A+rt3z1xcGoCFNyaLJTnwLlX+Z4y
        UFKodQ0RTEjhVPE5XChL4MghWlCPBb7i2r+196qf99thILNSi6WgUfyAu/AD8vMDovH/PVxE
        xBXkzyWoY5ScOjiW2yFXszHqhFilPGJrjAn9+UxPeis6bqLzre1yK8JIZEVA4oEySWl1HUtL
        NrG7EjnV1g2qhGhObUXDSCLQXxIRVcjSlJKN57ZwXByn+tvFSO+hGmznipKnftPiDPSUSV92
        n3DbVu3xDjEFJWmzRbSzxHLdlhz5LLVlwSyj4XPOiNC7bdNnZwTYe076SYvCNReS1UnzXy+P
        fL0uXeaIzLx2vyeU1zd0LS7ofDP+udj/lEvpHve4d2xQQNbCl3OP3unSRlSlMpHxZyShvvex
        xMWa9rzDxpEh6Xpixpq9zkmyqatt9sacgrIwftEuuWPwrG3rf5o/ObuVP85crqjW0gwTSt/r
        ynCjtZbVj49Jvz0y112atm+BRn66ra6W2fJzQqXt7JKkYzkN9Ymm0SiH7KqUWq3LGreV6Y3l
        qzBoa0j5cbH8ZOqe5sKVrkHhv84Xp7wrX+ZkAgn1ZjZ4Iq5Ss78BVKpEX7sDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRmVeSWpSXmKPExsVy+t/xe7o7he8kGvRNYrJ4u2QXo8XGtz+Y
        LDY9vsZqMeP8PiaLQ1P3Mlqc+TeVxeJ53z4mB3aPy9cuMnvMauhl89g56y67x9Er91g97lzb
        w+axeUm9x+dNcgHsUXo2RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5
        mWWpRfp2CXoZEy7vZC+YJ1Lx+txD5gbGnfxdjJwcEgImEt92tjB1MXJxCAksZZQ4MekJE0RC
        RuLktAZWCFtY4s+1LjaIoveMEic3L2LvYuTg4BWwk9j+UgakhkVAVeL3oo8sIDavgKDEyZlP
        WEBKRAWSJD5s8QMJCwuESDzb8gNsJLOAuMStJ/PB9ooIPGWU+LN2EyPE/J2MEgv7djGCVLEJ
        GEp0vQVZzMnBKWAh0Tr1JDNEt5lE19YuRghbXmL72znMExgFZyHZPQvJkllIWmYhaVnAyLKK
        USS1tDg3PbfYSK84Mbe4NC9dLzk/dxMjMN62Hfu5ZQfjylcf9Q4xMnEwHmKU4GBWEuHde+FW
        ohBvSmJlVWpRfnxRaU5q8SFGU2AATGSWEk3OB0Z8Xkm8oZmBqaGJmaWBqaWZsZI4r2dBR6KQ
        QHpiSWp2ampBahFMHxMHp1QD0zbhRM2WdTIXnm6aa6MbaDPxyWUhLZ1a895rX4W5PmXrTzLN
        +1km0bySLVjfw2KXruPWLr/jMidbcsTm5DZetLnjYmv/Sj/90cW/DUnnz8g6i3dcMJ45abFp
        buSOTye9djVoT/ml9El60kzBN1nC7RcqHz+eV31lR4KIXO29zs93tHdYz57Ot6PHlenpsct5
        u93E79VUKFY13lW7vMmCPeT79g1Ty2asOzNzq9iZim9ai+bM7t/1sn7RcTcFx4MrtifMqkte
        cXHz9kPTD+tdNZ746Btrw6+kDStK/PqldH2mT1e/LR4/p/RekTzf0W0HU/ZI7bqTHtAs/ey4
        /J3IxU+33Jhr+MHSZ3WmxsZfZ9WUWIozEg21mIuKEwFRSCYNQAMAAA==
X-CMS-MailID: 20220110110841eucas1p1083af0dc54a4ce2658c8332b98230bd8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220108215952eucas1p1bb9bc56c7f8ac7117b5e5576635460d5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220108215952eucas1p1bb9bc56c7f8ac7117b5e5576635460d5
References: <20220108215733.705865-1-henrik@grimler.se>
        <CGME20220108215952eucas1p1bb9bc56c7f8ac7117b5e5576635460d5@eucas1p1.samsung.com>
        <20220108215733.705865-2-henrik@grimler.se>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 08.01.2022 22:57, Henrik Grimler wrote:
> On Exynos5 the call is simply ignored by most variants of the
> trustzone firmware.  However, on some devices it instead causes the
> device to hang, so let's avoid the call for the SoCs where it should
> not be needed.
>
> To see that the call is ignored, we can look into sboot/tzsw.  On most
> of the Exynos{4,5} devices the part of sboot/tzsw that seem to handle
> the secure monitor calls is quite easy to recognise, the SMC number is
> compared to known ones, and if equal it branches to the relevant
> function.  In assembly this looks something like:
>
> ;-- handle_smc:
> 0x00000514      650070e3       cmn r0, 0x65
> 0x00000518      0a00000a       beq loc.smc_cmd_reg
> 0x0000051c      010070e3       cmn r0, 1
> 0x00000520      6c00000a       beq loc.smc_cmd_init
> 0x00000524      020070e3       cmn r0, 2
> 0x00000528      6b00000a       beq loc.smc_cmd_info
> 0x0000052c      030070e3       cmn r0, 3
> 0x00000530      6e00000a       beq loc.smc_cmd_sleep
> 0x00000534      060070e3       cmn r0, 6
> 0x00000538      ae00000a       beq loc.smc_cmd_save_state
> 0x0000053c      070070e3       cmn r0, 7
> 0x00000540      b400000a       beq loc.smc_cmd_standby
> 0x00000544      2b01001a       bne loc.smc_return_minus1
>
> where above example is from exynos5420-arndale-octa.  As can be seen
> the case where r0 is 4 (i.e. SMC_CMD_CPU1BOOT) is not handled.  The
> annotations are taken from github.com/hsnaves/exynos5410-firmware,
> where a large part of the exynos5410 trustzone firmware has been
> reverse-engineered.
>
> Signed-off-by: Henrik Grimler <henrik@grimler.se>

Works fine on all ARM 32bit Exynos-based boards I have for tests.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

> ---
>   arch/arm/mach-exynos/firmware.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-exynos/firmware.c b/arch/arm/mach-exynos/firmware.c
> index 2eaf2dbb8e81..2da5b60b59e2 100644
> --- a/arch/arm/mach-exynos/firmware.c
> +++ b/arch/arm/mach-exynos/firmware.c
> @@ -60,8 +60,10 @@ static int exynos_cpu_boot(int cpu)
>   	/*
>   	 * Exynos3250 doesn't need to send smc command for secondary CPU boot
>   	 * because Exynos3250 removes WFE in secure mode.
> +	 *
> +	 * On Exynos5 devices the call is ignored by trustzone firmware.
>   	 */
> -	if (soc_is_exynos3250())
> +	if (!soc_is_exynos4210() && !soc_is_exynos4412())
>   		return 0;
>   
>   	/*

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

