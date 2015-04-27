From: =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski.k@gmail.com>
Subject: Re: [PATCH v3 02/10] clk: samsung: exynos5433: Fix wrong offset of PCLK_MSCL_SECURE_SMMU_JPEG
Date: Mon, 27 Apr 2015 21:37:52 +0900
Message-ID: <CAJKOXPcND+strAenH-EMvYRCyeumo7m+pzg8z1guYShX0=zA7w@mail.gmail.com>
References: <1430134597-14668-1-git-send-email-cw00.choi@samsung.com>
	<1430134597-14668-3-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f41.google.com ([209.85.216.41]:43992 "EHLO
	mail-vn0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932517AbbD0Mhx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Apr 2015 08:37:53 -0400
In-Reply-To: <1430134597-14668-3-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, mturquette@linaro.org, kgene@kernel.org, inki.dae@samsung.com, chanho61.park@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jonghwa Lee <jonghwa3.lee@samsung.com>

2015-04-27 20:36 GMT+09:00 Chanwoo Choi <cw00.choi@samsung.com>:
> From: Jonghwa Lee <jonghwa3.lee@samsung.com>
>
> This patch fixes the wrong offoset of PCLK_MSCL_SECURE_SMMU_JPEG in CMU_MSCL
> domain.
>
> Fixes: b274bbfd8b4a94cb5bd6f (clk: samsung: exynos5433: Add clocks for CMU_MSCL domain
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Signed-off-by: Jonghwa Lee <jonghwa3.lee@samsung.com>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>

Hi,

Reviewed-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>

Best regards,
Krzysztof
