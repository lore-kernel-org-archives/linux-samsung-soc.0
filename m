Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793976353;
	b=IvGgb77p2qX0bV4td5eULa2np9VBbgs7+TdJS0tUgtlN22tPUhzgN7M2e7/uGLuTD+f5
	 lurCEOa5KPWZLGb1K3CqMzIhVJ1bWnWk1WokKpjYLzpC7MdRObTMxnvB+LRQoAo/O1Ha0
	 IZK/cyHUwBCpA6ZFhyAT0dogeVbJU9hAaMOJH9Wg5Un1U187o4Xb7Bp016TsjnztkqXCj
	 hH3xHGm4QyHQZOy93BRksa+KDGMzkXZ0+GqZBx5EyUBOXKUPH84rFwAVg0wzvq8sH0BuC
	 e+PVnBcemW52S8cZkrwS0FpkhWQOfFFkECd+3DvK/qX/ykipyd+7QXVLutkntOgvw6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793976353;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=nXpHtbwIXWqa0CUduYYty9A7kDwxd+/CalGYDzCTKjw=;
	b=sqmz6Z0rFKOGduh+XfuaIr6xOhTsFb7E1ykhwFfXBA3b9LRp++I97HcGH6hXIMfVD2HJ
	 Rrcs8UvekTli49uO/Wv9+Zmo2+2rUqLDFIERspQnq7O8iUlauVzJlfjy+r9hgR4PKxl1b
	 wAvfqFifTErO2hcvsMUV0eMBU9bjp7GnZynJIQOWRTmH3UGrn4uPREV2klIRgJ2d/LoLi
	 cAMphKRP88vfaKrQ7UsIvGujmN07cGCdXN6emmN3t2YVytkMbHsL21kGC3qRZfi8lzXH4
	 ddczTkMvuPFtZOcgdukAJFLOUBab0mKYT9G8JCIUAJ5F3AhadKfixQ02MhyukdcSnRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=grimler.se;
	spf=pass smtp.mailfrom=grimler.se;
	arc=none smtp.remote-ip=91.218.175.27
Received: from mta0.migadu.com (out-27.mta0.migadu.com [91.218.175.27])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DA6606A33A
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Nov 2026 14:45:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8DA6606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grimler.se
X-Envelope-To: linux-samsung-soc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=dsRJ/0z/yE/5s58BMhmlVSFV04GmqnxwznaEjY/5328=;
 c=simple/simple; d=grimler.se;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793976343; v=1; x=1794581143;
 b=kADcVJZMgmNCz98SwUVAOSfSrkz7gIzWbzN1tnaTaC/CyM5NEQ9+X5mynXCfvmbkw7XuInM9
 NAROZSBHoV0/9CqgXDtzIomW7cYT/ppqX/Fhy/LhrHWO5UoPgPn3onXSrZp9k+rthRSGL4m1cHm
 gD0Trg+KBvMvns8fnRoJ1Jmg=
X-Envelope-To: linux-samsung-soc@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id cf432eae1467532f;
	Fri, 06 Nov 2026 14:45:39 +0000
X-Mizu-Trace-ID: cf432eae1467532f
X-Migadu-Flow: FLOW_OUT
Date: Fri, 6 Nov 2026 15:45:36 +0100
From: Henrik Grimler <henrik@grimler.se>
To: Young-Jun Hong <nirvanah@nirvanahyj.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] clk: samsung: exynos5420: add VPLL rates for 650,
 700 and 750 MHz
Message-ID: <20261106144536.GA3678@localhost>
References: <20261106054210.2893230-1-nirvanah@nirvanahyj.com>
 <20261106054210.2893230-3-nirvanah@nirvanahyj.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106054210.2893230-3-nirvanah@nirvanahyj.com>

Hi Young-Jun,

On Fri, Nov 06, 2026 at 02:41:49PM +0900, Young-Jun Hong wrote:
> The VPLL drives the G3D (Mali) clock on Exynos 5420/5422. Its rate table
> stops at 600 MHz, so GPU OPPs above 600 MHz cannot be reached:
> clk_set_rate() silently keeps fout_vpll at 600 MHz.
> 
> Add the 650, 700 and 750 MHz rows (VCO 1300/1400/1500 MHz, using the same
> P/M/S style as the APLL rows).

What you mean with "using the same P/M/S style as the APLL rows"?

> Tested on Samsung ARTIK 10 (Exynos 5422): with these rows the G3D devfreq
> reaches 700 and 750 MHz, and the OpenCL accuracy suite passes 96/96 at
> 750 MHz with a board-specific 1.35 V OPP.
> 
> The analysis, the code and this changelog were produced with Claude
> Code (Anthropic), a coding assistant.

Was it tested by a human?

> Signed-off-by: Young-Jun Hong <nirvanah@nirvanahyj.com>
> ---
>  drivers/clk/samsung/clk-exynos5420.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
> index 400a5c59815c..1b4b0ae16765 100644
> --- a/drivers/clk/samsung/clk-exynos5420.c
> +++ b/drivers/clk/samsung/clk-exynos5420.c
> @@ -1451,6 +1451,9 @@ static const struct samsung_pll_rate_table exynos5420_epll_24mhz_tbl[] = {
>  };
>  
>  static const struct samsung_pll_rate_table exynos5420_vpll_24mhz_tbl[] = {
> +	PLL_35XX_RATE(24 * MHZ, 750000000U,  125, 2, 1),
> +	PLL_35XX_RATE(24 * MHZ, 700000000U,  175, 3, 1),
> +	PLL_35XX_RATE(24 * MHZ, 650000000U,  325, 6, 1),

Do you have any references, like vendor kernel sources, to back up
these choices of dividers and scalar?

Best regards,
Henrik Grimler

>  	PLL_35XX_RATE(24 * MHZ, 600000000U,  200, 2, 2),
>  	PLL_35XX_RATE(24 * MHZ, 543000000U,  181, 2, 2),
>  	PLL_35XX_RATE(24 * MHZ, 480000000U,  160, 2, 2),
> -- 
> 2.47.3
> 
> 
