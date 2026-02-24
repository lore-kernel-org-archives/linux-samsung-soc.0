Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746D639A7E8
	for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Feb 2026 12:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771937825; cv=none; b=W5NfPt1XYGZbyN/r7hvZ8ndNnSaMfCSVz8zdrvG78atzBHOCCIlCGp2/Mg2iqT91HBdJiktMvsZkqfxsjWd5rUDgD3WlXjba6Lla2enuCYVcIkNCjiotq4rrQIjyB5+N0eI0742g0Hpw3PbdvrBcQ+hkct6GllUthmC/eM3Q7B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771937825; c=relaxed/simple;
	bh=cMsxTLX7mj6pDb8n0Mf1TuapNZXLi4VS8lS3vHRnAjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cwIP31fRS3WvLDa/MnMFXVB+vP1gUOZHi8kVmRLpSXE4mwcJ775WNZLijV76VZmLsRIH4p3QY9YXdIQt+IHTYnSMz4Akk/gMcIA+3aeFr1jjgE0BhAnrT0hJcFplMSkqsTL/RmxRKdBjuKknRfVAoC/S9kYCOI839SvPTm/LC20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z3AsRqnL; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z3AsRqnL"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-436e8758b91so3780071f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Feb 2026 04:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771937823; x=1772542623; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P+4mGVj3G+psOD6BQM4z8xFWUBs0ualVLWXw/Lw/cGE=;
        b=z3AsRqnLxLYs5fN3g87J/g9lf+DVPFX0mvgmdvy5FP8/wwg4XJyWPK8cHHkZ7rKD3Z
         Z/6VUFpdla7FqxB66k4GF8uoFBNnfrVJyPhrheOzrFHqXPGWUCQfqrZyxjy3dEZhWrlj
         DcCsvQFHRNKQLKYhf0JwtH+IA28atLUDBm3UQs9FyxC28b7cvirooB9azd4NKrZe6c1G
         Wt6hvnBpibqrrWbZU+QHpjFezEXc+bfj0tis0auwG+U0xZzxtHNylWGcPoxTI2Nbxjpt
         Azvg5cqm8NIYaISWSyXNNZHxOVBFpWhTEDJy7G8ZJfzQMFRUq88cOUU1sRoXTVbVZaYD
         eTbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771937823; x=1772542623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P+4mGVj3G+psOD6BQM4z8xFWUBs0ualVLWXw/Lw/cGE=;
        b=Be6sBYxFlmkKteKzyEhQd4CmvcJvORe3vww8hyHwYBStAgQ7w+EXn5xm1oRJ0rTmXh
         3lwLRgCzvLLGbftzGamrzHs1pWQstbqqH6okv14QVaiY0xXhZlEo8l/QNvF/xn3BLIjD
         Y/sVbHogxEVPdrvl8tfAE7ZpCgPQJn44pUkmROms0dRlrYz6+btUjuf+pIR1Et7i46SN
         I9rKQ5iAQ/mPzuuNMy5SMWm5i7/Ea2wgqZTKvD8FIEKbFi4HeMl3W7RjvjwZmlxHp0gP
         Wuiief4umyN86no6P39QT9nehMcQ3pyjeYNGwGUDY5uFspN/qvyf0HigvrYg/GCC2IRf
         0CpA==
X-Forwarded-Encrypted: i=1; AJvYcCVXCLDAlvCzffWu7Vg5AOrxC1uCmOaOb+ulTrM0h8ArcOj0v26QTC0sJucZP3Qlaz977KpGvXizsjrNFwfadHHLAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTGtvbB+DweGv98zWbcn81kXIimZn1FRjchI33sZqYhDoSz0aS
	+YOBApOXQSfVZlSe0bfk/Px4mnf1essVEmLC9bY6Nt3n43GAXzU7evZ+uvJfApEWpcE=
X-Gm-Gg: ATEYQzxZUp1gCWO3qxH/X1MLYdqATQS/NtUgOHwp9lfDCpnQSeSwQ3twP8amhxVQj6S
	kScKapQ/mN8JiE1o77fi9ldSIYYpwytCRc9OsHttnA4yaP7MIYH3k7Bd4r7WWqqYk/hoHJon/YW
	mAVdqSDZzFm8Pzb1Ymxb4/PTd6JHgxY9f9b7H4IVzXOtOOAAzEfCQsNvs8+saC+c9CQXSXZlDmJ
	IEc4/aaEchfoHGM/AfmI1u23SnZIw32PzoaaSojeE7EMwpgUVGYHhBe5dhPlB5ea18uH1o+qVEb
	piEeCHHO5TxnNSNDvaxCj5zXZyyAFdpaOGzDOi8LqXZcFaYGE6ZBaHj+HOK2d1lB8/r+tBvPxWD
	6I8aFx/IiXVssdkgH8qjH1o6k0QDGLSc8qyTMIxhvbZRAY0OO4Yh89FbmuI3it3cr0i2d5IoM9d
	igsmDFxkeAuR29yzGp4KtEaXg/KsIXlsRu
X-Received: by 2002:a05:6000:230b:b0:437:71cc:a246 with SMTP id ffacd0b85a97d-4396f153cd2mr24591474f8f.10.1771937822763;
        Tue, 24 Feb 2026 04:57:02 -0800 (PST)
Received: from [10.11.12.108] ([79.115.63.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4bf89sm25284611f8f.29.2026.02.24.04.57.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 04:57:02 -0800 (PST)
Message-ID: <b083e950-f54a-44aa-b587-eec2cc10460b@linaro.org>
Date: Tue, 24 Feb 2026 14:57:01 +0200
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
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260224104203.42950-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

On 2/24/26 12:42 PM, Krzysztof Kozlowski wrote:
> All the functions operating on the 'handle' pointer are claiming it is a
> pointer to const thus they should not modify the handle.  In fact that's
> a false statement, because first thing these functions do is drop the
> cast to const with container_of:
> 
>   struct acpm_info *acpm = handle_to_acpm_info(handle);
> 
> And with such cast the handle is easily writable with simple:
> 
>   acpm->handle.ops.pmic_ops.read_reg = NULL;
>> The code is not correct logically, either, because functions like
> acpm_get_by_node() and acpm_handle_put() are meant to modify the handle
> reference counting, thus they must modify the handle.  Modification here

You are right that casting away const via container_of to modify the
parent's reference count is incorrect, so dropping the const from the
handle argument makes sense.

However, to address the underlying issue of the operations being
writable (e.g., acpm->handle.ops.pmic_ops.read_reg = NULL), I think we
should also decouple the ops from the handle struct and keep them strictly
constant in .rodata.

How about we apply your fix for the signatures, and I follow up with
(or we include) a patch to do the following:

struct acpm_handle {
        const struct acpm_ops *ops; // Changed from embedded struct to pointer
};

static const struct acpm_ops exynos_acpm_driver_ops = {
        .dvfs_ops = {
                .set_rate = acpm_dvfs_set_rate,
                .get_rate = acpm_dvfs_get_rate,
        },
        .pmic_ops = {
                .read_reg = acpm_pmic_read_reg,
                .write_reg = acpm_pmic_write_reg,
                // ... other ops
        },
};

and in probe:
acpm->handle.ops = &exynos_acpm_driver_ops;

This way, the handle safely reflects the mutability of its container,
but our function pointers remain fully protected.

Cheers,
ta
