Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BE13A1BD
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jan 2024 10:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705920299; cv=none; b=anCWGs9F4EKmW6MdI7lVyLwn+zQyN6Nk59ueQMeVCeAPnKeV3xk7xqksAFyLffk8h/t/7qltvQsQ2CRomVQeKXOx2yZJ2fgHRawKP/3oEjHFT5Gk+uEo6+HviuuYeRUis2uTVUk9+0M10+LP6nerp3Zrb4ahGYXV9f837rCr2AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705920299; c=relaxed/simple;
	bh=D/FSZYu2c7Uvn49WFGy+srvKlo3F49S7wmxM0BUoYsc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=U5wihN2VTIeqcU0gPzG9euCCmBJIZeT2cmDoTDFUi+Hj6MhVMhUGw5E+uWbx/zeVey8gV2oRXgLyrxAJn0nMPUD/bdYveUD0IjjID6zqEEdWGv3jKHfvsb1uvRYUAGghjR4j8ipI/hdS+1B1+kAiJlt52PselyD64ENR8O8bdeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gSSAl8JJ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gSSAl8JJ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40e9101b5f9so34647675e9.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jan 2024 02:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705920295; x=1706525095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JdpeDxdNLT9OV/2cTFPVotxifc8fm3oA29SrSED19Zk=;
        b=gSSAl8JJqkra0Zr4JXngAUqKuaM+v+2ky++d7OoFYdu4V/5nUPVZE2jVYqdSqqYfzm
         xp5zJChnvFxys5DwhaOWoippdpNMuzss+G0JOoyNXch6YuiYWCx71AIZH6jwjp3BeEYy
         uSzGuy/zquYLo5YE5lmq3zVrT9bMFq07wL5dqZZl+5v6vsJKpfk/+Ke58/fw6bo2cGWk
         jUG3g8MsdJAQYU61ZXp1Ih5fmmueoSrYK2JwmITmfwAgyxeyoa7qEAITBTthYI5fjrQo
         rQ8YqErLvZGIAgY+oaUHvn4nmxo/u56iRLScG6ko+Sf+9G1XO0tn21CIw1VppDfcA2gO
         rtiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705920295; x=1706525095;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JdpeDxdNLT9OV/2cTFPVotxifc8fm3oA29SrSED19Zk=;
        b=Xx2Oy2pj/iP4wuP4QasaIDlvr7fQlmJqVaL2Bw9ZmLOq9tcy7TSvyDPFFfMz5Lx0UK
         MLr32CYdUwlNDe5s2PlcPCACULZ0cV4pleQsIYM+mmAVOQ5tepz3AIEDQ/Acxtgn2b4e
         4mVJ7siviN2z2REIGOcGre8i7LH3CaO5vtStf/XOcRm2V7qJk5rDNj/at7eLRLi/o1I+
         SC+RLSRv8bDwYW0txumrmYiEAgi2d2kBH7QT9OfGqdq5LOT2fXsON6DcjJ3aJbfNl6no
         2+NcbStWdOsk2U609C8BpRMEJFTD/khKNcksYCP6JiwcUg1CXYF0tXOXeha18a53bR+T
         yvhA==
X-Gm-Message-State: AOJu0YxLoqhxLYIGapKwx8sfz34uFWqdNaVhw5YqRPbIVUklmiSdKb6l
	udLC25bvOgz/+za8P2qnZUxg+dxh75V6pCcDJwWsG6zzaxg4fEbNJWEj/ghWlz0W1Z3b+jZR7Vz
	BjTk=
X-Google-Smtp-Source: AGHT+IFC29R5NfzfmcvFUnFVv9EKcUADduSChc6hEHJOJqXTBgdXDd/uvVnVjKPhRqfNQSZEe7kfIw==
X-Received: by 2002:a05:600c:2a8d:b0:40e:49bd:a2d3 with SMTP id x13-20020a05600c2a8d00b0040e49bda2d3mr2285508wmd.139.1705920295418;
        Mon, 22 Jan 2024 02:44:55 -0800 (PST)
Received: from [127.0.1.1] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id f18-20020a05600c155200b0040d87100733sm38858312wmg.39.2024.01.22.02.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 02:44:55 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: patches@armlinux.org.uk, Alim Akhtar <alim.akhtar@samsung.com>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
In-Reply-To: <20240114052751.17242-1-rdunlap@infradead.org>
References: <20240114052751.17242-1-rdunlap@infradead.org>
Subject: Re: [PATCH] ARM: s5pv210: fix pm.c kernel-doc warning
Message-Id: <170592029431.39082.9342673926900228188.b4-ty@linaro.org>
Date: Mon, 22 Jan 2024 11:44:54 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Sat, 13 Jan 2024 21:27:51 -0800, Randy Dunlap wrote:
> Use the correct function name in the kernel-doc comment to prevent
> a kernel-doc warning:
> 
> arch/arm/mach-s5pv210/pm.c:61: warning: expecting prototype for s3c_pm_do_restore(). Prototype was for s3c_pm_do_restore_core() instead
> 
> 

Applied, thanks!

[1/1] ARM: s5pv210: fix pm.c kernel-doc warning
      https://git.kernel.org/krzk/linux/c/52524ff0558b57e8b78d05d645456b0a77c787bf

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

