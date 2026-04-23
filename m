Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E915F3C73D0
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Apr 2026 12:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776947652; cv=none; b=JujBI9MhxMclqZoB7377YJF9YLX/Ef5HxWLOK9xGL74iexIPBzoZ/rOQyeFSZKaCGe3IFBaK2WGb7LeFwdKjlpKE15cMriEUhlrRyuFz6IbyUeyOU07fxSHV2SS0xK0HlT6R5JVOX7facgtF2921HTPC7kfBQ+B9B0bhbR6ueho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776947652; c=relaxed/simple;
	bh=SHt8/jDSXolzcD5Ycs/HtVeMQJoHpcSGMEeHPCWu22c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TIJA0WwSpmfj0XF/ulMLz6jIJ3R/WitgkjH3p3CCI8lh1q51L8TgfL4stPchPcsIGfwcT+3IYnZV6B68Mb/dDrUvyVJc+xogzpt9y+r/T9BHPEboOJiCtfIYFW31o9tVNH22hyco2hS8G+8uO1iLs8DBOwbDiXoEgRs5kJqaWVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OyuRrHlB; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OyuRrHlB"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488ad135063so58518285e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Apr 2026 05:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776947649; x=1777552449; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SHt8/jDSXolzcD5Ycs/HtVeMQJoHpcSGMEeHPCWu22c=;
        b=OyuRrHlBpR0TcLjq11DTQNVtYQFiAa0ENCTgMudk1mmQm9bi3GjK0R+oqirFvaux56
         tiRflDIWvLlzZ0z0VxddZifTV8BBSsdBZDJ83frSosJnARIDfSQvBCWqcDIk/20KWfF8
         RLnCxbLa42aWvpoN3X5VBE8QCtyZUTqn5uHDT74lEb83MawzycdF5ewTBOMq8jM/GmZ9
         EGnQyJAsjGh4MX4X2Nf+i2LlYrrwenkMWqPKmxB/1LtLVIpImd5HAvjizdmNEMlc3NMT
         weIWR5WCAM4x+JDd3XhJW3AZ+3PILhr8/095YeW4587nwhr6XPNaIspj7jKjrWLB/rUc
         8QFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776947649; x=1777552449;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SHt8/jDSXolzcD5Ycs/HtVeMQJoHpcSGMEeHPCWu22c=;
        b=USIIIe5sDTPq6Ck/64xRqQNHPTcDLIWNk1RGfyo1q6bTwUbMFpxX2FA0kZ2ILlKfV8
         PqYdE4wqnJsQBD/nwkU5vQBDAw2h4OletPX/SFvjdDmobTR3YeFLr7io1DyzYiRXsNvZ
         sAnJITHletaXhdE9XrjX7nfG/EhubkkydMyW9Oz7LGURiyW8v6rtqVmnDBLNTnnVaH8b
         A6QQ9gV7t4gaKKYOEQAmZf+WAAKh/rHw7Xpf1ACWsgKpGBAd5vBWrv5HKF4Smp12iuUf
         nOvIYmomVyt/i+1/PDmf2+M5JFKRqvw7uMf3+ajsZVhWMo8WuFwDJqxHhqov0QGlw2at
         YSyA==
X-Forwarded-Encrypted: i=1; AFNElJ9Ore7a6ExFXjCpH4A8W2WAFuAtWIwtJO1TvyYOeJhqOd8R0/rLSAjrILJdXyMu1KaGuOAgmUMuoMOEZuaq2xZngg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqPq+aibyqLNXXejrsfiyTGOTXvMreLGcDe3X9Rv29s0OkbZYY
	ENM8p4F6FJ3um7f5NVb+4CnO40neYG9dqlEwqdsxhEWlakHN9D4INBOhut82yplYpC8=
X-Gm-Gg: AeBDietex1sZC/iwC8aj3Q66Dl7cut9xqpruHN2Vtnbwf2z1I9djsoXTQVVqUs/uJdx
	FF2socKJoU8iUGNXNQozGarHR0jewwEHhycW18f2LOshhOVPnXgfRYygGmzgVvxQO2lccTDWtXb
	9aHbTl0lXt5xUrBHMqrg1g7ObWxMkQFa7DOLfQDJJ3gRNpNqIjN0LciNutY/zq6j78js+l2iwP6
	N7sxOYGKVP4EP54UDNQ6FwQ7iPo4rs0Xw35R/xHxuDAcV4juA8SGP6H8wjJqIrK5N/swCYN50xR
	AJpXC4h57wFMUxkawJL7luA6RKqF2pLzIr3YQr151tQJ3e3zA1ijQPKh1TTYRhxXgo6jHcQ2GPh
	RbkqKnSUvtIqWvgAMPcBNRHaS85FAsURwh3REHfJIrOgnpBjG9dYwYUHZqAZ7DrpRDw5nC6DNmO
	Dllr6+lo/YIAc7TaOhRptLYD1KdmQ23afSFnt7ZFJBPSc=
X-Received: by 2002:a05:600c:3483:b0:488:af7f:775f with SMTP id 5b1f17b1804b1-488fb77d343mr363286325e9.18.1776947649347;
        Thu, 23 Apr 2026 05:34:09 -0700 (PDT)
Received: from [10.11.12.108] ([86.127.43.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1c773fsm588535385e9.12.2026.04.23.05.34.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 05:34:09 -0700 (PDT)
Message-ID: <b85c3dc6-46a7-4d08-8008-a8334262f4a1@linaro.org>
Date: Thu, 23 Apr 2026 15:34:04 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/10] thermal: samsung: Add support for Google GS101
 TMU
To: "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260420-acpm-tmu-v3-0-3dc8e93f0b26@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260420-acpm-tmu-v3-0-3dc8e93f0b26@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Sashiko identified few bugs in the existing upstream acpm code.
And two bugs for the current proposal. Preparing v4 where I
squash all.

Thanks,
ta
