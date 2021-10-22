Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E57B1C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 22 Oct 2021 08:55:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C9F5760EB8
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 22 Oct 2021 08:55:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232271AbhJVI6D (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 22 Oct 2021 04:58:03 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:57886
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231550AbhJVI6C (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 22 Oct 2021 04:58:02 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 312E23FFF3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Oct 2021 08:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634892944;
        bh=Ti/kWwWZCiPv4gL/LdQf6/gYsg4XXLTy9z9bRwDkCkI=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=Ud51/VuF9FIiD5QY85htXxUaQGKCM3qfBudQ67SsLhtcSyM4xF867DGSnaGwX4JdX
         1qn3VB+duEjAZiaavuL7luAcJa5rI3VQrv63Rphg5H7zoGENPqxe7l/hmcZjrqBNP2
         L+evpbUrA5sewuezcfylXtTO9/3dFCCPv936Bkcus9TpTtD/U6Zwgtkc89xHWCreAt
         N0ew9QtA4OlgVFR1ayxNIRzPk2r58FMA/VdLFlwEVnpI9p9CAE7/fCK2fSGx6yBBiM
         drVY+mygWbSAxbwB35xw5izW/JB8BBtaJyWyWNF8WyM0VBG+jZwj/r/CrPdMEcU4Yt
         WJQdFjFAYyGLA==
Received: by mail-lf1-f69.google.com with SMTP id k18-20020a05651210d200b003fd86616d39so1453705lfg.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Oct 2021 01:55:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ti/kWwWZCiPv4gL/LdQf6/gYsg4XXLTy9z9bRwDkCkI=;
        b=Uek+Gb0xtN1NGpO95omXtPQGwYS8buVy6MQ6lm4iPZZv9hJV3JkhiSnsa7whbd8x1U
         ZmCCimPoHlYHK6oMvv+E+egXYZTIXumxtHMZRzcJYQCo4PLpCM5c4cyborVjEP+EoMtb
         jpBG+IF02vXEpiPXLGKhRbZvXwBfwLw/IfDHskcn0HQ8/U5ujJzRQ9nulR2NJyGiyAFe
         /X+/lGTK7MnDaQZNYlvBvpgRWQoQJcp7COzChrf/oWBRszOS9e8Ilk8pbxvHSDi7B4Gl
         ULSl+XGqCdwajzpG/P6RXphTte1/5FLA2ftFYUhy4836N3Wxr27DfX/IZDZV6VQtvJDn
         +xRw==
X-Gm-Message-State: AOAM530dn6BNDO8eGzdF5LtDuKtNiUFHGdz8hJpnmZ1MoTwSEgRdUEQ1
        w9mlkYYpnP+DcwOTPO1E6jHLT/AwV1FYhjidt0iDG9TMDDrXHSPZbbMa7foB4AgJJSFkP/G++ow
        0OjkDxaWuh5a9+47SP5Dby5qp/0dmBmClCVo1ec3NXqYwUU6w
X-Received: by 2002:a19:fc01:: with SMTP id a1mr10557862lfi.214.1634892943600;
        Fri, 22 Oct 2021 01:55:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJym9KlsLquE+h9zu7V/QcUc3Crv0sHVj601Gyg6l+LuiW0HZGNuwzkArQkA5Em8fi4+NvG4SA==
X-Received: by 2002:a19:fc01:: with SMTP id a1mr10557848lfi.214.1634892943456;
        Fri, 22 Oct 2021 01:55:43 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id x4sm674150lfq.246.2021.10.22.01.55.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Oct 2021 01:55:43 -0700 (PDT)
Subject: Re: [GIT PULL] riscv: dts: few cleanups for v5.16
To:     Palmer Dabbelt <palmerdabbelt@google.com>,
        Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc:     Conor.Dooley@microchip.com, Olof Johansson <olof@lixom.net>,
        arm@kernel.org, soc@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        krzk@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org
References: <mhng-0efa2067-b731-4121-9725-e40954222d89@palmerdabbelt-glaptop>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <accf35b6-2c13-227b-c101-a36cdcd5e73d@canonical.com>
Date:   Fri, 22 Oct 2021 10:55:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <mhng-0efa2067-b731-4121-9725-e40954222d89@palmerdabbelt-glaptop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 21/10/2021 17:35, Palmer Dabbelt wrote:
> On Thu, 21 Oct 2021 08:18:16 PDT (-0700), Arnd Bergmann wrote:
>> On Thu, Oct 21, 2021 at 5:06 PM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>>> On Thu, 21 Oct 2021 06:09:50 PDT (-0700), krzysztof.kozlowski@canonical.com wrote:
>>>>
>>>> There is only one Microchip patch here (plic/clint). Others are for
>>>> SiFive. All the patches are described in the pull reqeust:
>>>> https://lore.kernel.org/lkml/20211021090955.115005-1-krzysztof.kozlowski@canonical.com/
>>>>
>>>> I had also second set of RISC-V patches for Microchip. These were picked
>>>> up by Palmer:
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/log/?h=for-next
>>>
>>> Sorry I missed this.  If you guys took this through the SOC tree that's
>>> fine, otherwise LMK and I'll put it in the RISC-V tree.
>>
>> I haven't merged it yet, please add it to your tree then.
> 
> OK, it's in.  Sorry for missing this, IRC is always a good bet for these 
> sorts of things as my inbox can get pretty hosed.

Great, thanks!

Best regards,
Krzysztof
