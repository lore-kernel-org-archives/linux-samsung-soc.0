Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1538C54E94
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 25 Jan 2023 09:45:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235130AbjAYJpv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 25 Jan 2023 04:45:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234999AbjAYJpu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Jan 2023 04:45:50 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 643D62728
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2023 01:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674639863;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tz7iyPImvcUWB9Dn0OtZ/fnzXULpckXnCuNXHm7FVL4=;
        b=JVRoi+i7G4m9cWCbYRfo/0ASO62Wli7ClHFpO4pSXsMoLQtGHnyNGN0AgRSEsZvu/Felh5
        G9KlilfqGMhl1Jyx1sTuv1aLLCa5KkIWrUBLTIACJA02XUWrTlwkY6VLGYZj/xP7KbFYOP
        8UEtgeg8OHiaAOSzc0YI+HrCol0nY5Q=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-672-iONlU9YkOVard5I7F6b6qA-1; Wed, 25 Jan 2023 04:44:22 -0500
X-MC-Unique: iONlU9YkOVard5I7F6b6qA-1
Received: by mail-wr1-f71.google.com with SMTP id y18-20020adffa52000000b002bfbd64ae48so145709wrr.15
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2023 01:44:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tz7iyPImvcUWB9Dn0OtZ/fnzXULpckXnCuNXHm7FVL4=;
        b=N5YEYHm5pyw0XlgPPZFFLftvlJlZZWAUOlJwtU2FgTK2KQSKUbfWDAuWeXR2OwpqlN
         daZjkqsczZHvrEuxFA+khdkZpxVBWJtnM9vouRJ1h1t76mdWA2tp74hqzDpaTnSTIP5J
         GPEPUemW4U+LOJOqMwfHZOkyTvftbkq/vVQ76+b8HjECFmyFwxMkgaG0/UuYOjdPL3AM
         l8Ab100BdhDvZrwKxwJbrzVf/iYbPFwgOAVwNWhEHmAPOx6if6/tAbZWUfM5qi9WqHV6
         nfYhCbkDvaiGEkdTJeVEMKa+KM1uRSzHwJSFYCCx8XX1U4b89xl8fgaYJ0DiNl1KkjYr
         cV2w==
X-Gm-Message-State: AFqh2koXIZMmw5e20KQrTMg/JRP/Ll5y/P/yU/HBkE+/Y1gkNWIW/l9C
        4D10PuK7sqjtRCkeTmfuhtIUe5KpZ3yuG8oxTcxBDsjACf9rMHxc6V5hxWfgEJE/zcvAk7XaV82
        TF3O3QxVbYpk5E7E2xG8jC/SJA91eFMY=
X-Received: by 2002:a1c:4b19:0:b0:3da:fb5c:8754 with SMTP id y25-20020a1c4b19000000b003dafb5c8754mr28002616wma.2.1674639860818;
        Wed, 25 Jan 2023 01:44:20 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs/ZWxYog8h3iR/G4m+bOHxbXPWtvCX/ZVFIUBahKB+Crw5vqS3Y5d/LkCiQwFYvGuCaEiL4A==
X-Received: by 2002:a1c:4b19:0:b0:3da:fb5c:8754 with SMTP id y25-20020a1c4b19000000b003dafb5c8754mr28002601wma.2.1674639860545;
        Wed, 25 Jan 2023 01:44:20 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id h9-20020a05600c314900b003c6f8d30e40sm1345518wmo.31.2023.01.25.01.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 01:44:20 -0800 (PST)
Message-ID: <13f04dbd-07f2-f01a-7d67-75a554374ddf@redhat.com>
Date:   Wed, 25 Jan 2023 10:44:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 07/10] drm/fbdev-generic: Minimize hotplug error
 handling
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>, airlied@gmail.com,
        daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20230124134010.30263-1-tzimmermann@suse.de>
 <20230124134010.30263-8-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230124134010.30263-8-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 1/24/23 14:40, Thomas Zimmermann wrote:
> Call drm_fb_helper_init() in the generic-fbdev hotplug helper

drm_fb_helper_fini()

> to revert the effects of drm_fb_helper_init(). No full cleanup
> is required.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

