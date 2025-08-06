Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E4428BAAE;
	Wed,  6 Aug 2025 14:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754489035; cv=none; b=bK41SL4nUyi4PE797Mpc/uyJy8LYmWoa70lgfMubIbxK4AEpm2dc6EV3kG5cjRGGyxbUIr/Tg/Xm3fZjxR2fXUXclfV8PcUo5xlApH9AYHvpSYCVT7ct3KsJ7A85veJYZY1KORO1aH96n1QhfjuHk1leL93RydNPFV47u9S13xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754489035; c=relaxed/simple;
	bh=lMoTmdZAcpb38FFOUzGfB6VQb3YZTNLRnWUbMapo/9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cF0w30Ait4CSYaDtGyne8C5t60t6daBte304MRJakaACXU3X8AP0Yu6pds5fZwZldTPFgV0hkJYvOlUWXKfGAcf3mK2x3YKMU7jcEUPaFGvT3Y+YBx0QTu+l2hOdDNlniweXkna3gT1jmauBrnp6vauMQK3JfGbfg/F4zryX8Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HT/lqZZB; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HT/lqZZB"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6154d14d6f6so9072901a12.2;
        Wed, 06 Aug 2025 07:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754489032; x=1755093832; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZdCn3l/Y/cDnw+eg7OBtMS2sCWl9a4rYzAAcz1Nkh/s=;
        b=HT/lqZZBoJmbvEmNr2pMZpd+jI0bX2vfZlD+wZKD7tY6D8PS+DgiwoiUcFyINSny+v
         qJgGXJ1P2Mcrcy0W65d9WgFQHdK85TVqN/xsvem0qX/6sZOsl7rnlfv5oo7VOrr+lHZJ
         +yYeM9AYgJ7jm2Ac/R6E3iS4Otlp/oEtO1u+LC6jodCPNAuaRAbQ5sgYp4LH9vxW3zBP
         5F1b++LOxEYts4mX8fWn/DSFtrGxve/49zNfW3bqn8SlaVZwMWWgyzWQnJVLp9IosxCw
         VWjuYiG5udKVHjVB7t2ya3JYnOAFUi/KCFhR1lKUD546e1L6JeAPm1O+c3oXTToU7rDz
         02Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754489032; x=1755093832;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZdCn3l/Y/cDnw+eg7OBtMS2sCWl9a4rYzAAcz1Nkh/s=;
        b=tKt9YNqeUR55PwFyI1FAE/nlwZRjDEbDsbRqHhKtF4IQSJPZ6nNwTQjg/yqv52HPIr
         XnUcaYE6V+LZ56Rym93oBnboVe0Te3oB5ZMB5vbpwerXXo++Hhw5eEXzDsA/gNMi/V9H
         tuzobdz5MfI79n5YjF6UgcGrz8reYUGmqqxIC9qpgAJJAI4nqa779WNqkGfUpbzKdbV4
         rMWxUalk3f4KSJcSy8fsG2IiihCFgamL/HVRkPrsRRyf9b7FAHyqmpKe4vO0m6BDGgVn
         Saof1ufXABizOjiYZFXxqWGkRaBkmfA189snkrZnlUvEQyLpQdKPhvb16DmJ8+YKA2Zk
         0kDA==
X-Forwarded-Encrypted: i=1; AJvYcCUQgHtme9M02CF2PRnKJUP7pK4MXOgyF79R63t6KJl59/A5zux6oImcQReWGYy888S2Cl08J30GrC9xGAcD@vger.kernel.org, AJvYcCWcSGDU5BA6yixyl9GdClLOzKf9KlTC33SP5dyy4BDwJcJqzaewEX/wMC4Ls1DLGyZGZc2jwQ61JxQAUq9MdcqmDIU=@vger.kernel.org, AJvYcCXFD1DwXsk5e/Jrq3RFDa1HOJSwQTXUxFjL9GcpCXnLLgK/n6xto35Rktos1o1suNpGlbMDjz+r96ef@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo5WI7kTc9pDfNJZsPuY/MLtTO5Rt/WbY/Bjp2Gxze426EVrTL
	NFNGQ6p6ndAGiauDYEjBJCAPwJSR6cUkEcBZSikI9uyO+XNVx70hH518
X-Gm-Gg: ASbGnct2cOwXwUUybcO0i0XCvksXB+K9YJ3ExLvhwMTErU5+r+kZP1D+UmSFaCmyA0I
	h8pxX22aLIJbTHXLesswHP8yTtCuNReBTg/uAR2KF8kndrCtE/SE1mmN0CHr4O47+70ynGS3SNB
	WYnB61Ly/RbBiftmUZlG5nl2u3wqqZZvLQocvl4aNHBaEIbShTVf2iDcHqn2cAbv+7nEAZ6hLWt
	kjAvFZLmKUxfAAF9mywzszWQ32CYIrwTl3+izFldK5DhhsHBY1HuKw4tVeXKIKt4C4s2C7GVyGV
	60i0OYWrJU1s0PomGzfONcpuaRE5qmQknvU3g1UCfYzgIf4XxF9W21rjFee7KPe3hE1pyosY01s
	X7xZXv1J233qD0IHDsRiLUaY/hr2X5Ti6ap0cRjVh0Q7/Ufo1k6Gw7ywZTB6MygBpBAecLyGagA
	qhC9WbljjdjjE=
X-Google-Smtp-Source: AGHT+IEZN/xnmINXiJf33M2U1WyJPsMopS4IUXYnX6+rek03rsq/iuB5F0OgJMrRAGHbwh934qYWfw==
X-Received: by 2002:a17:907:9710:b0:ae0:de30:8569 with SMTP id a640c23a62f3a-af9900f6e63mr261859666b.1.1754489031265;
        Wed, 06 Aug 2025 07:03:51 -0700 (PDT)
Received: from [192.168.1.106] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c0f4sm1094570366b.106.2025.08.06.07.03.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 07:03:50 -0700 (PDT)
Message-ID: <cf613367-dba6-4014-9be6-ff40de16a3a6@gmail.com>
Date: Wed, 6 Aug 2025 17:03:49 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] arm64: dts: exynos2200: add serial_0/1 nodes
Content-Language: en-US
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250730074253.1884111-1-ivo.ivanov.ivanov1@gmail.com>
 <20250730074253.1884111-5-ivo.ivanov.ivanov1@gmail.com>
 <CAPLW+4kOiBOZYQVA-ZiMEn+-_ZF1HD8QTm9AH0y34bcY+Mu92A@mail.gmail.com>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <CAPLW+4kOiBOZYQVA-ZiMEn+-_ZF1HD8QTm9AH0y34bcY+Mu92A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/2/25 02:12, Sam Protsenko wrote:
> On Wed, Jul 30, 2025 at 2:43 AM Ivaylo Ivanov
> <ivo.ivanov.ivanov1@gmail.com> wrote:
>> Add nodes for serial_0 (UART_DBG) and serial_1 (UART_BT), which
>> allows using them.
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> ---
>>  arch/arm64/boot/dts/exynos/exynos2200.dtsi | 26 ++++++++++++++++++++++
>>  1 file changed, 26 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/exynos2200.dtsi b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
>> index bab77b442..22c6da907 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos2200.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
>> @@ -336,6 +336,19 @@ pinctrl_peric1: pinctrl@10730000 {
>>                         reg = <0x10730000 0x1000>;
>>                 };
>>
>> +               serial_1: serial@10840000 {
>> +                       compatible = "samsung,exynos2200-uart", "google,gs101-uart";
>> +                       reg = <0x10840000 0x100>;
>> +                       clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
>> +                                <&cmu_peric1 CLK_DOUT_PERIC1_UART_BT>;
>> +                       clock-names = "uart", "clk_uart_baud0";
>> +                       interrupts = <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                       pinctrl-0 = <&uart1_bus>;
>> +                       pinctrl-names = "default";
>> +                       samsung,uart-fifosize = <256>;
>> +                       status = "disabled";
>> +               };
>> +
>>                 cmu_hsi0: clock-controller@10a00000 {
>>                         compatible = "samsung,exynos2200-cmu-hsi0";
>>                         reg = <0x10a00000 0x8000>;
>> @@ -458,6 +471,19 @@ pinctrl_peric2: pinctrl@11c30000 {
>>                         reg = <0x11c30000 0x1000>;
>>                 };
>>
>> +               serial_0: serial@11c40000 {
>> +                       compatible = "samsung,exynos2200-uart", "google,gs101-uart";
>> +                       reg = <0x11c40000 0x100>;
>> +                       clocks = <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>,
>> +                                <&cmu_peric2 CLK_DOUT_PERIC2_UART_DBG>;
>> +                       clock-names = "uart", "clk_uart_baud0";
>> +                       interrupts = <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                       pinctrl-0 = <&uart0_bus_single>;
>> +                       pinctrl-names = "default";
>> +                       samsung,uart-fifosize = <256>;
>> +                       status = "disabled";
>> +               };
>> +
> Shouldn't these two serial nodes be children of some corresponding USI
> nodes?

Which :P

>  IIUC, the downstream counterpart of this device tree is [1]? I
> can see the corresponding USI node is missing there. And if you don't
> have the TRM, it might get confusing. But, apart from my intuition
> telling me that those UART blocks *should* be implemented as a part of
> USI IP blocks in Exynos2200, there is also a fact that the downstream
> driver is actually accessing USI registers in exynos_usi_init()
> function, in the exynos-uart driver here: [2].

Unless that does nothing and Samsung did not care enough to strip the
code for it.

>  If that's correct, it
> means there should exist a USI block, which should be modeled like so:
>
> 8<------------------------------------------------------------------------->8
>     usi_...: usi@11c400c0 {
>         compatible = ...;
>         reg = <0x138200c0 0x20>;
>         samsung,sysreg = <...>;
>         samsung,mode = <USI_MODE_UART>;
>         #address-cells = <1>;
>         #size-cells = <1>;
>         ranges;
>         clocks = <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>,
>                  <&cmu_peric2 CLK_DOUT_PERIC2_UART_DBG>;
>         clock-names = "pclk", "ipclk";
>         status = "disabled";
>
>         serial_0: serial@11c40000 {
>             compatible = "samsung,exynos2200-uart", "google,gs101-uart";
>             reg = <0x11c40000 0x100>;
>             clocks = <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>,
>                      <&cmu_peric2 CLK_DOUT_PERIC2_UART_DBG>;
>             clock-names = "uart", "clk_uart_baud0";
>             interrupts = <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH 0>;
>             pinctrl-0 = <&uart0_bus_single>;
>             pinctrl-names = "default";
>             samsung,uart-fifosize = <256>;
>             status = "disabled";
>         };
>     };
> 8<------------------------------------------------------------------------->8
>
> This way you can achieve the same behavior as in downstream kernel, by
> making the (upstream) USI driver to initialize corresponding USI
> registers for you.
>
> Does that make any sense?

Not really. Perhaps you could __verify__ to what USI instance it belongs?
And is there a sysreg register for controlling the behavior of that?

Again, I know nothing more than what downstream says.

Best regards,
Ivaylo

>
> Thanks!
>
> [1] https://github.com/jgudec/android_kernel_samsung_exynos2200/blob/CWAI/arch/arm64/boot/dts/exynos/s5e9925.dts#L4648
> [2] https://github.com/jgudec/android_kernel_samsung_exynos2200/blob/CWAI/drivers/tty/serial/exynos_tty.c#L2181
>
>
>>                 cmu_cmgp: clock-controller@14e00000 {
>>                         compatible = "samsung,exynos2200-cmu-cmgp";
>>                         reg = <0x14e00000 0x8000>;
>> --
>> 2.43.0
>>
>>

