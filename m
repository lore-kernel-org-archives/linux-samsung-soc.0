Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0623BC433DB
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 13 Jan 2021 05:21:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A9ED7230FC
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 13 Jan 2021 05:21:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725883AbhAMFVc convert rfc822-to-8bit (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 13 Jan 2021 00:21:32 -0500
Received: from mail-wr1-f43.google.com ([209.85.221.43]:36055 "EHLO
        mail-wr1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbhAMFVc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 13 Jan 2021 00:21:32 -0500
Received: by mail-wr1-f43.google.com with SMTP id t16so728797wra.3;
        Tue, 12 Jan 2021 21:21:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ygvCn8fmZH80T0v+3u3CbzAAgsVPV7I6kSbF85AxYE8=;
        b=jbE+s8Sx78HxPDXrtsukzSp6pvUQiSvWdAkKLiZgxNG7dyWhw8/qH8AY/Y2X+vljgW
         aijdruuSY3sd69afkJyWDjFJJGncvkO3fgkUlQ9nYkdaousDoUCK6KHK4hgHmW5YvpKk
         tUt0KzxPAmZz+ve5TbCuSMSY2/FqAh+zbs24j4aA2bxA2yVFb9pGAOO4O5oN4QotZ+k+
         ByjthzY7GE5GFWViCoOE6lSNtxQryR1ThSxZctm6/5Sod+yyY4mm1Zwf+xP/sKUep6Im
         pb8d7OBOpc1jqbJVt7nXyb5282l7YdQVjm3YSY0IO7eS4H7/lxNusDLnE0Dbxu2CD9rN
         poqw==
X-Gm-Message-State: AOAM532xBP+0t0Y3aN/mBTfAztnqhPICJzunQKIvll7Rz4iebTWyOjna
        Gkcqz9mwZMnnjeUAftRm77w/qflDs14=
X-Google-Smtp-Source: ABdhPJxhcefF2g4ghMWfcYGFz4p/mMcOTBXdkjHmHKC1b8cf1wmHKSyoSIrwjlD7D4mvHQU6xRhrZg==
X-Received: by 2002:adf:fbc5:: with SMTP id d5mr587444wrs.82.1610515249819;
        Tue, 12 Jan 2021 21:20:49 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id c11sm240840wmd.36.2021.01.12.21.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 21:20:48 -0800 (PST)
Date:   Wed, 13 Jan 2021 06:20:47 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Danny Lin <danny@kdrag0n.dev>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: exynos: Add energy model for Exynos 5250
Message-ID: <20210113052047.GC6486@kozik-lap>
References: <20210111235717.321153-1-danny@kdrag0n.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20210111235717.321153-1-danny@kdrag0n.dev>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Jan 11, 2021 at 03:57:16PM -0800, Danny Lin wrote:
> This energy model enables the use of energy- and capacity-aware CPU
> frequency scaling.
> 
> Power and performance measurements were made using my freqbench [1]
> benchmark coordinator, which uses EEMBC CoreMark [2] as the workload
> and measures power usage using the integrated PMIC's fuel gauge (DS2784
> in this case).

Thanks for the patch.

The tested setup is not representative here. The Nexus 10 is not
supported by mainline and it might use specific revision of Exynos5250,
different than present on other mainlined boards. One could assume that
ratio of dynamic power coefficient of the cores should be similar... but
there is no ratio here, as this is not a big.LITTLE platform.

Another problem is the v3.4 vendor kernel with a lot of out-of-tree
code. This means it might use some different scheduler, different
drivers, different voltages and a lot more of unknown differences.
Vendor kernel should not matter that much in measurement of DPC but it
makes the results not possible to reproduce.

You were also measuring the power delivered to entire system, no to CPUs,
so you included static power in the data. Static power of CPUs and of
the entire system.

> The energy model dynamic-power-coefficient values were calculated with
>     DPC = µW / MHz / V^2
> for each OPP, and averaged across all OPPs within each cluster for the
> final coefficient.
> 
> A Google Nexus 10 device running a downstream 3.4 kernel was used for
> benchmarking to ensure proper frequency scaling and other low-level
> controls.
> 
> Raw benchmark results can be found in the freqbench repository [3].
> Below is a human-readable summary:
> 
> ===== CPU 1 =====
> Frequencies: 200 300 400 500 600 700 800 900 1000 1100 1200 1300 1400 1500 1600 1700
>  200:   909     4.5 C/MHz    132 mW   36.2 J    6.9 I/mJ   275.0 s

What are the columns here? I would expect that fuel gauge gives you the
current, but it's not here.

>  300:  1366     4.6 C/MHz    212 mW   38.7 J    6.5 I/mJ   183.0 s
>  400:  1821     4.6 C/MHz    286 mW   39.3 J    6.4 I/mJ   137.3 s
>  500:  2253     4.5 C/MHz    375 mW   41.7 J    6.0 I/mJ   111.0 s
>  600:  2740     4.6 C/MHz    446 mW   40.7 J    6.1 I/mJ    91.2 s
>  700:  3199     4.6 C/MHz    513 mW   40.1 J    6.2 I/mJ    78.2 s
>  800:  3673     4.6 C/MHz    678 mW   46.1 J    5.4 I/mJ    68.1 s
>  900:  4090     4.5 C/MHz    764 mW   46.7 J    5.4 I/mJ    61.1 s
> 1000:  4586     4.6 C/MHz    878 mW   47.9 J    5.2 I/mJ    54.5 s
> 1100:  5060     4.6 C/MHz   1084 mW   53.6 J    4.7 I/mJ    49.4 s
> 1200:  5515     4.6 C/MHz   1225 mW   55.5 J    4.5 I/mJ    45.3 s
> 1300:  5933     4.6 C/MHz   1396 mW   58.9 J    4.2 I/mJ    42.1 s
> 1400:  6395     4.6 C/MHz   1662 mW   65.0 J    3.8 I/mJ    39.1 s
> 1500:  6897     4.6 C/MHz   1895 mW   68.7 J    3.6 I/mJ    36.3 s
> 1600:  7332     4.6 C/MHz   2198 mW   75.0 J    3.3 I/mJ    34.1 s
> 1700:  7826     4.6 C/MHz   2497 mW   79.8 J    3.1 I/mJ    31.9 s
> 
> [1] https://github.com/kdrag0n/freqbench
> [2] https://www.eembc.org/coremark/
> [3] https://github.com/kdrag0n/freqbench/tree/master/results/exynos5250/main
> 
> Signed-off-by: Danny Lin <danny@kdrag0n.dev>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index 2ea2caaca4e2..cc2fe0afcfc7 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -58,6 +58,8 @@ cpu0: cpu@0 {
>  			clock-names = "cpu";
>  			operating-points-v2 = <&cpu0_opp_table>;
>  			#cooling-cells = <2>; /* min followed by max */
> +			capacity-dmips-mhz = <1024>;

The origin of this 1024 value should be explained.

> +			dynamic-power-coefficient = <800>;
>  		};
>  		cpu1: cpu@1 {
>  			device_type = "cpu";
> @@ -67,6 +69,20 @@ cpu1: cpu@1 {
>  			clock-names = "cpu";
>  			operating-points-v2 = <&cpu0_opp_table>;
>  			#cooling-cells = <2>; /* min followed by max */
> +			capacity-dmips-mhz = <1024>;
> +			dynamic-power-coefficient = <800>;
> +		};
> +
> +		cpu-map {

That's a second patch.

Best regards,
Krzysztof

> +			cluster0 {
> +				core0 {
> +					cpu = <&cpu0>;
> +				};
> +
> +				core1 {
> +					cpu = <&cpu1>;
> +				};
> +			};
>  		};
>  	};
>  
> -- 
> 2.29.2
> 
