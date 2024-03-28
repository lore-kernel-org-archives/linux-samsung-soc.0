Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4508B51C46
	for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Mar 2024 11:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711624464; cv=none; b=VJy5GVN3xM0nG4w92vnQ5q4mQG9E+9V4Q3ceHeDevKhyjzYb2vV5qYBcHtefiWsYVBaptVYRvJTAiU/sEYOS76Pvw7rOm5fd27D2oLrSwMQQlbAULKNNDRLrBz+SiozytpsnZNnWlVZ4fmUSvSUYOtSKJVJv+ry94aExupnf/rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711624464; c=relaxed/simple;
	bh=8YPbYAdeFXJMdfqc/yEaJhJyvb96epmPZhyIDWzonCU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HAYQXaUEG3LOWeLwlSQhwTRzz1hdyas921EML9Tlb1zz+7iRpqfJZGh+OudhkLOuZ6qBK0UixQVHxkGStim6XaLojN2dHdP6msBeQjJsL7ZPj7DOlTYbRTFgy/OCaLzozRhiIPmyfHtzp4Q03sYSLQBLhAAlyISLbzb6mKu8OSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JiCrcj7M; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JiCrcj7M"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-56bb22ff7baso907344a12.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Mar 2024 04:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711624462; x=1712229262; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ALYFsv0MuJ1c6KwsM480AASud0mpy25y/UnPkQ1lfXY=;
        b=JiCrcj7M8ECjYSbBeDhUzbW2DHgi1wDdBCUtU67+LgdwvS4ywRWfiqMGi9Xlhy6Pss
         F5Hj4MQpHS9qUsf94oi59RnsjkxIDguxD/46PMaDTVZoNK/4zMlln8zj/Nk/ISJupWt9
         HabjXrkXBCtMDQQ1qkc4HsoX4y/TZAuELgj/NiZWU9CTk06DN1UvfMwAWnYr0XJisQe0
         gFXEu4nMUw1VWHhnUFJnDMljxT+mXXk0k3IDCmvjLOaB3iKaQfYiqmC0lszVB/eHO6pj
         kR+b9zWifOH0OgOQ1T2eTqPwT+YVZ+c5IdlbNpadxPIu5aHvWBuFXEKU0UkzgqjQbTBR
         VLTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711624462; x=1712229262;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ALYFsv0MuJ1c6KwsM480AASud0mpy25y/UnPkQ1lfXY=;
        b=geY2aqwcZe6K7eT/4gmXFt/pqbvU2GDnBz1HF/KYNLC/4VlrBtdMGkHTuO/zRSTwPd
         0mSpAMbJU+mYLwaZ6SyW0dFkOjpBzCCM2QaghmuSgKNL25LNVFf3O0bWFB6H3k3Gd4jX
         kyGPBT1NSCYvK75cgrOvLgYF0lhUf76vEnTYxmx9SUCcrYbFsVTtGbvQEw/Kw2oROQq/
         XMpeBsr1MmxmgujDlyZ7RP5zvr6ZEo6vtPAMC1Nquzh8txsjNXN5qqYbeMogozauwLU/
         xf5Z/iYz9X1aKQYF40a9ZA0eCaMzLlNRZCg6sNy0KP1eaZTFfgPDXRtC5mZzt9ZXfDIh
         Ee1A==
X-Forwarded-Encrypted: i=1; AJvYcCUUBhC4PrVhOz+7SvWeoJ6GIc5MZSeAWR/tLVB0AI3c79NVAz33TvNoOnkXolwxvnEOQCNDan/BoqJJLgFjLdsKxEs3ez2XrsofWPKK5wx3Bgw=
X-Gm-Message-State: AOJu0YxKCuF2Slj3KDlU8SgWUTCZZSAt7FMDslfdQfcNqF5FrSynp6vl
	lEvib16dvZF4BKuyEuEKtxaqwwrAYDindbthJQ4x/2D9hKPyV/THL/OT9qOfOl4=
X-Google-Smtp-Source: AGHT+IFDoU7C6TXJhg0CHW0lwJhkfKI5Q9o5dn4LDPIkxj0MNry/BzsX7aYOMOrmAR4h840drOZ3gg==
X-Received: by 2002:a17:906:b057:b0:a4d:b0e9:efb8 with SMTP id bj23-20020a170906b05700b00a4db0e9efb8mr1435796ejb.24.1711624461636;
        Thu, 28 Mar 2024 04:14:21 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.1])
        by smtp.gmail.com with ESMTPSA id ky14-20020a170907778e00b00a47459e7371sm632117ejc.79.2024.03.28.04.14.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 04:14:21 -0700 (PDT)
Message-ID: <5e790f4a-0c31-49f7-8e0d-b87d592f2835@linaro.org>
Date: Thu, 28 Mar 2024 11:14:19 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] clk: samsung: introduce nMUX for MUX clks that can
 reparented
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 peter.griffin@linaro.org
Cc: alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 andre.draszik@linaro.org, willmcvicker@google.com, kernel-team@android.com,
 s.nawrocki@samsung.com, cw00.choi@samsung.com, mturquette@baylibre.com,
 sboyd@kernel.org, semen.protsenko@linaro.org, linux-clk@vger.kernel.org,
 jaewon02.kim@samsung.com
References: <20240326172813.801470-1-tudor.ambarus@linaro.org>
 <20240326172813.801470-2-tudor.ambarus@linaro.org>
 <5af43398-70fc-4598-9453-6a52d758975e@linaro.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <5af43398-70fc-4598-9453-6a52d758975e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/28/24 09:56, Krzysztof Kozlowski wrote:
> On 26/03/2024 18:28, Tudor Ambarus wrote:
>> All samsung MUX clocks that are defined with MUX() set the
>> CLK_SET_RATE_NO_REPARENT flag in __MUX(), which prevents MUXes to be
>> reparented during clk_set_rate().
>>
>> Introduce nMUX() for MUX clocks that can be reparented. One user of
>> nMUX() will be GS101. GS101 defines MUX clocks that are dedicated for
>> each instance of an IP (see MUX USI). The reparenting of these MUX clocks
>> will not affect other instances of the same IP or different IPs
>> altogether.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  drivers/clk/samsung/clk.h | 20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>
>> diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
>> index a70bd7cce39f..01f58b7686db 100644
>> --- a/drivers/clk/samsung/clk.h
>> +++ b/drivers/clk/samsung/clk.h
>> @@ -146,6 +146,26 @@ struct samsung_mux_clock {
>>  #define MUX_F(_id, cname, pnames, o, s, w, f, mf)		\
>>  	__MUX(_id, cname, pnames, o, s, w, f, mf)
>>  
>> +/* Used by MUX clocks where reparenting is allowed. */
> 
> ...where reparenting on clock rate change is allowed
> 
> Because otherwise this suggest muxes cannot change :)

Ok.
> 
> No need to resend just for this, I can fix it while applying. Still
> waiting for some review, till EOD.
> 

Andre' suggested I can avoid defining __nMUX() by removing the
CLK_SET_RATE_NO_REPARENT flag from __MUX() and instead add the flag in
the MUX() and MUX_F() definitions. Something like this:


diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index a70bd7cce39f..fb06caa71f0a 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -133,7 +133,7 @@ struct samsung_mux_clock {
                .name           = cname,                        \
                .parent_names   = pnames,                       \
                .num_parents    = ARRAY_SIZE(pnames),           \
-               .flags          = (f) | CLK_SET_RATE_NO_REPARENT, \
+               .flags          = f,                            \
                .offset         = o,                            \
                .shift          = s,                            \
                .width          = w,                            \
@@ -141,9 +141,16 @@ struct samsung_mux_clock {
        }

 #define MUX(_id, cname, pnames, o, s, w)                       \
-       __MUX(_id, cname, pnames, o, s, w, 0, 0)
+       __MUX(_id, cname, pnames, o, s, w, CLK_SET_RATE_NO_REPARENT, 0)

 #define MUX_F(_id, cname, pnames, o, s, w, f, mf)              \
+       __MUX(_id, cname, pnames, o, s, w, (f) |
CLK_SET_RATE_NO_REPARENT, mf)
+
+/* Used by MUX clocks where reparenting on clock rate change is allowed. */
+#define nMUX(_id, cname, pnames, o, s, w)                      \
+       __MUX(_id, cname, pnames, o, s, w, 0, 0)
+
+#define nMUX_F(_id, cname, pnames, o, s, w, f, mf)             \
        __MUX(_id, cname, pnames, o, s, w, f, mf)

I find the suggestion fine. Will submit v3 in a min, addressing all the
comments.

Thanks,
ta
