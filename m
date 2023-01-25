Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF50C27C76
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 25 Jan 2023 09:55:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235137AbjAYJzS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 25 Jan 2023 04:55:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232306AbjAYJzQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Jan 2023 04:55:16 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0950A30E8
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2023 01:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674640468;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TouYpeVIY3sVaURhe3OBQ2as0Nh1mIpj/44gYLj7/xc=;
        b=drh/E+7mDMGR49LUHRQH72giJXmyEJfT7HphMML1jyITbr0g5bocRge7O7EIjQxf8i/g+k
        ZbRoyA/AP6Ol9OrA9a7Pb5eUodiS44NHOrIquEVZYHcBzlQ/oF7fVU0ylfW/sfd0W8IqOU
        AwwSFVp6sDMTIW0zdUmOYtxP2Ed/0G8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-590--auGspzNMYyNU9Il7RiJFg-1; Wed, 25 Jan 2023 04:54:27 -0500
X-MC-Unique: -auGspzNMYyNU9Il7RiJFg-1
Received: by mail-wm1-f71.google.com with SMTP id c66-20020a1c3545000000b003d355c13229so846454wma.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2023 01:54:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TouYpeVIY3sVaURhe3OBQ2as0Nh1mIpj/44gYLj7/xc=;
        b=4ZTxEe8SDikVjEb6zGmgSiig2BukgrxUbHBeyB0k3g3z1hq7sx3486aoPEXTh1sciA
         /5eEd5KHdjP59LPH/Jq2mSX1++lKaETn7rs1wHLUbjmD+JeAYghipKd4Slbd7KsJwOuY
         kjTeyWFsc3YUYggGmGavcf5Wlivk1CfwLHeQHfkPFa1ePw6grUCXmuB5XU05Wb44jvT6
         aDBwg5IxPyBc80eqRGwpc4F4Ts/6aXnMz0oLvk/z3VjIGXc30Ya/C9oh3MQ+Z1rCgHpS
         TXEYZnIUADqN2ZL9kWsrHzm5hm8zaebds1zlqS3NUlEp/zUG5GENAL3WbjO81YnGLOYq
         Pg4Q==
X-Gm-Message-State: AFqh2krdUZnkffvN2qQoxC2X//oVXd+BID8o+ivgiIg/j8hZuprDdFjd
        pFbROMwRk60ZSSLkDRBhy1yRx3JKjw7U5OElSw7S34DdWdZDtofp+UL7PpdWRrpJqiXYXmMnz9v
        24NH+IxR9ADYu1s7opgzqXbxsg0YiyaE=
X-Received: by 2002:a5d:6944:0:b0:2bf:960b:7282 with SMTP id r4-20020a5d6944000000b002bf960b7282mr15280446wrw.44.1674640465870;
        Wed, 25 Jan 2023 01:54:25 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs0qhPZq4DvvRBWKlYakMR9y6Uj+/MSQrsj/7lcQHcP5rYP7V12fMSxLIHPoxhHoCWiXuL3sg==
X-Received: by 2002:a5d:6944:0:b0:2bf:960b:7282 with SMTP id r4-20020a5d6944000000b002bf960b7282mr15280426wrw.44.1674640465680;
        Wed, 25 Jan 2023 01:54:25 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id t9-20020adff049000000b002bddaea7a0bsm3982230wro.57.2023.01.25.01.54.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 01:54:24 -0800 (PST)
Message-ID: <f1441822-c85d-4a2e-7e0c-98c3a6de31ac@redhat.com>
Date:   Wed, 25 Jan 2023 10:54:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 10/10] drm/fbdev-generic: Rename struct fb_info 'fbi'
 to 'info'
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
 <20230124134010.30263-11-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230124134010.30263-11-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 1/24/23 14:40, Thomas Zimmermann wrote:
> The generic fbdev emulation names variables of type struct fb_info
> both 'fbi' and 'info'. The latter seems to be more common in fbdev
> code, so name fbi accordingly.
> 
> Also replace the duplicate variable in drm_fbdev_fb_destroy().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

