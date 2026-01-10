Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B161D5CD4
	for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Jan 2026 14:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768056545; cv=none; b=LiAoZa8+Zk/JnoH8bChb+vXXjWsClDuUWE+OyNWd9YaR7r9JnK+o/lkytKKs4y4tcRB2e5W21PFBvDYmz4tuCUSiuCjwm3kKCYDEuLdI36dv1Djehju8SlNfDt+n/+xjmLnIpzeVtHwUtUCtzKTyQ3OKJyGdAmzBCH4y/CWlItM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768056545; c=relaxed/simple;
	bh=8cZF88ZHHeswEWIoZ1XSpuokeFUHz2t/rDtmfT1Fb54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s1Hz5hu6OZT5XvTOWvYTaTYDcY+tfaZ2bnXg30/93MGXWKB01dwx+QPYgDjslQ5IOjweAELqk8Jg0eKJkl9tVznFxoDyYPeBEGV65UbB1x++3ge9G7SRKscBoy60rQostB1rAxMO1p1xrmFbpOcA3WtEnLULbRwdxTks5tGlCWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=EecNqfHS; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="EecNqfHS"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4327555464cso2977710f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Jan 2026 06:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768056540; x=1768661340; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IHk6EgoNk8lP2vqJMYUzvRzyl3K2JzNhjFEm/rJg//s=;
        b=EecNqfHSZs06v18jqARlP9k1rRdjxC5rUdz/jxGgFVrZljBbTmYS9L0TQobkdqccxN
         TTe2xjZtAdjKQ57catv9RuhOA2LeI5qXpQYtyGFLy1B8mUnqC+1Wfrc4bF+zjsQjK4en
         V9sGY/5D9wzFWxSLIrSHmL6MnugPw62J02oboA4OVLBToaF0g1oEbYvWvK9PBC0QAqxm
         X7DfQ1R3AeNHbmI6nAlJTc569VGTwaIOA4MTx25J+sVjBzQW9DAOpbZyVU3yMYPSVaOR
         vn/4Gg+tvob/2yq4G0xQEIgD6SjeC4Fn4rnONlaSH7sfgZxhEnI/kLpOQMR0nl82B0Wt
         AJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768056540; x=1768661340;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IHk6EgoNk8lP2vqJMYUzvRzyl3K2JzNhjFEm/rJg//s=;
        b=nwNUFF6tuTnr/kBxZIc1gcl1nWDClHH5PIqhrmSPw6tjd5kJ/YvD/XNIcCQXu3vrIh
         KX3/U+AbBssOc3NtL4vTE/ChxPP0+2RtdSxuEOnqxohG/qIO7lVmimo0ktOHX02XKy9m
         0elDGTea2hqba2ssEP+l+wBgZ1FS8XYfmjj5wNRBl7A+/bkNkG1dTdPTneOic0JgTcvQ
         bQKCik+ROAjLL+G07D9nRbZblcDc1bkLWmpml8mflRQT7oD7Z1Jz6BO36AiBGkjQPPO8
         L6rPNWrGRMI86WM7fgFFjCQagk/q/AkCBumW+LZ+qYvNPGqjKOuJYGUk8ABKqchdK8JZ
         skXw==
X-Forwarded-Encrypted: i=1; AJvYcCVqtw/b5wNNVFOATkBS1xUqBvhdn9C01zO3Ts/MwTa1n00vKdsrGVVuZhgg1RuMFDBU+f2Fwd5Ui9mj28tiLtDncA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5t6WSVgCHBqBbxJ54t1gyhwARD/PCG9kkaGk8YcA89kBLT7gE
	lr9Vt3XGSu66+qP8av+3tWX7D5WLHNi2Ev+G2D7CzllHjRinUi3mjzRIeMsLe/O9TmA=
X-Gm-Gg: AY/fxX7nSsKOIB0wFaYF20F8UUsfI8GkICWgmyIGSlYigVNJQb5s15hkHYQPxU8+iWZ
	pMV3jp7a8kwxCKAH/VnBlKIa+N+fYSG3I4bQgQYpLKowZ9cr1RMnigSBluz4OUYk+EpzmhbWfZc
	YRoZDFr5cKy8htViXtUgnYTqXKFwUsSwDYKLOVDAhe4uP0Ri+Idi62RUepO+iYPrxvFlq5S+RKs
	qy47pISqwC5KV6ycdaotHQetQIGC7mqXECLivT0F+oTotgYxP1BSuH1L8Lftp2vng3WJ/kcNzlv
	BEjAosMUqchijnsG5zjwDWskaaS5wr6T5X3U+vWOzz7XnxIJ9MRk1ZWrWOO5A2UIimCwATnfIk8
	hovU4jQqE+qZXAPojGr83aHOn3eM+uKGa43qKWPVkdb6INKrtqPqc1u1LvYWQFIU9TjybgSYv9f
	wjesmDPqDyG/RHD31mKzokXexN8tAm
X-Google-Smtp-Source: AGHT+IExDiyl6+cMqnLU0OScR46v/DhXxaFlI7KfbIz5c0gjBYd8wiO/Eo5iH1Cn00OMlkpwekH3Hg==
X-Received: by 2002:adf:f54f:0:b0:432:e00b:866f with SMTP id ffacd0b85a97d-432e00b8b14mr2891143f8f.60.1768056540373;
        Sat, 10 Jan 2026 06:49:00 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dacd1sm27764794f8f.4.2026.01.10.06.48.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jan 2026 06:48:59 -0800 (PST)
Message-ID: <b0dec3fb-51df-4bcd-ba13-c2049695266e@tuxon.dev>
Date: Sat, 10 Jan 2026 16:48:55 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] ARM: at91: Simplify with scoped for each OF child
 loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Russell King <linux@armlinux.org.uk>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-clk@vger.kernel.org, imx@lists.linux.dev, dmaengine@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
 <20260105-of-for-each-compatible-scoped-v1-2-24e99c177164@oss.qualcomm.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260105-of-for-each-compatible-scoped-v1-2-24e99c177164@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/5/26 15:33, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
