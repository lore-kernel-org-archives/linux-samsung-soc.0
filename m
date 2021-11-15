Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A34AFC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 15 Nov 2021 13:12:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8121861BF9
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 15 Nov 2021 13:12:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231645AbhKONPY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 15 Nov 2021 08:15:24 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:59650
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231700AbhKONOe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 15 Nov 2021 08:14:34 -0500
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 86F1B3F1BE
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Nov 2021 13:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636981898;
        bh=C4OqJG48hYcqq30Slr+ygcxYtVuy69xtDHhMFgPr9Mk=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=P92G6422RjT8fsbm4FO4lFXfRlMDCQVDb9W/8lL0Btp2YxdU61ovEVM4kohB7vHza
         W9FViNyYhlyCwhh8eHRJJaiduZnApgERjwjo33e6c4XpqR5hvP9kak6Rgdc7V0/pFl
         t8ZX7dSyXFmyBtGCn9+nUe+aXdhXR/7oHtnutYREUlZMIblRZHfmWOt9LZjBoD4Yk3
         kCVi87mn6aHdDm8FJ0+EeYyKIWlxKg0NkjXSaTJcbzEivLvFBAUJeMic63pvv0zC1I
         GA3KVnOi4M6G4YtFQqYApTa42ytL22udJGwecA5RwQn/ZpstMuaY8khXF+Uoz4+VzD
         9cBjmuB1hw+cw==
Received: by mail-lj1-f198.google.com with SMTP id u28-20020a2ea17c000000b0021126b5cca2so3218751ljl.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Nov 2021 05:11:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C4OqJG48hYcqq30Slr+ygcxYtVuy69xtDHhMFgPr9Mk=;
        b=u+RVZRN++ZwRQ+hu/7fXK1cIhwpGSzxJzYQy7zfiNL/0H3HNIG0PVitHP/OoeBi1sf
         BHjVuimiLlOCTp85nLxeK+bbLJ2UFwB3K8/AvaEYYRjhKGFxIOa86pYaNvoURBBvKCME
         5Po0muvQ6MKsXrEkd1J4ROu6Du8kZCaHKB8fIQUYge7EN8YN8bVyQfWtxfjhD1wDGFV6
         8otg3souuhm/Xb83f2ahGwz9TLYl+6d5PKZtRaG39hK1WnxXS/jRZz0nPkBrPj9Qisdu
         Yecb6aiIYbIgLQUkEtCcLf3k8xX8pZCRpsGtHi6jq/Y2gDgxpItcl9erqT2Jc5blxNgj
         TyiA==
X-Gm-Message-State: AOAM533BneCpMjZRFY3g5OaBZatfZAjfh/LqDceUfJ46k1dI8Qb3ZnZA
        6Kn68wC4GpGjqXLOzmReCNPRQhH1jBso40iMA5MTNdEmx4foPqUjshOLdtOHyM4hab8Itafy7Fl
        EMh7/5aukWkbIG9iK6yjykOkboxBbDSf09diqnf0lz4J0HAwv
X-Received: by 2002:a05:651c:a12:: with SMTP id k18mr32632311ljq.251.1636981897678;
        Mon, 15 Nov 2021 05:11:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxgfHv5Ghmc5ZcgMYQVuByaFZZUQ0C+iADPPifEfTYtAaa1iz5+nXIE+GsDCwWWK5IS1/YWHw==
X-Received: by 2002:a05:651c:a12:: with SMTP id k18mr32632286ljq.251.1636981897542;
        Mon, 15 Nov 2021 05:11:37 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id p21sm1411254lfa.289.2021.11.15.05.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 05:11:37 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-kernel@vger.kernel.org
Cc:     kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ARM: s3c: include header for prototype of s3c2410_modify_misccr
Date:   Mon, 15 Nov 2021 14:11:32 +0100
Message-Id: <163698188786.128367.13689737692316629811.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211111091123.50853-1-krzysztof.kozlowski@canonical.com>
References: <20211111091123.50853-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 11 Nov 2021 10:11:23 +0100, Krzysztof Kozlowski wrote:
> Include the header with prototype of s3c2410_modify_misccr to fix W=1
> warning:
> 
>   arch/arm/mach-s3c/gpio-samsung.c:1309:14: warning:
>     no previous prototype for ‘s3c2410_modify_misccr’ [-Wmissing-prototypes]
> 
> 
> [...]

Applied, thanks!

[1/1] ARM: s3c: include header for prototype of s3c2410_modify_misccr
      commit: 90dc0df9168b6c1ddb339481b440d7c13cc4417c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
