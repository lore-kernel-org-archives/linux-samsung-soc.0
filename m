Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E502018991E
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Mar 2025 07:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741763480; cv=none; b=a9W2KGgeH4q0gtfosr1mqZviWlHuZ8up79VQ72AgLOhTCdOkF7qipcM63AfgSrU3/sw1vGdt5WAoHRAtOj8de6qen+zZO7AMc8B7q1EiPrqeRDyNggSQ0XgMXeyjxQQTBD2O8rzbntYEEOoj74zln5Uv8xU0rT0MAM4N3HqFUa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741763480; c=relaxed/simple;
	bh=e7YGaKCY83HR3H/M3ccJe04aTUf4UGlWCN3ibpzLC2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q/Sp9tTL2hSngEEHkL2NeyH7PbqLJFDf1y0arxhahDhjJQYBQS7W8DKp47m/poBCjqvsXt8+KsxH04GPdr99O8JNiskxWR8HCNtUw1HzdzgAZ3SXxIl9f44rs5CyJSq4S3Zpd6C/9n84t8gRdh1OITTIHlTY4BIsxEjT5ESxcgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mixlnsjV; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mixlnsjV"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf257158fso20506915e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Mar 2025 00:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741763477; x=1742368277; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5JQMc0JK4aWXwOcpwJILt54UlEg8yqOSNknC98xAh/4=;
        b=mixlnsjVDXBfWhoqmax7LsRjVdz/9BeWYTlRIzu0A2pQ1++m3TkNZVQPu0EGwDoKmb
         1SfoAGny+iY37/etUIVa7wvCKP5vwwvnmEuGvwImZWDf859kYwPhdjqRDawwSg6PdQYb
         XWEj2SKruc4eimyZRulzN8a8kpLDGxKR3C0tyiWEUY1L/4hp6w1o98SMn42Ht7eBYqTH
         T5JPzSv9JrLYwOApeW6yyCZp7de7mfWQcMGcUnNmOWTTm8lTxzlMSzuVL5KcZ829jAYp
         4JkGgztM+v3ws0p+H2NuuBd4XSuqZ/CD40CY/JQAHrmXV0feQQmwTPblpYMgfw6pkDYr
         r5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741763477; x=1742368277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5JQMc0JK4aWXwOcpwJILt54UlEg8yqOSNknC98xAh/4=;
        b=SXGaNZ3GwstrxCu9quyQO7U8KBvsXZotksrkStQXsRKIrdcmdZV/oisLif+TKcuCUF
         n/6nkwVJQ4xiVlEqjTKo/nR1ZrUY8hO+99p35pju3Tr/kUeQFNpGKqqhqm8YkA7MVNRv
         N+RTYN0YzFqq+k3wc5ZHcpBEppaCwVACDzUIpMOnxmS6VC0kjLejYwj9veLOoFKfzYNd
         wJdjjuTr6m9siESjeI3jySz19oCws5t3K1hJ+ZR7k97gcGfzNHBqcpU6GuYSSu9/Kqyh
         Yt132SoriGHup+rOu4anc2Fw84oIJdQLdkyyTmZaLRdPEZ5zRZFynfoFie3PgU81/mf0
         XG9g==
X-Forwarded-Encrypted: i=1; AJvYcCV5+PaNpi/pXLhRxRkkfeOoDluNurLVUszUeghd03rQcCeSpehHCj+8eBd0L/kB4drXlGDJLNnkHpbtE8LRWAgxUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLaADPUj+MEEivMdW1hg4IxWH6QebTj3oaQW6fTnPhinaUSWhu
	g0HzPsaNcJ4dyBtP0H+G+sj9HERjygplkGgBriBKyvvmKIS3PTGluvGVKpnqDj0=
X-Gm-Gg: ASbGncughSsNH7V2pNFvsqk5ZPt5H8RIyw+lbzFLhQ4TgYZg+WG8r12CN040yRDSOw2
	8eTk/qWFWxZ/LaQay5UEpKv/iqn7SqYJqXgnNb2Z5L+3KH0As4Q16Be9/sb0aWY6EZWvDa7SBNF
	i6liJGghdixGjn/JHLTZH4AAHo28r3vTA2q5V2DFC32q2GX/5yXTJkeqmraVbc7rr8xWqqJ0fZm
	nIaaqBQKc5gSANsQ002OD1eVYWyCFosuZym8ExA7c8lfN++oVWc10aqMuA5mUMruuJ5iIpu8wBd
	n9Rzfl/GoaIsEDwdS29bvRNY9AhaQoBMfhSJMtRasrKG3muft0XsLw==
X-Google-Smtp-Source: AGHT+IE7CFqZ+AbL0Q4cb87iC4MZdbphZY+v7bJCpcP2ShGQtgySl1i2tbL1wMwKn/N8LmsPbsCRyA==
X-Received: by 2002:a05:600c:19cc:b0:43d:4e9:27ff with SMTP id 5b1f17b1804b1-43d04e92a66mr49813565e9.7.1741763469875;
        Wed, 12 Mar 2025 00:11:09 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d0a72ec8bsm12210285e9.5.2025.03.12.00.11.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 00:11:09 -0700 (PDT)
Message-ID: <696494b8-14e9-4b9b-bf26-2a94a915b2ec@linaro.org>
Date: Wed, 12 Mar 2025 07:11:08 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] firmware: samsung: add ACPM debugfs support
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: andre.draszik@linaro.org, peter.griffin@linaro.org,
 willmcvicker@google.com, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250224-acpm-debugfs-v1-0-2418a3ea1b17@linaro.org>
 <20250224-acpm-debugfs-v1-3-2418a3ea1b17@linaro.org>
 <005424c2-7fb7-48db-b38c-c62f9f8b3897@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <005424c2-7fb7-48db-b38c-c62f9f8b3897@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Krzysztof,

On 3/5/25 7:37 PM, Krzysztof Kozlowski wrote:
> On 24/02/2025 09:01, Tudor Ambarus wrote:

cut
> Please add something like above also as a comment to the driver, so the
> interface will be documented.

okay, will add.

cut

>> +static struct dentry *rootdir;
> 
> exynos-apcm.c is not a singleton, so neither should this be. You should
> create entries per device (so with device name as subdirectory), just
> for correctness.
> 
>> +
>> +static DEFINE_MUTEX(acpm_log_level_mutex);
> 
> And this also looks per-device-instance.

okay, will create per device instances.

>> +
>> +static void acpm_log_print_entry(struct acpm_info *acpm,
>> +				 const union acpm_log_entry *log_entry)
>> +{

cut

>> +		dev_info(acpm->dev, "[ACPM_FW] : %llu id:%u, %s, %x\n", time,
>> +			 log_entry->plugin_id, (char *)&msg, log_entry->data);
> 
> 
> I don't think these should be printed to dmesg - these are not system
> logs. You either return the contents to the caller's read() on debugfs
> entry or, if this is anyhow crashdump related, it goes to
> pstore/minidump once triggered. Or to ramoops.
> 
> Depends what these logs are (so please also explain what do you find
> there in the commit msg).
> 
> Maybe something like CHROMEOS_PSTORE?
> 
> IOW, if enabled, this should go to ramoops/pstore unconditionally. For
> runtime debugging this should be returned somehow to the userspace
> reading the file. I think usually debugfs and sysfs is not expected to
> provide more than PAGE_SIZE data, so this second part has to be
> rethinked still.
> 

This is a logging feature, it's not oops/panic related. These logs are
referred to as "block logs". A "block" is the start of a mailbox command
to its end, so it logs every ACPM mailbox command issued to the
firmware. After each end of a block, we see the state of all regulators,
frequencies and devices up/down extracted from the block.

These are indeed system logs, and using the dmesg ring buffer seems fine
as we typically care about the recent logs, we don't care if the ring
starts all over again.

>> +DEFINE_DEBUGFS_ATTRIBUTE(acpm_log_level_fops, acpm_log_level_get,
>> +			 acpm_log_level_set, "0%llu\n");
> 
> I also do not think debugfs is a knob to control loglevel of messages
> going to dmesg.
> 

This debugfs entry controls which SRAM log ring buffers are queried -
there are 2 SRAM buffers.

I guess you thought about the "logb_gprio_level" entry, which controls
the ACPM print verbosity. 0xf being ERR, and 0x0 all logs. The firmware
defaults on printing all logs. I can't tell right now other way of
controlling the logs verbosity, maybe via sysfs, but it's equivalent and
with more restrictions. Or maybe you think that I shall always print all
logs?

Thanks,
ta
