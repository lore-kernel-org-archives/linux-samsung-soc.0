Return-Path: <SRS0=ouEf=ZO=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED713C432C0
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 22 Nov 2019 01:37:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A9DB9206F4
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 22 Nov 2019 01:37:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="rUU1t1dw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbfKVBhb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 21 Nov 2019 20:37:31 -0500
Received: from mailout3.samsung.com ([203.254.224.33]:57923 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbfKVBha (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 21 Nov 2019 20:37:30 -0500
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20191122013727epoutp03a434c9805c2327eaae7e142eade6dd54~ZWFB7ZWDL0797507975epoutp03-
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Nov 2019 01:37:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20191122013727epoutp03a434c9805c2327eaae7e142eade6dd54~ZWFB7ZWDL0797507975epoutp03-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1574386647;
        bh=ubbA4+Lwdxue490eJSo8gvrwq7CezwOon7VoAkBRihk=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=rUU1t1dw3q1Y9cwstSblgK4nGB9tK1yVneBVIweSvu9HB9j/9fOZWxz19O021yy1X
         v2xsrondIVdyi6aVXP08DJYpzsFo8dDN9qL1Afi0/cVV9x6mICPZY4bskKD2R7Q0PK
         Zqa3VAFpAcmImwgcLbtjcj5E9dbg9atc9TiP/AvU=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20191122013726epcas1p28e8e6fe40da7a79b3a6e90daa1e30577~ZWFBY6zCy1818318183epcas1p2N;
        Fri, 22 Nov 2019 01:37:26 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.154]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 47JzZD3qJnzMqYkZ; Fri, 22 Nov
        2019 01:37:24 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
        epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        C3.83.04406.FCB37DD5; Fri, 22 Nov 2019 10:37:19 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20191122013718epcas1p1873b01a96ba34168b98790915ceb8e7c~ZWE57hCuT2493424934epcas1p1e;
        Fri, 22 Nov 2019 01:37:18 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20191122013718epsmtrp12b2208d7c048f901ea9f0c07dbf6150e~ZWE56ybX51073710737epsmtrp1j;
        Fri, 22 Nov 2019 01:37:18 +0000 (GMT)
X-AuditID: b6c32a38-95fff70000001136-33-5dd73bcf55f6
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        95.B1.03814.ECB37DD5; Fri, 22 Nov 2019 10:37:18 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20191122013718epsmtip10a40f018970715c8027ab2117d4c95aa~ZWE5vKtd52083820838epsmtip1V;
        Fri, 22 Nov 2019 01:37:18 +0000 (GMT)
Subject: Re: [PATCH] clk: samsung: exynos5420: Keep top G3D clocks enabled
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Sylwester Nawrocki <snawrocki@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <97dff6d2-08d8-ce28-6eaf-aa15ab778f5f@samsung.com>
Date:   Fri, 22 Nov 2019 10:43:06 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191121101145.15899-1-m.szyprowski@samsung.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SWUwTURT1ddrpgFbHgnKticAQE8EAHUtxVFASiamACYkmLgnWEcaCdEun
        VdEf44cCIYBKXBoERQyxakBElgbFAIbgVlQURVE2F3CLIIoaox0GIn/nvnvOO/e8dwlMWYKr
        iAyznbOZWSOF+0prW0Ijwj2rulLUZa1+zNVTlTLG46mSM1/zXsmYU56bEuZKa4+cqTzxU8Yc
        eTOExcl1Dc4eua7alYPr8mtcSDdavShZui0zJp1j0zhbEGdOtaRlmA2xVOJG/Vq9NlpNh9Mr
        mOVUkJk1cbFUfFJy+LoMo3cCKmgPa3R4j5JZnqciV8fYLA47F5Ru4e2xFGdNM1pXWCN41sQ7
        zIaIVItpJa1WL9N6iTsy08faejDrUOC+mhuWg6hoYS7yIYCMgo8/bklzkS+hJOsR3Ov7KROL
        EQTXWwqRWHxH8Lb3MjYlKXHX42Ljhpf1uE8iFl8Q9Lu6pQLLj0yAy0Wd3rsIwp+0gPPTJoGD
        kW4E5V0uucDByTBoev8MF/AcMhiejA8gASvI1eAZe40ErZRcDI2NnADnkVvg7hgrMuZC++nB
        CScfgX38g0TAGBkA3YOlkzgQ6j4VY4ItkAM43K4qlooB4uHlo9LJMH4w3FYjF7EKhgoOT+ID
        cLG9FRfF2QhqmjpkYkMDTReOS4SBMDIUKt2R4nEwNPw+g0Tj2fB5LG8iOpAKyD6sFCkh8Li3
        RyLiBXD+SA5eiCjntDjOaRGc0yI4/5udRVIXms9ZeZOB42lr1PS/rkYTuxnG1KPGB0nNiCQQ
        NUtRuPdpilLG7uGzTM0ICIzyVzR2daYoFWls1n7OZtHbHEaOb0Za71sfxVTzUi3eTTfb9bR2
        mUajYaLoaC1NUwEKYvxhipI0sHYuk+OsnG1KJyF8VAdRVXS/O+GceuM1ozGxW/656Jtm/fZV
        hrx3a3uv+m5OOFSxrrxjhNqdPZp1zJatXbSmJKZlf9zJv+U74gMddZca3Je2utyRwwN/QpXF
        PrtmG07H5wfm/xro3BmNL6lt/X3/zouyDXxBL+s+4akYn1XCmPvQmZA+z4zn+plLE3Q3ixvi
        KCmfztJhmI1n/wH13nQ2sQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeLIzCtJLcpLzFFi42LZdlhJTvec9fVYg6ub9Sw2zljPanH+/AZ2
        i48991gtZpzfx2Sx9shddov1036yWrQ/fcnswO6xc9Zddo9NqzrZPPq2rGL0+LxJLoAlissm
        JTUnsyy1SN8ugSvj6/G7zAUv5Su27M1vYJwi3cXIySEhYCIxb9cOti5GLg4hgd2MEvunrGCH
        SEhKTLt4lLmLkQPIFpY4fLgYouYto8TRvjlgNcICXhJrplxhBbFFBPIlZtzpZQSxmQX2MEq0
        H5KDaJjIKPHwfQ9YEZuAlsT+FzfYQGx+AUWJqz8egzXwCthJnP96nxFkGYuAqsSePakgYVGB
        CInn229AlQhKnJz5hAXE5gQpn/yaCWKXusSfeZeYIWxxiVtP5kPF5SW2v53DPIFReBaS9llI
        WmYhaZmFpGUBI8sqRsnUguLc9NxiwwKjvNRyveLE3OLSvHS95PzcTYzgCNLS2sF44kT8IUYB
        DkYlHt4J5ddihVgTy4orcw8xSnAwK4nw7rl+JVaINyWxsiq1KD++qDQntfgQozQHi5I4r3z+
        sUghgfTEktTs1NSC1CKYLBMHp1QDY/fqQk+vZXadkn88hRvtZAtrmYtZJ0u+ODYn6X/eP6fD
        LMt3nqnkXH6a47xe1KafRx6GvVjps3n++u/7Lk38l7XhEkto2SIunhW+DYuiCzY1zQq91zT3
        wpn+lNr5djJLRU78XhLeEaC26PJJlZcPhR9tS1dn9+tqzptU9vfr3lwX42UmG+pbGJVYijMS
        DbWYi4oTAdTSjA+cAgAA
X-CMS-MailID: 20191122013718epcas1p1873b01a96ba34168b98790915ceb8e7c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20191121101158eucas1p26b1f74cd2396a2461530e684d17a82e8
References: <CGME20191121101158eucas1p26b1f74cd2396a2461530e684d17a82e8@eucas1p2.samsung.com>
        <20191121101145.15899-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Marek,

On 11/21/19 7:11 PM, Marek Szyprowski wrote:
> All top clocks on G3D path has to be enabled all the time to allow proper
> G3D power domain operation. This is achieved by adding CRITICAL flag to
> "mout_sw_aclk_g3d" clock, what keeps this clock and all its parents
> enabled.
> 
> This fixes following imprecise abort issue observed on Odroid XU3/XU4
> after enabling Panfrost driver by commit 1a5a85c56402 "ARM: dts: exynos:
> Add Mali/GPU node on Exynos5420 and enable it on Odroid XU3/4"):
> 
> panfrost 11800000.gpu: clock rate = 400000000
> panfrost 11800000.gpu: failed to get regulator: -517
> panfrost 11800000.gpu: regulator init failed -517
> Power domain G3D disable failed
> ...
> panfrost 11800000.gpu: clock rate = 400000000
> 8<--- cut here ---
> Unhandled fault: imprecise external abort (0x1406) at 0x00000000
> pgd = (ptrval)
> [00000000] *pgd=00000000
> Internal error: : 1406 [#1] PREEMPT SMP ARM
> Modules linked in:
> CPU: 7 PID: 53 Comm: kworker/7:1 Not tainted 5.4.0-rc8-next-20191119-00032-g56f1001191a6 #6923
> Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
> Workqueue: events deferred_probe_work_func
> PC is at panfrost_gpu_soft_reset+0x94/0x110
> LR is at ___might_sleep+0x128/0x2dc
> ...
> [<c05c231c>] (panfrost_gpu_soft_reset) from [<c05c2704>] (panfrost_gpu_init+0x10/0x67c)
> [<c05c2704>] (panfrost_gpu_init) from [<c05c15d0>] (panfrost_device_init+0x158/0x2cc)
> [<c05c15d0>] (panfrost_device_init) from [<c05c0cb0>] (panfrost_probe+0x80/0x178)
> [<c05c0cb0>] (panfrost_probe) from [<c05cfaa0>] (platform_drv_probe+0x48/0x9c)
> [<c05cfaa0>] (platform_drv_probe) from [<c05cd20c>] (really_probe+0x1c4/0x474)
> [<c05cd20c>] (really_probe) from [<c05cd694>] (driver_probe_device+0x78/0x1bc)
> [<c05cd694>] (driver_probe_device) from [<c05cb374>] (bus_for_each_drv+0x74/0xb8)
> [<c05cb374>] (bus_for_each_drv) from [<c05ccfa8>] (__device_attach+0xd4/0x16c)
> [<c05ccfa8>] (__device_attach) from [<c05cc110>] (bus_probe_device+0x88/0x90)
> [<c05cc110>] (bus_probe_device) from [<c05cc634>] (deferred_probe_work_func+0x4c/0xd0)
> [<c05cc634>] (deferred_probe_work_func) from [<c0149df0>] (process_one_work+0x300/0x864)
> [<c0149df0>] (process_one_work) from [<c014a3ac>] (worker_thread+0x58/0x5a0)
> [<c014a3ac>] (worker_thread) from [<c0151174>] (kthread+0x12c/0x160)
> [<c0151174>] (kthread) from [<c01010b4>] (ret_from_fork+0x14/0x20)
> Exception stack(0xee03dfb0 to 0xee03dff8)
> ...
> Code: e594300c e5933020 e3130c01 1a00000f (ebefff50).
> ---[ end trace badde2b74a65a540 ]---
> 
> In the above case, the Panfrost driver disables G3D clocks after failure
> of getting the needed regulator and return with -EPROVE_DEFER code. This
> causes G3D power domain disable failure and then, during second probe
> an imprecise abort is triggered due to undefined power domain state.
> 
> Fixes: 45f10dabb56b ("clk: samsung: exynos5420: Add SET_RATE_PARENT flag to clocks on G3D path")
> Fixes: c9f7567aff31 ("clk: samsung: exynos542x: Move G3D subsystem clocks to its sub-CMU")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5420.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
> index 3a991ca1ee36..89126ba66995 100644
> --- a/drivers/clk/samsung/clk-exynos5420.c
> +++ b/drivers/clk/samsung/clk-exynos5420.c
> @@ -712,7 +712,7 @@ static const struct samsung_mux_clock exynos5x_mux_clks[] __initconst = {
>  	MUX(0, "mout_sw_aclk266_g2d", mout_sw_aclk266_g2d_p,
>  			SRC_TOP12, 12, 1),
>  	MUX_F(0, "mout_sw_aclk_g3d", mout_sw_aclk_g3d_p, SRC_TOP12, 16, 1,
> -	      CLK_SET_RATE_PARENT, 0),
> +	      CLK_IS_CRITICAL | CLK_SET_RATE_PARENT, 0),
>  	MUX(0, "mout_sw_aclk300_jpeg", mout_sw_aclk300_jpeg_p,
>  			SRC_TOP12, 20, 1),
>  	MUX(CLK_MOUT_SW_ACLK300, "mout_sw_aclk300_disp1",
> 

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
