Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6C930DEA6
	for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Apr 2026 13:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777295210; cv=none; b=b3J0TnQPFjFwWSJNqFe517kOQFWCDIm27mDx6S3hShWPBuT8D4YvQVDGHHuDPAR5jowb1kITaYUstboNym1MFCP+Purdmsjl76GVuhyzORWp8hFC2TGZ4pa+wps34cWAGTXNZspnjrVoWU4MdHpCVqbuYKpVPJqP6qBAdRhf+zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777295210; c=relaxed/simple;
	bh=IYUpsYBEN6196owDLzfH5/F1IIkOtluq3J8p6eTninc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EVWYgtA2sPX+sSq/85fLNqUhZIP5N7Dk4+eVsZPtaHeAUKE01FnWQUwO1wY6Pr0tNPZ/upsndlJhTcvZxvQR0fPZ/kss+CKylIEEmSCjrmjH/OziBXi7bt9yZYJnFLlLM9NZ6gtGSy6Fwp1RgqrToILloq//bOFx0CwVkY1MidE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XM3DPMVE; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XM3DPMVE"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso84225395e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Apr 2026 06:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777295207; x=1777900007; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IYUpsYBEN6196owDLzfH5/F1IIkOtluq3J8p6eTninc=;
        b=XM3DPMVE+K1XOoLpa98jBTuVUCFrDSQ+RquqB+lEApwbw5/ozF2g2iFFmpvt8XJIC6
         ib6MlNKA6UcJmXzsEsMHc+SZ6IPzkBJlN2nrdzvsgjLQn3WX2sM5x9jGWYxmTdBi5N/p
         u529qWO50tGXl7EOfgLEnEIiUqvLxBnPTnBxEF9mUtZ7+PPRpy6VoHjC3uz097BvAMlf
         9LmLlmHnFiqDdOppWP3TgS/L1EfoNx8pZ7ZEnIk6zVaxM7qxsiU6uWfGFe2EwXs/aekJ
         TGDNvBkwtOfovaKxam8pVGPx3ov5t3LaSFIM/hNhXX1kIMj7lTWcNNL5P+On2i0brFZ8
         pVRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777295207; x=1777900007;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IYUpsYBEN6196owDLzfH5/F1IIkOtluq3J8p6eTninc=;
        b=DnHemWou85qHbfsyn1yikvpLJpJP3kozDZH/R0VlxEdDbXG2bI0da4wmtqIqcTCRgs
         Tiy5nFnHkpPOPMIEQALBu+z6W+RMM+43TpWNkgVKcGXaIJ3YmtkHCItuD0ugVjUwQoip
         Ng0ponh4Uab5PrmgS0EKzPcWwCmWip/W7GMZtS5b99g5p5Nwbhy4u1RPthdz902+iZbZ
         P+umYaAMl7ckQGW2CqhS14Ni4++WMTLPzR/pwAPTAr6DtDZYfwObNbZJggkFrEzodEaX
         bwI/Ln2MQ6jNKN16seuET4WmMjHFtmrX8NkNmHygE5CyYdk9AZC2Ogyxp4PdpnQzYaSE
         iyRA==
X-Forwarded-Encrypted: i=1; AFNElJ+7mY+YGmlV+tVGLLsxF7wRBwdEG/NsLwXTD/a/Y9jyR0fYYF/THA6XYVJNp1199xEtt686pxazxsycaW9d0n7/mQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQeFbroV/nyss3xVOban5F4s/xRn/eIGkHBEtCNs1bt2PGd3kh
	YyoQVmVoc0Q1JjW9LipeEITVWkAe4jsp38Aj1Qo7+op6H9OgVGiTFci6nCJCeRk8sOI=
X-Gm-Gg: AeBDiespSgSPkZzFudYk9l98nA/fgv9bxIVvKIQhVXkg3MmYHZ0DEm1XOTl7bL68VZk
	NjUCXlino6oT5vOuso+JJDTnTPo/yiz1tbp4sbBl0K1w2JW1isv8Umz8idsql0aX8C/A/yM+TPL
	TWTpIqM+tQd18x3RRDa/WiepnetBYfO3hygFQeaL/pcqKHy8SWZFDGjzv8jtSJrlimyk0+5Yj6J
	0RuwbBKn3b573G0zain/jfvK3mMigCRqlXo4s6YnJDMU1/1DQDYiX9kiWRSgg/g7AmO2fK+KlNY
	pzFe1Ch0tkZl4PreN3Gea22bccjOTUYW/fW1F6CsoRiCO8M8P3SsncMEmzFODCPcjOkRuTGaqZE
	F1kimDkfFlbt1k+eom8U3o+zLdefG3WI9lwdMuHqqJKttjoo5Pz4JmxYbfs0zUecXbkwceylqgo
	utort1uIW9/ksRs4mzmwtABfk5YkF9Vj7HrZ+AnPrWy+0u98sBJ5EsUA==
X-Received: by 2002:a05:600c:8588:b0:489:2005:b36e with SMTP id 5b1f17b1804b1-4892005b4e9mr301808215e9.19.1777295207493;
        Mon, 27 Apr 2026 06:06:47 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb78d1bcsm348440715e9.5.2026.04.27.06.06.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 06:06:47 -0700 (PDT)
Message-ID: <29a976ae-c8a8-4a5b-85c7-f52a7901a7d2@linaro.org>
Date: Mon, 27 Apr 2026 16:06:44 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] firmware: samsung: acpm: Fix sequence number leak and
 infinite loop
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org,
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com,
 stable@vger.kernel.org
References: <20260423-acpm-fixes-sashiko-reports-v1-0-2217b790925e@linaro.org>
 <20260423-acpm-fixes-sashiko-reports-v1-2-2217b790925e@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260423-acpm-fixes-sashiko-reports-v1-2-2217b790925e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi!

I need to drop this patch, as it can cause silent data corruption.

Will send a v2 dropping this patch and adding a few more fixes for bugs
identified by sashiko.

Cheers,
ta
