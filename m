From: =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski.k@gmail.com>
Subject: Re: [PATCH v3 04/10] clk: samsung: exynos5433: Fix wrong parent clock
 of sclk_apollo clock
Date: Mon, 27 Apr 2015 21:43:53 +0900
Message-ID: <CAJKOXPdsA-5RDooKfctxO9MnKZedOKQTEytyuabjtTFwO4s+uw@mail.gmail.com>
References: <1430134597-14668-1-git-send-email-cw00.choi@samsung.com>
	<1430134597-14668-5-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430134597-14668-5-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, mturquette@linaro.org, kgene@kernel.org, inki.dae@samsung.com, chanho61.park@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

2015-04-27 20:36 GMT+09:00 Chanwoo Choi <cw00.choi@samsung.com>:
> This patch fixes the wrong parent clock of sclk_apollo clock
> from 'div_apollo_pll' to 'div_apollo2'.
>
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>

Hi,

Reviewed-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>

Best regards,
Krzysztof
