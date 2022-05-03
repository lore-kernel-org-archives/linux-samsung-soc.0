Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC2C2C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 May 2022 09:13:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233302AbiECJRP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 May 2022 05:17:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232621AbiECJRO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 May 2022 05:17:14 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57FB11C92E
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 May 2022 02:13:42 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id a1so19176991edt.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 May 2022 02:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=rFKdfBcnMhEWOK7CnxFzLdMdBFx+2O+jkB6fDTGm56M=;
        b=kwkOvOaTJ2ZoO0J1jqi6kzatLGiWLgTPzTpvahIkSoOYrcDsiMfIyEt9UDkWJ6fET0
         SJL09o5nh0DPwNJmQ3/lQ9pNoPwrPJKKd7+lYCsmaqkMQR6wUmmkP5b8JC2GLRVRjKf3
         sCvFS9U1gQgQd9YNZvlfw8WUqYf9Rhc0EWIBxw3xPm9hxEnIkqgcSIuGfxadA9oAFkuN
         B/ZUS/t6QELEtFuUCf5gQ8IaraHL2Zv1zubeGFXWDyVZNs0FOdMeimhFevO8bMNIN4Mx
         Hi/qylYb1w71mRun7OJVzHWMUCMHPqIgZu7qzywPaR28+olNPywDU4Q81cSyHRPRwXMZ
         m2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rFKdfBcnMhEWOK7CnxFzLdMdBFx+2O+jkB6fDTGm56M=;
        b=VxgN7lyzBjHsefl5d3VzA1/JSiqXZ+MChlo1yZ4DqYCITo3C/7P0H6Yp+Bz7jTrrp/
         E9LByDaIj561my5f4VyreUFcoOqxOPNvYBXASp/bEeDoCxAqxmTyLCiuH2RHbN22cp6w
         6QK6QGSapSlVGAIFGyVOSuaeB7+NYHjrgSw960/w9YxfdLgUh5PgS6GUwaBx7rJCaoCR
         PWFo9hHWdcTkTL/RXYWdqCbsLufJKlmxdaiaXX2eLGLCJmxsCygwN7aVzaZG5O4fMPkh
         XlhFd65AfkcEf/kZTcu5nUFjlHjFIebWvwiN8atd7Wc62WinhucqC4C0b7xtWSoBUXip
         C/qQ==
X-Gm-Message-State: AOAM530cgKIA8dowwg5xGho9A00DUpoPImecwyJ0UYrQ+AiLWwTEQO+U
        O3SQLZtr+Rs8r0jiRVQdfb4XKQ==
X-Google-Smtp-Source: ABdhPJwmFK2kDiSqaGTcSC+3DgyQjm2FdRoZo5QUjMyqsBRRGGhE6SnzpSaUIYyZ5ViWeLmuBzIGXQ==
X-Received: by 2002:a05:6402:254c:b0:427:db53:dfb0 with SMTP id l12-20020a056402254c00b00427db53dfb0mr4312373edb.176.1651569218745;
        Tue, 03 May 2022 02:13:38 -0700 (PDT)
Received: from [192.168.0.201] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id v21-20020aa7d815000000b0042617ba63b8sm7623066edq.66.2022.05.03.02.13.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 02:13:38 -0700 (PDT)
Message-ID: <42df6765-0589-bc34-7d20-a05ef3e2d057@linaro.org>
Date:   Tue, 3 May 2022 11:13:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 03/12] clk: samsung: add top clock support for Exynos Auto
 v9 SoC
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20220502090230.12853-1-chanho61.park@samsung.com>
 <CGME20220502090100epcas2p3b41d4bc4025955f3d731f8d696649018@epcas2p3.samsung.com>
 <20220502090230.12853-4-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220502090230.12853-4-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 02/05/2022 11:02, Chanho Park wrote:

Thank you for your patch. There is something to discuss/improve.


> +	MUX(MOUT_CLKCMU_NPU_BUS, "mout_clkcmu_npu_bus", mout_clkcmu_npu_bus_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_NPU_BUS, 0, 3),
> +
> +	/* PERIC0 */
> +	MUX(MOUT_CLKCMU_PERIC0_BUS, "mout_clkcmu_peric0_bus",
> +	    mout_clkcmu_peric0_bus_p, CLK_CON_MUX_MUX_CLKCMU_PERIC0_BUS, 0, 1),
> +	MUX(MOUT_CLKCMU_PERIC0_IP, "mout_clkcmu_peric0_ip",
> +	    mout_clkcmu_peric0_bus_p, CLK_CON_MUX_MUX_CLKCMU_PERIC0_IP, 0, 1),
> +
> +	/* PERIC1 */
> +	MUX(MOUT_CLKCMU_PERIC1_BUS, "mout_clkcmu_peric1_bus",
> +	    mout_clkcmu_peric0_bus_p, CLK_CON_MUX_MUX_CLKCMU_PERIC1_BUS, 0, 1),
> +	MUX(MOUT_CLKCMU_PERIC1_IP, "mout_clkcmu_peric1_ip",
> +	    mout_clkcmu_peric0_bus_p, CLK_CON_MUX_MUX_CLKCMU_PERIC1_IP, 0, 1),
> +
> +	/* PERIS */
> +	MUX(MOUT_CLKCMU_PERIS_BUS, "mout_clkcmu_peris_bus",
> +	    mout_clkcmu_peric0_bus_p, CLK_CON_MUX_MUX_CLKCMU_PERIS_BUS, 0, 1),
> +

Unneeded blank line
> +};
> +
> +static const struct samsung_div_clock top_div_clks[] __initconst = {
> +	/* CMU_TOP_PURECLKCOMP */
> +	DIV(DOUT_SHARED0_DIV3, "dout_shared0_div3", "mout_shared0_pll",
> +	    CLK_CON_DIV_PLL_SHARED0_DIV3, 0, 2),
> +	DIV(DOUT_SHARED0_DIV2, "dout_shared0_div2", "mout_shared0_pll",
> +	    CLK_CON_DIV_PLL_SHARED0_DIV2, 0, 1),
> +
> +	DIV(DOUT_SHARED1_DIV3, "dout_shared1_div3", "mout_shared1_pll",
> +	    CLK_CON_DIV_PLL_SHARED1_DIV3, 0, 2),
> +	DIV(DOUT_SHARED1_DIV2, "dout_shared1_div2", "mout_shared1_pll",
> +	    CLK_CON_DIV_PLL_SHARED1_DIV2, 0, 1),
> +	DIV(DOUT_SHARED1_DIV4, "dout_shared1_div4", "dout_shared1_div2",
> +	    CLK_CON_DIV_PLL_SHARED1_DIV4, 0, 1),
> +
> +	DIV(DOUT_SHARED2_DIV3, "dout_shared2_div3", "mout_shared2_pll",
> +	    CLK_CON_DIV_PLL_SHARED2_DIV3, 0, 2),
> +	DIV(DOUT_SHARED2_DIV2, "dout_shared2_div2", "mout_shared2_pll",
> +	    CLK_CON_DIV_PLL_SHARED2_DIV2, 0, 1),
> +	DIV(DOUT_SHARED2_DIV4, "dout_shared2_div4", "dout_shared2_div2",
> +	    CLK_CON_DIV_PLL_SHARED2_DIV4, 0, 1),
> +
> +	DIV(DOUT_SHARED4_DIV2, "dout_shared4_div2", "mout_shared4_pll",
> +	    CLK_CON_DIV_PLL_SHARED4_DIV2, 0, 1),
> +	DIV(DOUT_SHARED4_DIV4, "dout_shared4_div4", "dout_shared4_div2",
> +	    CLK_CON_DIV_PLL_SHARED4_DIV4, 0, 1),
> +
> +	/* BOOST */
> +	DIV(DOUT_CLKCMU_CMU_BOOST, "dout_clkcmu_cmu_boost",
> +	    "gout_clkcmu_cmu_boost", CLK_CON_DIV_DIV_CLKCMU_CMU_BOOST, 0, 2),
> +
> +	/* ACC */
> +	DIV(DOUT_CLKCMU_ACC_BUS, "dout_clkcmu_acc_bus", "gout_clkcmu_acc_bus",
> +	    CLK_CON_DIV_CLKCMU_ACC_BUS, 0, 4),
> +
> +	/* APM */
> +	DIV(DOUT_CLKCMU_APM_BUS, "dout_clkcmu_apm_bus", "gout_clkcmu_apm_bus",
> +	    CLK_CON_DIV_CLKCMU_APM_BUS, 0, 3),
> +
> +	/* AUD */
> +	DIV(DOUT_CLKCMU_AUD_CPU, "dout_clkcmu_aud_cpu", "gout_clkcmu_aud_cpu",
> +	    CLK_CON_DIV_CLKCMU_AUD_CPU, 0, 3),
> +	DIV(DOUT_CLKCMU_AUD_BUS, "dout_clkcmu_aud_bus", "gout_clkcmu_aud_bus",
> +	    CLK_CON_DIV_CLKCMU_AUD_BUS, 0, 4),
> +
> +	/* BUSC */
> +	DIV(DOUT_CLKCMU_BUSC_BUS, "dout_clkcmu_busc_bus",
> +	    "gout_clkcmu_busc_bus", CLK_CON_DIV_CLKCMU_BUSC_BUS, 0, 4),
> +
> +	/* BUSMC */
> +	DIV(DOUT_CLKCMU_BUSMC_BUS, "dout_clkcmu_busmc_bus",
> +	    "gout_clkcmu_busmc_bus", CLK_CON_DIV_CLKCMU_BUSMC_BUS, 0, 4),
> +
> +	/* CORE */
> +	DIV(DOUT_CLKCMU_CORE_BUS, "dout_clkcmu_core_bus",
> +	    "gout_clkcmu_core_bus", CLK_CON_DIV_CLKCMU_CORE_BUS, 0, 4),
> +
> +	/* CPUCL0 */
> +	DIV(DOUT_CLKCMU_CPUCL0_SWITCH, "dout_clkcmu_cpucl0_switch",
> +	    "gout_clkcmu_cpucl0_switch", CLK_CON_DIV_CLKCMU_CPUCL0_SWITCH,
> +	    0, 3),
> +	DIV(DOUT_CLKCMU_CPUCL0_CLUSTER, "dout_clkcmu_cpucl0_cluster",
> +	    "gout_clkcmu_cpucl0_cluster", CLK_CON_DIV_CLKCMU_CPUCL0_CLUSTER,
> +	    0, 3),
> +
> +	/* CPUCL1 */
> +	DIV(DOUT_CLKCMU_CPUCL1_SWITCH, "dout_clkcmu_cpucl1_switch",
> +	    "gout_clkcmu_cpucl1_switch", CLK_CON_DIV_CLKCMU_CPUCL1_SWITCH,
> +	    0, 3),
> +	DIV(DOUT_CLKCMU_CPUCL1_CLUSTER, "dout_clkcmu_cpucl1_cluster",
> +	    "gout_clkcmu_cpucl1_cluster", CLK_CON_DIV_CLKCMU_CPUCL1_CLUSTER,
> +	    0, 3),
> +
> +	/* DPTX */
> +	DIV(DOUT_CLKCMU_DPTX_BUS, "dout_clkcmu_dptx_bus",
> +	    "gout_clkcmu_dptx_bus", CLK_CON_DIV_CLKCMU_DPTX_BUS, 0, 4),
> +	DIV(DOUT_CLKCMU_DPTX_DPGTC, "dout_clkcmu_dptx_dpgtc",
> +	    "gout_clkcmu_dptx_dpgtc", CLK_CON_DIV_CLKCMU_DPTX_DPGTC, 0, 3),
> +
> +	/* DPUM */
> +	DIV(DOUT_CLKCMU_DPUM_BUS, "dout_clkcmu_dpum_bus",
> +	    "gout_clkcmu_dpum_bus", CLK_CON_DIV_CLKCMU_DPUM_BUS, 0, 4),
> +
> +	/* DPUS */
> +	DIV(DOUT_CLKCMU_DPUS0_BUS, "dout_clkcmu_dpus0_bus",
> +	    "gout_clkcmu_dpus0_bus", CLK_CON_DIV_CLKCMU_DPUS0_BUS, 0, 4),
> +	DIV(DOUT_CLKCMU_DPUS1_BUS, "dout_clkcmu_dpus1_bus",
> +	    "gout_clkcmu_dpus1_bus", CLK_CON_DIV_CLKCMU_DPUS1_BUS, 0, 4),
> +
> +	/* FSYS0 */
> +	DIV(DOUT_CLKCMU_FSYS0_BUS, "dout_clkcmu_fsys0_bus",
> +	    "gout_clkcmu_fsys0_bus", CLK_CON_DIV_CLKCMU_FSYS0_BUS, 0, 4),
> +
> +	/* FSYS1 */
> +	DIV(DOUT_CLKCMU_FSYS1_BUS, "dout_clkcmu_fsys1_bus",
> +	    "gout_clkcmu_fsys1_bus", CLK_CON_DIV_CLKCMU_FSYS1_BUS, 0, 4),
> +	DIV(DOUT_CLKCMU_FSYS1_USBDRD, "dout_clkcmu_fsys1_usbdrd",
> +	    "gout_clkcmu_fsys1_usbdrd", CLK_CON_DIV_CLKCMU_FSYS1_USBDRD, 0, 4),
> +
> +	/* FSYS2 */
> +	DIV(DOUT_CLKCMU_FSYS2_BUS, "dout_clkcmu_fsys2_bus",
> +	    "gout_clkcmu_fsys2_bus", CLK_CON_DIV_CLKCMU_FSYS2_BUS, 0, 4),
> +	DIV(DOUT_CLKCMU_FSYS2_UFS_EMBD, "dout_clkcmu_fsys2_ufs_embd",
> +	    "gout_clkcmu_fsys2_ufs_embd", CLK_CON_DIV_CLKCMU_FSYS2_UFS_EMBD,
> +	    0, 3),
> +	DIV(DOUT_CLKCMU_FSYS2_ETHERNET, "dout_clkcmu_fsys2_ethernet",
> +	    "gout_clkcmu_fsys2_ethernet", CLK_CON_DIV_CLKCMU_FSYS2_ETHERNET,
> +	    0, 3),
> +
> +	/* G2D */
> +	DIV(DOUT_CLKCMU_G2D_G2D, "dout_clkcmu_g2d_g2d", "gout_clkcmu_g2d_g2d",
> +	    CLK_CON_DIV_CLKCMU_G2D_G2D, 0, 4),
> +	DIV(DOUT_CLKCMU_G2D_MSCL, "dout_clkcmu_g2d_mscl",
> +	    "gout_clkcmu_g2d_mscl", CLK_CON_DIV_CLKCMU_G2D_MSCL, 0, 4),
> +
> +	/* G3D0 */
> +	DIV(DOUT_CLKCMU_G3D00_SWITCH, "dout_clkcmu_g3d00_switch",
> +	    "gout_clkcmu_g3d00_switch", CLK_CON_DIV_CLKCMU_G3D00_SWITCH, 0, 3),
> +	DIV(DOUT_CLKCMU_G3D01_SWITCH, "dout_clkcmu_g3d01_switch",
> +	    "gout_clkcmu_g3d01_switch", CLK_CON_DIV_CLKCMU_G3D01_SWITCH, 0, 3),
> +
> +	/* G3D1 */
> +	DIV(DOUT_CLKCMU_G3D1_SWITCH, "dout_clkcmu_g3d1_switch",
> +	    "gout_clkcmu_g3d1_switch", CLK_CON_DIV_CLKCMU_G3D1_SWITCH, 0, 3),
> +
> +	/* ISPB */
> +	DIV(DOUT_CLKCMU_ISPB_BUS, "dout_clkcmu_ispb_bus",
> +	    "gout_clkcmu_ispb_bus", CLK_CON_DIV_CLKCMU_ISPB_BUS, 0, 4),
> +
> +	/* MFC */
> +	DIV(DOUT_CLKCMU_MFC_MFC, "dout_clkcmu_mfc_mfc", "gout_clkcmu_mfc_mfc",
> +	    CLK_CON_DIV_CLKCMU_MFC_MFC, 0, 4),
> +	DIV(DOUT_CLKCMU_MFC_WFD, "dout_clkcmu_mfc_wfd", "gout_clkcmu_mfc_wfd",
> +	    CLK_CON_DIV_CLKCMU_MFC_WFD, 0, 4),
> +
> +	/* MIF */
> +	DIV(DOUT_CLKCMU_MIF_BUSP, "dout_clkcmu_mif_busp",
> +	    "gout_clkcmu_mif_busp", CLK_CON_DIV_CLKCMU_MIF_BUSP, 0, 4),
> +
> +	/* NPU */
> +	DIV(DOUT_CLKCMU_NPU_BUS, "dout_clkcmu_npu_bus", "gout_clkcmu_npu_bus",
> +	    CLK_CON_DIV_CLKCMU_NPU_BUS, 0, 4),
> +
> +	/* PERIC0 */
> +	DIV(DOUT_CLKCMU_PERIC0_BUS, "dout_clkcmu_peric0_bus",
> +	    "gout_clkcmu_peric0_bus", CLK_CON_DIV_CLKCMU_PERIC0_BUS, 0, 4),
> +	DIV(DOUT_CLKCMU_PERIC0_IP, "dout_clkcmu_peric0_ip",
> +	    "gout_clkcmu_peric0_ip", CLK_CON_DIV_CLKCMU_PERIC0_IP, 0, 4),
> +
> +	/* PERIC1 */
> +	DIV(DOUT_CLKCMU_PERIC1_BUS, "dout_clkcmu_peric1_bus",
> +	    "gout_clkcmu_peric1_bus", CLK_CON_DIV_CLKCMU_PERIC1_BUS, 0, 4),
> +	DIV(DOUT_CLKCMU_PERIC1_IP, "dout_clkcmu_peric1_ip",
> +	    "gout_clkcmu_peric1_ip", CLK_CON_DIV_CLKCMU_PERIC1_IP, 0, 4),
> +
> +	/* PERIS */
> +	DIV(DOUT_CLKCMU_PERIS_BUS, "dout_clkcmu_peris_bus",
> +	    "gout_clkcmu_peris_bus", CLK_CON_DIV_CLKCMU_PERIS_BUS, 0, 4),
> +};
> +
> +static
> +const 
const goes to line above (with static).

struct samsung_fixed_factor_clock top_fixed_factor_clks[] __initconst = {
> +	FFACTOR(DOUT_CLKCMU_FSYS0_PCIE, "dout_clkcmu_fsys0_pcie",
> +		"gout_clkcmu_fsys0_pcie", 1, 4, 0),
> +};
> +
> +static const struct samsung_gate_clock top_gate_clks[] __initconst = {
> +	/* BOOST */
> +	GATE(GOUT_CLKCMU_CMU_BOOST, "gout_clkcmu_cmu_boost",
> +	     "mout_clkcmu_cmu_boost", CLK_CON_GAT_GATE_CLKCMU_CMU_BOOST,
> +	     21, 0, 0),
> +
> +	GATE(GOUT_CLKCMU_CPUCL0_BOOST, "gout_clkcmu_cpucl0_boost",
> +	     "dout_cmu_boost", CLK_CON_GAT_CLKCMU_CMU_CPUCL0_BOOST, 21, 0, 0),
> +	GATE(GOUT_CLKCMU_CPUCL1_BOOST, "gout_clkcmu_cpucl1_boost",
> +	     "dout_cmu_boost", CLK_CON_GAT_CLKCMU_CMU_CPUCL1_BOOST, 21, 0, 0),
> +	GATE(GOUT_CLKCMU_CORE_BOOST, "gout_clkcmu_core_boost",
> +	     "dout_cmu_boost", CLK_CON_GAT_CLKCMU_CMU_CORE_BOOST, 21, 0, 0),
> +	GATE(GOUT_CLKCMU_BUSC_BOOST, "gout_clkcmu_busc_boost",
> +	     "dout_cmu_boost", CLK_CON_GAT_CLKCMU_CMU_BUSC_BOOST, 21, 0, 0),
> +
> +	GATE(GOUT_CLKCMU_BUSMC_BOOST, "gout_clkcmu_busmc_boost",
> +	     "dout_cmu_boost", CLK_CON_GAT_CLKCMU_CMU_BUSMC_BOOST, 21, 0, 0),
> +	GATE(GOUT_CLKCMU_MIF_BOOST, "gout_clkcmu_mif_boost", "dout_cmu_boost",
> +	     CLK_CON_GAT_CLKCMU_CMU_MIF_BOOST, 21, 0, 0),
> +
> +	/* ACC */
> +	GATE(GOUT_CLKCMU_ACC_BUS, "gout_clkcmu_acc_bus", "mout_clkcmu_acc_bus",
> +	     CLK_CON_GAT_GATE_CLKCMU_ACC_BUS, 21, 0, 0),
> +
> +	/* APM */
> +	GATE(GOUT_CLKCMU_APM_BUS, "gout_clkcmu_apm_bus", "mout_clkcmu_apm_bus",
> +	     CLK_CON_GAT_GATE_CLKCMU_APM_BUS, 21, CLK_IGNORE_UNUSED, 0),
> +
> +	/* AUD */
> +	GATE(GOUT_CLKCMU_AUD_CPU, "gout_clkcmu_aud_cpu", "mout_clkcmu_aud_cpu",
> +	     CLK_CON_GAT_GATE_CLKCMU_AUD_CPU, 21, 0, 0),
> +	GATE(GOUT_CLKCMU_AUD_BUS, "gout_clkcmu_aud_bus", "mout_clkcmu_aud_bus",
> +	     CLK_CON_GAT_GATE_CLKCMU_AUD_BUS, 21, 0, 0),
> +
> +	/* BUSC */
> +	GATE(GOUT_CLKCMU_BUSC_BUS, "gout_clkcmu_busc_bus",
> +	     "mout_clkcmu_busc_bus", CLK_CON_GAT_GATE_CLKCMU_BUSC_BUS, 21,
> +	     CLK_IS_CRITICAL, 0),
> +
> +	/* BUSMC */
> +	GATE(GOUT_CLKCMU_BUSMC_BUS, "gout_clkcmu_busmc_bus",
> +	     "mout_clkcmu_busmc_bus", CLK_CON_GAT_GATE_CLKCMU_BUSMC_BUS, 21,
> +	     CLK_IS_CRITICAL, 0),
> +
> +	/* CORE */
> +	GATE(GOUT_CLKCMU_CORE_BUS, "gout_clkcmu_core_bus",
> +	     "mout_clkcmu_core_bus", CLK_CON_GAT_GATE_CLKCMU_CORE_BUS,
> +	     21, 0, 0),
> +
> +	/* CPUCL0 */
> +	GATE(GOUT_CLKCMU_CPUCL0_SWITCH, "gout_clkcmu_cpucl0_switch",
> +	     "mout_clkcmu_cpucl0_switch",
> +	     CLK_CON_GAT_GATE_CLKCMU_CPUCL0_SWITCH, 21, CLK_IGNORE_UNUSED, 0),
> +	GATE(GOUT_CLKCMU_CPUCL0_CLUSTER, "gout_clkcmu_cpucl0_cluster",
> +	     "mout_clkcmu_cpucl0_cluster",
> +	     CLK_CON_GAT_GATE_CLKCMU_CPUCL0_CLUSTER, 21, CLK_IGNORE_UNUSED, 0),
> +
> +	/* CPUCL1 */
> +	GATE(GOUT_CLKCMU_CPUCL1_SWITCH, "gout_clkcmu_cpucl1_switch",
> +	     "mout_clkcmu_cpucl1_switch",
> +	     CLK_CON_GAT_GATE_CLKCMU_CPUCL1_SWITCH, 21, CLK_IGNORE_UNUSED, 0),
> +	GATE(GOUT_CLKCMU_CPUCL1_CLUSTER, "gout_clkcmu_cpucl1_cluster",
> +	     "mout_clkcmu_cpucl1_cluster",
> +	     CLK_CON_GAT_GATE_CLKCMU_CPUCL1_CLUSTER, 21, CLK_IGNORE_UNUSED, 0),
> +
> +	/* DPTX */
> +	GATE(GOUT_CLKCMU_DPTX_BUS, "gout_clkcmu_dptx_bus",
> +	     "mout_clkcmu_dptx_bus", CLK_CON_GAT_GATE_CLKCMU_DPTX_BUS,
> +	     21, 0, 0),
> +	GATE(GOUT_CLKCMU_DPTX_DPGTC, "gout_clkcmu_dptx_dpgtc",
> +	     "mout_clkcmu_dptx_dpgtc", CLK_CON_GAT_GATE_CLKCMU_DPTX_DPGTC,
> +	     21, 0, 0),
> +
> +	/* DPUM */
> +	GATE(GOUT_CLKCMU_DPUM_BUS, "gout_clkcmu_dpum_bus",
> +	     "mout_clkcmu_dpum_bus", CLK_CON_GAT_GATE_CLKCMU_DPUM_BUS,
> +	     21, 0, 0),
> +
> +	/* DPUS */
> +	GATE(GOUT_CLKCMU_DPUS0_BUS, "gout_clkcmu_dpus0_bus",
> +	     "mout_clkcmu_dpus0_bus", CLK_CON_GAT_GATE_CLKCMU_DPUS0_BUS,
> +	     21, 0, 0),
> +	GATE(GOUT_CLKCMU_DPUS1_BUS, "gout_clkcmu_dpus1_bus",
> +	     "mout_clkcmu_dpus1_bus", CLK_CON_GAT_GATE_CLKCMU_DPUS1_BUS,
> +	     21, 0, 0),
> +
> +	/* FSYS0 */
> +	GATE(GOUT_CLKCMU_FSYS0_BUS, "gout_clkcmu_fsys0_bus",
> +	     "mout_clkcmu_fsys0_bus", CLK_CON_GAT_GATE_CLKCMU_FSYS0_BUS,
> +	     21, 0, 0),
> +	GATE(GOUT_CLKCMU_FSYS0_PCIE, "gout_clkcmu_fsys0_pcie",
> +	     "mout_clkcmu_fsys0_pcie", CLK_CON_GAT_GATE_CLKCMU_FSYS0_PCIE,
> +	     21, 0, 0),
> +
> +	/* FSYS1 */
> +	GATE(GOUT_CLKCMU_FSYS1_BUS, "gout_clkcmu_fsys1_bus",
> +	     "mout_clkcmu_fsys1_bus", CLK_CON_GAT_GATE_CLKCMU_FSYS1_BUS,
> +	     21, 0, 0),
> +	GATE(GOUT_CLKCMU_FSYS1_USBDRD, "gout_clkcmu_fsys1_usbdrd",
> +	     "mout_clkcmu_fsys1_usbdrd", CLK_CON_GAT_GATE_CLKCMU_FSYS1_USBDRD,
> +	     21, 0, 0),
> +	GATE(GOUT_CLKCMU_FSYS1_MMC_CARD, "gout_clkcmu_fsys1_mmc_card",
> +	     "mout_clkcmu_fsys1_mmc_card",
> +	     CLK_CON_GAT_GATE_CLKCMU_FSYS1_MMC_CARD, 21, 0, 0),
> +
> +	/* FSYS2 */
> +	GATE(GOUT_CLKCMU_FSYS2_BUS, "gout_clkcmu_fsys2_bus",
> +	     "mout_clkcmu_fsys2_bus", CLK_CON_GAT_GATE_CLKCMU_FSYS2_BUS,
> +	     21, 0, 0),
> +	GATE(GOUT_CLKCMU_FSYS2_UFS_EMBD, "gout_clkcmu_fsys2_ufs_embd",
> +	     "mout_clkcmu_fsys2_ufs_embd",
> +	     CLK_CON_GAT_GATE_CLKCMU_FSYS2_UFS_EMBD, 21, 0, 0),
> +	GATE(GOUT_CLKCMU_FSYS2_ETHERNET, "gout_clkcmu_fsys2_ethernet",
> +	     "mout_clkcmu_fsys2_ethernet",
> +	     CLK_CON_GAT_GATE_CLKCMU_FSYS2_ETHERNET, 21, 0, 0),
> +
> +	/* G2D */
> +	GATE(GOUT_CLKCMU_G2D_G2D, "gout_clkcmu_g2d_g2d",
> +	     "mout_clkcmu_g2d_g2d", CLK_CON_GAT_GATE_CLKCMU_G2D_G2D, 21, 0, 0),
> +	GATE(GOUT_CLKCMU_G2D_MSCL, "gout_clkcmu_g2d_mscl",
> +	     "mout_clkcmu_g2d_mscl", CLK_CON_GAT_GATE_CLKCMU_G2D_MSCL,
> +	     21, 0, 0),
> +
> +	/* G3D0 */
> +	GATE(GOUT_CLKCMU_G3D00_SWITCH, "gout_clkcmu_g3d00_switch",
> +	     "mout_clkcmu_g3d00_switch", CLK_CON_GAT_GATE_CLKCMU_G3D00_SWITCH,
> +	     21, 0, 0),
> +	GATE(GOUT_CLKCMU_G3D01_SWITCH, "gout_clkcmu_g3d01_switch",
> +	     "mout_clkcmu_g3d01_switch", CLK_CON_GAT_GATE_CLKCMU_G3D01_SWITCH,
> +	     21, 0, 0),
> +
> +	/* G3D1 */
> +	GATE(GOUT_CLKCMU_G3D1_SWITCH, "gout_clkcmu_g3d1_switch",
> +	     "mout_clkcmu_g3d1_switch", CLK_CON_GAT_GATE_CLKCMU_G3D1_SWITCH,
> +	     21, 0, 0),
> +
> +	/* ISPB */
> +	GATE(GOUT_CLKCMU_ISPB_BUS, "gout_clkcmu_ispb_bus",
> +	     "mout_clkcmu_ispb_bus", CLK_CON_GAT_GATE_CLKCMU_ISPB_BUS,
> +	     21, 0, 0),
> +
> +	/* MFC */
> +	GATE(GOUT_CLKCMU_MFC_MFC, "gout_clkcmu_mfc_mfc", "mout_clkcmu_mfc_mfc",
> +	     CLK_CON_GAT_GATE_CLKCMU_MFC_MFC, 21, 0, 0),
> +	GATE(GOUT_CLKCMU_MFC_WFD, "gout_clkcmu_mfc_wfd", "mout_clkcmu_mfc_wfd",
> +	     CLK_CON_GAT_GATE_CLKCMU_MFC_WFD, 21, 0, 0),
> +
> +	/* MIF */
> +	GATE(GOUT_CLKCMU_MIF_SWITCH, "gout_clkcmu_mif_switch",
> +	     "mout_clkcmu_mif_switch", CLK_CON_GAT_GATE_CLKCMU_MIF_SWITCH,
> +	     21, CLK_IGNORE_UNUSED, 0),
> +	GATE(GOUT_CLKCMU_MIF_BUSP, "gout_clkcmu_mif_busp",
> +	     "mout_clkcmu_mif_busp", CLK_CON_GAT_GATE_CLKCMU_MIF_BUSP,
> +	     21, CLK_IGNORE_UNUSED, 0),
> +
> +	/* NPU */
> +	GATE(GOUT_CLKCMU_NPU_BUS, "gout_clkcmu_npu_bus", "mout_clkcmu_npu_bus",
> +	     CLK_CON_GAT_GATE_CLKCMU_NPU_BUS, 21, 0, 0),
> +
> +	/* PERIC0 */
> +	GATE(GOUT_CLKCMU_PERIC0_BUS, "gout_clkcmu_peric0_bus",
> +	     "mout_clkcmu_peric0_bus", CLK_CON_GAT_GATE_CLKCMU_PERIC0_BUS,
> +	     21, 0, 0),
> +	GATE(GOUT_CLKCMU_PERIC0_IP, "gout_clkcmu_peric0_ip",
> +	     "mout_clkcmu_peric0_ip", CLK_CON_GAT_GATE_CLKCMU_PERIC0_IP,
> +	     21, 0, 0),
> +
> +	/* PERIC1 */
> +	GATE(GOUT_CLKCMU_PERIC1_BUS, "gout_clkcmu_peric1_bus",
> +	     "mout_clkcmu_peric1_bus", CLK_CON_GAT_GATE_CLKCMU_PERIC1_BUS,
> +	     21, 0, 0),
> +	GATE(GOUT_CLKCMU_PERIC1_IP, "gout_clkcmu_peric1_ip",
> +	     "mout_clkcmu_peric1_ip", CLK_CON_GAT_GATE_CLKCMU_PERIC1_IP,
> +	     21, 0, 0),
> +
> +	/* PERIS */
> +	GATE(GOUT_CLKCMU_PERIS_BUS, "gout_clkcmu_peris_bus",
> +	     "mout_clkcmu_peris_bus", CLK_CON_GAT_GATE_CLKCMU_PERIS_BUS,
> +	     21, CLK_IGNORE_UNUSED, 0),
> +

unneeded blank line


Best regards,
Krzysztof
