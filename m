From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3] ASoC: exynos: organize the asoc audio into a menu
Date: Tue, 20 Sep 2016 19:26:31 +0200
Message-ID: <20160920172631.GA17304@kozik-book>
References: <1474311470-23175-1-git-send-email-ayaka@soulik.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33943 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755711AbcITR0g (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 20 Sep 2016 13:26:36 -0400
Content-Disposition: inline
In-Reply-To: <1474311470-23175-1-git-send-email-ayaka@soulik.info>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Randy Li <ayaka@soulik.info>
Cc: alsa-devel@alsa-project.org, sbkim73@samsung.com, s.nawrocki@samsung.com, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, krzk@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Sep 20, 2016 at 02:57:50AM +0800, Randy Li wrote:
> It is simple sound card time, we could assign different codec
> to a interface without making a specific driver for it. The SPDIF
> and I2S interface for Samsung would be possible used by
> simple-sound-card, but not sure about the PCM.
> 
> Those S3C time entries are left alone as I don't think any new board
> would need them.
> 
> Signed-off-by: Randy Li <ayaka@soulik.info>
> ---
>  sound/soc/samsung/Kconfig | 57 ++++++++++++++++++++++++-----------------------
>  1 file changed, 29 insertions(+), 28 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
