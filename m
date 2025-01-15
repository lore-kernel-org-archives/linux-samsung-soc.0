Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00821E991D
	for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jan 2025 12:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736943094; cv=none; b=thtZZByR7Uume9B9UjMt0hGFU/SH7pBJIPlT+sP1kfWlTmXZYJU1jWaog+vdQqUAmk6eX1iu6UHM9SP/Mza/O3B+dxrbCnaOGQRi8of/PIeFoCTBph9KMD7omOPZZhB5e1sroqGREDgsiu5Qfac/Fe/n+tTdAG1+b8kheSafw4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736943094; c=relaxed/simple;
	bh=tqsMzLKy6bs61gSygcl7f7EAPGHfBJv0JgULJ1Ym7Fs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KwGGWM2tV5eJbm3GXBvFCRDRn8caK69QjHUEDMMJUAaLYmhy7HrMz0wRw9k36E2y+oRgrXsNDospkGL5fvC0BSKZpJ5cVkuLtMKu64c+3VJL2jHRRkJOoscvBQb7rzvRc+8PFHLbeTgXwbdvWVfZTZ+hwfZJj1H9ArgUQJBPKaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uqm+0PNP; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uqm+0PNP"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-436a03197b2so46912235e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jan 2025 04:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736943091; x=1737547891; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bH+qFIkzfP2ZdF0jKFR3toN5QXpPpNWnsi9wML2k+Rs=;
        b=Uqm+0PNPfVZD3mdKXZvFxy0tOjOmM1VOCjWw06tAlfOiw42Ssa/L70oDOy2EdVYGhN
         kyt3+BHSoiwLOlI094uLsfeH4u8xyzvz0I0E1JS9OXcRGxdrve5syCQk/IcInOF3DM1+
         BmagqKpLTuc9xe/Yc3B/452fo7mvIkb+/xWS17woziBdkdx31S67NJjantfhsL3zUKta
         I3uU03v0SrS9k/vc04F/8fRdCwRWIxoqFq9h4javXkPYAzYWFbAONoe7gizL+7TGEm2D
         drdixxE74uZGdXhjQT6FlW+/5vAEvvNDro2NQXTnRJ4VzztrDMMW9MupUJgBrlxqEJK9
         MQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736943091; x=1737547891;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bH+qFIkzfP2ZdF0jKFR3toN5QXpPpNWnsi9wML2k+Rs=;
        b=N1Vw6AmEi84vAS5IzDuyJzCPZdEOitlrHbCm2nLYsMfNIfw4huVZ51VchQifsy8W7n
         FDTUG/NDqf5ItAjEUuFzk7xBfk8+B6zb9XovwJTqIg5cLdxVTR6uZETI0UNNYwWiQiq8
         stimsY4Wydxs7WVKyd/Uw70JzfsLC4Q9g5W3mXzDqpz6MuQSsiZExXx9PJdXRmNi1ZDe
         Xv2IuJopZi8GBqmzvPw1jItQrq9cgNO+JZfVUxRx+f8lpAO84NRNZuOwEejcawy0qoP9
         EPLxBBnSwaVKLTMbZs/OVCgCXzji58ZaXxycLsy0yE7dxOJVwmbO7My9bT0UjhSH1miu
         qpjw==
X-Forwarded-Encrypted: i=1; AJvYcCWz1FUQHBRrd6iLPPf6+iwDIyYfSsWV3efMxxzrymtPCD+gnfjgSHYT5dr38We8sf54HBN8izGjw0MQr9uP3nPfOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJdlPMvm1Dmi/JSLOoUlWxErioP2Ml0D3AKIYi/Asdv78lm6Nl
	vC19UcMzHVYNqPb7brUycgZmzHbwLF4x76NCBMPen3dg7kwIxv0c0qyJLQSqv1k=
X-Gm-Gg: ASbGncuHLRAYNEmZ8GGhNcghQEc7WmdE7Fq2cwDoqBWxqBPv4JVmD3OQof97SAQ+Vgm
	ioZeEpGoaoPwNK8orR25ZTAcCq/+/mbgfA8vwN9SkZiXQx3gRSNKs9Xn/uxQvhG5ajx+Tgc2lU0
	mGLifqKpSUcGoFP3B4iktJePxkfqGskofdAg/wVcdWqDiBIS0tlnAPPeTNRaqcXUQutyHjPpeUS
	BMOv7JiUTJjpOYgnoO8AgMyMICMRs9wqKkYng/c8CpbrPHPjKbK+B1bUyxYB6qedw==
X-Google-Smtp-Source: AGHT+IF67pKs8kpi+olSNlNu50s1yq8/8pWrqcBOcbOQ7vJkysvgsGhycYNComXSpVL3sZaZf36tsw==
X-Received: by 2002:a05:600c:3593:b0:431:6083:cd38 with SMTP id 5b1f17b1804b1-436e2696e93mr232743555e9.6.1736943090907;
        Wed, 15 Jan 2025 04:11:30 -0800 (PST)
Received: from [192.168.0.14] ([188.26.60.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c7499558sm21582055e9.8.2025.01.15.04.11.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 04:11:30 -0800 (PST)
Message-ID: <41430496-14e9-4b17-9884-0e44e1731135@linaro.org>
Date: Wed, 15 Jan 2025 12:11:28 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] dt-bindings: mailbox: add google,gs101-mbox
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 andre.draszik@linaro.org, peter.griffin@linaro.org, kernel-team@android.com,
 willmcvicker@google.com, daniel.lezcano@linaro.org,
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de
References: <20241220-acpm-v4-upstream-mbox-v6-0-a6942806e52a@linaro.org>
 <20241220-acpm-v4-upstream-mbox-v6-2-a6942806e52a@linaro.org>
 <uo4zvw4sl6uxsj2ewvoue7l3obugivq5z74ukwnd4sj3ndtwhu@hxxque3r4nvb>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <uo4zvw4sl6uxsj2ewvoue7l3obugivq5z74ukwnd4sj3ndtwhu@hxxque3r4nvb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Krzysztof,

Will send a new version soon, replying to confirm that I address the
feedback received.

On 12/22/24 8:44 AM, Krzysztof Kozlowski wrote:
> On Fri, Dec 20, 2024 at 01:49:57PM +0000, Tudor Ambarus wrote:
>> Add bindings for the Samsung Exynos Mailbox Controller.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  .../bindings/mailbox/google,gs101-mbox.yaml        | 70 ++++++++++++++++++++++
>>  include/dt-bindings/mailbox/google,gs101.h         | 14 +++++
> 
> Drop the header, not used.

not yet used in device tree indeed, will drop. I'll use driver
definitions for specifying channel types.
> 
>>  2 files changed, 84 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
>> new file mode 100644
>> index 000000000000..a1fbc3b2b9de
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
>> @@ -0,0 +1,70 @@

cut

>> +description: |
> 
> Drop |

okay

cut

>> +examples:
>> +  # Doorbell mode.
> 
> Drop comment, not applicable now, I think.

okay. Thanks!
