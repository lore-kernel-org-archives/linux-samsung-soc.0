Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23364E780C
	for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Sep 2026 09:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672555; cv=none; b=qj5J3z1lYbTLNAZTnQS91L16kqMMmUabQRzTZpifO2bsLTJ2Z08HKwfpNFPupXFxMu3Wr8cHCTAftL3V+goj/EHLB3a8zmntMzwRrjduDKBwjGmngzfPhK5z2NZUT18P1MLFQZr7GUgi7TKXIB+JzoBFfHHogNp+DyQ0oXqDr6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672555; c=relaxed/simple;
	bh=+E8vF3OM2T9aBuCele2XoJ6uplIMu6dwqmf1wFybHOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n2ZtTfe+TSTseTBnWxF1qtUAYCR2juVOi+mEfXFTdKhVdxykmgPFTZbutpzl8hZ8NIY12U3WkfoUAUjrkdabZc+bZCuraXiySnMArjSvRK21kxC+KB8ghQQ7w9wcG13/MABPBR31LrC1Ej0Rbzb659CgkXeEg6/nEhkwu46g9h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IE6Djk1J; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IE6Djk1J"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48434392b02so3387618f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Sep 2026 02:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790672542; x=1791277342; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BwJjdqcFj709Qv5LzibFkFCPgjMc0g1wC/gY1GLFeWU=;
        b=IE6Djk1JwBkjZBnhb6zaOvVtY6qWfjaAZr8DYgMSr9fbfHPc5oAiQP3WfY8O6IBvlK
         2pBa2FcqY9kCYXglwhYDTocIqIX3xAYv6LOYSvsoUTtvGoiJF9+gHKOVOy72616iZQIU
         j6TXzFqJPIBl9mKXHRziWSE29clCi9L9fvzKq4qrbde2bFZ5V19jHIVDLRAdaLYyc6YF
         SQKBhUcvTtZoIQIa/rry4ARk9mhOk0RNAae4Ri3b4tjObkdTlC6vBgkR6dKjHl/yZpsQ
         /fBKLoxCWfeuwxWrhyDrK0/w+piuiFOg8STzKauGhp2UDu6At7dhMBlaBAG4L14Ar7sM
         GHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672542; x=1791277342;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BwJjdqcFj709Qv5LzibFkFCPgjMc0g1wC/gY1GLFeWU=;
        b=TryN2PBkP6yEInr16VMg/DtCHU+92aatL51kkRBgAZ/cmiFYKikS13wrKvjLQXpDQi
         lyczMyjHtxxtYoUghV6630vP5uvTN6aqSo1Q9GabUUTFqruJd62lK2/VbPXtEOU6y351
         aCmh4K6CSFXV0fGS5yAd2eulbnuQx8HAIqab8jI8ichNwcJxlQNp1SwMx9tzpSuq71Gk
         1Wk53ZXPy9ighPo3o8AngWy79U41tkUbSmAt9spNmO4RF6C4Hh8l6Y+5fnMz18TpmgBv
         nASmi1W2ftf7Y7GwA9/6LNFVo1ukRhOOjd+vibcjk4xV3JgzMt0FpVJAHXbi9TNFucSG
         yyxg==
X-Forwarded-Encrypted: i=1; AKwUvBw37ZMfSSSv3SNRANjtk9WkSoKi0+iC7DKGzO/kTlH6OD039u6Q47ZpMTInn7hyR8SCZokKFvtSSqFYUNqzfil9DQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJr4ujl5jIpXo8N0R46F2Q4uEqSAywQw+hi+a47LDLO8GJy0e7M
	5CiFMX4hUze3HSTx93V3Q2QJ22sOHSoxLglBL7MuLgJjmjdsE0pWmu7GDixlySpF1c0=
X-Gm-Gg: AYBFou3a6enARRaRC24vw8mB0pDEOA4uSr84cit/cZ4dPtMnJ+jx5w4yinq4pdmCyHW
	13Rl/cBTQ3LB9hACX77j2Eiz2P5SLbHqA8BwxlP03Iu/LEOvbojcDGP0HfhGOIPH0mhjCfg6H9K
	G16GfxfgwomhE1NePZtO4vpn1VXza5pRAbEg+nvI3RXT2lI/ovKNXEJnLBG/Ku595XG49bsGpRT
	qfuGXiquIA3WV4BoJvkQ3/DMVHmmAqhJOLodT0j4GM7ovqPJ+sVDr8mX8p4hT19tUjm7ZbO99sP
	kszJ+jc/SDxC1YSWM+eJLCbbwSldNInqBCdJbZ2BhKl3NrwVwYLjgdInS/Vw4Na0KWKcGtZLDOF
	89HBdbGYey1pldKrJvyzFMjhJCBcPup3D1H7ZOZfEaKrkDJB3SmCxt3+mTYpTu/RhxesFVHnIHX
	lgBxDcGfVO7hv/axCAXlsOUkFPEanKEx+USX9t0LhFfGqg3GjdZsNJllxuijW+4tbdAGdDmOMtW
	SHEnkSE
X-Received: by 2002:a05:6000:4009:b0:487:92e:c608 with SMTP id ffacd0b85a97d-48af1b1cc9amr3124751f8f.1.1790672542160;
        Tue, 29 Sep 2026 02:02:22 -0700 (PDT)
Received: from [10.11.12.111] ([79.115.63.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af5058c52sm2748227f8f.19.2026.09.29.02.02.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 02:02:21 -0700 (PDT)
Message-ID: <7b5dded4-c475-40dd-b5c4-5086bab4162e@linaro.org>
Date: Tue, 29 Sep 2026 12:02:18 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: exynos850: Add ACPM firmware node
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Thomas Turner <tturner@lineageos.org>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260929-exynos850-acpm-node-cpufreq-v1-0-5a86c1d404b8@linaro.org>
 <20260929-exynos850-acpm-node-cpufreq-v1-1-5a86c1d404b8@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260929-exynos850-acpm-node-cpufreq-v1-1-5a86c1d404b8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Alexey,

On 9/29/26 6:10 AM, Alexey Klimov wrote:
> Add the ACPM firmware node with cpucl0 and cpucl1 clocks. ACPM firmware
> protocol provides interface for all client drivers to actually use
> features exposed by the APM co-processor.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> index 8a4771899a8e..91c6cee8f483 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -11,6 +11,7 @@
>   */
>  
>  #include <dt-bindings/clock/exynos850.h>
> +#include <dt-bindings/clock/samsung,exynos850-acpm.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/soc/samsung,exynos-usi.h>
>  
> @@ -170,6 +171,18 @@ timer: timer {
>  		     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
>  	};
>  
> +	firmware {
> +		acpm_ipc: power-management {
> +			compatible = "samsung,exynos850-acpm-ipc";
> +			mboxes = <&ap2apm_mailbox>;
> +			shmem = <&apm_sram>;
> +			clocks = <&cmu_cpucl0 CLK_FOUT_CPUCL0_PLL>,
> +				 <&cmu_cpucl1 CLK_FOUT_CPUCL1_PLL>;

Why do you describe these clocks?

Thanks,
ta

> +			clock-names = "cpucl0", "cpucl1";
> +			#clock-cells = <1>;
> +		};
> +	};
> +
>  	soc: soc@0 {
>  		compatible = "simple-bus";
>  		#address-cells = <1>;
> 

