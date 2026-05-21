Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE49027AC31
	for <linux-samsung-soc@vger.kernel.org>; Thu, 21 May 2026 14:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779374991; cv=none; b=slM3AfmRkbTTsPsEPpFE3cR6QFZF5xxJHM3CTJfDj+Z51TY7hUWI/tlwWAsKN1sMovbUJdGCZMapDOfhovi+WwZULtd0wOZuq9OPTrBwCznryMVllOxEikDp1xi7eTY/6nTdOdGXNDzniCQvuAYFxJjByJX095aY6nO3bOT3GDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779374991; c=relaxed/simple;
	bh=kHfW1tkeDqd0FB9koVmxfMJiTZ+rQNUC9ZCer8vMg4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C0n1I8Ju8sWLGOOqRh3ltAaQV3w9SAi+8J/Aw56E8vZ3HrjaW0D4kGvEkADN3aQT0DtP1WpWKL+sBx+nweIdwAGJN5iydNDUNX6GCPlqgXXDItEWebVVF71mmlH7rFZvaCRiAJGCVb/AtSl9Qdjpfy/JD1sG/VW6RqPfEgCRavE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zwYi+evs; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zwYi+evs"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490388fd0dbso7288075e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 May 2026 07:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779374988; x=1779979788; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kHfW1tkeDqd0FB9koVmxfMJiTZ+rQNUC9ZCer8vMg4o=;
        b=zwYi+evsFyK43tb9HzHTSVntN44q1OnTQayutfzV+wb4Y8ri7IPaZjYbyRchbwO26W
         2dgAkL3l+uotciSKXUxP2wcaVxvJLC/AdkoUmqlZgAl8hyScxwQ6UNreVkdnyDh8oWu5
         cDToEJyPDZbwnEIGJ5LLlMD6giVf6ZTzVUFSJ1Yrd729vbGixIwUrWvdHB68QubCxGMS
         Pc+TC80jhuRXTJVkuKR6VmOG5K8mstXm5cLU4KNkqzsXYvRVLbyOK0NPkt5zDP5Ba+gL
         UsaRtuEv79JnF8taC/IDJUjzCuNWYfvg6T28K4tm1xb+GyFG9HkAbELuQqgmKcfPZ8rP
         pBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779374988; x=1779979788;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kHfW1tkeDqd0FB9koVmxfMJiTZ+rQNUC9ZCer8vMg4o=;
        b=n1g1CM57uxq5vVLARSRPrm09qUqXCSpAyMbSfRGcoJ0kfXwwW+fZzzTwXerhTDw7vW
         jPgmr/ZSdMfDtYhe+ob/rVqtkOjdXvQ5Wsl4rFJTiNWgtFXddPa58dIKUuZdHfv5ZW5X
         MhXINsLia3++N3T2jdZ4XarKb5xeYlibnA/YM6xyyak0KEWCqNyOb+4KQTFusTJqxPdw
         fYHzW4Lk2meR20Hg4ZqJxmjjLfyUOYsaXpuZQVdJibfSD+p+hpzz07peP9N9An8pjz1Z
         SXnkhjUD0Nu0+xOhS9pUKLM2/ZoQhVyibufrTBCacx4fPuDMulYqvhUuH3t6HHqYhzJb
         npkg==
X-Forwarded-Encrypted: i=1; AFNElJ+78Ap3pChTZD4AftFCytlX/8neC3pjWuQllivI/vgJomdJh7PDpRMn4ATL4r9D/tVZmuaObUPSiG6ldrAyuULVHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+7ZOIztAkNEaz72b865KKPzlDfJQUrfuk+09ELk3gxH6MGNk5
	fnUpiCLMe37TK11fFizy1kcXObUx0dc6Y9gdQZUHL7+NoM7N2BbSWTQn8Y7y/AVON2Y=
X-Gm-Gg: Acq92OF3tKqegW4j0zzIOrSdVxiyGMjocaaDzCGWHnndNU2wxEnOPm8HEZQ3w1HfKf5
	SGA+3CZjgWlmiQc0ObPel/Xr3U6YE/1AgQ4BpiCfgZ5g5uFi2vHRbBVhzFd5h8+5MOVtS9AdCHp
	QlVC3xTz2mrzToYqOevOfDL4ZClFuOaeQrrwaCywdG8h0I7Z5NssO8ED7IQJeyJjnWFafEPrPp6
	YI879lCL/DDpuCt+UXDt2QO1GPL8r8RKKYTWC+hfA/Ncg+haizkkNFDEM84y4PmZSkK9jEcp1SA
	2pB89J9sTqgNxBVI0aSzZphrQq1TxUzjnCD87QargbHfRF7vHdFeo1zCAnu54oKBhLTWDNSqGJU
	l1fW6lR33PFt4W/g/xsn0EKD5gZY1Jhz3ys0ewv9MP2qvRDltcaK/8zIQSrMtIZvl+RKPAutWzZ
	eb1PMlM3GuGsbU/O+xgewAQfyVesYOi28=
X-Received: by 2002:a05:600c:3b26:b0:48a:5821:5ffc with SMTP id 5b1f17b1804b1-49036033499mr48409275e9.2.1779374988282;
        Thu, 21 May 2026 07:49:48 -0700 (PDT)
Received: from [10.11.12.110] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49035c6766fsm35082475e9.2.2026.05.21.07.49.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 07:49:47 -0700 (PDT)
Message-ID: <b061d100-c0dd-467d-8289-be2c0935791b@linaro.org>
Date: Thu, 21 May 2026 17:49:44 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] firmware: samsung: acpm: Add TMU protocol support
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Lee Jones <lee@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 jyescas@google.com, kernel-team@android.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
 <20260506-acpm-tmu-helpers-v1-5-a9cd5daf8355@linaro.org>
 <DIBOWQYHOPOU.3PCLCL8030WRL@linaro.org>
 <806da86b-45b7-43cc-b364-97bade8f4041@linaro.org>
 <DIFVKM72KZDI.14EVGUMQ0NV9S@linaro.org>
 <a55690fc-7727-401d-9b3c-06bf3c2852d0@linaro.org>
 <DILRJBWU9SKV.2P7EJN7ECEJB7@linaro.org>
 <73f18a2c-e729-45d7-9376-7c0e60ed35c7@linaro.org>
 <DINT2DFDVWFX.BGTG7LOC91RH@linaro.org>
 <CADrjBPqiooFC9o56bOAg-j7908ssPtrzff1reNe6eXmu7hcA=w@mail.gmail.com>
 <DIOE94AX265Y.4QU8ZF520FUV@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DIOE94AX265Y.4QU8ZF520FUV@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Alexey,

On 5/21/26 4:37 PM, Alexey Klimov wrote:
> Peter, I agree we shouldn't bother about hypothetical SoCs. However,

It's standard kernel philosophy to not add code that __might__ be useful
later. Please consider adding that print when you submit support for
e850.

Cheers,
ta
