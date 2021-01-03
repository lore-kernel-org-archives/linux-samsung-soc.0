Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E76FC433E6
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  3 Jan 2021 16:27:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 667D02151B
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  3 Jan 2021 16:27:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbhACQ1a (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 3 Jan 2021 11:27:30 -0500
Received: from mail-wr1-f41.google.com ([209.85.221.41]:37228 "EHLO
        mail-wr1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727281AbhACQ11 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 3 Jan 2021 11:27:27 -0500
Received: by mail-wr1-f41.google.com with SMTP id i9so28502442wrc.4
        for <linux-samsung-soc@vger.kernel.org>; Sun, 03 Jan 2021 08:27:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ypSnS/LQE1gA8/hhssBbuvms6S0nAbKTwj3Wfj9z8aI=;
        b=HW4vcy69lD0lqviyooYHvweSt9wxI9DS9ZYidLHH8cfQLHQ2ZIwZcKWOuFFBARBt+H
         ZzkilKi1BB+XXYYhSy5Mo08IUEfSWbGzrwjD9g5iO5mEljs3bHzaw/7udgg2SY7BQsWF
         NQ+Riy8Ku2Iuz3znE74eKsg3Q4q3cP+awH1DsJz3uID2nypeUHN91LQix7UpIYmVQHtB
         MT4WgA9ToWJJX3hvO8TGjJW767A/B/dr5mHeN6ST1Fuyzr/qod7RpsM+kPVOoeS0rx22
         5tPuMwnSlriXOpowoUGTm9hErQ7oCMRG/wXdEo8RyxsvXtn8x2zUyBrRWGnLRrTB0Cwx
         8Egw==
X-Gm-Message-State: AOAM533vabYtNtyrKICJP/d0fckbiaknCZ6s7Cv1pI4bhrmL6tQuujMh
        KPTpJqyPOpb7jAqBX8OZC+87o0eopxs=
X-Google-Smtp-Source: ABdhPJxOavxPnv974wApobXjdyapjamdA+QDyc5OmYTyk+a5ukGmQXY2rVhcDkJXDZ1iOnD+e/EAew==
X-Received: by 2002:adf:a4cf:: with SMTP id h15mr76960077wrb.13.1609691203203;
        Sun, 03 Jan 2021 08:26:43 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id y63sm30243732wmd.21.2021.01.03.08.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jan 2021 08:26:42 -0800 (PST)
Date:   Sun, 3 Jan 2021 17:26:40 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Gabriel Ribba Esteva <gabriel.ribbae@gmail.com>
Cc:     linux-samsung-soc@vger.kernel.org
Subject: Re: Enabling HDMI support on Exynos5410 SoC
Message-ID: <20210103162640.GA55804@kozik-lap>
References: <CAN4ncHMMw05XwRac8oX0w1gWhzyfborHC4w1p31Sa-hsm+9MNA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAN4ncHMMw05XwRac8oX0w1gWhzyfborHC4w1p31Sa-hsm+9MNA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Jan 01, 2021 at 11:48:29PM -0300, Gabriel Ribba Esteva wrote:
> Hi, i'm trying to support HDMI video output on Exynos5410 SoC based
> Odroid-XU board.
> 
> This work is done from porting board-level and SoC-level source files
> mainly all from Hardkernel's vendor repository (odroid-3.13.y-linaro),
> using their  U-Boot (odroid-v2012.07) repo. The reason behind this is
> it has implementation of device tree.
> In addition there are some reports that HDMI was working on this
> particular version, which i confirmed recently with a experimental
> disk image from [0].
> 
> The following dependencies modified during tests are based on kernel
> 5.8 and tested on Archlinux arm:
> 
> /drivers/gpu/drm/exynos/exynos_hdmi.c
> /drivers/clk/samsung/clk-exynos5410.c
> /arch/arm/boot/dts/exynos5410.dtsi
> /arch/arm/boot/dts/exynos5410-pinctrl.dtsi
> /arch/arm/boot/dts/exynos5410-odroidxu.dts
> /include/dt-bindings/clock/exynos5410.h
> 
> However, after updating the kernel, still not having HDMI output. Here
> are some relevant logs:
> 
> [root@alarm alarm]# dmesg | grep hdmi
> [    0.206739] device: '14530000.hdmi': device_add
> [    0.206757] bus: 'platform': add device 14530000.hdmi
> [    0.206792] PM: Adding info for platform:14530000.hdmi
> [    0.216737] platform 14530000.hdmi: Linked as a sync state only
> consumer to 100440c0.power-domain
> [    0.216760] platform 14530000.hdmi: Linked as a sync state only
> consumer to 13400000.pinctrl
> [    0.216779] platform 14530000.hdmi: Linked as a sync state only
> consumer to fixed_regulator@0
> [    2.609448] bus: 'platform': add driver msm_hdmi_phy
> [    2.609636] bus: 'platform': add driver hdmi_msm
> [    2.982804] platform 14530000.hdmi: Linked as a sync state only
> consumer to 4-0009
> [    3.747931]     vout=hdmi
> [    3.747936]     hdmi_phy_res=1080p60hz
> [   11.166645] bus: 'platform': add driver exynos-hdmi
> [   11.166811] bus: 'platform': driver_probe_device: matched device
> 14530000.hdmi with driver exynos-hdmi
> [   11.166824] bus: 'platform': really_probe: probing driver
> exynos-hdmi with device 14530000.hdmi
> [   11.168402] exynos-hdmi 14530000.hdmi: no init pinctrl state
> [   11.168427] exynos-hdmi 14530000.hdmi: no sleep pinctrl state
> [   11.168436] exynos-hdmi 14530000.hdmi: no idle pinctrl state
> [   11.168486] exynos-hdmi 14530000.hdmi: adding to PM domain DISP
> [   11.168494] exynos-hdmi 14530000.hdmi: genpd_add_device()
> [   11.172597] exynos-hdmi 14530000.hdmi: genpd_remove_device()
> [   11.172627] platform 14530000.hdmi: Driver exynos-hdmi requests
> probe deferral
> [   11.172636] platform 14530000.hdmi: Added to deferred list
> [   11.185562] devices_kset: Moving 14530000.hdmi to end of list
> [   11.185570] PM: Moving platform:14530000.hdmi to end of list
> [   11.185580] platform 14530000.hdmi: Retrying from deferred list
> 
> [root@alarm alarm]# dmesg | grep mixer
> [    0.207251] device: '14450000.mixer': device_add
> [    0.207267] bus: 'platform': add device 14450000.mixer
> [    0.207296] PM: Adding info for platform:14450000.mixer
> [    0.216840] platform 14450000.mixer: Linked as a sync state only
> consumer to 100440c0.power-domain
> [    0.216883] platform 14450000.mixer: Linked as a sync state only
> consumer to 14650000.sysmmu
> [   11.156641] bus: 'platform': add driver exynos-mixer
> [   11.156851] bus: 'platform': driver_probe_device: matched device
> 14450000.mixer with driver exynos-mixer
> [   11.156866] bus: 'platform': really_probe: probing driver
> exynos-mixer with device 14450000.mixer
> [   11.156892] exynos-mixer 14450000.mixer: no pinctrl handle
> [   11.156997] devices_kset: Moving 14450000.mixer to end of list
> [   11.157006] PM: Moving platform:14450000.mixer to end of list
> [   11.157016] exynos-mixer 14450000.mixer: Linked as a consumer to
> 14650000.sysmmu
> [   11.157065] exynos-mixer 14450000.mixer: Adding to iommu group 3
> [   11.161723] exynos-mixer 14450000.mixer: adding to PM domain DISP
> [   11.161732] exynos-mixer 14450000.mixer: genpd_add_device()
> [   11.165821] exynos-mixer 14450000.mixer: genpd_remove_device()
> [   11.165884] platform 14450000.mixer: Driver exynos-mixer requests
> probe deferral
> [   11.165893] platform 14450000.mixer: Added to deferred list
> [   11.175578] devices_kset: Moving 14450000.mixer to end of list
> [   11.175586] PM: Moving platform:14450000.mixer to end of list
> [   11.175595] platform 14450000.mixer: Retrying from deferred list
> 
> [root@alarm alarm]# dmesg | grep DISP
> [    0.244348] exynos-sysmmu 14650000.sysmmu: adding to PM domain DISP
> [    0.248034] PM: DISP: Power-off latency exceeded, new value 4000000 ns
> [   11.161723] exynos-mixer 14450000.mixer: adding to PM domain DISP
> [   11.163113] Power domain DISP enable failed
> [   11.168486] exynos-hdmi 14530000.hdmi: adding to PM domain DISP
> [   11.169851] Power domain DISP enable failed
> [   11.178089] Power domain DISP enable failed
> 
> 
> Moreover, the gen_pd output is as follows:
> 
> [root@alarm pm_genpd]# cat pm_genpd_summary
> domain                          status          slaves
>     /device                                             runtime status
> ----------------------------------------------------------------------
> GSC                             on
>     /devices/platform/soc/13e80000.sysmmu               suspended
>     /devices/platform/soc/13e90000.sysmmu               suspended
> MFC                             off-0
>     /devices/platform/soc/11200000.sysmmu               suspended
>     /devices/platform/soc/11210000.sysmmu               suspended
>     /devices/platform/soc/11000000.codec                suspended
> DISP                            off-0
>     /devices/platform/soc/14650000.sysmmu               error
> 
> In comparison of the experimental image [0], the clock tree for
> video-related clocks seems almost OK (e.g. aclk is at 266 MHz instead
> of 200 MHz). Here's the clock tree from debugfs:
> 
> [root@alarm alarm]# cat /sys/kernel/debug/clk/clk_summary
>                                  enable  prepare  protect
>                   duty
>    clock                          count    count    count        rate
>  accuracy phase  cycle
> ---------------------------------------------------------------------------------------------
>  32khz_cp                             0        0        0       32768
>         0     0  50000
>  32khz_ap                             0        1        0       32768
>         0     0  50000
>  sclk_dptxphy                         0        0        0    24000000
>         0     0  50000
>  sclk_hdmi27m                         0        0        0    24000000
>         0     0  50000
>  sclk_hdmi24m                         0        0        0    24000000
>         0     0  50000
>  sclk_hdmiphy                         0        0        0    24000000
>         0     0  50000
>  fin_pll                              6        7        0    24000000
>         0     0  50000
>     mout_aclk300_jpeg                 0        0        0    24000000
>         0     0  50000
>     mout_fimd1                        0        0        0    24000000
>         0     0  50000
>        div_fimd1                      0        0        0    24000000
>         0     0  50000
>           sclk_fimd1                  0        0        0    24000000
>         0     0  50000
>     mout_pwm                          0        0        0    24000000
>         0     0  50000
>        dout_pwm                       0        0        0    24000000
>         0     0  50000
>           sclk_pwm                    0        0        0    24000000
>         0     0  50000
>     mout_usbd301                      1        1        0    24000000
>         0     0  50000
>        dout_usbd301                   0        0        0    24000000
>         0     0  50000
>           sclk_usbd301                0        0        0    24000000
>         0     0  50000
>        dout_usbphy301                 1        1        0    24000000
>         0     0  50000
>           sclk_usbphy301              2        2        0    24000000
>         0     0  50000
>     mout_usbd300                      1        1        0    24000000
>         0     0  50000
>        dout_usbd300                   0        0        0    24000000
>         0     0  50000
>           sclk_usbd300                0        0        0    24000000
>         0     0  50000
>        dout_usbphy300                 1        1        0    24000000
>         0     0  50000
>           sclk_usbphy300              3        3        0    24000000
>         0     0  50000
>     sclk_epll                         0        0        0    24000000
>         0     0  50000
>     mout_vpllsrc                      0        0        0    24000000
>         0     0  50000
>        fout_vpll                      0        0        0   350000000
>         0     0  50000
>           sclk_vpll                   0        0        0   350000000
>         0     0  50000
>              div_hdmi_pixel           0        0        0    21875000
>         0     0  50000
>                 sclk_pixel            0        0        0    21875000
>         0     0  50000
>                 mout_hdmi             0        0        0    21875000
>         0     0  50000
>                    sclk_hdmi          0        0        0    21875000
>         0     0  50000
>     fout_mpll                         1        1        0   532000000
>         0     0  50000
>        sclk_mpll                      1        1        0   532000000
>         0     0  50000
>           sclk_mpll_muxed             2        2        0   532000000
>         0     0  50000
>              aclk266                  1        1        0   266000000
>         0     0  50000
>                 sss                   2        2        0   266000000
>         0     0  50000
>              aclk66_pre               1        1        0   266000000
>         0     0  50000
>                 aclk66                5       10        0    66500000
>         0     0  50000
>                    hdmi               0        0        0    66500000
>         0     0  50000
>                    pwm                1        1        0    66500000
>         0     0  50000
>                    tsadc              1        1        0    66500000
>         0     0  50000
>                    i2c_hdmi           0        0        0    66500000
>         0     0  50000
>                    usi3               0        0        0    66500000
>         0     0  50000
>                    usi2               0        0        0    66500000
>         0     0  50000
>                    usi1               0        0        0    66500000
>         0     0  50000
>                    usi0               0        1        0    66500000
>         0     0  50000
>                    i2c3               0        0        0    66500000
>         0     0  50000
>                    i2c2               0        1        0    66500000
>         0     0  50000
>                    i2c1               0        1        0    66500000
>         0     0  50000
>                    i2c0               0        0        0    66500000
>         0     0  50000
>                    uart3              0        0        0    66500000
>         0     0  50000
>                    uart2              1        1        0    66500000
>         0     0  50000
>                    uart1              0        0        0    66500000
>         0     0  50000
>                    uart0              0        0        0    66500000
>         0     0  50000
>                    tmu                0        4        0    66500000
>         0     0  50000
>                    rtc                0        1        0    66500000
>         0     0  50000
>                    wdt                1        1        0    66500000
>         0     0  50000
>                    mct                1        1        0    66500000
>         0     0  50000
>              mout_aclk400_isp         0        0        0   532000000
>         0     0  50000
>              mout_aclk266_gscl        0        0        0   532000000
>         0     0  50000
>              mout_aclk166             0        0        0   532000000
>         0     0  50000
>                 aclk166               0        0        0   133000000
>         0     0  50000
>     fout_kpll                         0        0        0   600000000
>         0     0  50000
>        mout_kpll                      0        0        0   600000000
>         0     0  50000
>           sclk_kpll                   0        0        0   150000000
>         0     0  50000
>           mout_kfc                    0        0        0   600000000
>         0     0  50000
>              div_kfc                  0        0        0   600000000
>         0     0  50000
>                 div_pclk              0        0        0   120000000
>         0     0  50000
>                 div_aclk              0        0        0    75000000
>         0     0  50000
>     fout_epll                         0        0        0   192000000
>         0     0  50000
>        mout_audss                     0        0        0   192000000
>         0     0  50000
>           dout_srp                    0        0        0    96000000
>         0     0  50000
>              srp_clk                  0        0        0    96000000
>         0     0  50000
>              dout_aud_bus             0        0        0    19200000
>         0     0  50000
>                 i2s_bus               0        0        0    19200000
>         0     0  50000
>                    3830000.i2s_rclk_src       0        0        0
> 19200000          0     0  50000
>                       3830000.i2s_prescaler       0        0        0
>   19200000          0     0  50000
>                          3830000.i2s_cdclk       0        0        0
>  19200000          0     0  50000
>           mout_i2s                    0        0        0   192000000
>         0     0  50000
>              dout_i2s                 0        0        0   192000000
>         0     0  50000
>                 sclk_i2s              0        0        0   192000000
>         0     0  50000
>     fout_dpll                         0        0        0   600000000
>         0     0  50000
>        sclk_dpll                      0        0        0   600000000
>         0     0  50000
>           div_aclk300_jpeg            0        0        0   600000000
>         0     0  50000
>           div_aclk300_disp1           0        0        0   300000000
>         0     0  50000
>              mout_aclk300_disp1       0        0        0   300000000
>         0     0  50000
>                 smmu_gscl1            0        0        0   300000000
>         0     0  50000
>                 smmu_gscl0            0        0        0   300000000
>         0     0  50000
>                 gscl4                 0        0        0   300000000
>         0     0  50000
>                 gscl3                 0        0        0   300000000
>         0     0  50000
>                 gscl2                 0        0        0   300000000
>         0     0  50000
>                 gscl1                 0        0        0   300000000
>         0     0  50000
>                 gscl0                 0        0        0   300000000
>         0     0  50000
>                 dsim1                 0        0        0   300000000
>         0     0  50000
>                 mie1                  0        0        0   300000000
>         0     0  50000
>                 fimd1                 0        0        0   300000000
>         0     0  50000
>           div_aclk300_disp0           0        0        0   300000000
>         0     0  50000
>              mout_aclk300_disp0       0        0        0   300000000
>         0     0  50000
>                 sclk_dp1              0        0        0   300000000
>         0     0  50000
>           div_aclk300_gscl            0        0        0   300000000
>         0     0  50000
>              mout_aclk300_gscl        0        0        0   300000000
>         0     0  50000
>     fout_cpll                         1        1        0   640000000
>         0     0  50000
>        sclk_cpll                      1        1        0   640000000
>         0     0  50000
>           mout_aclk333                0        0        0   640000000
>         0     0  50000
>              div_aclk333              0        0        0   320000000
>         0     0  50000
>                 mout_aclk333_sub       0        0        0   320000000
>          0     0  50000
>                    smmu_mfcl          0        0        0   320000000
>         0     0  50000
>                    smmu_mfcr          0        0        0   320000000
>         0     0  50000
>                    mfc                0        0        0   320000000
>         0     0  50000
>           mout_uart3                  0        0        0   640000000
>         0     0  50000
>              div_uart3                0        0        0    64000000
>         0     0  50000
>                 sclk_uart3            0        0        0    64000000
>         0     0  50000
>           mout_uart2                  1        1        0   640000000
>         0     0  50000
>              div_uart2                1        1        0    64000000
>         0     0  50000
>                 sclk_uart2            1        1        0    64000000
>         0     0  50000
>           mout_uart1                  0        0        0   640000000
>         0     0  50000
>              div_uart1                0        0        0    64000000
>         0     0  50000
>                 sclk_uart1            0        0        0    64000000
>         0     0  50000
>           mout_uart0                  0        0        0   640000000
>         0     0  50000
>              div_uart0                0        0        0    64000000
>         0     0  50000
>                 sclk_uart0            0        0        0    64000000
>         0     0  50000
>     fout_bpll                         1        1        0   800000000
>         0     0  50000
>        sclk_bpll                      1        1        0   800000000
>         0     0  50000
>           sclk_bpll_muxed             2        2        0   800000000
>         0     0  50000
>              mout_aclk400             0        0        0   800000000
>         0     0  50000
>                 aclk400               0        0        0   266666667
>         0     0  50000
>              mout_aclk200             1        1        0   800000000
>         0     0  50000
>                 aclk200               2        4        0   266666667
>         0     0  50000
>                    dp                 0        0        0   266666667
>         0     0  50000
>                    pdma0              0        1        0   266666667
>         0     0  50000
>                    pdma1              0        1        0   266666667
>         0     0  50000
>                    sdmmc2             1        1        0   266666667
>         0     0  50000
>                    sdmmc1             0        0        0   266666667
>         0     0  50000
>                    sdmmc0             1        1        0   266666667
>         0     0  50000
>                    mout_aclk200_disp1       0        0        0
> 266666667          0     0  50000
>                       smmu_tv         0        0        0   266666667
>         0     0  50000
>                       smmu_fimd1       0        0        0   266666667
>          0     0  50000
>                       mixer           0        0        0   266666667
>         0     0  50000
>              sclk_mpll_bpll           2        2        0   800000000
>         0     0  50000
>                 mout_mmc2             1        1        0   800000000
>         0     0  50000
>                    div_mmc2           1        1        0   800000000
>         0     0  50000
>                       div_mmc_pre2       1        1        0
> 200000000          0     0  50000
>                          sclk_mmc2       1        1        0
> 200000000          0     0  50000
>                 mout_mmc1             0        0        0   800000000
>         0     0  50000
>                    div_mmc1           0        0        0    72727273
>         0     0  50000
>                       div_mmc_pre1       0        0        0
> 72727273          0     0  50000
>                          sclk_mmc1       0        0        0
> 72727273          0     0  50000
>                 mout_mmc0             1        1        0   800000000
>         0     0  50000
>                    div_mmc0           1        1        0   800000000
>         0     0  50000
>                       div_mmc_pre0       1        1        0
> 200000000          0     0  50000
>                          sclk_mmc0       1        1        0
> 200000000          0     0  50000
>     fout_apll                         0        0        0   900000000
>         0     0  50000
>        mout_apll                      0        0        0   900000000
>         0     0  50000
>           mout_cpu                    0        0        0   900000000
>         0     0  50000
>              div_arm                  0        0        0   900000000
>         0     0  50000
>                 div_arm2              0        0        0   900000000
>         0     0  50000
>                    pclk_dbg           0        0        0   128571429
>         0     0  50000
>                    div_atb            0        0        0   128571429
>         0     0  50000
>                    div_cpud           0        0        0   112500000
>         0     0  50000
>                    div_acp            0        0        0   900000000
>         0     0  50000
>     clkout                            1        1        0    24000000
>         0     0  50000
>  sclk_pcm                             0        0        0           0
>         0     0  50000
>     pcm_bus                           0        0        0           0
>         0     0  50000
>  usbd301                              1        1        0           0
>         0     0  50000
>  usbd300                              1        1        0           0
>         0     0  50000
>  usbh20                               3        3        0           0
>         0     0  50000
> 
> As i see, some years ago it was disscused about problems with HDMI and
> the power-domains [1], which led me to try changing some properties in
> the device tree.
> 
> Disabling the DISP pd and removing  samsung,syscon-phandle =
> <&pmu_system_controller> property from hdmi node results in sclk_hdmi
> and mout_hdmi being moved to sclk_hdmiphy. Furthermore, i got some
> weird colorful vertical lines being displayed on my tv.
> 
> AFAICT as not fully understand what is going on and not being aware of
> what is it required nor missing, i can suppose the following:
> 
> 1) U-Boot is doing some initialization with power-domains that affects
> later on kernel which results in DISP failed.
> 2) As Exynos5410 currently does not have PMU drivers supported,
> there's issues with anything else from the minimal support (reboot,
> poweroff).

I think there is also no support for power domain in current mainline,
so you had to add them by yourself. Since I don't know what you did,
it's difficult to guess what is wrong.

> 3) Some clocks from clock driver are not defined correctly. This is
> the least possible due that definitions were copied same as described
> in working HDMI repo.

Clocks for Exynos5410 are not properly described in mainline, so it is
quite likely that something is disabled or assigned to wrong PLL. If you
use some other clock configuration, then again difficult to judge - I
don't know what you put there.

> 
> Having exposed all these info as background, i would ask if you could
> bring some insights to solve this. Thanks in advance.

The power domains should be enabled by default (reset value) so I would
propose not to configure them. Otherwise you are fixing and working with
multiple things at the same time, so problem might be in multiple
places. Usually it's much easier to deal with one problem at a time.

Anyway, Exynos5410 is a poor choice to work on without manual. The
support for it was never finished except me, no one was even working
on it since 5 years or something.

Best regards,
Krzysztof

