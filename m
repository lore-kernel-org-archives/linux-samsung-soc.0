Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A728D36D512;
	Sat, 22 Nov 2025 20:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763842090; cv=none; b=qzIlG1pMGHmQSeQKVM0vddz08erA9O2jIf7I9G059rrUHDNhDcdE9FllKxkwXtyqvXW6jSmWyrixZ+9NQAQlwXyXWg8YtyR1dQ/C7au0s9EBdNNSYdz6nfUQaZKv5r/pwcy+5l9WGzCVoFIGselLIYnbhDhs3NvQT+Clt3M9ohg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763842090; c=relaxed/simple;
	bh=UzzLxlEBN9xjoUc8UPWEUF+pB5p/0COgP5NBHxVgQno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LUG2AYiRD8nz2YAMaAxOAejjmFKaoWkq1W40DRFPxBC3Okbbp7EIkd4kmFuLU1UeXmuS3Bzpfqbi6eENr+50xL+vy0zgYZeIODY8ijSyA7G8m69ExeJ0gR4hN2BgIjkaUBKSj9VcP6etzgKYNkVKxgkNM4h/Z8uKWpiPLlIMwfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=HAW4lhuN; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="HAW4lhuN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DdnZSzKrbHE8gHveL8ilDrJSPZu8nD7ismwCAdQIHLg=; b=HAW4lhuNcsIgptOfIKxa/wlQN4
	2oGmOZQNIrHL+sJIndr8afcbFny4Z9KH2eO4qAbJuwBH7A8jL5YKpUqF1G68OEDtxSmdFnlMaV4rK
	cXHt9U93/3Bu37Iu/UvKxKBSpA1eU9OaEvM/aYR2Km5lTYnTHmTTuBLrpZv2AXWkhBrcRAQ9FR2DF
	C+daiLrj06v10VVFDuOShaHao1HyFe6G7xDG2DKE4RKVPdVHL52Cd5T8qLQ2+mZLUDAnRNMqo8bNO
	YE4oPaqGqdO2AW6EEb+zpbpxubitfCTNOLhfyyo69WsaikQO5hVTdyDLldylAlrTyBfur5BE23yCv
	9MdnvgLA==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <carnil@debian.org>)
	id 1vMttV-001D1z-55; Sat, 22 Nov 2025 20:07:41 +0000
Received: by eldamar.lan (Postfix, from userid 1000)
	id 0DC00BE2EE7; Sat, 22 Nov 2025 21:07:40 +0100 (CET)
Date: Sat, 22 Nov 2025 21:07:40 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Jochen Sprickerhof <jspricke@debian.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: 1121211@bugs.debian.org, linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: Bug#1121211: UBSAN: array-index-out-of-bounds in
 /build/reproducible-path/linux-6.17.8/drivers/clk/samsung/clk-exynos-clkout.c:178:18
Message-ID: <aSIYDN5eyKFKoXKL@eldamar.lan>
References: <176383554642.17713.6408785381758213911.reportbug@vis>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176383554642.17713.6408785381758213911.reportbug@vis>
X-Debian-User: carnil

Hi,

Jochen reported the folowing while booting 6.17.8 based kernel in
Debian:

On Sat, Nov 22, 2025 at 07:19:06PM +0100, Jochen Sprickerhof wrote:
> Package: src:linux
> Version: 6.17.8-1
> Severity: normal
> 
> First time booting into 6.17.8-1 and first time I see UBSAN in my logs:
> 
> [Nov21 08:31] Booting Linux on physical CPU 0x100
> [  +0,012977] ------------[ cut here ]------------
> [  +0,000017] UBSAN: array-index-out-of-bounds in /build/reproducible-path/linux-6.17.8/drivers/clk/samsung/clk-exynos-clkout.c:178:18
> [  +0,000038] index 0 is out of range for type 'clk_hw *[*]'
> [  +0,000025] CPU: 4 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.17.8+deb14-armmp #1 NONE  Debian 6.17.8-1
> [  +0,000018] Hardware name: Samsung Exynos (Flattened Device Tree)
> [  +0,000007] Call trace:
> [  +0,000009]  unwind_backtrace from show_stack+0x18/0x1c
> [  +0,000042]  show_stack from dump_stack_lvl+0x54/0x68
> [  +0,000036]  dump_stack_lvl from ubsan_epilogue+0x8/0x34
> [  +0,000025]  ubsan_epilogue from __ubsan_handle_out_of_bounds+0x88/0x8c
> [  +0,000024]  __ubsan_handle_out_of_bounds from exynos_clkout_probe+0x38c/0x428
> [  +0,000029]  exynos_clkout_probe from platform_probe+0x64/0x98
> [  +0,000034]  platform_probe from really_probe+0xd8/0x3ac
> [  +0,000031]  really_probe from __driver_probe_device+0x94/0x1dc
> [  +0,000027]  __driver_probe_device from driver_probe_device+0x3c/0xd8
> [  +0,000027]  driver_probe_device from __driver_attach+0xd8/0x1d8
> [  +0,000028]  __driver_attach from bus_for_each_dev+0x84/0xd4
> [  +0,000026]  bus_for_each_dev from bus_add_driver+0xf4/0x218
> [  +0,000023]  bus_add_driver from driver_register+0x8c/0x140
> [  +0,000027]  driver_register from do_one_initcall+0x50/0x24c
> [  +0,000023]  do_one_initcall from kernel_init_freeable+0x288/0x2fc
> [  +0,000022]  kernel_init_freeable from kernel_init+0x24/0x140
> [  +0,000022]  kernel_init from ret_from_fork+0x14/0x28
> [  +0,000015] Exception stack(0xf0835fb0 to 0xf0835ff8)
> [  +0,000012] 5fa0:                                     00000000 00000000 00000000 00000000
> [  +0,000011] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [  +0,000009] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> [  +0,000007] ---[ end trace ]---
> [  +0,000226] ------------[ cut here ]------------
> [  +0,000012] UBSAN: array-index-out-of-bounds in /build/reproducible-path/linux-6.17.8/drivers/clk/samsung/clk-exynos-clkout.c:183:29
> [  +0,000032] index 0 is out of range for type 'clk_hw *[*]'
> [  +0,000021] CPU: 4 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.17.8+deb14-armmp #1 NONE  Debian 6.17.8-1
> [  +0,000014] Hardware name: Samsung Exynos (Flattened Device Tree)
> [  +0,000006] Call trace:
> [  +0,000006]  unwind_backtrace from show_stack+0x18/0x1c
> [  +0,000032]  show_stack from dump_stack_lvl+0x54/0x68
> [  +0,000033]  dump_stack_lvl from ubsan_epilogue+0x8/0x34
> [  +0,000023]  ubsan_epilogue from __ubsan_handle_out_of_bounds+0x88/0x8c
> [  +0,000020]  __ubsan_handle_out_of_bounds from exynos_clkout_probe+0x354/0x428
> [  +0,000024]  exynos_clkout_probe from platform_probe+0x64/0x98
> [  +0,000031]  platform_probe from really_probe+0xd8/0x3ac
> [  +0,000031]  really_probe from __driver_probe_device+0x94/0x1dc
> [  +0,000031]  __driver_probe_device from driver_probe_device+0x3c/0xd8
> [  +0,000028]  driver_probe_device from __driver_attach+0xd8/0x1d8
> [  +0,000027]  __driver_attach from bus_for_each_dev+0x84/0xd4
> [  +0,000025]  bus_for_each_dev from bus_add_driver+0xf4/0x218
> [  +0,000023]  bus_add_driver from driver_register+0x8c/0x140
> [  +0,000027]  driver_register from do_one_initcall+0x50/0x24c
> [  +0,000022]  do_one_initcall from kernel_init_freeable+0x288/0x2fc
> [  +0,000019]  kernel_init_freeable from kernel_init+0x24/0x140
> [  +0,000020]  kernel_init from ret_from_fork+0x14/0x28
> [  +0,000016] Exception stack(0xf0835fb0 to 0xf0835ff8)
> [  +0,000010] 5fa0:                                     00000000 00000000 00000000 00000000
> [  +0,000009] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [  +0,000009] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> [  +0,000098] ---[ end trace ]---

Can you have a look into it? The downstream report is at
https://bugs.debian.org/1121211

Regards,
Salvatore
