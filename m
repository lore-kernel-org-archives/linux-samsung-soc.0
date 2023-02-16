Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3BB2C636D6
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 16 Feb 2023 11:04:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbjBPLE7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 16 Feb 2023 06:04:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbjBPLE6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 16 Feb 2023 06:04:58 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96CA3B450
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Feb 2023 03:04:56 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id mc25so4121781ejb.13
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Feb 2023 03:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PEej8HpfwiKbzcm7R2RhpKX7rz/O0Vj620haGc2w0cM=;
        b=y4hS8WWXhOmhW1imSBPTZmJY9mmDdygmNtD9s1hwbnwT0IUQm5/BmrR7fdVRPm/8ZS
         QhdSZ/qg2sFqdikuYwhujc2+816lopjgCaF5Jn9LeGrjSByOYmdhE/Oxr+hzOFQGYi0G
         MCEj8UYqc+ddGOuxiRoATznhkKk3GpNVGvfff6p3+wAziN4Elaa/UAK6QiO9YlqFbTZ4
         60Pi6Pgh73eRgKUkZHnQxvcpanllT4Ogi6FqVqHLp99OaC5Ynt2WFQ7mRQNgNifgp+mB
         T6hiv4Ew9w2Qax4vJeJWUzX8NCeMmld/ieJXIh+raz8ZmclW4lwXOfvXH65aZEOMWtGE
         23aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PEej8HpfwiKbzcm7R2RhpKX7rz/O0Vj620haGc2w0cM=;
        b=078y63X0oCXrQ/N23MwzGSOk9CbomtT1AiImdiiXtkbUAPU9PnYVDpX+cDn9DAeua4
         S30pQwW9QGOJFtehsXrA3LeUFJOXZOpaIZXez+IvHCNWKK62oTl4StxIPk0RMkkdIfFZ
         zpbfJBc7w0U6pF+GP5fOO1xqYx+0IVZdFu5JOBwKja2DU+SNhwPT7SQMGIgN6tj/wlCe
         dS2uyfTc8xNVcBalFHsPdaBTn7QyPPsN93bnJi2f7bZHhKyBiZbPxNdpoYaYaD4F2LxY
         Sy9RfbVEIQTS0GMSE6IeUcL3q3N/TPF5cwN3ppE1GaOELtcNTrD/ZkKA0uC7iobhKzQ3
         PfmQ==
X-Gm-Message-State: AO0yUKVEIJZ8en9Wfnc+EW7dOBxv98FIcD498BV8X10PFCWq4yMV0ymv
        W7jO/WMnAjoT8R/QjcMn9bQwyA==
X-Google-Smtp-Source: AK7set/tQcr1YwauqE0QvNpCQrfGcQTbZMeuB3yhQaxtYsjLLkYB88rO9tL4deHZmk+nt6lgwyDzxg==
X-Received: by 2002:a17:906:55cb:b0:8af:305b:76af with SMTP id z11-20020a17090655cb00b008af305b76afmr5178891ejp.33.1676545495124;
        Thu, 16 Feb 2023 03:04:55 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id mm14-20020a170906cc4e00b008af2c131d4csm676003ejb.5.2023.02.16.03.04.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 03:04:54 -0800 (PST)
Message-ID: <af063274-97a1-f72d-f93e-a34dfa23570b@linaro.org>
Date:   Thu, 16 Feb 2023 12:04:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 05/16] dt-bindings: PCI: Rename the term elbi to appl
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>, Shradha Todi <shradha.t@samsung.com>
Cc:     lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com,
        krzysztof.kozlowski+dt@linaro.org, alim.akhtar@samsung.com,
        jingoohan1@gmail.com, Sergey.Semin@baikalelectronics.ru,
        lukas.bulwahn@gmail.com, hongxing.zhu@nxp.com, tglx@linutronix.de,
        m.szyprowski@samsung.com, jh80.chung@samsung.co,
        pankaj.dubey@samsung.com, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230214121333.1837-1-shradha.t@samsung.com>
 <CGME20230214121424epcas5p38e74b52a2d94a32b82a093c7e0a12499@epcas5p3.samsung.com>
 <20230214121333.1837-6-shradha.t@samsung.com>
 <20230214191516.GA17421-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230214191516.GA17421-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 14/02/2023 20:15, Rob Herring wrote:
> On Tue, Feb 14, 2023 at 05:43:22PM +0530, Shradha Todi wrote:
>> DT uses the name elbi in reg-names for application logic
>> registers which is a wrong nomenclature. This patch fixes
>> the same.
>>
>> This commit shouldn't be applied without changes
>> "arm64: dts: Rename the term elbi to appl" and
>> "PCI: samsung: Rename the term elbi to appl"
> 
> Which is your clue that this is an ABI break. You're stuck with the old 
> name unless the ABI break is fine for all Samsung platforms using this.

This piece is quite stable so even without many out-of-tree users, we
shouldn't break it without valid reason. Wrong nomenclature is not
necessarily valid enough.

Best regards,
Krzysztof

