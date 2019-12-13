Return-Path: <SRS0=lSeZ=2D=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8797C3F68F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 13 Dec 2019 03:03:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9F2E82464B
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 13 Dec 2019 03:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576206193;
	bh=1t1Xw/B0ewfrYzKWuGegjfGoPkRqeem6a2osUCvO3MM=;
	h=In-Reply-To:References:Subject:To:From:Cc:Date:List-ID:From;
	b=SSg6HCrQ4Jp5vWdOnm+jM491IMn2oGopxtpzOARC/IOTM3S3RWECygiCZrJH60wTR
	 C0UyTt+RXGjhl/Uf+8fZmxc/vgbiDXKhzlx+Xu7crUVejmoMn3FP/CqOVPnCHkMDCL
	 A9U0ZRu/77kH11aK3QzTips3MRprh6jQEo5ZIX38=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731885AbfLMDDN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 12 Dec 2019 22:03:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:42092 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731884AbfLMDDN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 12 Dec 2019 22:03:13 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8FB3F2253D;
        Fri, 13 Dec 2019 03:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576206191;
        bh=1t1Xw/B0ewfrYzKWuGegjfGoPkRqeem6a2osUCvO3MM=;
        h=In-Reply-To:References:Subject:To:From:Cc:Date:From;
        b=eGDpMBg7AmTHFPKuwQweXSdYQC5ElaJQj9dCMpFnmDChinXqocC2zeu9LB6CnDMat
         nNtySBuvAQnIMo51Tkm5vfw08mqL/+nYJpePnilEsCKMcVBnsd6U1y5BkigdccY3su
         DLe438OQrjTX9Zo2XyVx1pMMy47YHC99FizpDbbg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <f46f7d3d-c107-2542-d9ed-124c9079aeca@samsung.com>
References: <CGME20191121101158eucas1p26b1f74cd2396a2461530e684d17a82e8@eucas1p2.samsung.com> <20191121101145.15899-1-m.szyprowski@samsung.com> <f46f7d3d-c107-2542-d9ed-124c9079aeca@samsung.com>
Subject: Re: [PATCH] clk: samsung: exynos5420: Keep top G3D clocks enabled
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>
User-Agent: alot/0.8.1
Date:   Thu, 12 Dec 2019 19:03:10 -0800
Message-Id: <20191213030311.8FB3F2253D@mail.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Quoting Sylwester Nawrocki (2019-12-12 03:53:17)
> Cc: Stephen and Michael
>=20
> On 11/21/19 11:11, Marek Szyprowski wrote:
> > All top clocks on G3D path has to be enabled all the time to allow prop=
er
> > G3D power domain operation. This is achieved by adding CRITICAL flag to
> > "mout_sw_aclk_g3d" clock, what keeps this clock and all its parents
> > enabled.
> >=20
> > This fixes following imprecise abort issue observed on Odroid XU3/XU4
> > after enabling Panfrost driver by commit 1a5a85c56402 "ARM: dts: exynos:
> > Add Mali/GPU node on Exynos5420 and enable it on Odroid XU3/4"):
> >=20
> > panfrost 11800000.gpu: clock rate =3D 400000000
> > panfrost 11800000.gpu: failed to get regulator: -517
> > panfrost 11800000.gpu: regulator init failed -517
> > Power domain G3D disable failed
> > ...
> > panfrost 11800000.gpu: clock rate =3D 400000000
> > 8<--- cut here ---
> > Unhandled fault: imprecise external abort (0x1406) at 0x00000000
> > pgd =3D (ptrval)
> > [00000000] *pgd=3D00000000
> > Internal error: : 1406 [#1] PREEMPT SMP ARM
> > Modules linked in:
> > CPU: 7 PID: 53 Comm: kworker/7:1 Not tainted 5.4.0-rc8-next-20191119-00=
032-g56f1001191a6 #6923
> > Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
> > Workqueue: events deferred_probe_work_func
> > PC is at panfrost_gpu_soft_reset+0x94/0x110
> > LR is at ___might_sleep+0x128/0x2dc
> > ...
> > [<c05c231c>] (panfrost_gpu_soft_reset) from [<c05c2704>] (panfrost_gpu_=
init+0x10/0x67c)
> > [<c05c2704>] (panfrost_gpu_init) from [<c05c15d0>] (panfrost_device_ini=
t+0x158/0x2cc)
> > [<c05c15d0>] (panfrost_device_init) from [<c05c0cb0>] (panfrost_probe+0=
x80/0x178)
> > [<c05c0cb0>] (panfrost_probe) from [<c05cfaa0>] (platform_drv_probe+0x4=
8/0x9c)
> > [<c05cfaa0>] (platform_drv_probe) from [<c05cd20c>] (really_probe+0x1c4=
/0x474)
> > [<c05cd20c>] (really_probe) from [<c05cd694>] (driver_probe_device+0x78=
/0x1bc)
> > [<c05cd694>] (driver_probe_device) from [<c05cb374>] (bus_for_each_drv+=
0x74/0xb8)
> > [<c05cb374>] (bus_for_each_drv) from [<c05ccfa8>] (__device_attach+0xd4=
/0x16c)
> > [<c05ccfa8>] (__device_attach) from [<c05cc110>] (bus_probe_device+0x88=
/0x90)
> > [<c05cc110>] (bus_probe_device) from [<c05cc634>] (deferred_probe_work_=
func+0x4c/0xd0)
> > [<c05cc634>] (deferred_probe_work_func) from [<c0149df0>] (process_one_=
work+0x300/0x864)
> > [<c0149df0>] (process_one_work) from [<c014a3ac>] (worker_thread+0x58/0=
x5a0)
> > [<c014a3ac>] (worker_thread) from [<c0151174>] (kthread+0x12c/0x160)
> > [<c0151174>] (kthread) from [<c01010b4>] (ret_from_fork+0x14/0x20)
> > Exception stack(0xee03dfb0 to 0xee03dff8)
> > ...
> > Code: e594300c e5933020 e3130c01 1a00000f (ebefff50).
> > ---[ end trace badde2b74a65a540 ]---
> >=20
> > In the above case, the Panfrost driver disables G3D clocks after failure
> > of getting the needed regulator and return with -EPROVE_DEFER code. This
> > causes G3D power domain disable failure and then, during second probe
> > an imprecise abort is triggered due to undefined power domain state.
> >=20
> > Fixes: 45f10dabb56b ("clk: samsung: exynos5420: Add SET_RATE_PARENT fla=
g to clocks on G3D path")
> > Fixes: c9f7567aff31 ("clk: samsung: exynos542x: Move G3D subsystem cloc=
ks to its sub-CMU")
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > ---
> >  drivers/clk/samsung/clk-exynos5420.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung=
/clk-exynos5420.c
> > index 3a991ca1ee36..89126ba66995 100644
> > --- a/drivers/clk/samsung/clk-exynos5420.c
> > +++ b/drivers/clk/samsung/clk-exynos5420.c
> > @@ -712,7 +712,7 @@ static const struct samsung_mux_clock exynos5x_mux_=
clks[] __initconst =3D {
> >       MUX(0, "mout_sw_aclk266_g2d", mout_sw_aclk266_g2d_p,
> >                       SRC_TOP12, 12, 1),
> >       MUX_F(0, "mout_sw_aclk_g3d", mout_sw_aclk_g3d_p, SRC_TOP12, 16, 1,
> > -           CLK_SET_RATE_PARENT, 0),
> > +           CLK_IS_CRITICAL | CLK_SET_RATE_PARENT, 0),
> >       MUX(0, "mout_sw_aclk300_jpeg", mout_sw_aclk300_jpeg_p,
>                         SRC_TOP12, 20, 1),
>=20
> Adding that flag to a mux clock doesn't look right, it feels we are not
> addressing the issue properly and the root cause is not known.
>=20
> AFAICS CLK_IS_CRITICAL flag will also not ensure required root clock up=20
> in the clk tree is enabled in case any reparenting is done after that mux=
=20
> clock has been registered.  The flag seems misused and the fix looks dubi=
ous=20
> and fragile to me.
>=20
> I would apply that to fix crashes we are seeing in -next but we ned to co=
me
> up with a better solution.
>=20
> Perhaps we could add a comment like:
>=20
> "CLK_IS_CRITICAL flag is added to this clock as a workaround for imprecis=
e=20
> external abort triggered by the Panfrost driver and will be removed once =

> the issue is properly addressed."

You should always add a comment to CLK_IS_CRITICAL usage. This sort of
comment is not comforting though. When will the issue be properly
addressed? Maybe we should block panfrost from being enabled on this
platform until it is root caused?

