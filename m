From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] ASoC: samsung: Remove tests of member address
Date: Mon, 12 Dec 2016 14:35:41 +0100
Message-ID: <2863148.52BcI6omVF@amdc3058>
References: <1481363471-21364-1-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:46641 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751798AbcLLNfq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 12 Dec 2016 08:35:46 -0500
In-reply-to: <1481363471-21364-1-git-send-email-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org


Hi,

On Saturday, December 10, 2016 11:51:11 AM Krzysztof Kozlowski wrote:
> The driver was checking for non-NULL address of struct's members:
>  - s3c_audio_pdata->type (union),
>  - s3c_audio_pdata->type.i2s (embedded struct).
> 
> This is pointless as these will be always non-NULL.  The 's3c_audio_pdata'
> is always initialized in static memory so it will be zeroed.
> Additionally the 'type' member was an union with only one member.
> 
> It is safe to reorganize the structures to get rid of useless union and
> checks for addresses to fix the coccinelle warning:
> 	>> sound/soc/samsung/i2s.c:1270:2-4: ERROR: test of a variable/field address
> 
> Reported-by: kbuild test robot <fengguang.wu@intel.com>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
