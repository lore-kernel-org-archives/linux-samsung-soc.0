Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F561DE2AD
	for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Feb 2026 14:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772028048; cv=none; b=gs8Zqi9pLNJcYcsYIhE3hTP1qk/KB/rbJeSiyril9+cIcfiLG4PAOjWEIZ2G4r4bfL79WeZHekUT8LaKdXh9syH6ReVAeVUMhncmeEx4WQ2urwT7IbCUkj2ujUYO1nEbT0yO7B1pCp9IDAcuwkRFtm7jvL710jeoPgYoaeVB3KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772028048; c=relaxed/simple;
	bh=oXWq7ZKppyOqoUwMd00YgZ68r0g8MU/hDohRVD2+w2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YU0Hr2OrctHL/Pj6ej/gVoLXSOU+0kTE19e1gbgD40pwGH9/DGc1XOC/YV5ujEOZG0hERGEUOoXksT0t+Xjk9bcAgGV40GHKtGmMmgUdJczu+Gc+YBWQZ5FgREGUZgkCGtmmetkJi39YCU46qo/ZmMPQiMqErlQ/h//qpZp6mSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PCtwohfE; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PCtwohfE"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48336a6e932so41194205e9.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Feb 2026 06:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772028046; x=1772632846; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v83nX06CFNonzs3aaey88JZD1iHRYlh5Rsz4acoeN6I=;
        b=PCtwohfEdvCchQQCABCeY8lYDYrQzUvCap6M+pc/f5Xtd8yZ8XPRj658kB7HPnXrIg
         9l0uQfwKzEcMxwg4BKHWVjDH1x3+xNZh3LUXMjYvLR/6bE4cEFl1rUkLd1jpSTXReB19
         qmGazQrohP3AuHigkoudW4hJN48GmSKbc2Vk5ADAIzoPbMw26+KnkYJtiB/I6GyM9gnq
         JeWyJ9/Vlp+AKXr9MpcfhTnRWq1mPbkXFnDAvcpBZb1mfCzPr65HdkhO+kugQDm1rNNg
         YsVt/zqT2WC9rOPDz5TyP9IGMpGUTrpR6mGOp439w93duG/xsPpkJp+8ISrsTcFy5oKE
         CgHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772028046; x=1772632846;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v83nX06CFNonzs3aaey88JZD1iHRYlh5Rsz4acoeN6I=;
        b=c+jRN0oNjXYZV1xfymdKwojbcqME+6GTgGO+UUxFrtxAnISavm8S/a3Gy8FBeZ1PNW
         Q73Qd7rRXdKiwE9HaH785bLzqAMX45IQXS1tW3XlbupVmRHrgr5cjRjj14uOO9Y99u7q
         cJlmd1/TLaiqLGMC4Zc0sQTCX6/ZCKcdV4L3/C+PAP3KM218PTfLokE5x0QVuaWswRb5
         7VZ79EyxLM99T5HV0R4AvEa3kdTbNLyp5xofGkSzf4jqcPZSkvBjyAToVHS/iacVE848
         FF7CgAoFhm0O0zbbSNuJY7YCRmWUtFyYGZpylfcqqSRKSQ7dii/p+2T8axSd5uUvaWf4
         C4Lw==
X-Forwarded-Encrypted: i=1; AJvYcCXef+Giw0m9PCyia3vQstD/ApEZlpY88OudQ9iQv+yQ67aoR45rPfioAc0cPh1QBhEdyMXnZdY5qWdunQ7HslEGDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyseUnfEraLAYA6edO8y4WzZwbvU7ADhNcZv8bch9AokesI8DQ/
	QAdL0vRY4dVsMAF5dTj9VMSwKoqz+RXgdFYnp9EjpkZS6I7Yh0nV1gFAFAizdxI5BiI=
X-Gm-Gg: ATEYQzwPrR2ToHd3IGXZASdapIA7AKX+ow5SG1Tvxz23DsvkxbDzKNwSYkNL9m4cmSg
	ge5FpdHNep1Tu4XPas9awlwAtguujWJz3Stur0KJgx6wAFkO8J0YVS6YIB50aiccV7Q60PQQ6T3
	7KMHnrrtkZFnL8rkEF8aMZ1GNWVXs5dAwRJDVJFr7G9KuqesnfKCSX4Db+3BIHDWRZkXiPclsiY
	URFN6mtPFOgu7LigW+YoceYZI0aubIkD6sNpbvlNAyG7QbDRxmjNy3R52rS6KxBHh0x+O4j7BET
	2qDOE4lb4/hFhX/kaqXfu3a/pS1JNx97cxXefOnKwsPXW7ObGRNg5Sm6godJt/YzDW0VwGydYaF
	GideQqxQ/4y3P2PM8BxB5a9hCfgjT+p9EyN17XNbXTCk10Ht3xZWZoMBNGWUxaixapUHYWsjPk2
	2BmxpMiV//zoHid3QuPi76uHHwMqGNir01
X-Received: by 2002:a05:600c:3e1b:b0:483:703e:4ad9 with SMTP id 5b1f17b1804b1-483c219b659mr8852985e9.19.1772028045947;
        Wed, 25 Feb 2026 06:00:45 -0800 (PST)
Received: from [10.11.12.108] ([79.115.63.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c09897sm35367670f8f.17.2026.02.25.06.00.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 06:00:45 -0800 (PST)
Message-ID: <279baf9e-ef05-4217-9357-94d21bd93978@linaro.org>
Date: Wed, 25 Feb 2026 16:00:43 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] firmware: exynos-acpm: Drop fake 'const' on handle
 pointer
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: stable@vger.kernel.org
References: <20260224104203.42950-2-krzysztof.kozlowski@oss.qualcomm.com>
 <b083e950-f54a-44aa-b587-eec2cc10460b@linaro.org>
 <3e5001a6-ea3c-4304-8db3-bbe616eb4015@oss.qualcomm.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <3e5001a6-ea3c-4304-8db3-bbe616eb4015@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/25/26 12:48 PM, Krzysztof Kozlowski wrote:
> On 24/02/2026 13:57, Tudor Ambarus wrote:
>> Hi Krzysztof,
>>
>> On 2/24/26 12:42 PM, Krzysztof Kozlowski wrote:
>>> All the functions operating on the 'handle' pointer are claiming it is a
>>> pointer to const thus they should not modify the handle.  In fact that's
>>> a false statement, because first thing these functions do is drop the
>>> cast to const with container_of:
>>>
>>>   struct acpm_info *acpm = handle_to_acpm_info(handle);
>>>
>>> And with such cast the handle is easily writable with simple:
>>>
>>>   acpm->handle.ops.pmic_ops.read_reg = NULL;
>>>> The code is not correct logically, either, because functions like
>>> acpm_get_by_node() and acpm_handle_put() are meant to modify the handle
>>> reference counting, thus they must modify the handle.  Modification here
>>
>> You are right that casting away const via container_of to modify the
>> parent's reference count is incorrect, so dropping the const from the
>> handle argument makes sense.
>>
>> However, to address the underlying issue of the operations being
>> writable (e.g., acpm->handle.ops.pmic_ops.read_reg = NULL), I think we
>> should also decouple the ops from the handle struct and keep them strictly
>> constant in .rodata.
>>
>> How about we apply your fix for the signatures, and I follow up with
>> (or we include) a patch to do the following:
>>
>> struct acpm_handle {
>>         const struct acpm_ops *ops; // Changed from embedded struct to pointer
>> };
>>
>> static const struct acpm_ops exynos_acpm_driver_ops = {
>>         .dvfs_ops = {
>>                 .set_rate = acpm_dvfs_set_rate,
>>                 .get_rate = acpm_dvfs_get_rate,
>>         },
>>         .pmic_ops = {
>>                 .read_reg = acpm_pmic_read_reg,
>>                 .write_reg = acpm_pmic_write_reg,
>>                 // ... other ops
>>         },
>> };
>>
>> and in probe:
>> acpm->handle.ops = &exynos_acpm_driver_ops;
>>
>> This way, the handle safely reflects the mutability of its container,
>> but our function pointers remain fully protected.
> 
> Yes, this makes sense.
> 

Will you come with a follow up patch or do you want me to ACK this and do
the follow up patch myself? Both options are fine by mine.

Thanks!
ta
