From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ASoC: samsung: spdif: Conversion to use
 devm_ioremap_resource()
Date: Wed, 2 Nov 2016 20:27:26 +0200
Message-ID: <20161102182726.GD7958@kozik-lap>
References: <1478085182-30923-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:36359 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756589AbcKBS1b (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 2 Nov 2016 14:27:31 -0400
Received: by mail-wm0-f66.google.com with SMTP id c17so4313818wmc.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Nov 2016 11:27:31 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1478085182-30923-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: broonie@kernel.org, krzk@kernel.org, m.szyprowski@samsung.com, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, sbkim73@samsung.com

On Wed, Nov 02, 2016 at 12:13:02PM +0100, Sylwester Nawrocki wrote:
> This simplifies the code a bit and removes a hard coded IO memory
> region size.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/samsung/spdif.c | 54 +++++++++++------------------------------------
>  1 file changed, 12 insertions(+), 42 deletions(-)
>

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
