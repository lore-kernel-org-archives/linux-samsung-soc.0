Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A870420F98F;
	Tue, 14 Jan 2025 21:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736891853; cv=none; b=PhJBskgFSp/j5pACrwkPMPQAo7K1ZWMSPOiYu8G9pvX6z2pN+9F9JymJ4zTl5Muou7CDdhPD1PfBW1b0WdOGfpJOxBpb7eP1fV5zlQVvfQbZYgQpcTbGnPUORgrutfX8SGP2Ltuhp2nXe6EXS1jDJheWUgv5oUZMToD/i3L8caI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736891853; c=relaxed/simple;
	bh=mY1ByvAzkq/1267QcOicrnww0Bug5ydkNL9fEvOoNE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dSsuFCSVHfAEs75lTHic+t1bUSVwW0rnMgrYjwM089DxNaew/KHM3rkGeShvhq2U7DO7dmyapIMfePF1XsMdfGLzcfrM133KUFeY5SnVLILQaw177YG6gMMmTWQ1WB+rlMHW8x+A9eNlE3ERxJcCgUx4hbzrUxuefPvlcEba72U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nyla7Fjd; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nyla7Fjd"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d3d479b1e6so8444138a12.2;
        Tue, 14 Jan 2025 13:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736891850; x=1737496650; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hQu9l4If54VEx/qw1TONKfUdVJ9/1OBl33V3eKp1goI=;
        b=Nyla7FjdyWIqatwColAvhvAEGLj7r+0UqljkFMpFuI3UpVnErcriuVSjgCgyCIf+va
         iZofu0bT8vkfyl3JIbztgIW3c5TAfbrvn2QR1u/yEMcbU3y9b38a3ZqBrjxkQETnh/78
         5aafLK9HVRzDjaGbWhGhMIvaHwFrN7VksCUxnhi4gIfPnirrhejh/6l5lfXAIzqsHT9V
         K9dwFX9ODnCFYZrZtR+sKayXpPRHr8+Ca6YUI51WNQycQAFkJ+/bONF83fv0mqWYa0Sn
         dUcG5gsmHEfAtbiMf+o4UBK6DSpoNSRCbWBtkBRItZrPZ+g0qjeefBbpuPUcVsKBwIX7
         7eRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736891850; x=1737496650;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hQu9l4If54VEx/qw1TONKfUdVJ9/1OBl33V3eKp1goI=;
        b=mETZpR8XcR6lmoEx3qQmWIMutKBIGUi/r5q/VUjDUO6PDZ8fGSs2JVjbpHTwB3kpR/
         wdbjAxZ2NPGrdh0sJRK8ILK+uMZWEf6HxdTeFdo0kWLef2CCSR5BltaGTDMB07PpAAbf
         pr86+GlMqXsIMthzZPYkkH8hojQ8h1I1fHw4uVTPST3nBuRemKnLw3liQz2XEdjq0TcR
         PeOMgZz8qUQh9nRp1mtNlmST9DOEdObEiLf/xcOvhrMWyW9FGXCNsZwRfL8yGs/zAwQK
         QZof/GQJwghVdHQvOuVgx5UPo1zGGohKfj5+XIG2+IKi1fcOjqB9uYTlYPILIW/rgAbb
         W01A==
X-Forwarded-Encrypted: i=1; AJvYcCUvT/eRmCb+ZG4NgWl4ueLxIC/EBO+RNKksruRQWzHo09AKt2xmpR+8ABfV5VTRxUgmeveA+RRWZfegeQE5BYXAnTo=@vger.kernel.org, AJvYcCUy1V0Kfta9EmwnDig3Lfktre3H/tuqulCllneku5bRsWjt64vo4JvexMhhRqEGhrcvfhZcqCP6H8JtGho=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVxWwcpLkmA3ergDMdoFa8rP3qIWpVYTpCzrE+iLcezasAvJYG
	5Xw91Plp5kuMtYvOC3wD7REqGzMgu/I8AEr4tb6I12pPu7rOOdi2
X-Gm-Gg: ASbGnctCO7klElFXtE/ZVdAQ38IVZh6TwPsc+iK3+l+IXZCCCE/GmrIK5rjrou8Fj++
	iMFHaQoBvLBvm/I6mmS3UUFL/rTDNZ+arAeN9+QHc16cDfToMB3rv9Pu6fTb1+H7SDUhr+YfACm
	VkYwCeEJvi/bHfpPfp181NXhtxuM20fgwSbqgLIKUSfu4P4xU3wQKYk206rZB0WRwSgyx6P/bpM
	IqchUIeoRpXFuBuwCIU7Jb3aLbhPBpXAPCFZt7sSnRr1FzTzKf8fdZRFsl8wDXKSC2+pz6EdO0U
	LyfHY3RepQ2JyR1MpTjkgTYUFkZ9vshpH0E=
X-Google-Smtp-Source: AGHT+IH2uBguYrAt8RmEQaVYzAmbMVFnqhUDBVbYGhqIhJtoDuRg3mXoojY+VnqzpULof5Ie/4Sl9Q==
X-Received: by 2002:a05:6402:26c5:b0:5d0:d491:2d5e with SMTP id 4fb4d7f45d1cf-5d972dfff56mr31360609a12.7.1736891849618;
        Tue, 14 Jan 2025 13:57:29 -0800 (PST)
Received: from [192.168.1.107] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d99008c523sm6730831a12.8.2025.01.14.13.57.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 13:57:29 -0800 (PST)
Message-ID: <15e9931a-b817-4dd3-abb6-9718e002c6bd@gmail.com>
Date: Tue, 14 Jan 2025 23:57:27 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] soc: samsung: usi: add a routine for unconfiguring
 the ip
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250109090325.595475-1-ivo.ivanov.ivanov1@gmail.com>
 <20250109090325.595475-3-ivo.ivanov.ivanov1@gmail.com>
 <81ff734b-7a5e-4c98-9df2-9b65996fff78@kernel.org>
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <81ff734b-7a5e-4c98-9df2-9b65996fff78@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/14/25 20:03, Krzysztof Kozlowski wrote:
> On 09/01/2025 10:03, Ivaylo Ivanov wrote:
>> +static void exynos_usi_unconfigure(void *data)
>> +{
>> +	struct exynos_usi *usi = data;
>> +	u32 val;
>> +
>> +	/* Make sure that we've stopped providing the clock to USI IP */
>> +	val = readl(usi->regs + USI_OPTION);
>> +	val &= ~USI_OPTION_CLKREQ_ON;
>> +	val |= ~USI_OPTION_CLKSTOP_ON;
>> +	writel(val, usi->regs + USI_OPTION);
>> +
>> +	/* Set USI block state to reset */
>> +	val = readl(usi->regs + USI_CON);
>> +	val |= USI_CON_RESET;
>> +	writel(val, usi->regs + USI_CON);
> Also shouldn't you enable clocks for accessing these? They are being
> disabled at the end of exynos_usi_enable().

Hm, perhaps. But I find that weird, since I haven't seen it in the downstream
driver implementation.

Best regards,
Ivaylo

>
> Best regards,
> Krzysztof

