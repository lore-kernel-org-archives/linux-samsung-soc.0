Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F6F9C54E94
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Jan 2023 10:49:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236680AbjAZKtK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 26 Jan 2023 05:49:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236130AbjAZKtI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 05:49:08 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20B1443467
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2023 02:48:32 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id b7so1341805wrt.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2023 02:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S1oHIv84+gqWpeprpYr5WHtUeIKRCWjFxOmQZdohkr0=;
        b=k/HX4mkyFa8lPlhUKq14mrbcyBZFE3LLULrAnrsgDM/fXCRrK552LC5x4/apKOBt2q
         cbgiUvNsdJi8SWBW1dBq+EApvnGwBfjaTJ/yeLop4ncIf3QZbfjiJdqj9JSjQNAcPYuK
         cUPuJaHZI4I5RxqtCnDwXuEH1gkPrloiGhnSbNDk/qORMIBNhH/GLz5mEtw65YJ4MN2C
         iYQ7DDUiIGJpTpgXdNr4NzZ3HaiX8rs3zkTD/96thlIPRc0LqO9wJdg91CPxlZjZCBKn
         2ZEP+PDKn7Szx8g5N9ftDnnNo+t/XHfzZFv1NjWzMTc+n+/eRQ1WkeIrVwjWW8um7cS4
         Y3Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S1oHIv84+gqWpeprpYr5WHtUeIKRCWjFxOmQZdohkr0=;
        b=aN5MKXdHbfGnNI56okAn7hgGBWOwbNKNkEBRY3KivzykxT2UHlqSWvjSoEn+Zneoid
         v8F5vIeFC/5Tjs66x4JXrqh0tkUU5PufX1COjcd4JzLAXeYe38m6++gfJtDWQ5TFfYN5
         biimmDSlesgPyT9rluCy+IuG0CMTmgOHTySTSIEos/B8y9jinaPtGN5Jk2iLWc2dOMdV
         P29DeBjTErd/GrWSvFuuQlMRBtMyIEHcd1PXFGMquNcN6HS/lOHbscgZaxPjQetq6Q34
         frRDsxqjK33dAVPqm6JyAdPGVi0dLFErdBiA6VvUa6js15og2rl105fTyMCIYTlUXTKJ
         iGvQ==
X-Gm-Message-State: AO0yUKXwd+wTb+2ur0mIywt7+4NefWf1M9hmi9RECWhPX+CJonIbxOIG
        EQjMUR0anNWnWH97PEBbKJbnwQ==
X-Google-Smtp-Source: AK7set9ng1No/R1yeLGXdRUAQYm/shCPRwBRFuOjvcleaWNJ5RfczIJwORV/9dTBmib4dq4Z2jYg4A==
X-Received: by 2002:adf:a30d:0:b0:2bf:b44d:6dae with SMTP id c13-20020adfa30d000000b002bfb44d6daemr8076614wrb.28.1674730108083;
        Thu, 26 Jan 2023 02:48:28 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id a17-20020adffb91000000b002bddac15b3dsm940450wrr.33.2023.01.26.02.48.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 02:48:27 -0800 (PST)
Message-ID: <afce38b0-be90-a3b5-f181-a88ad3025bd9@linaro.org>
Date:   Thu, 26 Jan 2023 11:48:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH] dt-bindings: usb: samsung,exynos-dwc3: allow unit address
 in DTS
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230125175943.675823-1-krzysztof.kozlowski@linaro.org>
 <20230125211329.GA2899932-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230125211329.GA2899932-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 25/01/2023 22:13, Rob Herring wrote:
> On Wed, Jan 25, 2023 at 06:59:43PM +0100, Krzysztof Kozlowski wrote:
>> The Samsung Exynos SoC USB 3.0 DWC3 Controller is a simple wrapper of
>> actual DWC3 Controller device node.  It handles necessary Samsung
>> Exynos-specific resources (regulators, clocks), but does not have its
>> own MMIO address space.
>>
>> However neither simple-bus bindings nor dtc W=1 accept device nodes in
>> soc@ node which do not have unit address.  Therefore allow using
>> the address space of child device (actual DWC3 Controller) as the
>> wrapper's address.
> 
> The correct fix is 'ranges' should have a value. Though the whole 
> wrapper thing when there are no registers I dislike...

You mean something like this (diff against this patchset):
----------
diff --git a/arch/arm/boot/dts/exynos54xx.dtsi
b/arch/arm/boot/dts/exynos54xx.dtsi
index 08786fd9c6ea..75b6f9678672 100644
--- a/arch/arm/boot/dts/exynos54xx.dtsi
+++ b/arch/arm/boot/dts/exynos54xx.dtsi
@@ -142,16 +142,15 @@ hsi2c_7: i2c@12cd0000 {
                        status = "disabled";
                };

-               usbdrd3_0: usb-wrapper@12000000 {
+               usbdrd3_0: usb-wrapper {
                        compatible = "samsung,exynos5250-dwusb3";
-                       reg = <0x12000000 0x10000>;
                        #address-cells = <1>;
                        #size-cells = <1>;
-                       ranges;
+                       ranges = <0x0 0x12000000 0x10000>;

-                       usbdrd_dwc3_0: usb@12000000 {
+                       usbdrd_dwc3_0: usb@0 {
                                compatible = "snps,dwc3";
-                               reg = <0x12000000 0x10000>;
+                               reg = <0x0 0x10000>;

---------

Unfortunately dtc W=1 is still not happy:

exynos54xx.dtsi:145.26-159.5: Warning (unit_address_vs_reg):
/soc/usb-wrapper: node has a reg or ranges property, but no unit name

neither dtbs_check is:

exynos5410-smdk5410.dtb: soc: usb-wrapper: {'compatible':
['samsung,exynos5250-dwusb3'], '#address-cells': [[1]], '#size-cells':
[[1]], 'ranges': [[0, 301989888, 65536]], 'clocks': [[5, 366]],
'clock-names': ['usbdrd30'], 'pinctrl-names': ['default'], 'pinctrl-0':
[[21, 22]], 'vdd10-supply': [[23]], 'vdd33-supply': [[23]], 'usb@0':
{'compatible': ['snps,dwc3'], 'reg': [[0, 65536]], 'interrupts': [[0,
72, 4]], 'phys': [[24, 0], [24, 1]], 'phy-names': ['usb2-phy',
'usb3-phy'], 'snps,dis_u3_susphy_quirk': True}} should not be valid
under {'type': 'object'}
	From schema:
/home/krzk/.local/lib/python3.10/site-packages/dtschema/schemas/simple-bus.yaml


Best regards,
Krzysztof

