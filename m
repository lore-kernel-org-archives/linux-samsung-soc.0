Return-Path: <SRS0=zATP=EE=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D383FC2D0A3
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Oct 2020 17:50:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7633820790
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Oct 2020 17:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603993856;
	bh=MnaEdVRvf+I6U9ck8odbApAyZg6+jPgyaOk9jAH/FlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=twj5B/9htibkpekh1ZsHBJ/yTcYd2kEAUFFGvPFQbl0YYm4rQyWjoLkiWrKVU1ggm
	 0SfqfD19QIlxGKlBhLUA0qVIr+W3tea/mKh1kjZRO152+r7y/VZSEqLq07vDjFfSLf
	 YUF8onuH0XShcGntMIy2kWm2gzcux4vRWnd1RjSQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbgJ2Ruw convert rfc822-to-8bit (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 29 Oct 2020 13:50:52 -0400
Received: from mail-ej1-f65.google.com ([209.85.218.65]:45137 "EHLO
        mail-ej1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbgJ2Ruv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 29 Oct 2020 13:50:51 -0400
Received: by mail-ej1-f65.google.com with SMTP id dk16so4411346ejb.12;
        Thu, 29 Oct 2020 10:50:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=JW5uUjpEncojW8FWdx8WUdmW9j1qeTAangqeBjgEKyQ=;
        b=OQYSgtdOREABaN8zCbg77l5PiMcS0RXXL96/gVeEJV1bfB+QITOqG7xg1hB6MLH1/z
         oPfNFC3TMS1O82OE8KlpJgAd+WoZJpUrx+Gh2Rb/BpRpZH4f37KpqOLH5QpFKhEXTtW3
         rzyEnBm+Hz1S/hDmwV8x8QCTd3NGrRfTA8dv4nhxmml6pnkEKO+LfwcFr5bGfZ726LG7
         aUfqVqq5VH1Y81qRZeixws+/A/WIhthQ/71zKQFLxwPNK6HjDSwso8/TVnIolGB1QfOQ
         GG9X9wVpytluZCCoWWytgUGxzCkKbMqYDOce8j4Fifc78rWRIdqtFF+QtaeVzm1bAQdc
         ETlQ==
X-Gm-Message-State: AOAM530EuIU7s4iorvZmfkIql83XlJ8NsDvG9TqGheTKia3SUSP3q43l
        sRqiK2FeyTKyAs2/3B8DJx4=
X-Google-Smtp-Source: ABdhPJyl7xUB/nJc95o/DV+69jqaZrjMS6PW4fVoEdF/462KVKVNy5/ZWfPbKjUtMuzyYBjkZYG4eQ==
X-Received: by 2002:a17:906:3689:: with SMTP id a9mr5136518ejc.403.1603993847561;
        Thu, 29 Oct 2020 10:50:47 -0700 (PDT)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id z22sm1856419ejw.107.2020.10.29.10.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 10:50:45 -0700 (PDT)
Date:   Thu, 29 Oct 2020 18:50:43 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Cc:     kgene@kernel.org, alim.akhtar@samsung.com, robh+dt@kernel.org,
        a.kesavan@samsung.com, naveenkrishna.ch@gmail.com,
        thomas.ab@samsung.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: exynos: Fix reboot/poweroff issues on Exynos7
Message-ID: <20201029175043.GA88508@kozik-lap>
References: <20201028210813.49874-1-pawel.mikolaj.chmiel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20201028210813.49874-1-pawel.mikolaj.chmiel@gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Oct 28, 2020 at 10:08:13PM +0100, Paweł Chmiel wrote:
> In vendor sources for Exynos 7420, psci is not used to reboot or
> poweroff device. Instead we should use syscon reboot/poweroff.
> Previously it was not possible to poweroff (no syscon poweroff node) or
> reboot (because it was handled by psci and this way is not working for
> Exynos).

Do you want to say that PSCI cannot be used to power off or reboot?

> 
> Fixes: fb026cb65247 ("arm64: dts: Add reboot node for exynos7")
> Fixes: b9024cbc937d ("arm64: dts: Add initial device tree support for exynos7")
> Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos7.dtsi | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
> index 959918f4ca45..47d54c369d03 100644
> --- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
> @@ -117,8 +117,10 @@ cpu_atlas3: cpu@3 {
>  	};
>  
>  	psci {
> -		compatible = "arm,psci-0.2";
> +		compatible = "arm,psci";

Please explain how is it related to this issue? You onle mentioned
a problem of lacking syscon-reboot node.

>  		method = "smc";
> +		cpu_off = <0x84000002>;
> +		cpu_on = <0xC4000003>;

The same question.

>  	};
>  
>  	soc: soc@0 {
> @@ -552,6 +554,13 @@ pmu_system_controller: system-controller@105c0000 {
>  			compatible = "samsung,exynos7-pmu", "syscon";
>  			reg = <0x105c0000 0x5000>;
>  
> +			poweroff: syscon-poweroff {
> +				compatible = "syscon-poweroff";
> +				regmap = <&pmu_system_controller>;
> +				offset = <0x330C>; /* PS_HOLD_CONTROL */
> +				mask = <0x5200>; /* reset value */
> +			};
> +

Instead, please include arm/exynos-syscon-restart.dtsi.

Best regards,
Krzysztof
