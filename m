Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6899C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 17 Jan 2022 07:45:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237631AbiAQHpi (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 17 Jan 2022 02:45:38 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:32906
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233264AbiAQHpi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 17 Jan 2022 02:45:38 -0500
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EB1413F1E1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jan 2022 07:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642405536;
        bh=BnlFRfnEyWAxe1fw6gmGyUXzbXb/Exxy2EiruYyTAbQ=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=UhrII8P1PQrDHaCJc3IQT47uBIirl6otb02sK/HujWRJ0ONalPXRkFCQH+xcWBsGj
         /33xJoYHiotz84PLkwbsXdIFuqWs61NZcdGLR8tT1A59VjDfIbgMbK0Stco2o83uGQ
         aV5YN8jQLpxZy9EZltz+NjojhByE3fpBUA0QzdAlyXcKxjT/1luvHBN7XnYOmianKO
         5y00D6TUbnx2+swa3m9tv8mV0YpYeh6CxLQIkV2y3x2bNF3NzzC+wWUAuMmDFmgFw/
         wtqo2mtnkFqG4YPL6StDuZR7hZjh/4t/NeVi5RKUNkXc3k++uxMfJrwkFh9vH6Hg2f
         js9dhRMd8WxrA==
Received: by mail-ed1-f71.google.com with SMTP id a8-20020a056402168800b004022fcdeb25so2685737edv.21
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Jan 2022 23:45:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BnlFRfnEyWAxe1fw6gmGyUXzbXb/Exxy2EiruYyTAbQ=;
        b=4a8UEt2XZXunkNoMJIjGOLASB/TP1SuUrh+AyJXHhIEzjcwUPGimVvTbP8kv/HE0mO
         t6sOnfRDm7+eNA8h8YlPRaBqY6M56kZRRo66TMZOEor29n9cHxElVpTGPnB+Yo84TOaj
         DH5F9hKY8z3AkXYMi1YvmdYAozk5NTbo8Pi4o0fZXls80PIKEJVCTAkdw/MfX4bpX53T
         HAv3Q5kKeRS2VmkqetWOf4i5zhs37pfBbAQrY4lUOLgj68/xlMjphTKsQzjkqdNwGtNd
         yVitFq7GhbR7/TMmtvgRDBVxCeO4oj76FmSyc2XxgYLx03ZXFqk9f6DTG8ONrXW9FaXw
         ATRg==
X-Gm-Message-State: AOAM530TQbwTpPJ6SfaAJrvf3HLn8m5fdd8ygaeQBZ0RuT5EGMB6mnIO
        sCTTnDSnhge9PPqReWNshuzfW8QI+Yo6TLhxaU5p5Gv8MS8E90oLcvAUqjRa5LUDM/B5QSkHor5
        bZ7ov6RIA8yVyfPbKWluXHi8Am45UH9ru2Zz87nqCrcGibHL1
X-Received: by 2002:a05:6402:50d3:: with SMTP id h19mr5266024edb.346.1642405536676;
        Sun, 16 Jan 2022 23:45:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzMuqDcqMplgNTykVRmag/eEAnjZ76C8iPXMJNJiJNejm5c5xQel4/ESmkmvuy3yxY7PGuFQA==
X-Received: by 2002:a05:6402:50d3:: with SMTP id h19mr5266017edb.346.1642405536552;
        Sun, 16 Jan 2022 23:45:36 -0800 (PST)
Received: from [192.168.0.35] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id hp14sm4151387ejc.97.2022.01.16.23.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jan 2022 23:45:36 -0800 (PST)
Message-ID: <77bd8fa4-2b35-352c-da07-ef91fcbed454@canonical.com>
Date:   Mon, 17 Jan 2022 08:45:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 24/28] dt-bindings: pinctrl: samsung: convert to
 dtschema
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>,
        Alim Akhtar <alim.akhtar@gmail.com>,
        Rob Herring <robh@kernel.org>
References: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com>
 <20220111201722.327219-18-krzysztof.kozlowski@canonical.com>
 <CACRpkdYTXSOW+sOX3wVtF4jj6xm0jr-F3HKQPGHOdAVjbasP3A@mail.gmail.com>
 <5047da7c-d3a6-5472-b0ca-7ed3dbe8a5fe@canonical.com>
 <CACRpkdbhmJ91EW395C5F2WYjWJQdJ-SBHaDm7XnQsxMuyoMmLg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CACRpkdbhmJ91EW395C5F2WYjWJQdJ-SBHaDm7XnQsxMuyoMmLg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 16/01/2022 22:38, Linus Walleij wrote:
> On Sun, Jan 16, 2022 at 6:10 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
> 
>> Anyway DTS and dtschema will have to wait for one release, because they
>> depend on samsung pinctrl driver change (patch #2).
> 
> What about I put that (and maybe this schema) on an immutable
> branch so you can pull the commit into your for-arm-soc branch and
> put the DTS changes on top?

That would be a solution if not a policy for arm-soc of keeping DTS
separate. Arnd and Olof since some time are not happy when DTS branch
receives any driver updates.

Arnd, Olof,
This is a set of dtschema conversion + DTS alignment with new schema:
1. Driver change necessary to accept new DTS (driver depends on node
names and this has to change because of dtschema),
2. DTS commits depending on above, which convert node name to new format,
3. Finally dtschema requiring new naming of the GPIO nodes.

If I got correctly, the policy of not mixing drivers and DTS requires
that #2 above (DTS changes) will wait for one more release. During the
time, if dtschema (#3 above) is applied, there will be new warnings
about non-compliant DTS.

Do you see any chance of merging driver + DTS + dtschema via same tree
in same release?


Best regards,
Krzysztof
