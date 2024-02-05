Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39B51CA8D
	for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Feb 2024 12:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707136332; cv=none; b=CRFS934bSB0KtfDjEKta1hX2q4shkuIWPBn84hK5KFp0Apa4XstYabCUKEYaaKPsQ1IThi71Jqg+yM/YC0rNeOowRhDsOIgfDLX5/7bxNiWO6waUpu5XhZDM5S7TZVlSJS2DIrfTyvQNXbDhvHHaFpowmfBTCkS4Kh4s7Qyc2ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707136332; c=relaxed/simple;
	bh=F1z41l7Z7e/jSHjrr+FGrKBFyuoXBDs1ejoNPFBfZwE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=q2WdBfJM6GFz0iyFbxRHNlezyg8oO4rr/fsr4aIVMTNr79N15b/yS5id/y9oMik2eUhVSn+bUn0G6pnsLjRhD2llDYQy8jrFS93O/nm6wAR0kCAPTI6Di530GrPk2c2/hnpR2LzNW4xRe+lDLPD6TFcnXhn/9fR3lRgk14t54vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sWcAb1um; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sWcAb1um"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5114b2b3b73so1315908e87.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Feb 2024 04:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707136328; x=1707741128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EQSlfcZABw5oM4k117qg/VOCg+HuBjTCp9wS3cnGuAo=;
        b=sWcAb1umaH3dQPXU2QSiiHfeuoY2aVHc9vBGCYsQLzZ8VKXzI6i+YzJLKQxfeB1MUz
         otohY8/tm1zi5d1fC/3SVvREcOb73r/ZKrQi7yaFVvuW5Pt7HY7Enz3PWT9ieA8azFdl
         Yycs1d2ClXUSC+YV1ZunyXBrUqupl7OoaND9CvYonSw8NZ1CnSULhU8GkISb7Est94Tm
         y+3Bzsu6SMv37ktHs7oPJ4Z1lB4J9O+y+QA34lpn7ppt8v5KLlgTLNuONaDwFWicAgtX
         S8vP5YARILhQek0hoF4ffdp892M1xojCIb9eLUvj8Cgd2Lvsugj2nQcqpZ9z8x3yJ5dy
         0YIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707136328; x=1707741128;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EQSlfcZABw5oM4k117qg/VOCg+HuBjTCp9wS3cnGuAo=;
        b=WOKu9cFNkT8Abe7u36ExLgTFWQyjOOLxhaHYmYWV1nJUhBaQbSQJk2V5wrxYBNCjOS
         bWqx5cNDH8cBzJ8AXIpkDTdjoLhhH8QJiG5kRkZeIUSFj4r5xcaz98D5zMfKiXkOzsBL
         2y5SUkgVI97CP2E5+Q+/eAbo+nu4pO8Dzv8gGO/k210lp9F8Rfzwu9NuYN6Bc9aajZID
         J9H/Ww8dr6RjXE6EJNBoSe+x+zQj4rTK2Y4rvCfalj/FreoOKWdnO+T8PmLezTzmFGNg
         6J/52+xzqcIQPEbv4kglibxTROs3wrClgO90SIHwLI15trGjz77qooalk+T0dBm1YY+m
         +82g==
X-Gm-Message-State: AOJu0Yy9kPhxhvnY7alP2EVlgTIhsbyHFro8QkJGfSrhUQPqRe78R2y3
	H99kpbXTzoAfAjfQJjwfzVWw9A6JjShXzAt7lpMIIz7hB/6QyiFHPETh1BV67BQ=
X-Google-Smtp-Source: AGHT+IG/+JCnrxBmmQ8061gKTQNA6x8e9cIaS4nSAzGosJjaQCSUaJmB2tguPKfjQAehoKWfIrgGJw==
X-Received: by 2002:ac2:52b2:0:b0:511:48aa:d621 with SMTP id r18-20020ac252b2000000b0051148aad621mr3504930lfm.66.1707136327768;
        Mon, 05 Feb 2024 04:32:07 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU5/jVhMWAbyCiDwSAFnqAUMJx5v3i95llgo9laFwrB5lTV6L8wHevdjtC4K58jGyE3vBHPB2jtlQsD2Fa0IFZ7QRWEb8M+Cn2tBXeudrCUviCDjd38D8wkoy0368Rs35822YFFlTpKFukpk+DxXYKY69nKJ/LTN3l7cwbR55qNSOP63dEw3HhdW2BV6tSLyyK+Ikg5xpLZhUI8j/LkP5TDbwN+ZwLujP9ST3Fn0RRuGX2aHxIZFMBqUXU=
Received: from [127.0.1.1] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id v11-20020a05600c470b00b0040fdd7cbc8dsm1414453wmo.47.2024.02.05.04.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 04:32:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Russell King <linux@armlinux.org.uk>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
In-Reply-To: <20240204-bus_cleanup-arm-v1-1-41d651dd8411@marliere.net>
References: <20240204-bus_cleanup-arm-v1-1-41d651dd8411@marliere.net>
Subject: Re: [PATCH] arm: s3c64xx: make s3c64xx_subsys const
Message-Id: <170713632561.37217.11792751448407951770.b4-ty@linaro.org>
Date: Mon, 05 Feb 2024 13:32:05 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Sun, 04 Feb 2024 11:46:21 -0300, Ricardo B. Marliere wrote:
> Now that the driver core can properly handle constant struct bus_type,
> move the s3c64xx_subsys variable to be a constant structure as well,
> placing it into read-only memory which can not be modified at runtime.
> 
> 

Applied, thanks!

[1/1] arm: s3c64xx: make s3c64xx_subsys const
      https://git.kernel.org/krzk/linux/c/db085a6c66337799ad5983c5c6d4b1d8386f4256

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

