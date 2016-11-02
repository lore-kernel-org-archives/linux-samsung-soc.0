From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v7 RESEND 1/2] ASoC: samsung: Add DT bindings
 documentation for TM2 sound subsystem
Date: Wed, 2 Nov 2016 20:24:14 +0200
Message-ID: <20161102182414.GA7958@kozik-lap>
References: <1478102558-12524-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:36461 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756196AbcKBSYW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 2 Nov 2016 14:24:22 -0400
Received: by mail-wm0-f68.google.com with SMTP id c17so4301758wmc.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Nov 2016 11:24:21 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1478102558-12524-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: broonie@kernel.org, linux-samsung-soc@vger.kernel.org, krzk@kernel.org, alsa-devel@alsa-project.org, sbkim73@samsung.com, b.zolnierkie@samsung.com, linux-arm-kernel@lists.infradead.org

On Wed, Nov 02, 2016 at 05:02:37PM +0100, Sylwester Nawrocki wrote:
> This patch adds DT binding documentation for Exnos5433 based TM2
> and TM2E boards sound subsystem.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> Changes since v5:
>  - none.
> 
> Changes since v4:
>  - indentation changes.
> 
> Changes since v2:
>  - none.
> 
> Changes since initial version:
>  - dropped clocks, clock-names properties, instead properties from
>    the CODEC node will be used,
>  - property renames: 'samsung,model' -> 'model', 'samsung,i2s-controller'
>    -> 'i2s-controller', 'samsung,speaker-amplifier' -> 'audio-amplifier',
>  - added 'audio-codec' property.
> ---
>  .../bindings/sound/samsung,tm2-audio.txt           | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt
>


Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
