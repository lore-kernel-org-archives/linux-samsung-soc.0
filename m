Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5270AC001B1
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  5 Jul 2023 09:08:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232391AbjGEJIG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 5 Jul 2023 05:08:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232357AbjGEJIE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Jul 2023 05:08:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E376F1700
        for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Jul 2023 02:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688548036;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=a06dM4DVhOWie+29y5OH6RTZsrC7pthC/bnsJb9dU4k=;
        b=TkctYdfkaG7vg82cKjocujjyNN5f97SGBL0O8qElhImGEztSuHPnXfne6t5x5MRb0EwqZp
        bX+PYReIO2No8v9pat+IOLaqHDow16jV/JVa0mEsQbq7YQIC/4jcGvumAG/r4yGdfqjIMi
        vNcelHt24pWiqCavtCB1LAIZSBf5pZg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-224-RNBh-Q3MNi-8v02E3P-WDw-1; Wed, 05 Jul 2023 05:07:15 -0400
X-MC-Unique: RNBh-Q3MNi-8v02E3P-WDw-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3143ac4a562so1483677f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Jul 2023 02:07:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688548034; x=1691140034;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a06dM4DVhOWie+29y5OH6RTZsrC7pthC/bnsJb9dU4k=;
        b=TKOdYM9BWqsCVuMyQuEo/2fBk20pm2G3I/EIDb+/2fe+jnROddw4iI+bp4jfOOEzyO
         Uy2bJ7/iystl+mAVrg1JV51sQC5kIPhRrjTGKm1bQoK58R9p+jo53qNahpX/va5OAF9Z
         SVP+5/YAoeWsSSXdnz19C7jT+8s0d1SIScDrx7B81fWzrATjv6SBCl9earu3uswz8lKp
         kYO0iuBYJbx/S51URM+R9Y2BVOo33BG4CJvBZE9OA1mkozQ4d9PPaCSfltNWmKsM2a42
         0ntQrD1EcWtf1xKzcPrqFJJXrfwCnn/mk3MrVZqeGD55gqD5BBqmT5RjDZSF23cIyvom
         IzqA==
X-Gm-Message-State: ABy/qLb1v855jVfjg/tjBJHggPklKGxV71QQ6zA+cL2nfkcIWwCJ6M0V
        +Di60Ougv4ozlcSYQrBpefQ8g7SuRdd0eB1GWjcdnSuD3sebp9Z2uNbqBS+rScRXmCi9Q/psUo3
        j8S4Ew818O+rW3MMB+H6HfnFWZrtLubs=
X-Received: by 2002:adf:f3c4:0:b0:313:ebf3:850e with SMTP id g4-20020adff3c4000000b00313ebf3850emr13765071wrp.37.1688548033939;
        Wed, 05 Jul 2023 02:07:13 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHGcT0p8hhCDRF3h+9mFlbkiFbzXDC8/ZzlCbbtfV1aXJy0eKEzcQDMciMIa3WCioCrYV9vdg==
X-Received: by 2002:adf:f3c4:0:b0:313:ebf3:850e with SMTP id g4-20020adff3c4000000b00313ebf3850emr13765052wrp.37.1688548033678;
        Wed, 05 Jul 2023 02:07:13 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id m3-20020adff383000000b0031417b0d338sm16044699wro.87.2023.07.05.02.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 02:07:13 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 09/10] drm/omapdrm: Set fbdev flags
In-Reply-To: <20230704160133.20261-10-tzimmermann@suse.de>
References: <20230704160133.20261-1-tzimmermann@suse.de>
 <20230704160133.20261-10-tzimmermann@suse.de>
Date:   Wed, 05 Jul 2023 11:07:12 +0200
Message-ID: <87ilayrakf.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Set fbdev default flags FBNFO_DEFAULT and mark the framebuffer with

FBINFO_DEFAULT. I noticed that the same typo is in patch 04/10 as well.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

