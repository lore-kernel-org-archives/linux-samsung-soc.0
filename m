Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6230B1DFD96
	for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Feb 2025 09:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738832538; cv=none; b=PIncG0JApsUyYO16WikYQ2Ehl7ItibiOmYw/Ndvb2t4MH4k+UGv3OFp8rDUmsGoKPHeV+TpBxrECkHqFUzCj3r6e6PX/pwqSGLnXTCxXYxAD8+LM63C6uzDfs6RN/cE2Vvuh8k8N0Wfefm2Rw7Ju0uU6nXdDlH3G5GtJ39b3kGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738832538; c=relaxed/simple;
	bh=UAXyu6RSQTWRgiR0k2OETrZ560YXgX45bKcxld054/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kDKyqiwU5Dy15aKb/nOhjle/DJ4HHd0DhqvuyUiTm8g5RaqQ8N4+giv6NQnKkW8xAkRR4Qbn3mPXnmJsN6WbkwWQ+GVOtkTAQiEjMgfUglB40tNTCW0HcSTX38/WYMe4sfN0Vu710Cx0iPSxfknXZXJQcN/Y/GUfFh6uQJlX7p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jqjdhtwo; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jqjdhtwo"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38da72cc47bso469045f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Feb 2025 01:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738832534; x=1739437334; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZPzy1Z8VbxCdd+MyKxJcvToGmvpLxSPc4zUEljsmwWY=;
        b=jqjdhtwogrIdhNoEmFMU5484Um0Td/Vy5MBmHm+kN7yfLHJAEJY6z1GR8UPZTE8hvw
         gKjPl/tuAGdH8l9kdFhgxfpWaoMRYxxH5NRZrJBDgWsKlJfP+W2jx2lYpbpiBdbvLDCY
         CCmrS05HGXTFoCSUp/BVwL4uGSyR8gbIb9jDP+hrbxHNt+8R5inm8C/7sgBsYZ06A7hO
         MDvp4y7EyjiT421hrX3SAjMLmWsQ74UDbjzismt/7Wos4iLsZpetE12OS6LNUzkd1iTq
         5+KbHlkZ3KTyKM+iY1rpDHSPQ7/jTio2wWdY+Fe1osEVLMfnzGZrSyIrDUjSrMkVuFn+
         ddDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738832534; x=1739437334;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZPzy1Z8VbxCdd+MyKxJcvToGmvpLxSPc4zUEljsmwWY=;
        b=M4QYdqaEefJR46Ky4UMgjuF5SoeFiNZhrabAEdOOCwt6zvbvMJj16y/OIuCoBg9qKM
         ChGtHy2HydIVDSxHpBM25tdKg04ToVcdYvg7RVsOR80kXiVZfTTgOl/VSdlZinv6JZLX
         xg1JGdyJaQnquKvap4fFhg89yBKTE6TDDtlDH8NOdtvjrHaliukN7tMjUSdzn1hKYIe+
         /mg+DuBtDU8/qKdsH9efDHEumXwQ0hDQ/3ib7PYUXN1LOoJmMCAawvZNx8MhQ3puLADv
         uKmdbLqYwYTn4Nq30O7YsUtv4I+mXgS/bCxlzm0BAh3v7cUBoVWJJpYNTIH1rblra3u5
         ayJw==
X-Forwarded-Encrypted: i=1; AJvYcCWfZpOsp8Ys+muJTUFdQHfM1oLDs4yhfJLjTCYTo/0m0tGjuqGcmMMpSokxP0F56WZAmxKU2K3dvQOL9b1dcF82cA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBjV8skf+nxYRyfrB1AHNbwhKG2z1V9/FD/NIcs1C9Ywtfy5ud
	GqmyyJB52gnbDE6+0A05Jj6ln2kbvy20+Z9QX5BM1NLiULVL24Skb+2koUoSvKY=
X-Gm-Gg: ASbGncuwGiWnLByMfY4d9HfmLSUhwMpE0ljebRoUF5gIvPnPjgGU4/HEuxf9XrXUJm5
	dQXOTfIpBkFw6rjNsR5sXrytGbBoMilkb3K42O5la3m3pSYFDer5CD90XfexvClfqqcodkw1Wwu
	dSh2kyZ+1Zjll6c56kTsUv8AreJNQjH27d6I01nqgU2wd2ngWCV9w2rZyfr9GxnnX0zyvvKt7Fv
	pr+qqNylsgaHiZRpbpI4UUPF5OrgXhU6GSClnvj8ZqSVF5PM+PhWSKBjfAErmNtdrMcHj/AXTmo
	Mb1UCWGVNPszURScqLtgOFVf
X-Google-Smtp-Source: AGHT+IHb4g4QZ/ozYPa6vvDOHmEuKFym5OBNx5m4o6Nj8tDENoav/RWlv4fqN6xllweSDexUwkeGoQ==
X-Received: by 2002:a05:6000:1a8b:b0:386:407c:40b9 with SMTP id ffacd0b85a97d-38db48d247amr4779823f8f.28.1738832534542;
        Thu, 06 Feb 2025 01:02:14 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbf6e4a4bsm786590f8f.92.2025.02.06.01.02.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 01:02:13 -0800 (PST)
Message-ID: <1fa54c76-d82f-483b-b577-79322908fabc@linaro.org>
Date: Thu, 6 Feb 2025 09:02:11 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] firmware: add Exynos ACPM protocol driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com,
 peter.griffin@linaro.org, daniel.lezcano@linaro.org,
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de
References: <20250116-gs101-acpm-v6-0-e3a2e1a3007c@linaro.org>
 <20250116-gs101-acpm-v6-2-e3a2e1a3007c@linaro.org>
 <f83ccdb0-4d22-441f-9311-d9a2c8cd3493@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <f83ccdb0-4d22-441f-9311-d9a2c8cd3493@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/5/25 4:52 PM, Krzysztof Kozlowski wrote:
>> +static const struct acpm_handle *acpm_get_by_phandle(struct device *dev)
> "by_phandle" takes the name of the property with phandle as an argument,
> because otherwise you do not have here phandle part at all in the
> interface (see syscon API).
> 

Indeed.

> Other option would be by actual phandle - see of_find_node_by_phandle().
> 
> I would propose in such case only acpm_get() or maybe better of_acpm_get()?
> 
>> +{

cut

>> +	np = of_parse_phandle(dev->of_node, "exynos,acpm_ipc", 0);
> You need bindings for this somewhere and fix the underscore->hyphen...
> and vendor prefix. It really would not be accepted that way so please
> post consumer bindings anywhere.

There's no consumer upstreamed yet, I don't know where I shall specify
it. How about keeping the function name and modify the declaration to

+static const struct acpm_handle *acpm_get_by_phandle(struct device_node
*np,
+						     const char *property)

This shall be in line with the syscon API and doesn't force me to
introduce bindings for the consumers now.

Thanks!
ta
