Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC05C5519F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 16 Nov 2020 16:18:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 034C422314
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 16 Nov 2020 16:18:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730948AbgKPQS0 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 16 Nov 2020 11:18:26 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36569 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730807AbgKPQSZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 16 Nov 2020 11:18:25 -0500
Received: by mail-wm1-f68.google.com with SMTP id a65so24146367wme.1;
        Mon, 16 Nov 2020 08:18:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=PbgwAmW6Lz3dqeU5xSor1wsOYK6dIOHqYRMNAiFO25s=;
        b=YPK1n8R+SjgkplALEqI7bgQXPJSJZIJzGgItE5marp/gSpRZekZqgTFi07f3ZZhJ/C
         b/C6N2spYefCtyejLVA3D5g9h7Jmc637El9+i+ln0rHD7SWCuVI0cwGC4ks0VhX1J6qM
         LxFU27pO8QhrKJTelYzzOSoQipLoxlpk0DS4vWoMGvMflSuYqm4RKrt0ICY/Mi0wbVCV
         j2v8CWJhlThaAeyt+A1EDVV4HXnK76RcfieygU7d/a2rJTD6+wC2ZjqDMLJHsu4cKkI0
         WVDN0QcEnqr32U2VCINC43VGd981wP0PcU3NlIz4heVhI1TCHnFjIXqypcYNFRGuTZOI
         LeIA==
X-Gm-Message-State: AOAM530s0Oh0eLjoY0wqU9ZAVI4kiV8GtCEICqJ9xPPIqDDBjoDkm1Bx
        pO/K8EGPlLKYNuHTtwSqtNM=
X-Google-Smtp-Source: ABdhPJzJBNm+T25RTJHrN+VjsBcA2jYXeWFB0ei08ow3bzg6qrZwugxaxhE2yeqxElyupCt2rJXOBQ==
X-Received: by 2002:a05:600c:2cb4:: with SMTP id h20mr16272190wmc.119.1605543501974;
        Mon, 16 Nov 2020 08:18:21 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id i11sm24221025wro.85.2020.11.16.08.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 08:18:20 -0800 (PST)
Date:   Mon, 16 Nov 2020 17:18:19 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Martin =?utf-8?Q?J=C3=BCcker?= <martin.juecker@gmail.com>
Cc:     linux-samsung-soc@vger.kernel.org, kgene@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/5] ARM: dts: add Samsung's exynos4412-based p4note
 boards
Message-ID: <20201116161819.GD25108@kozik-lap>
References: <20201113212525.13455-1-martin.juecker@gmail.com>
 <20201113212525.13455-3-martin.juecker@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20201113212525.13455-3-martin.juecker@gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Nov 13, 2020 at 10:25:23PM +0100, Martin Jücker wrote:
> The p4note family contains a couple of variants of the Galaxy Note 10.1
> tablet with mainly different modems. The GT-N8010/GT-N8013 is the wifi
> only version.
> 
> Signed-off-by: Martin Jücker <martin.juecker@gmail.com>
> ---
>  arch/arm/boot/dts/Makefile                    |    1 +
>  arch/arm/boot/dts/exynos4412-p4note-n8010.dts |   17 +
>  arch/arm/boot/dts/exynos4412-p4note.dtsi      | 1132 +++++++++++++++++
>  3 files changed, 1150 insertions(+)
>  create mode 100644 arch/arm/boot/dts/exynos4412-p4note-n8010.dts
>  create mode 100644 arch/arm/boot/dts/exynos4412-p4note.dtsi

Thanks, applied.

Best regards,
Krzysztof

