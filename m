Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60A6FC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 May 2022 13:08:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350336AbiEDNMC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 May 2022 09:12:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350409AbiEDNLq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 09:11:46 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 014183E5FC;
        Wed,  4 May 2022 06:07:54 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id e24so1190247pjt.2;
        Wed, 04 May 2022 06:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=vYg4rvjBskdDeZGugnxLh2ljnxAFSL38ZWkvr+e48Dg=;
        b=eFown16QulVwOuM1vFesLkaJ+0k7QJqbaQaCE7QkNHz7aOgy53bbiDG+CMTxPq4IAc
         fPfyl8wFwFE+alsDNng/8nRFv2ZZTn2HcuCRs4JZ1+yGacLAPzNm8gZYKKczBfARjG4n
         lMYVrFvJ44zw0pRBovVd1+twvzWnNwViVfL4gzuVhGvBsQBPd876w7UgmddgveY0UPQB
         NjCa7Zgz0kS9I6VvNyozpPqHssNUdJpH8zGRgsrD1z1jPKt18hBtDLgaO4L6csFr5Nza
         yKMPIol0QgI+NVHqg1WFu0kuFBdqmlquaE+ncnn+zJtJIUKF5/lE2BnEbxVY7VVSvL+2
         dilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vYg4rvjBskdDeZGugnxLh2ljnxAFSL38ZWkvr+e48Dg=;
        b=BpCjmDg9mWC6wEmxQI1Pwwt7ncM+WAfeIwIos7BbZN9eWQdPz63eT/IS0tRTMN2GBD
         vU7iUbpnhYInPyR6wlSv0T29nwCVscWOgvwMcGrWJfy6rKM1q4T+9Oc4BX1mA18t3SKZ
         6Kz2QyY7XeyGk9xsllQu0Ynb5GCtCTSHfurZLDqfxQvuGqB5Mz9JnEKbcJPYEGDEVV+e
         dWZ2t6Y+4eREU6M3WxupUZL8omQvifLCQAHpYA6hBc3J5sbaWfivdKs4oHpXFGIPt8hF
         wKbPop9JCJjCFnd5VEP/VFYcu6DhSMEhQ5RXN/4lbIdhGoP2iCGj8g+pSSJtb0znyi8P
         +/Rg==
X-Gm-Message-State: AOAM5300rRuNx+EsC8VhjMfPIrYMVDXepKlhB9r3qsywEQCyd5SDDOY+
        YsjwfSS8/uvRYv2P4k1QskOTl+0QwIc=
X-Google-Smtp-Source: ABdhPJxf2wyA1oDuq1ZZaMBKM7SXBSm0pKWWDI/n0pFoB77t63aO5YgHvPZLkts1FviRmCC6pyAg7w==
X-Received: by 2002:a17:90b:4cc7:b0:1dc:18c5:adb2 with SMTP id nd7-20020a17090b4cc700b001dc18c5adb2mr10030585pjb.121.1651669674148;
        Wed, 04 May 2022 06:07:54 -0700 (PDT)
Received: from [172.30.1.41] ([14.32.163.5])
        by smtp.gmail.com with ESMTPSA id h19-20020a63df53000000b003c14af50634sm15155679pgj.76.2022.05.04.06.07.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 May 2022 06:07:53 -0700 (PDT)
Message-ID: <f732c488-e50c-848d-c852-4b1c263a5d97@gmail.com>
Date:   Wed, 4 May 2022 22:07:48 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 12/12] arm64: dts: exynosautov9: switch ufs clock node
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20220504075154.58819-1-chanho61.park@samsung.com>
 <CGME20220504075004epcas2p4d082e1aa4b35ec4720ea8ed2308878f5@epcas2p4.samsung.com>
 <20220504075154.58819-13-chanho61.park@samsung.com>
From:   Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20220504075154.58819-13-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 22. 5. 4. 16:51, Chanho Park wrote:
> Use cmu_fsys's clock node instead of dummy ufs clock node.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>   arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 14 ++------------
>   1 file changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> index 68335fefa5f3..a8818b92e217 100644
> --- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> @@ -157,16 +157,6 @@ xtcxo: clock {
>   			clock-frequency = <26000000>;
>   			clock-output-names = "oscclk";
>   		};
> -
> -		/*
> -		 * Keep the stub clock for ufs driver, until proper clock
> -		 * driver is implemented.
> -		 */
> -		ufs_core_clock: ufs-core-clock {
> -			compatible = "fixed-clock";
> -			#clock-cells = <0>;
> -			clock-frequency = <166562500>;
> -		};
>   	};
>   
>   	soc: soc@0 {
> @@ -383,8 +373,8 @@ ufs_0: ufs0@17e00000 {
>   				<0x17dc0000 0x2200>;  /* 3: UFS protector */
>   			reg-names = "hci", "vs_hci", "unipro", "ufsp";
>   			interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&ufs_core_clock>,
> -				<&ufs_core_clock>;
> +			clocks = <&cmu_fsys2 CLK_GOUT_FSYS2_UFS_EMBD0_ACLK>,
> +				 <&cmu_fsys2 CLK_GOUT_FSYS2_UFS_EMBD0_UNIPRO>;
>   			clock-names = "core_clk", "sclk_unipro_main";
>   			freq-table-hz = <0 0>, <0 0>;
>   			pinctrl-names = "default";

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Samsung Electronics
Chanwoo Choi
