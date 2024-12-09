Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A0D19939D
	for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Dec 2024 19:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733773923; cv=none; b=ActL4Zg4QDFeeOsO1V4j1DTbiaK7iCy1HkTz4pt37B51lnQw7L1byefOIrYc3TutMLCTLjl4OmdGi2KOczNJUoWOHZVxnaY9thQe2VR8Kd2tBaNJnIQqshib0LdKjOesQIDIhVYHxSI+uinpLNNuwINeJF31i28FbrJKrQ/LAu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733773923; c=relaxed/simple;
	bh=L1EiAUK29+7N2gtomApIJMLqJlRx6S8oRsEftzBrckA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Z+NRkdXoFvSQtpdO1Jfv77Y/6hmsKfu/SGmQulNAS8DGsmmvh/1xghbpEueVQqJ4fXQbThJIW+f9V5+7FdF7HllYITlcV4aCSWwtCvzA2tY2gQ9OcZYiLbgv+eofOTos+5KlD3HyfncWgjX2GrJVqTwvZ7X5Z7cZh1N/QK1mbF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j9wae02q; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j9wae02q"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d0ac3be718so606425a12.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Dec 2024 11:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733773919; x=1734378719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lcInZ7cAZWZG8+HBNkE/FJUcMkaeDAVgkLqMgxcS4kQ=;
        b=j9wae02qjtJUIxoyQ7aHrqXFs8DtWAqkmWECLmqRxQUDa+6WC/993uHFL23wZBK4e8
         Aqhx2vKJIvYw3LKhq3fgiof2xAJSNu/95H7Io+uog1NG0mECzH953XHKiiuC3vNhk39h
         BF5lxFAo24NgBT7y8WHH5cGUSIvkB68b+CxpRA1ccJm1IE90KOHFaZFh6S+/vSAkQMWT
         peImg1ufa6/o6enjeDKfOLoOB+VaQfF3FM2mtaijbVV9M3lzLp0C6pDMKr9nl5ro5iWZ
         2DhsaEUdIEXO0B0M0mywVPsTLkYpZLLd0Zi8mtaD55gEBr3OgL780GJ6vmDCdJw5bzH8
         iryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733773919; x=1734378719;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lcInZ7cAZWZG8+HBNkE/FJUcMkaeDAVgkLqMgxcS4kQ=;
        b=f67gCaAVXkAIUtb2i50ElpWpmCG4dL1z1ZwhJvb8pywhlP97ajiFE53Yj6ycwlzLHG
         rMh3nK0ouqVA9ntDIM0e8PmIgNDWt3F4tr4gD77K0wem3/EQoe5BHQE+vhiHRm0XHKNo
         tvRFemh4WpLC+ULcINXWYw/+FnYZab43Lb4JP6FsHiHxBaZDNx8aqxfEuccw/trGT299
         wme3BIckK9YTU+k6F7bUuxD5lAQs+TvZyJB7iGSbFfMi8vKw5OA5tALNnRWyl8lUDX99
         xS6w2NngkUCqtBpYBNJ/Z+6kT2NsCuX8XTzVXthXVTf8e54RVrjNCZYl+klikwjBKyvD
         JLLg==
X-Forwarded-Encrypted: i=1; AJvYcCUS9lzpvwoj6wa90SMk6QEjNe+KAnLT9Cfy0PrKNPKudA/ZKjkH+F56IpFbXeAPj4fXMAID3/MpNA7EYw64Sdh+Lw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/yawai9ZaS3En9arO97r4UkUj2WZCMvr8VtSQ2sgAXuHkNnXj
	6LS6NVv6iGGM5tb1C1jSA0cWDhBaSGmq0rDf4lGo+A8tOIC7Wk3hUpPIeXODtts=
X-Gm-Gg: ASbGnctwmPMK58m+UZgq32u64zOiFoTkVwusQwyR8DzYt34S4m9ZwKRe79FVodghI1n
	qW4TNS7juVnkS2TPqMhAaleod+tMXCrzoUGKej6LLHTzjM9HnlfcyNTkhNd8i2kY+iiw9qzeOLV
	+bJKSrVVMe14V0qTQcn9JzwodOCCF/5v31nE5fjr5mpjyvrPud4wLw0TPtYEesy6rCB/+hAU7KX
	hjZlhkMXCZPVCBSPYdlqTeOZZGCpciqdU5gU/5gaRkRwLNwVkxNRabdcGzNQMz6rPt84Q==
X-Google-Smtp-Source: AGHT+IGZXsH93Y0M2+nnc7IYqxUfw3k6tfsPFGPEyxmWBQNb2mUim2xJZvm/VhaZREPeArDMlc7Kpg==
X-Received: by 2002:a05:6402:350e:b0:5d0:bcdd:ff9b with SMTP id 4fb4d7f45d1cf-5d41c65121emr353310a12.9.1733773918716;
        Mon, 09 Dec 2024 11:51:58 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3d475ca85sm4539151a12.47.2024.12.09.11.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 11:51:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Umer Uddin <umer.uddin@mentallysanemainliners.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 igor.belwon@mentallysanemainliners.org
In-Reply-To: <20241209080059.11891-1-umer.uddin@mentallysanemainliners.org>
References: <20241209080059.11891-1-umer.uddin@mentallysanemainliners.org>
Subject: Re: [PATCH v7 0/4] Add minimal Samsung Galaxy S20 Series board,
 SM-G981B and SM-G980F support
Message-Id: <173377391743.160715.4680965991151574957.b4-ty@linaro.org>
Date: Mon, 09 Dec 2024 20:51:57 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 09 Dec 2024 08:00:55 +0000, Umer Uddin wrote:
> This series adds initial support for the Samsung Galaxy S20 Series and also
> initial board support for the Samsung Galaxy S20 5G (SM-G981B)
> codenamed x1s and the Samsung Galaxy S20 (SM-G980F).
> 
> The S20 Series feature a lot of similarities in their configuration
> and internally Samsung named the common devicetrees in their
> downstream kernel 'hubble', please note hubble excludes the
> S20 FE series and Note20 series. To accommodate this, I've
> now named the device tree common's matching the codenames
> (x1s-common).
> The device trees have been tested with dtbs_check W=1
> and results in no warnings.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: arm: samsung: samsung-boards: Add bindings for SM-G981B and SM-G980F board
      https://git.kernel.org/krzk/linux/c/2e342a80b02c64d2bae6f1070c473a8a9c7a5b9d
[2/4] arm64: dts: exynos: Add initial support for Samsung Galaxy S20 Series boards (x1s-common)
      https://git.kernel.org/krzk/linux/c/38794a41be2bacc698fc520d75d3aea88c727a01
[3/4] arm64: dts: exynos: Add initial support for Samsung Galaxy S20 5G (x1s)
      https://git.kernel.org/krzk/linux/c/e7c075846d0be40f6238ea9c784c5d553135c1ae
[4/4] arm64: dts: exynos: Add initial support for Samsung Galaxy S20 (x1slte)
      https://git.kernel.org/krzk/linux/c/4ccb27d48a73d8be0e532353d0d9445cb52587c9

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

