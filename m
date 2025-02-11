Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D41F1F03C7
	for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Feb 2025 08:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739263212; cv=none; b=jGe63SX3QCjbJ5AA3jUiUXlLqkCmj4IhmbJAKgMoiAqsnrdrZakXaM3h0ckls8CNuMaiwAZyD8KAo1ATMtRrwIk/OGar5x/rnTMTVOcoD1cxeF3n532uSmUyVAf5+tzTHQ7HpFhLYlQn9d+87CUsO4bsHnJWANvdWBcn8ccWoew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739263212; c=relaxed/simple;
	bh=aLWPkGYLTXZ6KZLjG1uvCkYfzVSGcFtVAE6ajRD+SJ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E95JB0lyuzmq+ILxDhjL9kpOv/I8HuVqCtosVQ+joccoOLmyFQWvhVXiMadtDtAFt7mVALZlKHHaU/0yzQH5tZqQEMjzpfavL09XCFXvblIyJz2zbfiFQZ8OJFr3RbIhM0Zc0rPKJz/tovhGXtZ9tYWQ6w/ADWLyqZjQOwNATLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ExeKpU9H; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ExeKpU9H"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ab7c14b880dso377784166b.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Feb 2025 00:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739263209; x=1739868009; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aLWPkGYLTXZ6KZLjG1uvCkYfzVSGcFtVAE6ajRD+SJ8=;
        b=ExeKpU9HTk/wvyEOrC1ZJs0JzlzDxCBvjDobJLkpdp2BpnlRCJs97CIbCn94GDYw9i
         o0hl/yF9OZRJJduwpeV+XmHCJ+qiaS5O8wJns9HQfEcmxbe4qcAzM8zU/GFdjmKCiBj9
         0DIcm09LUiAM2yIFCI9AnFaZf5PL9ma0iixVVKBD5zYRN6cme3tUTAyfM/Ey+HHIaIui
         FiwevtHmOTkM8DK0OwLHGPVHVcUfh0WXfaEghOC6TPgbueqhO+0stmUcfraufQvjqmbJ
         F6X3KuImszdN+lnOlBp5Urjj+fnkUrI6kdtV3f3jIWI3PQ26Hefp233qd34sizOgBoSK
         7i5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739263209; x=1739868009;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aLWPkGYLTXZ6KZLjG1uvCkYfzVSGcFtVAE6ajRD+SJ8=;
        b=YMi5RiO7Yd7EQ3MJvHvPMY5Uz0QbaLFEmQPiEcGI791WuVq5og/R8wMKsQL1sl3DJA
         /jBgKoR1cgGjEk+tznzCAtEUWRgdK9rbAnDGVKeNyDcI7C45qGSJvQk5zMX0U5c+93wS
         U4ymvmhA6O+MGYwEVH73qEgZ5dKpjykQW/+v5txmiTBufeGGtq50NraqxIR/MJq+03qf
         UPgcfkr6fuB0WEGOEJeeDzM9GZ/aJh4GxjjgM2aVAnOwXepWNa7jU1MdRaM2ZDYBoyFg
         p2zY8IxU8qDRlckNbd+v4Vypf80auXqgN59bfyxdVGg4JuoIGGQIK4YPm1CWDMoGjBZ+
         JG2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWWaU4wDarj0QWOosZFdC1zlCZxDaNz8V0CTzoTWJmYg69v4mekZ32ODCO1y7Yk0m814RnTzIj1kUM8TJ/55qW9Sg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqURCbKv504L1y7NmLCtUMTFSmlIAkevnAh/r6lnupL6UkY+lq
	VbK+5kECRUMOsGExGm4vskDOv8ckECujsuJyy/4YLhPnfFxRa7KhitFtXm+ym4E=
X-Gm-Gg: ASbGncth8EEqHIBsdaQDINrb2BRrJD0zrUVHPZhFylZpLh0fNdlttTY00r1zrwF/Brx
	5iC6RKMdWfkUmhn/Ytp8asPn8ZYV5lwJSPcoJwaYlVExynQ9uik//Fb29UceS5td7C7JN/Kkm24
	LdjQUUnHfV5S02VuXRIFLDliwKUCNM5ND1llnq2fMbwZtfzjeW8Fk+d2WREqfoOnT6jpk+adLMS
	ENyoGl4pQraUBqumsKqZAAV2k10ag6sDgULkuQnD6rn4+x39CQt64x6ZfbfrmBpbRWwztRcl6x9
	aLD0XU6A3/lRYjPeg9kcz2Bu
X-Google-Smtp-Source: AGHT+IGcNPi3rZA/CTA/KZxJg/KYFxP9+ErymmejAcw4HslSUTPYtftnIqEPAddfpjtGO6oKFni/vQ==
X-Received: by 2002:a17:907:c308:b0:ab7:c6f4:9527 with SMTP id a640c23a62f3a-ab7da33acedmr246065566b.3.1739263209240;
        Tue, 11 Feb 2025 00:40:09 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.124])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7b4aba036sm470650266b.45.2025.02.11.00.40.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 00:40:08 -0800 (PST)
Message-ID: <b29042fd-919f-4e57-9ca3-58ead8a8011b@linaro.org>
Date: Tue, 11 Feb 2025 08:40:06 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] firmware: add Exynos ACPM protocol driver
To: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 Alim Akhtar <alim.akhtar@samsung.com>, Conor Dooley <conor+dt@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-team@android.com,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Will McVicker <willmcvicker@google.com>
References: <20250207-gs101-acpm-v7-2-ffd7b2fb15ae@linaro.org>
 <e1fffd3b-d3dd-4f46-b7b6-1f03f934dd30@web.de>
 <503b7ec9-e0b1-4351-aa34-3089b2055eb9@linaro.org>
 <60c7ed79-c344-4f6a-aefc-d6d45a4d9004@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <60c7ed79-c344-4f6a-aefc-d6d45a4d9004@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/10/25 9:23 AM, Krzysztof Kozlowski wrote:
>> I'll replace the open-coded mutex handling with cleanup.h guard(mutex)
>> and scoped_guard(mutex, ...), thanks.
> FYI, Markus is PLONKed so I won't ever see what he writes.

Thanks for the heads up. I don't mind using the scope-based cleanup
mutex helpers, it results is smaller code. And since I already have to
send a v8 because of the kdoc warn, I'll include these as well. I let
0day bot run on my v8, I haven't seen any complains, will publish it
shortly.

Cheers,
ta
