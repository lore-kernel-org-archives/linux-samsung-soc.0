From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [RFC PATCH v3 2/2] clk: exynos5420: Make sure MDMA0 clock is
 enabled during suspend
Date: Tue, 07 Apr 2015 16:26:29 +0200
Message-ID: <5523E915.5070203@collabora.co.uk>
References: <1427730803-28635-1-git-send-email-javier.martinez@collabora.co.uk>	<1427730803-28635-3-git-send-email-javier.martinez@collabora.co.uk>	<CA+Ln22FBpuzR06qCsVc7SXtLX2mhf901vDE5D-mT1+ijZ2G3sg@mail.gmail.com>	<551976F1.1000605@collabora.co.uk>	<CAM4voanL3A=dS8Z-ovi_-EDi9ctyaxZkvjajp+3ZjyNAnqR1aQ@mail.gmail.com>	<551AFCCE.4050404@collabora.co.uk>	<551BD07E.2090506@samsung.com>	<551BDA0A.7010704@collabora.co.uk>	<551C2B6D.4010001@samsung.com>	<551C71A5.1070903@collabora.co.uk>	<CAM4voakS8PnatqRTW5gkD0NNKD9gW9Tuv5p-ekxFhKN5NcuBCQ@mail.gmail.com>	<5523B878.8040304@collabora.co.uk> <CAM4voanig_BQrEKGA0YYX_80Gvbtmau3zwz7mQUKtvNMCO-LuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:53750 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756093AbbDGO0g (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Apr 2015 10:26:36 -0400
In-Reply-To: <CAM4voanig_BQrEKGA0YYX_80Gvbtmau3zwz7mQUKtvNMCO-LuQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kevin Hilman <khilman@linaro.org>, Tyler Baker <tyler.baker@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

Hello Abhilash,

On 04/07/2015 04:11 PM, Abhilash Kesavan wrote:
> 
> Yes, though it increasingly looks like aclk266_g2d needs to stay ON
> and we should use your patch that keeps it enabled prior to suspend.
>

Indeed, could you please give me some feedback on the latest RFC patch
I shared [0] on this thread according to Tomasz comments?
 
> Regards,
> Abhilash
>>

Thanks a lot and best regards,
Javier

[0]: https://lkml.org/lkml/2015/4/7/537
