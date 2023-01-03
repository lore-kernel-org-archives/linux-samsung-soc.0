Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAEECC4708E
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Jan 2023 11:13:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237322AbjACLNV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 Jan 2023 06:13:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237173AbjACLNU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Jan 2023 06:13:20 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BB9C767D
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Jan 2023 03:13:19 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id s22so31455821ljp.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Jan 2023 03:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/TWpQiqg2iNv0O2diyiU4mfauguHMd4IysTnhIm0+fM=;
        b=P2s5tnD5MmHi+uSv4kHuF4d8IwY9IgQ+14JhDu+4u3ZxKe97MH/MG6IY8eE/t+dl7m
         b9BWNzeVLkwLYxXe/GZoRxyz2QKbT+dgj3HZyL/HxyYllp1Se9uXmJp8Q7FRJDdPUr+m
         45kWneEaoQoYg3BK5tWcHhHJSIFYnIKb0nB7llMmj/QNCTUzRe0pFMRqhZCoYKWl6YbS
         65dMNkbEioNXPZ+66yQWA8HX5EU6hlozJvDfS/2MlQUjqAu8IMUmMq0IYbpzygECyMBy
         e9+XT4fWylQly35GWrFj9PggXTGHEwgukIZgWnk+EEXvYYiFWix3h71ThCsrv6eVxmfn
         SgZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/TWpQiqg2iNv0O2diyiU4mfauguHMd4IysTnhIm0+fM=;
        b=HLStAZRasclD3lUsueO3EWJelznFfXR+VaTCRuMiq2taDmDsFCEcSDmJY9LoyY/HjW
         U8Zgd3fWfKzyTUd/yxRO1Dq/jooTXzhqOlWvsky0T/gwbiJVEvFC2VYUoylN+3PkDYah
         0pwgb5+Co/oiUMQiMmdn1i1JTsy5kc6XJBDs6/b8faq4/wxj4MtMo5let0wRhpx1rAC/
         iO14alYhInyhwWamffzmn+qvnKAR1fYJqvhEYTpOL3VJBMSQC1fASNy64X5a02EvZzz0
         aQfaF7aQN2zmtWlAHQfxl9laJ/twH92uGjAjTkxi2OOL62mZCkXd39UXcrMMrspOBQpw
         hsLw==
X-Gm-Message-State: AFqh2kpcruib8PQtIxtQ8w/ndDDt345avWl3qkdPhZMefLfJY9Vf+y4t
        ifdYhVYF/OXwo76j4VdvYddy2lJ5eGO8Zp81
X-Google-Smtp-Source: AMrXdXsq4eIbXobzEJN/aR14hPh8zbDa75iWKce21g7fG2vNVHzWb4UfMEZpdHsU9qRvjyGv1U9L0A==
X-Received: by 2002:a2e:a583:0:b0:27f:cf81:cbc with SMTP id m3-20020a2ea583000000b0027fcf810cbcmr6992503ljp.24.1672744397870;
        Tue, 03 Jan 2023 03:13:17 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id k10-20020a05651c10aa00b0027fe262a75csm970094ljn.81.2023.01.03.03.13.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jan 2023 03:13:17 -0800 (PST)
Message-ID: <2c6950c9-3489-c2d4-2ca8-cb723195f75b@linaro.org>
Date:   Tue, 3 Jan 2023 12:13:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 5/5] arm64: dts: fsd: Add sound card node for Tesla FSD
Content-Language: en-US
To:     Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>,
        lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, s.nawrocki@samsung.com,
        perex@perex.cz, tiwai@suse.com, pankaj.dubey@samsung.com,
        alim.akhtar@samsung.com, rcsekar@samsung.com,
        aswani.reddy@samsung.com
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <20230103045613.100309-1-p.rajanbabu@samsung.com>
 <CGME20230103045706epcas5p14f2f951d162899234c7f5f7a0998ab6b@epcas5p1.samsung.com>
 <20230103045613.100309-6-p.rajanbabu@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230103045613.100309-6-p.rajanbabu@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 03/01/2023 05:56, Padmanabhan Rajanbabu wrote:
> Add device tree node support for sound card on Tesla FSD board
> 
> Signed-off-by: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
> ---
>  arch/arm64/boot/dts/tesla/fsd-evb.dts | 37 +++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts b/arch/arm64/boot/dts/tesla/fsd-evb.dts
> index e2fd49774f15..ce726bddfb50 100644
> --- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
> +++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
> @@ -29,6 +29,43 @@
>  		device_type = "memory";
>  		reg = <0x0 0x80000000 0x2 0x00000000>;
>  	};
> +
> +	sound {
> +		compatible = "simple-audio-card";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		simple-audio-card,name = "FSD Audio Card";
> +		simple-audio-card,widgets =
> +			"Line", "Line Out",

I don't think you need to break the line after '='.

> +			"Line", "Line In";
> +		simple-audio-card,routing =
> +			"Line Out", "LLOUT",
> +			"Line Out", "RLOUT",
> +			"MIC2L", "Line In",
> +			"MIC2R", "Line In";
> +
> +		status = "okay";

Why?

> +
> +		simple-audio-card,dai-link@0 {
> +			reg = <0>;
> +			format = "i2s";
> +			bitclock-master = <&tlv320aic3x>;
> +			frame-master = <&tlv320aic3x>;
> +
> +			cpu0 {

Does not look like you tested the DTS against bindings. Please run `make
dtbs_check` (see Documentation/devicetree/bindings/writing-schema.rst
for instructions).

> +				sound-dai = <&i2s_0 0>;
> +			};
> +			cpu1 {
> +				sound-dai = <&i2s_0 1>;
> +			};
> +			codec {
> +				sound-dai = <&tlv320aic3x>;
> +				system-clock-frequency = <33000000>;
> +			};

Best regards,
Krzysztof

