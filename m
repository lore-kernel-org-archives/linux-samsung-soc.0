Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0556CC19F29
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Jul 2022 07:39:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230348AbiG0Hju (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 27 Jul 2022 03:39:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229913AbiG0Hjt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 27 Jul 2022 03:39:49 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C854F402FD;
        Wed, 27 Jul 2022 00:39:48 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id y9so15375700pff.12;
        Wed, 27 Jul 2022 00:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=SLjW9zbSaP3Q2O4LQXmhepXz0CV4wCxNX1+WAfYc4rg=;
        b=EbQ/7UIbJvD987KeraDbVWr+/mfh+eHeRTyj/coAgPcDShyX1K46sPKFhSb6Q+ocnF
         h92ObwgugrCr1bDy9dbaTsQfV6kQAkUggkZk5gxXvodu2YdSLI8u7BKslYSSOu07duHb
         8EvgVGM6/l6eif73mZaaBKntFNkSAY6puuWjMulr2nJtsFOLyTVRYlqFvb5gTIpVAq4i
         +AxCbiGqPM/oK2w1MRtJ1cZGK6l/cuBNFN4SxoUS45zXElKa+2mr4TqxQquoKWyVTFL7
         Dl0TmDGeKJkLdRBmEGj+4YNAjpV9YYalQ7OCS4scfPL9sjSEHk/PD5w84XINDtzxu+81
         P6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=SLjW9zbSaP3Q2O4LQXmhepXz0CV4wCxNX1+WAfYc4rg=;
        b=fqxzzntcQSjbKGbGLbUFCWwgjuye0A89yC7BbDBahTKL+ZBXjmoQeL8SjQz7vLXUsg
         KgGniMFskvyhB8FjmBrlfWA9Kec7MXhW9ndQZPpV8G1HCNhHOJaoSkg5t6VuLWdDPAV8
         VacfDauRquYCX7GXLQhrXTyRpAKz9y+Jj1BuVJpyYs7s8BUr7h2HnjqfFahJ84/oEyU5
         gbh94ZihmrI5sygelAJghU8+9W8BtgwmMoLaaxdnOzkyFHu6AvhrhxRC5It04CSNjriW
         /YsPDYXxq7B1s2hMRhiD8NwsDwo7rJfokUEEedvNukpjE2MMidPXoqOsBd49NXw/u/gv
         wQNA==
X-Gm-Message-State: AJIora+IkgCn8W5/sMcYDTJwU5GdlaLQtZpA2KxA91o+Hnjfat3rFH8Q
        rUHCh+Kc14BOn155zXQKFIU=
X-Google-Smtp-Source: AGRyM1uIHs9Z2B5xUcTEGHfKn494FR0+XiBKwTKM0aa4DOa1EwslWTLU0yFd/K3LUrHKKS92R5Mfow==
X-Received: by 2002:a05:6a00:14c5:b0:52b:8877:8263 with SMTP id w5-20020a056a0014c500b0052b88778263mr21145838pfu.1.1658907588312;
        Wed, 27 Jul 2022 00:39:48 -0700 (PDT)
Received: from [172.30.1.52] ([14.32.163.5])
        by smtp.gmail.com with ESMTPSA id z2-20020a17090a170200b001efd39b7e39sm932785pjd.37.2022.07.27.00.39.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 00:39:42 -0700 (PDT)
Message-ID: <2e7ac9be-666a-816a-ff5b-5811925bf578@gmail.com>
Date:   Wed, 27 Jul 2022 16:39:33 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/6] dt-bindings: clk: exynosautov9: add fys0 clock
 definitions
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220727060146.9228-1-chanho61.park@samsung.com>
 <CGME20220727060612epcas2p355e7f9ca3700cad4778e944cbdbf2d50@epcas2p3.samsung.com>
 <20220727060146.9228-2-chanho61.park@samsung.com>
From:   Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20220727060146.9228-2-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 22. 7. 27. 15:01, Chanho Park wrote:
> Add fsys0(for PCIe) clock definitions.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  .../dt-bindings/clock/samsung,exynosautov9.h  | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/include/dt-bindings/clock/samsung,exynosautov9.h b/include/dt-bindings/clock/samsung,exynosautov9.h
> index ea9f91b4eb1a..6305a84396ce 100644
> --- a/include/dt-bindings/clock/samsung,exynosautov9.h
> +++ b/include/dt-bindings/clock/samsung,exynosautov9.h
> @@ -185,6 +185,49 @@
>  
>  #define CORE_NR_CLK			6
>  
> +/* CMU_FSYS0 */
> +#define CLK_MOUT_FSYS0_BUS_USER		1
> +#define CLK_MOUT_FSYS0_PCIE_USER	2
> +#define CLK_GOUT_FSYS0_BUS_PCLK		3
> +
> +#define CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X1_REFCLK		4
> +#define CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X2_REFCLK		5
> +#define CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X1_DBI_ACLK	6
> +#define CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X1_MSTR_ACLK	7
> +#define CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X1_SLV_ACLK	8
> +#define CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X2_DBI_ACLK	9
> +#define CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X2_MSTR_ACLK	10
> +#define CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X2_SLV_ACLK	11
> +#define CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X2_PIPE_CLK	12
> +#define CLK_GOUT_FSYS0_PCIE_GEN3A_2L0_CLK		13
> +#define CLK_GOUT_FSYS0_PCIE_GEN3B_2L0_CLK		14
> +
> +#define CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X1_REFCLK		15
> +#define CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X2_REFCLK		16
> +#define CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X1_DBI_ACLK	17
> +#define CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X1_MSTR_ACLK	18
> +#define CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X1_SLV_ACLK	19
> +#define CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X2_DBI_ACLK	20
> +#define CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X2_MSTR_ACLK	21
> +#define CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X2_SLV_ACLK	22
> +#define CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X2_PIPE_CLK	23
> +#define CLK_GOUT_FSYS0_PCIE_GEN3A_2L1_CLK		24
> +#define CLK_GOUT_FSYS0_PCIE_GEN3B_2L1_CLK		25
> +
> +#define CLK_GOUT_FSYS0_PCIE_GEN3_4L_X2_REFCLK		26
> +#define CLK_GOUT_FSYS0_PCIE_GEN3_4L_X4_REFCLK		27
> +#define CLK_GOUT_FSYS0_PCIE_GEN3_4L_X2_DBI_ACLK		28
> +#define CLK_GOUT_FSYS0_PCIE_GEN3_4L_X2_MSTR_ACLK	29
> +#define CLK_GOUT_FSYS0_PCIE_GEN3_4L_X2_SLV_ACLK		30
> +#define CLK_GOUT_FSYS0_PCIE_GEN3_4L_X4_DBI_ACLK		31
> +#define CLK_GOUT_FSYS0_PCIE_GEN3_4L_X4_MSTR_ACLK	32
> +#define CLK_GOUT_FSYS0_PCIE_GEN3_4L_X4_SLV_ACLK		33
> +#define CLK_GOUT_FSYS0_PCIE_GEN3_4L_X4_PIPE_CLK		34
> +#define CLK_GOUT_FSYS0_PCIE_GEN3A_4L_CLK		35
> +#define CLK_GOUT_FSYS0_PCIE_GEN3B_4L_CLK		36
> +
> +#define FSYS0_NR_CLK			37
> +
>  /* CMU_FSYS2 */
>  #define CLK_MOUT_FSYS2_BUS_USER		1
>  #define CLK_MOUT_FSYS2_UFS_EMBD_USER	2

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Samsung Electronics
Chanwoo Choi
