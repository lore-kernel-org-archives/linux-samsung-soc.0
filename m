From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [RESEND][PATCH] ARM: dts: exynos4412-odroid: add 'rtc_src' clock
 to rtc node
Date: Fri, 08 May 2015 20:13:53 +0900
Message-ID: <554C9A71.9080408@samsung.com>
References: <554C8319.70203@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f169.google.com ([209.85.192.169]:34926 "EHLO
	mail-pd0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753203AbbEHLOT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 May 2015 07:14:19 -0400
Received: by pdbqd1 with SMTP id qd1so77591825pdb.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 May 2015 04:14:19 -0700 (PDT)
In-Reply-To: <554C8319.70203@fivetechno.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Markus Reichl <m.reichl@fivetechno.de>, linux-samsung-soc@vger.kernel.org
Cc: javier.martinez@collabora.co.uk, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Chanwoo Choi <cw00.choi@samsung.com>, Kukjin Kim <kgene@kernel.org>

W dniu 08.05.2015 o 18:34, Markus Reichl pisze:
> The Exynos4412 SoC has a s3c6410 RTC where the source clock is now
> a mandatory property.
> 
> This patch fixes probe failure of s3c-rtc on Odroid-X2/U2/U3
> boards.
> 
> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de> Tested-by:
> Tobias Jakobi <tjakobi@math.uni-bielefeld.de> Reviewed-by: Chanwoo
> Choi <cw00.choi@samsung.com> Reviewed-by: Javier Martinez Canillas
> <javier.martinez@collabora.co.uk> Tested-by: Krzysztof Kozlowski
> <k.kozlowski@samsung.com>

Thanks, applied. I'll push it to Kukjin a little later, depending on
status of previous pull requests.

Best regards,
Krzysztof
