From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [RFC PATCH 2/2] ARM: EXYNOS: Make sure that the Exynos5420 MDMA0
 clock is enabled during suspend
Date: Mon, 30 Mar 2015 17:56:48 +0200
Message-ID: <55197240.6010405@collabora.co.uk>
References: <1427466097-7287-1-git-send-email-javier.martinez@collabora.co.uk> <1427466097-7287-3-git-send-email-javier.martinez@collabora.co.uk> <5518AF17.2060207@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5518AF17.2060207@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, Kevin Hilman <khilman@linaro.org>, Tyler Baker <tyler.baker@linaro.org>, Steve Capper <steve.capper@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Chanwoo,

Thanks a lot for your feedback.

On 03/30/2015 04:04 AM, Chanwoo Choi wrote:
> 
> I faced on the similiar issue. If some clock was disabled,
> Exynos SoC could not enter the suspend mode
> 
> But, I think it is not prpper method to resolve this issue.
> about that that specific clock (e.g., mdma0) is handled in this dirver.
> Also, ARM-64bit don't include any '../mach-exynos' directory.
> 
> IMHO, some clock issue have to be handled in SoC clk driver or others.
> 

Ok, Abhilash also said that before so I just posted another RFC:

"[RFC PATCH v3 0/2] ARM: EXYNOS: Fix Suspend-to-RAM on Exynos5420"

Please let me know if that is more aligned to what you were 
thinking as the proper solution.

> 
> Best Regards,
> Chanwoo Choi
> 

Best regards,
Javier
