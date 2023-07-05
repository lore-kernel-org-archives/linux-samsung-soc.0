Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA7BC001DE
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  5 Jul 2023 17:47:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231252AbjGERq6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 5 Jul 2023 13:46:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233166AbjGERq5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Jul 2023 13:46:57 -0400
X-Greylist: delayed 362 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 05 Jul 2023 10:46:56 PDT
Received: from mailrelay2-1.pub.mailoutpod2-cph3.one.com (mailrelay2-1.pub.mailoutpod2-cph3.one.com [46.30.211.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4E401981
        for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Jul 2023 10:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=rsa1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=D2MBeSjh9PbUUpjfBCdJ5yEcoq0Rd3QOgcLZCtE4Di0=;
        b=pkTyGri8txVDPfXNLvYZyP3Pzd2VrkJVwdinBgOP2DDwCBz42h+dZI7dFwdUH6I6lx2anhC5Hrbdm
         vjwymPCHz+fHmI21O/N9I9nvvhgfbJobWl8SxIzkFw36dpt3sT1XOhr5l9zo5FUSgTgajOEkTPG4rM
         uM7TCHuDTqV4ScU4vcqzUR3tP7LW7vwtATCroJM1ceryprvz7kOE/oZppKk+SdK+EhHYBnU9zTaVl5
         aVzHPiHeLscKqmHvJM68IvYW7XzXYTzKVtXF1fXQqKhJDvUnCgrN0vab5mVCeSw9KDiG15Ny0hL9TM
         X7d8EmNVvoCDoetXJVq5gwa9e5d22UQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=ed1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=D2MBeSjh9PbUUpjfBCdJ5yEcoq0Rd3QOgcLZCtE4Di0=;
        b=usGeU7gk76EJ817esTcfBnFfo9imlKSGUkv5KK7iGI6p4Tri272tdOZKgivVH2E1g2HP6HsUHXWDJ
         BLZ1T9oDg==
X-HalOne-ID: c838b9e8-1b5b-11ee-87c8-5ba399456a4a
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
        by mailrelay2 (Halon) with ESMTPSA
        id c838b9e8-1b5b-11ee-87c8-5ba399456a4a;
        Wed, 05 Jul 2023 17:45:52 +0000 (UTC)
Date:   Wed, 5 Jul 2023 19:45:50 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/3] drm/panel: ld9040: Register a backlight device
Message-ID: <20230705174550.GC106478@ravnborg.org>
References: <20230703214715.623447-1-paul@crapouillou.net>
 <20230703214715.623447-3-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230703214715.623447-3-paul@crapouillou.net>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Paul,

On Mon, Jul 03, 2023 at 11:47:14PM +0200, Paul Cercueil wrote:
> Register a backlight device to be able to switch between all the gamma
> levels.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/gpu/drm/panel/panel-samsung-ld9040.c | 40 ++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-ld9040.c b/drivers/gpu/drm/panel/panel-samsung-ld9040.c
> index 7fd9444b42c5..b4f87d6244cb 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-ld9040.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-ld9040.c
> @@ -8,6 +8,7 @@
>   * Andrzej Hajda <a.hajda@samsung.com>
>  */
>  
> +#include <linux/backlight.h>
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
> @@ -311,8 +312,40 @@ static int ld9040_parse_dt(struct ld9040 *ctx)
>  	return 0;
>  }
>  
> +static int ld9040_bl_update_status(struct backlight_device *dev)
> +{
> +	struct ld9040 *ctx = dev_get_drvdata(&dev->dev);
There is also the helper bl_get_data() - that do the same.

	Sam
