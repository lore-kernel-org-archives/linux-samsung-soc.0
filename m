Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA1329D29E;
	Sat, 22 Nov 2025 20:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763843943; cv=none; b=q28E+vT+k6JclleeH8qMuZdf+LFgqdxYq2C3ENqSZfB3LngVQFcSQTJB0i6i+8YBi+NPfJ5m1qqRWOgaGfPkV2yg3ksSW8uuhfRhOODvV7fpPB9hx+BeO0aGqaQZJEW3e74kCmXsTJfm5C0TDbGU4vjtSigiSflsoomwfAO8Avo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763843943; c=relaxed/simple;
	bh=LytqE/ino26TpMNy7C4TEQXxJLwP78jNqt4RMla9zf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kyj7OQSOjIVxfuyG1zBZQ4mcldsAN3epR+yMu0Y9cSeE4Z5vICxul266QkfHXG26jIqJ91odo030w0RvREXA1LxHb6yyp/dqiIaxovj62ukEKCOW50lZpEs+BcjDOTmzKI2BeijBfeNA2OMJHZjFq7MHgk9tMCiKnb8ZsnCTYWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fp6XCUd8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fp6XCUd8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADE83C4CEF5;
	Sat, 22 Nov 2025 20:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763843943;
	bh=LytqE/ino26TpMNy7C4TEQXxJLwP78jNqt4RMla9zf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fp6XCUd8jijkalz67G0GS7Yd4xnEiOcWIRxKyxdkRCjDAT4IN2n0m5Pw9gshzl1YP
	 eqNQcllFJhFRl2L4k17c53DgF5kerAX6Jrw392QAafvAvMRL0OB1/YTsCW3FacfqB1
	 K2ZxYZAeKHp7jxYUEx1JS1ozQQK6WpSqbq/8UvWEzWmgFi7biCmuH6tCWmlKnWJaLS
	 fGCKkKsJ1DJfzFm6URVZbvIQ6k83wq7oJ66rOjRQ3wXYjdaET2U9ZflFAGm8ZFl/sW
	 Hg+WqGoZnQuhnOGQl7Kpcg6/f4EuPSt7QsEfoV2EpYUPOIM9JJTUYsz7ETmf97MqVR
	 CU+VAKMu4nyCg==
Date: Sat, 22 Nov 2025 13:38:56 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Salvatore Bonaccorso <carnil@debian.org>
Cc: Jochen Sprickerhof <jspricke@debian.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, 1121211@bugs.debian.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, Kees Cook <kees@kernel.org>
Subject: Re: Bug#1121211: UBSAN: array-index-out-of-bounds in
 /build/reproducible-path/linux-6.17.8/drivers/clk/samsung/clk-exynos-clkout.c:178:18
Message-ID: <20251122203856.GA1099833@ax162>
References: <176383554642.17713.6408785381758213911.reportbug@vis>
 <aSIYDN5eyKFKoXKL@eldamar.lan>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSIYDN5eyKFKoXKL@eldamar.lan>

On Sat, Nov 22, 2025 at 09:07:40PM +0100, Salvatore Bonaccorso wrote:
> Hi,
> 
> Jochen reported the folowing while booting 6.17.8 based kernel in
> Debian:
> 
> On Sat, Nov 22, 2025 at 07:19:06PM +0100, Jochen Sprickerhof wrote:
> > Package: src:linux
> > Version: 6.17.8-1
> > Severity: normal
> > 
> > First time booting into 6.17.8-1 and first time I see UBSAN in my logs:
> > 
> > [Nov21 08:31] Booting Linux on physical CPU 0x100
> > [  +0,012977] ------------[ cut here ]------------
> > [  +0,000017] UBSAN: array-index-out-of-bounds in /build/reproducible-path/linux-6.17.8/drivers/clk/samsung/clk-exynos-clkout.c:178:18
> > [  +0,000038] index 0 is out of range for type 'clk_hw *[*]'
> > [  +0,000025] CPU: 4 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.17.8+deb14-armmp #1 NONE  Debian 6.17.8-1
> > [  +0,000018] Hardware name: Samsung Exynos (Flattened Device Tree)
> > [  +0,000007] Call trace:
> > [  +0,000009]  unwind_backtrace from show_stack+0x18/0x1c
> > [  +0,000042]  show_stack from dump_stack_lvl+0x54/0x68
> > [  +0,000036]  dump_stack_lvl from ubsan_epilogue+0x8/0x34
> > [  +0,000025]  ubsan_epilogue from __ubsan_handle_out_of_bounds+0x88/0x8c
> > [  +0,000024]  __ubsan_handle_out_of_bounds from exynos_clkout_probe+0x38c/0x428
> > [  +0,000029]  exynos_clkout_probe from platform_probe+0x64/0x98
> > [  +0,000034]  platform_probe from really_probe+0xd8/0x3ac
> > [  +0,000031]  really_probe from __driver_probe_device+0x94/0x1dc
> > [  +0,000027]  __driver_probe_device from driver_probe_device+0x3c/0xd8
> > [  +0,000027]  driver_probe_device from __driver_attach+0xd8/0x1d8
> > [  +0,000028]  __driver_attach from bus_for_each_dev+0x84/0xd4
> > [  +0,000026]  bus_for_each_dev from bus_add_driver+0xf4/0x218
> > [  +0,000023]  bus_add_driver from driver_register+0x8c/0x140
> > [  +0,000027]  driver_register from do_one_initcall+0x50/0x24c
> > [  +0,000023]  do_one_initcall from kernel_init_freeable+0x288/0x2fc
> > [  +0,000022]  kernel_init_freeable from kernel_init+0x24/0x140
> > [  +0,000022]  kernel_init from ret_from_fork+0x14/0x28
> > [  +0,000015] Exception stack(0xf0835fb0 to 0xf0835ff8)
> > [  +0,000012] 5fa0:                                     00000000 00000000 00000000 00000000
> > [  +0,000011] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> > [  +0,000009] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> > [  +0,000007] ---[ end trace ]---
> > [  +0,000226] ------------[ cut here ]------------
> > [  +0,000012] UBSAN: array-index-out-of-bounds in /build/reproducible-path/linux-6.17.8/drivers/clk/samsung/clk-exynos-clkout.c:183:29
> > [  +0,000032] index 0 is out of range for type 'clk_hw *[*]'
> > [  +0,000021] CPU: 4 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.17.8+deb14-armmp #1 NONE  Debian 6.17.8-1
> > [  +0,000014] Hardware name: Samsung Exynos (Flattened Device Tree)
> > [  +0,000006] Call trace:
> > [  +0,000006]  unwind_backtrace from show_stack+0x18/0x1c
> > [  +0,000032]  show_stack from dump_stack_lvl+0x54/0x68
> > [  +0,000033]  dump_stack_lvl from ubsan_epilogue+0x8/0x34
> > [  +0,000023]  ubsan_epilogue from __ubsan_handle_out_of_bounds+0x88/0x8c
> > [  +0,000020]  __ubsan_handle_out_of_bounds from exynos_clkout_probe+0x354/0x428
> > [  +0,000024]  exynos_clkout_probe from platform_probe+0x64/0x98
> > [  +0,000031]  platform_probe from really_probe+0xd8/0x3ac
> > [  +0,000031]  really_probe from __driver_probe_device+0x94/0x1dc
> > [  +0,000031]  __driver_probe_device from driver_probe_device+0x3c/0xd8
> > [  +0,000028]  driver_probe_device from __driver_attach+0xd8/0x1d8
> > [  +0,000027]  __driver_attach from bus_for_each_dev+0x84/0xd4
> > [  +0,000025]  bus_for_each_dev from bus_add_driver+0xf4/0x218
> > [  +0,000023]  bus_add_driver from driver_register+0x8c/0x140
> > [  +0,000027]  driver_register from do_one_initcall+0x50/0x24c
> > [  +0,000022]  do_one_initcall from kernel_init_freeable+0x288/0x2fc
> > [  +0,000019]  kernel_init_freeable from kernel_init+0x24/0x140
> > [  +0,000020]  kernel_init from ret_from_fork+0x14/0x28
> > [  +0,000016] Exception stack(0xf0835fb0 to 0xf0835ff8)
> > [  +0,000010] 5fa0:                                     00000000 00000000 00000000 00000000
> > [  +0,000009] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> > [  +0,000009] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> > [  +0,000098] ---[ end trace ]---
> 
> Can you have a look into it? The downstream report is at
> https://bugs.debian.org/1121211

I bet it is the same problem as the ones I fixed in

  6dc445c19050 ("clk: bcm: rpi: Assign ->num before accessing ->hws")
  9368cdf90f52 ("clk: bcm: dvp: Assign ->num before accessing ->hws")

So something like this?

Cheers,
Nathan

diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
index 5f1a4f5e2e59..5b21025338bd 100644
--- a/drivers/clk/samsung/clk-exynos-clkout.c
+++ b/drivers/clk/samsung/clk-exynos-clkout.c
@@ -175,6 +175,7 @@ static int exynos_clkout_probe(struct platform_device *pdev)
 	clkout->mux.shift = EXYNOS_CLKOUT_MUX_SHIFT;
 	clkout->mux.lock = &clkout->slock;
 
+	clkout->data.num = EXYNOS_CLKOUT_NR_CLKS;
 	clkout->data.hws[0] = clk_hw_register_composite(NULL, "clkout",
 				parent_names, parent_count, &clkout->mux.hw,
 				&clk_mux_ops, NULL, NULL, &clkout->gate.hw,
@@ -185,7 +186,6 @@ static int exynos_clkout_probe(struct platform_device *pdev)
 		goto err_unmap;
 	}
 
-	clkout->data.num = EXYNOS_CLKOUT_NR_CLKS;
 	ret = of_clk_add_hw_provider(clkout->np, of_clk_hw_onecell_get, &clkout->data);
 	if (ret)
 		goto err_clk_unreg;
