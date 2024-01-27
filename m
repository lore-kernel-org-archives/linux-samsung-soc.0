Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712BD11CAE
	for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Jan 2024 04:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706328229; cv=none; b=S91jbAGnTHot/xawnxAw0RrYjt0qlsxyuSu1H/OzqBZ0plhy+o5POFy0C6QzqqSetLmC7iL3rl0UH6PIRdJZzQjcHkIlySY/7blfxtCYJg/R2nbEkxAgCNn6yh2MBrr2f6Ug+L4KJH/snDv4QTyJy8gBW1lKKQGbnwvsMCuc/Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706328229; c=relaxed/simple;
	bh=ibPIG32KDz5lkYlFOZqgY9Su1g2LgI59+9TH7QrBfEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FRP6xBl6R3EMH/O2JDGdCqoERy+HOZn/aaGHnK0/OeRskaVCOxAHxy398PCOjKbBE46EC5Vw2izKpfT5x0vrOgNcbCRQCZ9VQWqGUTETBks34Pf0xyjANJxhb9gI3sKx/orcJGihDaPgZv9LqAp7L2SoNia5NYCxigJ3OhA2ZFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nFu4WjlZ; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nFu4WjlZ"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-51028fadfe2so1068157e87.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 20:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706328225; x=1706933025; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AhVLIlzeBK5qY5g8wi502EuRXY3kZQUh5Yr30GtXoR4=;
        b=nFu4WjlZDPrhvPHRTRXGoWCZvXPAXEFAJ5KR1mKS7EdyGevpV/OYvS9P7A5sqQUU3Y
         EHjPb710IGSUsqbjZeU+UBPpioe/TQYEJBCbNj5aLC1bCtghJCwLY+EGpsMd0ndTMAUS
         15mi6Ob0p9usZTq8RQVKHukrMFRWSrwNPZhdMsNgB8DjdNHIn/jnnBzY5lpHs9yVsWdV
         9Ul+DcwrdZzWlKQ+/a14Ek6LNIH/+M7MksowT7UMXFEdCF+FGZ+zELetcHVS6TOTY2mb
         TZ6sqhCea/ViLAx7Ha19GGpEvl2/k6ut4DzuMZ9MVUaQNkC6aTXIhntrSGbHAzBax8L6
         7Tcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706328225; x=1706933025;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AhVLIlzeBK5qY5g8wi502EuRXY3kZQUh5Yr30GtXoR4=;
        b=WEzUkjfhUDdLRK8XsJXlF+2RhhkH0Vo34TnMq021mLQB6ivYT2ru+nlf/J7rr8DE+r
         Amh6a4N1YB9s+2XU8WofzadcUJcBEaUmmfFeKvJ3E0/RGIs8bMekH911XE0q9WVNdRb3
         0Vvecomqlz7PDzX3qughGyaNzJR75u35PIs8E/DLcUSQFyaYYjBNdEt0NRV4Tnwryxsl
         cDWCyVHBs/JC245SUvuXWipS6pJy2acb3ABcczCf3E1voH6wTtlE7QM15jymRvfXKhug
         p7MxScZ6v53qVu1HKeTOo1NtAQXwpYLvUK9eFL3fR1FCOmae6PEzk1arMLC5B3N6kC2O
         Do/Q==
X-Gm-Message-State: AOJu0YzvNMG70YErp8206gmSMrUJxlqKkFjhXgR4eiYyGKriPUl+Dg9S
	tONHQsZBQUZuX+CXEhp/mQRN2iue1Be8kIeAiWyk0uKz4jg0ClmCQuIS5JpdLIE=
X-Google-Smtp-Source: AGHT+IGqPf0Y4JlE0TDyayzJ4+4DkjB7KETghuDJrX0IvXWt4UWKxRjXEnwgnh8i1uo8NmohOi+woQ==
X-Received: by 2002:ac2:4c13:0:b0:50e:b65b:4944 with SMTP id t19-20020ac24c13000000b0050eb65b4944mr513639lfq.21.1706328225421;
        Fri, 26 Jan 2024 20:03:45 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id f19-20020a17090624d300b00a2f15b8cb76sm1298403ejb.184.2024.01.26.20.03.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 20:03:43 -0800 (PST)
Message-ID: <6ccf359a-faeb-485b-8047-fa61bb1a3fc8@linaro.org>
Date: Sat, 27 Jan 2024 04:03:41 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: exynos: gs101: use correct clocks for
 usi_uart
Content-Language: en-US
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 peter.griffin@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com,
 willmcvicker@google.com, semen.protsenko@linaro.org,
 alim.akhtar@samsung.com, s.nawrocki@samsung.com, tomasz.figa@gmail.com,
 cw00.choi@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20240127003607.501086-1-andre.draszik@linaro.org>
 <20240127003607.501086-5-andre.draszik@linaro.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240127003607.501086-5-andre.draszik@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 1/27/24 00:35, André Draszik wrote:
> Wrong pclk clocks have been used in this usi8 instance here. For USI
> and UART, we need the ipclk and pclk, where pclk is the bus clock.
> Without it, nothing can work.
> It is unclear what exactly is using USI0_UART_CLK, but it is not
> required for the IP to be operational at this stage, while pclk is.
> This also brings the DT in line with the clock names expected by the
> usi and uart drivers.
> 
> Update the DTSI accordingly.
> 
> Fixes: d97b6c902a40 ("arm64: dts: exynos: gs101: update USI UART to use peric0 clocks")
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> index e5b665be2d62..f93e937d2726 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -410,7 +410,7 @@ usi_uart: usi@10a000c0 {
>  			ranges;
>  			#address-cells = <1>;
>  			#size-cells = <1>;
> -			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_CLK_PERIC0_USI0_UART_CLK>,
> +			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP1_PCLK_0>,

As I said in the previous email, I don't think this is correct. This is
just a heads up for Krzysztof to not pick these 2 patches yet. We'll
come back on this matter on Monday.

>  				 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP1_IPCLK_0>;
>  			clock-names = "pclk", "ipclk";
>  			samsung,sysreg = <&sysreg_peric0 0x1020>;
> @@ -422,7 +422,7 @@ serial_0: serial@10a00000 {
>  				reg = <0x10a00000 0xc0>;
>  				interrupts = <GIC_SPI 634
>  					      IRQ_TYPE_LEVEL_HIGH 0>;
> -				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_CLK_PERIC0_USI0_UART_CLK>,
> +				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP1_PCLK_0>,
>  					 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP1_IPCLK_0>;
>  				clock-names = "uart", "clk_uart_baud0";
>  				samsung,uart-fifosize = <256>;
