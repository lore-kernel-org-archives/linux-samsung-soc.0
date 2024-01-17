Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F76224FD
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Jan 2024 14:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705502953; cv=none; b=GJ4SlP4ug8U56tpyJqMacqcQKRKJt+JCj7xwiAyjAWYEqptHoyvcxoznRh4nLHwJm+4suViEtJ4y/G7OYDtM2tx2gppF98yGPjUC0F6eeIoJ4iVymkjvljkEmp6PTQyExQ1fnihx76x9KCmd8LDBGU8ycx1dV33Bd5v4TwlH8/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705502953; c=relaxed/simple;
	bh=xbOsZ7hNf9ivXDXTjA3fkk2LMk4yyJfbnqb4EOp2G0o=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:
	 To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=qSCOAeWhOKtjpCtEk9GJbQsEPUQuzj4U/F9Q27CwRucPxfkDuHfak7pTnD8VrGukFR0kK9F/HjZM+0JyAW/T/aV2G2Tvn0DYpWoaKvwHOECTLvymPSa0kZdwGfVQ24Au8H2qTNjSb1jJ3ztWaoFsLQNg522sDMY1k5dQHC+J8hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KD7tYHP+; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KD7tYHP+"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a28cc85e6b5so1324638666b.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Jan 2024 06:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705502950; x=1706107750; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wUp7AtgEUSYNvZ7/fVy0kILGk6FxXL69i5KUD1q97UU=;
        b=KD7tYHP+aNzQhO/v8Gv6InoamNLudK4Bu9cxQ+vn/k3HfVqP/E1JNP+iskw4JLgUtU
         Co1rI5XiV6gNnExMeB3S2NqqJ/ZGsCrmbtCxpO4it+pxJbC96bxLyhxN8FB9NmKGbZO2
         o3yP/aCKX4K4TDq51T7lYwzi3c6QrTr43py2Zz9DwA2h3IwdT1jRKgdH4H4IYs8NpIlO
         znZ8Dym8DyCwWfUE7qg/KfyLxSODbs+xdiefQnfnRbxLfTM6XuDeY/9V4GkXKoN2xoKV
         mg/F1IK1wLQjhFeWj8mD/Z/oPl2Wn/OAA32IDY3SIh80GqnWE5R0FgB0Wdyy067xwPkW
         aFfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705502950; x=1706107750;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wUp7AtgEUSYNvZ7/fVy0kILGk6FxXL69i5KUD1q97UU=;
        b=gZ1yipWeZtjX8S5m/4OJqlI1WUIfpyDtit7o6Y1iU1dbr/9RxhG66Bgotj4bHAbFWb
         lgO6mujTZ6SpuDnqz2vJVmkUHoanR8NyeF+sUiUDD1/4x3I0BMQxhHHnKlc7AKUY56sB
         1KW2ayxkLSxd6koYKwgzEsgiXnNXvqshlMYcZsERyMwpwB/Kox0eNXm+g156mbHql+9o
         ZhBpBWukT57xm7xCcho7ONU/Zy7EgX/b6O2aNd9cVzFNDzQApfV5+Mw5BRa9AplUCvQi
         hMLeT9JkLw2prP6h7+nFXXDkAAGzhYt0Y2AybQumqeKulOftcqA5V82i4L3Yw7hJBz8t
         3L6g==
X-Gm-Message-State: AOJu0YxTYauv+Mb9zmzFcoMaTm6Bq7hC6AjR7fgPjFW66RxW1/lVC/ET
	aJ5AnymK4fZ6+nwdKn/oikjyO8rrDPwHNg==
X-Google-Smtp-Source: AGHT+IGfogk1vyrdo+0VUD+8Wa7WTI0X1CJ1wuka8a695dU1RQlPFwd51cLYisobNRPZgcLdGzCY+A==
X-Received: by 2002:a17:907:7215:b0:a2c:cf7a:b70b with SMTP id dr21-20020a170907721500b00a2ccf7ab70bmr3242363ejc.145.1705502950157;
        Wed, 17 Jan 2024 06:49:10 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id o10-20020a170906288a00b00a2a632e4eebsm7758780ejd.119.2024.01.17.06.49.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jan 2024 06:49:09 -0800 (PST)
Message-ID: <f394e372-dbfd-4fd5-b5c8-23c383cb6cf2@linaro.org>
Date: Wed, 17 Jan 2024 14:49:07 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/12] clk: samsung: gs101: add support for cmu_peric0
Content-Language: en-US
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: peter.griffin@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 gregkh@linuxfoundation.org, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org,
 alim.akhtar@samsung.com, jirislaby@kernel.org, s.nawrocki@samsung.com,
 tomasz.figa@gmail.com, cw00.choi@samsung.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org, andre.draszik@linaro.org,
 kernel-team@android.com, willmcvicker@google.com
References: <20240109125814.3691033-1-tudor.ambarus@linaro.org>
 <20240109125814.3691033-8-tudor.ambarus@linaro.org>
 <CAPLW+4=y12fBf47v_HKfBdHTsQJfWo2cwBuFosUKo3xPBqcKJw@mail.gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAPLW+4=y12fBf47v_HKfBdHTsQJfWo2cwBuFosUKo3xPBqcKJw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Sam,

Thanks for reviewing the series!

On 1/16/24 17:42, Sam Protsenko wrote:

cut

>> Few clocks are marked as critical because when either of them is
>> disabled, the system hangs even if their clock parents are enabled.
>>
>> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
cut
>>
>> diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
>> index 782993951fff..f3f0f5feb28d 100644
>> --- a/drivers/clk/samsung/clk-gs101.c
>> +++ b/drivers/clk/samsung/clk-gs101.c

cut

>> +static const struct samsung_gate_clock peric0_gate_clks[] __initconst = {
>> +       /* Disabling this clock makes the system hang. Mark the clock as critical. */
>> +       GATE(CLK_GOUT_PERIC0_PERIC0_CMU_PERIC0_PCLK,
>> +            "gout_peric0_peric0_cmu_peric0_pclk", "mout_peric0_bus_user",
>> +            CLK_CON_GAT_CLK_BLK_PERIC0_UID_PERIC0_CMU_PERIC0_IPCLKPORT_PCLK,
>> +            21, CLK_IS_CRITICAL, 0),
> Why not just CLK_IGNORE_UNUSED? As I understand this gate clock can be

When either of the clocks that I marked as critical is disabled, the
system hangs, even if their clock parent is enabled. I tested this by
enabling the clock debugfs with write permissions. I prepared-enabled
the parent clock to increase their user count so that when the child
gets disabled to not disable the parent as well. When disabling the
child the system hung, even if its parent was enabled. Thus I considered
that the child is critical. I mentioned this in the commit message as
well. Please tell if get this wrong.

> used to disable PCLK (bus clock) provided to the whole CMU_PERIC0.
> Aren't there any valid cases for disabling this clock, like during
> some PM transitions? For Exynos850 clock driver I marked all clocks of

They aren't, because if one switches off any of these clocks that are
marked as critical, the system hangs and it will not be able to resume.

> this kind as CLK_IGNORE_UNUSED and it works fine. In other words: I'd
> say CLK_IS_CRITICAL flag is more "strong" than CLK_IGNORE_UNUSED, and
> requires better and more specific explanation, to make sure we are not
> abusing it. And I'm not sure this is the case.

Is the explanation from the commit message enough?
> 
> The same goes for the rest of clocks marked as CLK_IS_CRITICAL in this
> patch. Please check if maybe using CLK_IGNORE_UNUSED makes sense for
> any of those as well.

I've already checked and all behave as described above.

Thanks,
ta
