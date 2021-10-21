Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A7B0C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 15:35:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E7D9611C7
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 15:35:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231256AbhJUPhY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 21 Oct 2021 11:37:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230020AbhJUPhX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 21 Oct 2021 11:37:23 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4A10C061764
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Oct 2021 08:35:07 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id o4-20020a17090a3d4400b001a1c8344c3fso1301404pjf.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Oct 2021 08:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=Iu7p8YJ09LKB7UxcfJBHKOYGTkw5Ln5vg4U6RHWQs3U=;
        b=N9mW0nfr9JesgpEOnQB8FV3Ivh/q2sth6ZHaD9wGtcKtpqmRzhrhCwn7iEgIOrylIj
         5EsJ+Tbqw+974E+HSwBeLr8wxqRMPf2BY/AZXguF0g/exRJO3b3jfPOjeiPDWnd2cPHZ
         wYz9RCkTOzpoP8WSjGQmAvWrwzRIR491+RImtx1tTk/HbvYu1IB6eeVgc1r09tp38jHl
         NJvrJXNj1Jf/fBGJMGLk6PkRZJOQnZuxJqwgoJlJgc7KUA/NDVi+L+3qln1TkraNLxci
         pREi1Q5DMXnsETVqNeGCoHrn4Guw74IPjlOLJlwZJa9DDVEy70km3BqcgUrJWL4Y6SjD
         MwOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=Iu7p8YJ09LKB7UxcfJBHKOYGTkw5Ln5vg4U6RHWQs3U=;
        b=nnU7MKBublpGQMHLckSK5IlzSAfH1nV39F1yQD4mzcOn/E5ElnV1OnRyof51e5o+hX
         Nf+0a1Txy65SyDOs70net17Hqawasutyi2vKDYZY0RDjfW7ARzOKCpjTPPDOV1FuJDXU
         CVxQOGzVovb7fxzZuqHKuRRGoqR+W3BhNaGBiqGKoQtYcPuksXdhQEDIkeO39SxH2/O6
         DWbzygjpa7X31co9YTvQMbT1vs9oH13GDOqzzPOvy5XLfrm7sbLxFdR9GcG+aZHBtyW6
         wPSMOWPTcgtHVdX7Qfz9Dh1EVq3KcOX3OXYFiL0rJp/R8eRUurzvyhyLmydh6Bx3Brey
         kBTw==
X-Gm-Message-State: AOAM532kV30oZdZqRmO5vlZF0XjFlEQO6v/g7SToK9LDKHA86ldy0oSI
        bRd13wKcoVPePzMOBd/makqI9g==
X-Google-Smtp-Source: ABdhPJwDNaVwUCWUwB0He/hM/H9zr+hEw5kR1fOwUoC0BICsXfUjekend5YgMkCbXWfoNE1KdQA/BQ==
X-Received: by 2002:a17:90b:185:: with SMTP id t5mr1034947pjs.54.1634830507081;
        Thu, 21 Oct 2021 08:35:07 -0700 (PDT)
Received: from localhost ([2620:0:1000:5e10:459d:a8c7:78e4:f487])
        by smtp.gmail.com with ESMTPSA id m10sm9996832pjs.21.2021.10.21.08.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 08:35:05 -0700 (PDT)
Date:   Thu, 21 Oct 2021 08:35:05 -0700 (PDT)
X-Google-Original-Date: Thu, 21 Oct 2021 08:35:02 PDT (-0700)
Subject:     Re: [GIT PULL] riscv: dts: few cleanups for v5.16
In-Reply-To: <CAK8P3a0dnRE4Sr-En-hPYbRAWAYgYZ7FBtC2h39RXggy=tA_HQ@mail.gmail.com>
List-Id: <soc.lore.kernel.org>
CC:     krzysztof.kozlowski@canonical.com, Conor.Dooley@microchip.com,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        arm@kernel.org, soc@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        krzk@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org
From:   Palmer Dabbelt <palmerdabbelt@google.com>
To:     Arnd Bergmann <arnd@arndb.de>
Message-ID: <mhng-0efa2067-b731-4121-9725-e40954222d89@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 21 Oct 2021 08:18:16 PDT (-0700), Arnd Bergmann wrote:
> On Thu, Oct 21, 2021 at 5:06 PM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>> On Thu, 21 Oct 2021 06:09:50 PDT (-0700), krzysztof.kozlowski@canonical.com wrote:
>> >
>> > There is only one Microchip patch here (plic/clint). Others are for
>> > SiFive. All the patches are described in the pull reqeust:
>> > https://lore.kernel.org/lkml/20211021090955.115005-1-krzysztof.kozlowski@canonical.com/
>> >
>> > I had also second set of RISC-V patches for Microchip. These were picked
>> > up by Palmer:
>> > https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/log/?h=for-next
>>
>> Sorry I missed this.  If you guys took this through the SOC tree that's
>> fine, otherwise LMK and I'll put it in the RISC-V tree.
>
> I haven't merged it yet, please add it to your tree then.

OK, it's in.  Sorry for missing this, IRC is always a good bet for these 
sorts of things as my inbox can get pretty hosed.
