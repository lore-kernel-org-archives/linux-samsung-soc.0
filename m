Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFB6657C5
	for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Feb 2024 07:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707463778; cv=none; b=BGikrTCB7VBAQ2hZ8RHQlq8HQBZlFFyDAxmUSNfwRRqV5nbXY9z5Ph6tYR2/f/clK09kQ00K/PRiYYJnZcVOHVRoSAW/pvau0ZDRDmPk0AN1Sr+qoNwFw8Qv0fM1erEJA6cfQxkJOuYsZjabAlDnYE6NL0PvLhIjuxOmcL2b/UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707463778; c=relaxed/simple;
	bh=W6QV1F5OZdUlqW/SY1DByMknSuiUmFQ6MYwYVErpvZg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hUsODL862vU5EvI1+SV8dfFgdLr2AumWGaRH/TUl88efn8DdVnl+7O4HFNCdXVYp2ZAbmE/r+7IKkgqv8o0MtJzFsPrH98Y4z3hhw0GkSm3LMLdnYoXmhi6gtidSFauN6ByperKlH4XtPLg6kPrpmSS8rCa+ZA1CbxMyHXBm698=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=trpZPYTp; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="trpZPYTp"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-339289fead2so296195f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Feb 2024 23:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707463774; x=1708068574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lH09KwUmvRJm+9gd5yEmEWslMg47ivyjsgyBYqEU8qM=;
        b=trpZPYTp/GR90lTpuMva1/eawaCwRUssPg/HuZ/CwvkXEpBoE5IORMDyNGAKTxIcne
         +C2Uz8LL2GVsY+Po2MDkhNpwPTp+ThbhxulDKwILgSGf8SGU9Mphh9rYg1lzs7HFRsLX
         x1ge0Ml3FdScg0sE+y+R46AZPS15m1v6Z1vV27vL/jkBLHYH07tts9aWNNK65JkL9kZL
         HYBRo4At9V8UeekezxjiOKA3E5f4vjlOc0ye34iOaXw4q+O+55p+zfw/9qY9OAFFS34L
         4mqtDJudmLfKGy8646MqhXYwbZYK5N8sykZ7Ebq7l/eG9LaKBO26NojxUZCHPu1CXMZV
         y0bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707463774; x=1708068574;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lH09KwUmvRJm+9gd5yEmEWslMg47ivyjsgyBYqEU8qM=;
        b=iZSgVhupMkunTQGGrozEbeR6GcSGCYIGc48XYKBNDrqZ3wfsbQsgWSI1sppUVpIFsf
         TFHktdh9GRym8MS+cE2hUl97cOKK47iS28ILKw2X14znVmZt5gTmXzY5j0uG21MS9ieb
         rEwJVSWQ7AmrHJKFxfmMlvw5jMbY5OT5V25ZwqaG4e+kX81EkbT33nVCHry+WT2obbuJ
         lOtLtGfsiEaAwBFBHBe+rVMWDH1D5svKPMgICAnEp5lwf/KT0gidyVZ25UcBVomqeD/d
         n/IsNPsrcBnSWpEKSAYzawxanfMjsrZ+Vy7vYN+raE7edptjZ+uFcXmAdZcBJjk3j6na
         ZJjw==
X-Gm-Message-State: AOJu0Yz9G1K7Yos7BfGq5bEHLY3bt8mCsvsm9vqFmBxiHxer8HPT44T+
	q+aiTWaN/T24m/NvTSi5s2nCcOIwM4BUlkx4QMF/E6EVYU37U6poKfAMiFgYMxw=
X-Google-Smtp-Source: AGHT+IF+fiyjc2z/X/cVa0KX6WTDzvImZ41KjIv5u/T6NEuXieOHvVuqQ0plf0W3pkHkZw5aAPSxAA==
X-Received: by 2002:a5d:6a51:0:b0:33b:45f7:636b with SMTP id t17-20020a5d6a51000000b0033b45f7636bmr452067wrw.22.1707463773812;
        Thu, 08 Feb 2024 23:29:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWuq7Va3emGJe5IAatx3ATyenu9yuBn3x6EWEmQ1x6qrHfv1jjx88hWvzth50CDrREpGNNe1yxK9tewl9/GQ6p6b4bQPqfyxSx6sNZEkd4RqVCJecxhuM9JSeDCgpUGZ6CiU+EnzvIruudYUguCtEGGRvlPKKTc4P4mfhCvbgOxDVucwuk9aKclBpM6DmtnlJCyQq4MO6mZYo1nePkK38mkqAsIfb6qTCGry/F9bYiE/cgghDCPLQ3gOW3oC/pIb9NWl9k7JLMmkA8yTo7cpxvDl++kOn0T2pWogYdzDklhB/NJSf+U1qjYjScYuhXZx5PXD1SSy/j21880Pmo+zVZc0g==
Received: from [127.0.1.1] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id c5-20020adfef45000000b0033b4719eb6esm1084936wrp.27.2024.02.08.23.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 23:29:33 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: alim.akhtar@samsung.com, linux-fsd@tesla.com, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 Tamseel Shams <m.shams@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240205082625.39259-1-m.shams@samsung.com>
References: <CGME20240205082631epcas5p170b45d20431bfe0b9410caf470216e92@epcas5p1.samsung.com>
 <20240205082625.39259-1-m.shams@samsung.com>
Subject: Re: [PATCH v2] arm64: dts: fsd: Add fifosize for UART in Device
 Tree
Message-Id: <170746377270.4997.2411756438071063883.b4-ty@linaro.org>
Date: Fri, 09 Feb 2024 08:29:32 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Mon, 05 Feb 2024 13:56:25 +0530, Tamseel Shams wrote:
> UART in FSD SoC has fifosize of 64 bytes.
> Set fifosize as 64 bytes for UART from Device Tree.
> 
> 

Applied, thanks!

[1/1] arm64: dts: fsd: Add fifosize for UART in Device Tree
      https://git.kernel.org/krzk/linux/c/3197329072f0ed2b1272af98ad4299a290036f65

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

