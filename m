Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C52124291F;
	Mon, 17 Mar 2025 14:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742221439; cv=none; b=EeaLeqdP2WK6MXZrkxt9VXKq4YpoFKo41s05cjRDZuKdG1c+lDYXI5IZiY2usHgfX/FsgOu1hh0a00uWUtZtJ+QBoJ8oAHGHo0sI6jAXbKadUNRB3/kuHA31+lY0kFWjtr8smmuSZyTgNexTB8jIThFpjJIzqcee2/ApjE2T3U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742221439; c=relaxed/simple;
	bh=bGVpXdopmBe2cylHrDEfMEXNLompQYGUMWrvVrieX0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kwxTmVwBiTowIejnRnPATTcoRmLGjsj/3KvKYtQuQ9OFaaTzxeTO+JIDi9BcpAUJfwdqHx0oxItJy8vPEJClI4ftMVRva1etySznh4zgV1+lUijufrj+ubEOxOiGyJTnxQL7FmT4ne8Vv1wART3XGXLrWu4m9aR1gW9jaaQOAPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KTkLWRKZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KTkLWRKZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57E5BC4CEE3;
	Mon, 17 Mar 2025 14:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742221438;
	bh=bGVpXdopmBe2cylHrDEfMEXNLompQYGUMWrvVrieX0k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KTkLWRKZ81fEfBmFQKPqM/O1sLvfmcbuBkWauO0JOZE4V256OeTKzeTu1A4co6wSX
	 rr5t9A/nbmr9GDHwC7MwymfGJijiyInuq5IJr6T2XUdK5kVYyCDVHspkQTqjGcWzAk
	 +WhpRoAGmZL/wPxMExPQwsN7VBzPkrBg+7hYKg/5iOlf5FXaozsmNVh98NgSaWuBl7
	 sZ/crBdNlVbFGtEmIt0UIATp+HWxYBBQEvHGfCRFJKXLBlQgv8WAKKAydOdP3fo1cy
	 3vlJHX5VgnQ5qZkykonx8VPqVVmmbtPW3pw68KpzAhTe6Yqs+tRaW7lP3zvcwDkqbj
	 CssJmAJb/F1qg==
Message-ID: <3a25e4f5-e017-4d30-92cc-62b9ebef1d5a@kernel.org>
Date: Mon, 17 Mar 2025 15:23:52 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] firmware: samsung: add ACPM debugfs support
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: andre.draszik@linaro.org, peter.griffin@linaro.org,
 willmcvicker@google.com, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250224-acpm-debugfs-v1-0-2418a3ea1b17@linaro.org>
 <20250224-acpm-debugfs-v1-3-2418a3ea1b17@linaro.org>
 <005424c2-7fb7-48db-b38c-c62f9f8b3897@kernel.org>
 <696494b8-14e9-4b9b-bf26-2a94a915b2ec@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <696494b8-14e9-4b9b-bf26-2a94a915b2ec@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/03/2025 08:11, Tudor Ambarus wrote:
> 
>>> +		dev_info(acpm->dev, "[ACPM_FW] : %llu id:%u, %s, %x\n", time,
>>> +			 log_entry->plugin_id, (char *)&msg, log_entry->data);
>>
>>
>> I don't think these should be printed to dmesg - these are not system
>> logs. You either return the contents to the caller's read() on debugfs
>> entry or, if this is anyhow crashdump related, it goes to
>> pstore/minidump once triggered. Or to ramoops.
>>
>> Depends what these logs are (so please also explain what do you find
>> there in the commit msg).
>>
>> Maybe something like CHROMEOS_PSTORE?
>>
>> IOW, if enabled, this should go to ramoops/pstore unconditionally. For
>> runtime debugging this should be returned somehow to the userspace
>> reading the file. I think usually debugfs and sysfs is not expected to
>> provide more than PAGE_SIZE data, so this second part has to be
>> rethinked still.
>>
> 
> This is a logging feature, it's not oops/panic related. These logs are
> referred to as "block logs". A "block" is the start of a mailbox command
> to its end, so it logs every ACPM mailbox command issued to the
> firmware. After each end of a block, we see the state of all regulators,
> frequencies and devices up/down extracted from the block.
> 
> These are indeed system logs, and using the dmesg ring buffer seems fine
> as we typically care about the recent logs, we don't care if the ring
> starts all over again.

I claim these are not system logs, but firmware logs, thus dmesg ring
buffer is not suitable for them. Where do the other vendors log remoteprocs?


Best regards,
Krzysztof
