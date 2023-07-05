Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F58BC0015E
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  5 Jul 2023 09:08:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232164AbjGEJIp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 5 Jul 2023 05:08:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232201AbjGEJIm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Jul 2023 05:08:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE21B1716
        for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Jul 2023 02:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688548074;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=qr/C5LtRvrDZoQId+bjsOh/ZaHhOujfRlisJ/yVhSwY=;
        b=MwRfSKWep3KZ8KpZjH0t8xAopYqOUFETrPoNg0ett2QTXsNLKd74WHBRpuFeyXau8ua5Rb
        FrKnh6tLxqubm+n0jJj255qJcfGjk7Y66qBzCb+Oe8womJPGY4NOSQPX5QTiFjfEjw0h2k
        9ZGBvLoHexlaYQt8V2ee/FyZp8gdtF4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-495-EFf24bp5NJKGi4PyXKwUVQ-1; Wed, 05 Jul 2023 05:07:50 -0400
X-MC-Unique: EFf24bp5NJKGi4PyXKwUVQ-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-31444df0fafso401427f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Jul 2023 02:07:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688548069; x=1691140069;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qr/C5LtRvrDZoQId+bjsOh/ZaHhOujfRlisJ/yVhSwY=;
        b=XieUIH8/XzTmA0GAGsZ9vKen7JbxbJsOGlPM9Bk3a055gZ780m2cJJLvnOH+fOB/Vo
         5VosjJj5/otXkMv6lmuEViAWhWMNOzqYU11QnEXJoKIc8yyYKW347NsTgu0IMWN/0+7+
         TGFP7iIvzIOMM9I2J7Kg+uVPZlSUPd8/wQXj0SN0G8nDyLrKldD5TkTxF7lBwGgSvOPN
         EZfAnylnTeIfQCT7IX4tlFh+oWHzLWIznOtA4kaYLG76+tlfCMXbU5OsqlLqAwdREbZf
         xs0gevwwW1AsrugYP92MLjeZpt2l5E2eVwQuVcYmpPizPqIRnVegULKtFz/O16cspV5z
         oOEw==
X-Gm-Message-State: ABy/qLanyNEnq33PUODCOYeB57zGs2sSSAKc5pEL9C04Kf7hFhM8Su+S
        OzY0YK5Y4lO9zGhYjwYPiJ3EJU9kaw6kLq7VlxM/i45A/CnEyt/pn9DsZMbIom6OGCx84vP7mHU
        Gv/Xdk6JxDUGMVQNBaoNJugH9b6Z5M1A=
X-Received: by 2002:adf:f504:0:b0:30f:d12a:d0b5 with SMTP id q4-20020adff504000000b0030fd12ad0b5mr13084512wro.55.1688548069027;
        Wed, 05 Jul 2023 02:07:49 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHf2mlJzkynZeRnACKLZDj8dpbPaRQo1oHTkYMNq2t7OkGieb7M7VOESlbgxnGoXEMWu20AzQ==
X-Received: by 2002:adf:f504:0:b0:30f:d12a:d0b5 with SMTP id q4-20020adff504000000b0030fd12ad0b5mr13084501wro.55.1688548068811;
        Wed, 05 Jul 2023 02:07:48 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id n5-20020adfe345000000b0030e5bd253aasm30417562wrj.39.2023.07.05.02.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 02:07:48 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 10/10] fbdev: Remove FB_DEFAULT_SYS_OPS
In-Reply-To: <20230704160133.20261-11-tzimmermann@suse.de>
References: <20230704160133.20261-1-tzimmermann@suse.de>
 <20230704160133.20261-11-tzimmermann@suse.de>
Date:   Wed, 05 Jul 2023 11:07:47 +0200
Message-ID: <87fs62rajg.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Remove the initializer macro FB_DEFAULT_SYS_OPS and its helper macro
> __FB_DEFAULT_SYS_OPS_MMAP. There are no users.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Helge Deller <deller@gmx.de> (maintainer:FRAMEBUFFER LAYER)
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

