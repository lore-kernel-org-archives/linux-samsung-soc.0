Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C1AC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 20 Sep 2021 08:15:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3FE38610CE
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 20 Sep 2021 08:15:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233959AbhITIQf (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 20 Sep 2021 04:16:35 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:51132
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233908AbhITIQf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Sep 2021 04:16:35 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3A10C3F048
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Sep 2021 08:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632125708;
        bh=RbnF5hAV4mmqgOMwbx5PeFWTjk5AbWZGdxLNmlZ/+u0=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=JksSR1ZgccMORnY/fktNqkJzaCTW6uIg1wb4B4tPeAOwrdnWn1Hqwa71bu0W7MgPG
         M9rgxz3ycVEaVOfkVfRTCgJh/H0aWKeEjJybfuTlIURhiM7Jxdjk9iqLb1ONVDGgch
         NhvaUQowRwh+Fct+nXOjg9tx6lCxmcG/IkI3Y0ndJf+Aa+T3B7u6uygAG5+klETTbw
         5qDNeykZVmN4UeeMTSxi8uR1yY6iidOIKlSefZTMwqW9jXIOlXzyQniJKspe0xWomc
         Ylc4BJ2uqRZWvJwmjcc559hqAbWB3yqscdQmlyQp7LqnSh2qVmjNCSZkYdJ67thf2r
         pJGUqPox7Zarw==
Received: by mail-wr1-f72.google.com with SMTP id f7-20020a5d50c7000000b0015e288741a4so5520912wrt.9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Sep 2021 01:15:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RbnF5hAV4mmqgOMwbx5PeFWTjk5AbWZGdxLNmlZ/+u0=;
        b=rwLoUplKizW7xxDaKpVKNcmRrGR2pelQgazKqL9/v3F0oK71QmXHC2Lat56q1fagmt
         ZSjMhQ11q2TAXjBBi8Sty3qnlANi705mIzUQx3hNntdxK4+yz8T1dxQfC3Mfk59taP0U
         Lppr0FqPPugtGF8YoFZoXfmIEDLSzjGf5fNCU9PRzcJqKr1d78AwrmJIBkm/gbVCTM95
         P4qsWa0DBtnys6l3zPdpluinsGe0YhaEafhzWnqCtounfP5cAqQ74fQwCVraJZa5tcx+
         h/hX5pukiY/knciqDgC34PQraO0BJVBFhbZIgdGuzigWH4p/EN0jxkgew7TxCOYOYA8c
         I4fw==
X-Gm-Message-State: AOAM531icpGEJgToecai2f3pe7t3LYkxiX9QrxFwaEiQ8FD/UkU6d0TG
        I8+r5+vUYSojqO8CGHnESylkrPILk+D/98EkNrDIQxlQ0wtmvSPaDW9yww9PkbMQjptlOdoQxQt
        AUsCDUol9i6DmFXaCKxy7BaAyQBjjPA4Yq90FOPgTLIoYcawX
X-Received: by 2002:a5d:4e47:: with SMTP id r7mr27168651wrt.417.1632125707970;
        Mon, 20 Sep 2021 01:15:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyI1Laop0HHhwm29eWDYQDKvcafzMKgfc+Q8LVzR67h+bw1jUc88e3rl9xSTyZK3r5x8IVxrg==
X-Received: by 2002:a5d:4e47:: with SMTP id r7mr27168627wrt.417.1632125707785;
        Mon, 20 Sep 2021 01:15:07 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id b207sm1947652wmb.29.2021.09.20.01.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 01:15:07 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Jason Wang <wangborong@cdjrlc.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux@armlinux.org.uk
Subject: Re: [PATCH] ARM: s3c: Use strscpy to replace strlcpy
Date:   Mon, 20 Sep 2021 10:15:04 +0200
Message-Id: <163212570006.110243.10080683787518372101.b4-ty@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210906134656.101088-1-wangborong@cdjrlc.com>
References: <20210906134656.101088-1-wangborong@cdjrlc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 6 Sep 2021 21:46:56 +0800, Jason Wang wrote:
> The strlcpy should not be used because it doesn't limit the source
> length. As linus says, it's a completely useless function if you
> can't implicitly trust the source string - but that is almost always
> why people think they should use it! All in all the BSD function
> will lead some potential bugs.
> 
> But the strscpy doesn't require reading memory from the src string
> beyond the specified "count" bytes, and since the return value is
> easier to error-check than strlcpy()'s. In addition, the implementation
> is robust to the string changing out from underneath it, unlike the
> current strlcpy() implementation.
> 
> [...]

Applied, thanks!

[1/1] ARM: s3c: Use strscpy to replace strlcpy
      commit: aa519471715ce73034ffaa52fc85681de31c1acf

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
