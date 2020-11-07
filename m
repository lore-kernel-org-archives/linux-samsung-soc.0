Return-Path: <SRS0=3dq4=EN=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBCD3C55178
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  7 Nov 2020 15:07:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B660420719
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  7 Nov 2020 15:07:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UiaG9MkC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727084AbgKGPHc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 7 Nov 2020 10:07:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726301AbgKGPHc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 7 Nov 2020 10:07:32 -0500
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A14BC0613CF
        for <linux-samsung-soc@vger.kernel.org>; Sat,  7 Nov 2020 07:07:31 -0800 (PST)
Received: by mail-io1-xd44.google.com with SMTP id u21so5158917iol.12
        for <linux-samsung-soc@vger.kernel.org>; Sat, 07 Nov 2020 07:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kx47WtaQ7WMa9LVtSdFy9W14nJBrLgdMQNIJm3qYLSc=;
        b=UiaG9MkCCu9LY8D5CjnR2038+tnnSIDjmVdZ1bHC/qG0u8uriWxKmbcr7XuQd3di/l
         D+uxux2qejbKsJ5TxLpRqx0P5iH7sfalNyTop4Kk7t4TKuJpBmDgBskhhc12SD5okBi8
         cvv9zpNP1Km9VPxdNoaXdrXu+0iW9fZC/FdeztqO8Mv/OaYl5FmqpWGTNbvJ4MykUHrJ
         ooEIIawdi0lzLWE9jPOqqAsJ9RWdiiOClKBWqXzKYpXHnvqM7Urr+s8Afeb/ytUg7ifH
         LNGJ10+m6Trcjl4Vrm4ncXu/e52URQIOPb5EwNIkbE/BGsx4gd6unjeh7kbG8iW5AcVh
         tdHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kx47WtaQ7WMa9LVtSdFy9W14nJBrLgdMQNIJm3qYLSc=;
        b=cNKyX4CWXDeLIi70PGJtMT6CLFi1IGxfQFugycKXqYDrpS7isVCzNC2FK7MtW0P56i
         Nlak/JwCB5XJbLPD6B+GqrCbTbsvSirn8TnXndmtstwlNZNVdbWTxedeVV7GKm3GYBDk
         kFSeeZGH0tn5edr3Nbco5MxjGFlcSI+x3FmXCIrkK27LyAGkvtNPYXHXM9u7hs7JyazJ
         89dJIeiU5NFQ/lUIdpF4MbKQGuFp7dHHJkYq+S8wTqWEH25RtIaJ7elateWAGlyWOLaG
         mHGiVWVS62glufex3He4o7A4Tfswh+8RX8cqhw2gqfg8lIu+hsX7PNQSidNaDDby8mt8
         YDBw==
X-Gm-Message-State: AOAM530Oz4rZxhRLnbNGQgnXd2rDhA6WJAYXffNsKahvdJ9fMVaCHR8f
        rK6Np/tzCfZ9GpyrfrAgFFlT8CGAoa8SaCFxACs=
X-Google-Smtp-Source: ABdhPJxcVFJfnIwNIdKPVZY+opxPhNqa/evtovhSadn6b7zDc0zmiXU7HJLpIvaAZCXbeDlFo7UteerVH719gLk2tQE=
X-Received: by 2002:a6b:d00c:: with SMTP id x12mr5039748ioa.10.1604761650411;
 Sat, 07 Nov 2020 07:07:30 -0800 (PST)
MIME-Version: 1.0
References: <20200911135413.3654800-1-m.tretter@pengutronix.de> <20200911135413.3654800-2-m.tretter@pengutronix.de>
In-Reply-To: <20200911135413.3654800-2-m.tretter@pengutronix.de>
From:   Adam Ford <aford173@gmail.com>
Date:   Sat, 7 Nov 2020 09:07:19 -0600
Message-ID: <CAHCN7xKAHm0cvh+7rb1wxF+UqE2Fs48nYF7=rWm7E9ipy2Jtmw@mail.gmail.com>
Subject: Re: [PATCH v2 01/16] drm/encoder: remove obsolete documentation of bridge
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        sw0312.kim@samsung.com, Krzysztof Kozlowski <krzk@kernel.org>,
        a.hajda@samsung.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        sylvester.nawrocki@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Sep 11, 2020 at 8:54 AM Michael Tretter
<m.tretter@pengutronix.de> wrote:
>
> In commit 05193dc38197 ("drm/bridge: Make the bridge chain a
> double-linked list") the bridge has been removed and replaced by a
> private field. Remove the leftover documentation of the removed field.
>
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

What is the status of this series?  I know of at least one other patch
series depending on this.

adam

> ---
> v2: none
> ---
>  include/drm/drm_encoder.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
> index a60f5f1555ac..5dfa5f7a80a7 100644
> --- a/include/drm/drm_encoder.h
> +++ b/include/drm/drm_encoder.h
> @@ -89,7 +89,6 @@ struct drm_encoder_funcs {
>   * @head: list management
>   * @base: base KMS object
>   * @name: human readable name, can be overwritten by the driver
> - * @bridge: bridge associated to the encoder
>   * @funcs: control functions
>   * @helper_private: mid-layer private data
>   *
> --
> 2.20.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
