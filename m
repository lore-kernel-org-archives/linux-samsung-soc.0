Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794574469;
	b=ENHRgznfkIcLd6s7xouEuXdIX4dXdj7SbXpSmT2SQf3ZPleibq87fEUhAhePbwwuOo+S
	 AOaD2eLv4SaGFL4u54EMevYK7hW7mvhQ+pNKOU7e90x5StIBPZYd0Ccp+7aeYwH/XoIIC
	 nbpVHdSfu1ZVFuNMuKVnPH5uMPGuAOJm5tkl/oI9WpuMnZttiHKwKVj0cFWoLg88P2Dd3
	 TCa+QJ+jvo3bm4/pvDwNHpBsaN87xacWPUJGepsrAU2+RoqPKf2CdCnIHYN2pupUZNey5
	 5lELvMWClVOfqtfzFi1UlDVO15RZ/yoxsi8WAIC9/GAdm/KnqBe1xdiQG/j9Q+IJd8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=mLlFdlAUsckIoBDaS7lANsUL8Pv2vCZkw0CEClRgKQA=;
	b=ErDtU1wLlmlg5c3+eUybzb3pwqd19f+ZJu0pFyqm0uUGQu5nRfy+rQZfYtRkA9DBTRDG
	 HpzM1mydBq8U7qwFF+BBxLyNtBsNw0gTABQ55XoWLby8/aO+e904mz7jduWFHADAzD1/y
	 6jE89B78PnV4NKtYwNVdyIPtTx2Et61DhfrHkPVls2bAhZ5bsUgPi7AxhmZpX1GDptORw
	 14FqccOJ36vimh1lN5ZzqASxre1+Tp4UaJi1WVyPKg9cKaAFbt6CNLniLhUlkPfYoSHRK
	 EX6OdhOfXyTiD5RUCAQkFerelbcvcIbc+WpXXuF/nYi09NA0cw/cqJe92DCBdXux80w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WKaeb2l4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1602F606A32E
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 12:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1602F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WKaeb2l4
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b56c428212so1438638a12.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 04:54:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794574467; cv=none;
        d=google.com; s=arc-20260327;
        b=mVLjoS4Sk53i5XA1ATSdf7VtuCq2HpRiXPzHRTzYD58pqsYaW6RmEclIrjQwKql1Ke
         uuzE8Djx2zD2gaj4NW0cCN9YP/PPwRmaGZkkijEk4MM4jp5BeK9C7dYYPJ1Y8RlRaFb6
         EWYdGaCGYwwmobOMh66fSh+xc92PP1U3r81MmlgcJz+mVyxFn3mKTZZ5jbUDKGxDjABl
         bh0ZMAl9olElYINRIZaUnQRCFRcfnSsDIVc+2ei4DbR2b/N200FPakJxATWGQJsQdHaZ
         JguHsa5Eg/GvVxEinJ3Rnh/zsWWApYIiCTDkc4aGbYDoG0pUDuPPyIBHtv6QZK4L6rI+
         aYBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mLlFdlAUsckIoBDaS7lANsUL8Pv2vCZkw0CEClRgKQA=;
        fh=PThOCX34FBiti7DdP05F7+cKnm2ZIIrNhTLI2byhL2I=;
        b=Oh2C9SQ32qIY+ud/3DHOw0roAZyo+uZx8RfTGmDNX2CAujJRYi3V69T2Q7r0az+VQa
         FEQRTVGQGy1vi6CDnDgfKNAOz+CIzy8Fmc58l+pn0s51c1e1coZ8ol1dXoBtzTCiYkMf
         rx9p+2bBS4uRgnqiOnJoiXt65rrFbtYC6MDy062g/MtLElGNU7QvPAd7yE7Rx6SicAvH
         d9DdzPtOIP+mc4q9LZt4hJHiIS1lLHrAEFbGh6FfJcoznnknMPji8XWmE5k96UWust/Z
         Pi7UhEgE0DNoQOgm+0gYRAg8M5q+dShmR3qndH7EUwUWUEpn0ds8HWs+eeH60gw8yXxt
         FMJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794574467; x=1795179267; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mLlFdlAUsckIoBDaS7lANsUL8Pv2vCZkw0CEClRgKQA=;
        b=WKaeb2l4pVzBS87XlMfPO1VmDqptC/3pLusWhgieqeXXXbpQOD/MIp0MA41pPGaSFE
         UGPcR7i6V3UxRV/TUJfwrRDVWP1rRhkfW2bv5f3NKIh7u65gSoBnWc3Smn0ZYEC1mG59
         9c6J0EwwIbANh6fVCNqaE+Sh+OrShJvWjxXx6MXf+bORf3/36vfNUdBbbOHoGqqHfsEC
         sjhXCaXM03ov3jzCLS+fNlnP85J/nu4r9Jy4UZgLRRt4sSmQTCKs9VTP14lzhYH0OT5X
         XIqDjGH1/R319J2ZswfccQWGwNAO+p9bfzHnzjuzlF/O/NaF7SFfrUot6bmtetdPzbED
         pgkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574467; x=1795179267;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mLlFdlAUsckIoBDaS7lANsUL8Pv2vCZkw0CEClRgKQA=;
        b=xETd97ENVuOmVYm9B2UB9Xu6/5H+7jOQT+7KePLZ81BuLCauUjwbuQvzGM+whfHBAE
         YiY+jn2GRUqjqPM2u8OrSluZLuO+7NiB81wwndvIWKv67l2+KYhjsBla7bzggXhLbTMJ
         6LqU82FJCA5U1hOwakfPjMazyIPvwF/yEievcBxEWV2OXJqM7pEjK55uUK9GfZ2Hn3oN
         6p8ca0vnYoV86bHYuDwSG3uLtvHwfNczUfqCXKEMPlLMSXOVdrJyCmSKNthM2OSd94RK
         VR2+xlq4b3Rzn3xEg7BBjCZkpaEyC6MQCAfd9F+WOFnO/2Gww3O2lwSZliFge/uRgwse
         uahw==
X-Forwarded-Encrypted: i=1; AL+hErFDDsTrPonL0kMMolcLK9DwX3/sIVk/N6+0TRLf/EnIGJMPwAvV8Ppauzj4Gg1kP+XhVcUm6q9gY6MdJXT1WWlg7A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8o8Txu4mEDb4NFJJhHTJbHfZ+2hR3qwZiL8HcLhnheSrDzuM17
	U3zbeq59RW1UJrn7buoWy/1VaK5sRnYGDvs8l1Ng5k2wRXXxTtp9MJ9/K0vTy2kT0f/vMXh8Osb
	FTuVbucqjpqRSgfGphPDzFhp5hZ3i6HQMAA3Spc3S4Q==
X-Gm-Gg: AYBFou2FMWoxvR4a5sQKJdM3mHQzoGUkiV24p0OZXLEyVj32Yh7SgYEbATUBhb+ykPB
	AWnNgDbbf+o3EByvel8wrUk0TMtnjMkm6BWwFir4ZXeUjH8LVxQtBo3ZW0EEJ4Gw5fnKmrXp96P
	XJpheg3txoUf5+gBXDsLvLjeJSi0CnEgO7Egaz/vMcqqPLqUaUU/ru8liJDFmuIL6V+7u9DkCjJ
	OshxdxnFr11Se0okpLBbzjq2jkzAjZg4VpJKENYKn0HSJIkHB7+DPIqgqWzWQ7/H9pUja319Hi3
	pc1Pcn20x0ll1h42in5aWIX3gn6F3PGkhCl5wsc246G+cwbIWkAwHv/wbdQkcoG+yMzhWQ0bEiC
	UzLT1kld/hsXVxep4+kdeLe52NKztsZKyEJN8cWDZF59+RZl7gkdnkxc++9ozfiJEnO1Hyg==
X-Received: by 2002:a05:6402:2804:b0:6b7:245a:a509 with SMTP id
 4fb4d7f45d1cf-6b7c0d166cfmr1777902a12.40.1794574467313; Fri, 13 Nov 2026
 04:54:27 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104853epcas5p175c566a1ced2547e533c21b21e60e993@epcas5p1.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-9-raghav.s@samsung.com>
In-Reply-To: <20261113110612.3265841-9-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 12:54:14 +0000
X-Gm-Features: AclHuK9WcGq9tEUmProC1B7yOVe2Lz9yBCRU5dHo1y04eEg6YkemqWw0onfqCbI
Message-ID: <CADrjBPrzHP_97OgAYacJKKqeCcp9FURoi6=Dmopk6nisTdEbdA@mail.gmail.com>
Subject: Re: [PATCH v3 08/14 RESEND] clk: samsung: exynos8855: add block peris
 clock support
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com
Content-Type: text/plain; charset="UTF-8"

Hi Raghav,

On Fri, 13 Nov 2026 at 10:54, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> Register compatible and cmu_info data to support clocks.
> CMU_PERIS, this provides clocks for PERIS
>
> Co-developed-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos8855.c | 97 ++++++++++++++++++++++++++++
>  1 file changed, 97 insertions(+)
>
> diff --git a/drivers/clk/samsung/clk-exynos8855.c b/drivers/clk/samsung/clk-exynos8855.c
> index dcf58f2459b0..12b5ae54b560 100644
> --- a/drivers/clk/samsung/clk-exynos8855.c
> +++ b/drivers/clk/samsung/clk-exynos8855.c
> @@ -18,7 +18,9 @@
>  /* NOTE: Must be equal to the last clock ID increased by one */
>  #define CLKS_NR_TOP                     (CLKCMU_DOUT_G3D_HTU + 1)
>  #define CLKS_NR_PERIC                   (CLK_GOUT_USI_PERIC + 1)
> +#define CLKS_NR_PERIS                   (CLK_GOUT_WDT1_PERIS + 1)
>
> +#define EXYNOS8855_PERIS_GATE_DBG_OFFSET      0x2004
>  #define EXYNOS8855_PERIC_GATE_DBG_OFFSET      0x2024
>  #define EXYNOS8855_TOP_GATE_DBG_OFFSET      0x20A0
>
> @@ -1092,6 +1094,98 @@ static const struct samsung_cmu_info peric_cmu_info __initconst = {
>         .memclk_offset          = EXYNOS8855_MEMCLK_OFFSET,
>  };
>
> +/* ---- CMU_PERIS --------------------------------------------------------- */
> +
> +/* Register Offset definitions for CMU_PERIS (0x10030000) */
> +#define CMU_PERIS_PLL_CON0_MUX_CLKCMU_PERIS_NOC_USER           0x600
> +#define CMU_PERIS_CLK_CON_MUX_CLK_PERIS_GIC                    0x1000
> +#define CMU_PERIS_PLL_CON0_MUX_CLK_PERIS_GIC_USER              0x610
> +#define CMU_PERIS_CLK_CON_DIV_CLK_PERIS_NOCP                   0x1800
> +#define CMU_PERIS_CLK_CON_DIV_CLK_PERIS_OTP                    0x1804
> +#define CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_CMU_PERIS_IPCLKPORT_PCLK     0x201c
> +#define CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_SYSREG_PERIS_IPCLKPORT_PCLK  0x2040
> +#define CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT0_IPCLKPORT_PCLK          0x2048
> +#define CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT1_IPCLKPORT_PCLK          0x204c
> +#define CMU_PERIS_CONTROLLER_OPTION0_CMU_CTRL                  0x800
> +
> +static const unsigned long peris_clk_regs[] __initconst = {
> +       CMU_PERIS_PLL_CON0_MUX_CLKCMU_PERIS_NOC_USER,
> +       CMU_PERIS_CLK_CON_MUX_CLK_PERIS_GIC,
> +       CMU_PERIS_PLL_CON0_MUX_CLK_PERIS_GIC_USER,
> +       CMU_PERIS_CLK_CON_DIV_CLK_PERIS_NOCP,
> +       CMU_PERIS_CLK_CON_DIV_CLK_PERIS_OTP,
> +       CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_CMU_PERIS_IPCLKPORT_PCLK,
> +       CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_SYSREG_PERIS_IPCLKPORT_PCLK,
> +       CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT0_IPCLKPORT_PCLK,
> +       CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT1_IPCLKPORT_PCLK,
> +       CMU_PERIS_CONTROLLER_OPTION0_CMU_CTRL,
> +};

Same comment about preserving register state from the bootloader when
powering off/on PERIS block.

> +
> +/* List of parent clocks for Muxes in CMU_PERIS */
> +PNAME(mout_clkcmu_peris_noc_user_p) = { "oscclk", "dout_clkcmu_peris_noc" };
> +PNAME(mout_clk_peris_gic_p) = { "oscclk", "mout_clkcmu_peris_gic_user" };
> +PNAME(mout_clkcmu_peris_gic_user_p) = { "oscclk", "dout_clkcmu_peris_gic" };
> +
> +static const struct samsung_mux_clock peris_mux_clks[] __initconst = {
> +       MUX(CLK_MOUT_PERIS_NOC_USER, "mout_clkcmu_peris_noc_user",
> +           mout_clkcmu_peris_noc_user_p, CMU_PERIS_PLL_CON0_MUX_CLKCMU_PERIS_NOC_USER, 4, 1),
> +       MUX(CLK_MOUT_PERIS_GIC, "mout_clk_peris_gic",
> +           mout_clk_peris_gic_p, CMU_PERIS_CLK_CON_MUX_CLK_PERIS_GIC, 0, 1),
> +       MUX(CLK_MOUT_PERIS_GIC_USER, "mout_clkcmu_peris_gic_user",
> +           mout_clkcmu_peris_gic_user_p, CMU_PERIS_PLL_CON0_MUX_CLK_PERIS_GIC_USER, 4, 1),
> +};
> +
> +static const struct samsung_div_clock peris_div_clks[] __initconst = {
> +       DIV(CLK_DOUT_PERIS_NOCP, "dout_clkcmu_peris_nocp",
> +           "mout_clkcmu_peris_noc_user", CMU_PERIS_CLK_CON_DIV_CLK_PERIS_NOCP,
> +           0, 4),
> +       DIV(CLK_DOUT_PERIS_OTP, "dout_clkcmu_peris_otp",
> +           "oscclk", CMU_PERIS_CLK_CON_DIV_CLK_PERIS_OTP,
> +           0, 4),
> +};
> +
> +static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
> +       GATE(CLK_GOUT_CMU_PERIS, "gout_cmu_peris",
> +            "dout_clkcmu_peris_nocp",
> +            CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_CMU_PERIS_IPCLKPORT_PCLK,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_SYSREG_PERIS, "gout_sysreg_peris",
> +            "dout_clkcmu_peris_nocp",
> +            CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_SYSREG_PERIS_IPCLKPORT_PCLK,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_WDT0_PERIS, "gout_wdt0_peris",
> +            "dout_clkcmu_peris_nocp",
> +            CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT0_IPCLKPORT_PCLK,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_WDT1_PERIS, "gout_wdt1_peris",
> +            "dout_clkcmu_peris_nocp",
> +            CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT1_IPCLKPORT_PCLK,
> +            21, 0, 0),

The Linux clock name strings look wrong here. It looks like you've
generally followed the clk-gs101 clock name mangling in this series so
it should be "gout_<block-name>_<IP-clock-name>, but you have
"gout_IP-clock_name>-<block-name>". I know there is some "name
diversity" in-tree for various SoCs, but with new SoCs using auto
clocks I would like to keep the naming scheme following a similar
style to clk-gs101.

Also I guess with auto clocks now enabled from the start you may never
need to expose all the CMU bus clocks, but I worry a bit you may have
mangled the names here a bit too much. If you do need to expose extra
gates you might get name collisions. For example in clk-gs101 we have
both

gout_apm_apm_usi0_uart_ipclk
gout_apm_apm_usi0_uart_pclk

So we kept the _pclk suffix in the Linux name to avoid a name collision.

Thanks,

Peter
