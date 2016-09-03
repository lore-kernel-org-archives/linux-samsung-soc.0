From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v7 2/2] ASoC: samsung: Add machine driver for Exynos5433
 based TM2 board
Date: Sat, 3 Sep 2016 12:39:14 +0100
Message-ID: <20160903113914.GI21682@localhost.localdomain>
References: <1472835932-13535-1-git-send-email-s.nawrocki@samsung.com>
 <1472835932-13535-2-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:52341 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752240AbcICLjN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 3 Sep 2016 07:39:13 -0400
Content-Disposition: inline
In-Reply-To: <1472835932-13535-2-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Inha Song <ideal.song@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

On Fri, Sep 02, 2016 at 07:05:32PM +0200, Sylwester Nawrocki wrote:
> This patch adds the sound machine driver for TM2 and TM2E board.
> Speaker and headphone playback, Main Mic capture, Bluetooth,
> Voice call and external accessory are supported.
> 
> Signed-off-by: Inha Song <ideal.song@samsung.com>
> [k.kozlowski: rebased on 4.1]
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> [s.nawrocki: rebased to 4.7, adjustment to the ASoC core changes,
>  removed unused ops and direct calls to the max98504 function,
>  added parsing of "audio-amplifier" and "audio-codec"
>  properties, added TDM API calls, switched to gpiod API]
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

Thanks,
Charles
