Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96AEAFA3744
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 31 Oct 2022 12:14:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231247AbiJaMOl (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 31 Oct 2022 08:14:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231179AbiJaMOk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 31 Oct 2022 08:14:40 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1312B6444
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Oct 2022 05:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667218423;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2H8Fq04+XbNugdc6Ty/YSDXQIs5WWNt9cW9u1MIkjOA=;
        b=LyZfO8oK7WZg4YiS9L3p0sPvSDxJCNdr2Me/YfWcIWtG3BRFZltcOhxxLIrtskFui509hE
        xsInseEH2yFmN84gB9WUs/gQuBrkKynCG9+fUX6R3pQXdXRJ3+3lDQY7Th6RTNKRybZc4i
        Jd+OU8QSZF05D6AMylsox0LmSDOrFXE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-640-6oIwrwMaPWeFRcmr9l2E4g-1; Mon, 31 Oct 2022 08:13:42 -0400
X-MC-Unique: 6oIwrwMaPWeFRcmr9l2E4g-1
Received: by mail-wr1-f72.google.com with SMTP id h26-20020adfaa9a000000b002364ad63bbcso3006213wrc.10
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Oct 2022 05:13:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2H8Fq04+XbNugdc6Ty/YSDXQIs5WWNt9cW9u1MIkjOA=;
        b=chGzyxMyn4SSk/1ujlzUTJ9A9jZwMwoiQ8fGSpr8V3WuvRO9ybw+7kNCPgbuEjANTX
         26lSqh9kN28oGqiWwSZw/T34L7mZwSMXcoEw9+TVJzhIqp6YK35zwrX2jLilOHDSqPk2
         IoJM0JIlsGK+tuT8UmG/xPKbHYZU+cX4xmxoEMwN/5EgXMQ3MQyaaLG2Hgy7iklYzB+C
         BNMmjVP0e21SFP5oqU6nwGmkvcWnNWnfJdC/TsJFg4qFV54lbiH1RmC6ugvdwqM42A/M
         OxIyWkWIhIcRm6CdhZ5b12IdN6hvL9hl2K3dLVVl3c7Sefmo1DHAioQjohnBcHXsAySs
         F9+g==
X-Gm-Message-State: ACrzQf0P8/ZJvfBjQEQcW6l3gSRlh1+EYS8/hx46++S8ueW2sahpF+Un
        6ndtZiE7p3Kh43989mtSp/cUFRlsNTW7q6Y6lmlciTHGUbGwcwtqKxXEE1CmGGKKUKLSJWbq9f4
        pZijAaEIg6kW39mbZx4KTmYjrnk/P2eY=
X-Received: by 2002:a5d:64cd:0:b0:236:6d1c:c1a2 with SMTP id f13-20020a5d64cd000000b002366d1cc1a2mr8196682wri.360.1667218420926;
        Mon, 31 Oct 2022 05:13:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6+QX10ZDmjvc1IfL0XXmvBimtEQHEjFBrrHb50hNQes1zzurNnpW//og1SN1o9c/o5tX548g==
X-Received: by 2002:a5d:64cd:0:b0:236:6d1c:c1a2 with SMTP id f13-20020a5d64cd000000b002366d1cc1a2mr8196664wri.360.1667218420692;
        Mon, 31 Oct 2022 05:13:40 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id az29-20020a05600c601d00b003cdf141f363sm7207444wmb.11.2022.10.31.05.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 05:13:40 -0700 (PDT)
Message-ID: <231be619-96b7-b725-0735-0275e07477d8@redhat.com>
Date:   Mon, 31 Oct 2022 13:13:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 04/21] drm/amdgpu: Don't set struct
 drm_driver.output_poll_changed
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
        maarten.lankhorst@linux.intel.com
Cc:     dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org,
        etnaviv@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        spice-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        xen-devel@lists.xenproject.org
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-5-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-5-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Don't set struct drm_driver.output_poll_changed. It's used to restore
> the fbdev console. But as amdgpu uses generic fbdev emulation, the
> console is being restored by the DRM client helpers already. See the
> functions drm_kms_helper_hotplug_event() and
> drm_kms_helper_connector_hotplug_event() in drm_probe_helper.c.
> 
> v2:
> 	* fix commit description (Christian)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

