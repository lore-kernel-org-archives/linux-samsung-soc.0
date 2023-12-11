Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AIIOCg7c"
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BD32102
	for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Dec 2023 23:42:14 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c9e9c2989dso54357031fa.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Dec 2023 23:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702280532; x=1702885332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=isEx4Px7vt9AwtBEcan27JIxTrceu09splFCoGA5dbc=;
        b=AIIOCg7c3P6CsvlcFKXsEk2jwnecOok/KWxmL9Fp4SPTJCHuhjU7aSoomh2jNWjyB8
         IOrMVnzyXUIOO2I6ABbWjsuzh4wn+/9EvFMxDO/op8AIzqSqcygWLyhbtVHxBrLo8yOn
         da3V5dNjZ8fkckTGDAf1+W/fkaIRK40tefKd9nMc7BLvJbsQ+4afAkoPXzqgTHyIfYmI
         33xc/YyimIpOgQ/vQtDcFAwTvVP6UurB1fYN9jXB0xvliYL+xtbN9yqC930jMkjJt2HD
         pGX0vEW6gOIFTM3U4rX8CTh6tyL26Q1arqvvLzFXBMK/aJ83FzEhYypUSWoOWxmQBc0T
         +hYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702280532; x=1702885332;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=isEx4Px7vt9AwtBEcan27JIxTrceu09splFCoGA5dbc=;
        b=wk0w/WvCmrOE8xu7JQtSnbOLqlvga/vFcyEbb/dPQ+w4QqZwq1n35SSXXQ3kviEJca
         Mkq+QBMBhoXs5PbwXo9aDUCqZN4da1mgx9ktpl7uyrl8ZA7Yi8isQwRkBY/XHSOXJ0zH
         qZ984bQObCbaIBTo0s8apxrFbPT6NCtuc7veIv5QFomG4GLYxO7UXoSVFo9CbUHEs6PK
         t5c1WAMi+evKFnTE/RA+m2LmbAFSMY0FKzkS/soy1uv8L/tvCny2yF1WS2xqDQntUrF7
         siu32qu8RJe29CIN42PCU+/OaJ3EqzoKLzV/i38Y1vDsmkhQQwRmI05UaWmZQcElkY3d
         gKVg==
X-Gm-Message-State: AOJu0YxHlA1/E9G6SNGWjs37QWwSxCDLl/SpgnlRk0zL4jpCDhiWRywC
	3Qkw2wsggWjX7bcG8qixdH8Ne1CDCGIlY+qhqtM=
X-Google-Smtp-Source: AGHT+IFNI74+YNQA3KSvGpKhUuTNU4PHfmLowVWnfUrcsdiQP4p/loRDXs+lYzLROz+4aagaMI7FQQ==
X-Received: by 2002:a2e:be21:0:b0:2cb:2b42:6d68 with SMTP id z33-20020a2ebe21000000b002cb2b426d68mr1342157ljq.4.1702280532766;
        Sun, 10 Dec 2023 23:42:12 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id s30-20020a05651c201e00b002ca0217f327sm1116269ljo.65.2023.12.10.23.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 23:42:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Uwe Kleine-K?nig <u.kleine-koenig@pengutronix.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Jaewon Kim <jaewon02.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org, 
 linux-serial@vger.kernel.org
In-Reply-To: <20231208074527.50840-3-jaewon02.kim@samsung.com>
References: <20231208074527.50840-1-jaewon02.kim@samsung.com>
 <CGME20231208075020epcas2p30e46ea65e921664930b337510461892f@epcas2p3.samsung.com>
 <20231208074527.50840-3-jaewon02.kim@samsung.com>
Subject: Re: (subset) [PATCH v3 2/4] arm64: dts: exynos: add minimal
 support for exynosautov920 sadk board
Message-Id: <170228053058.12030.17311728279876504581.b4-ty@linaro.org>
Date: Mon, 11 Dec 2023 08:42:10 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Fri, 08 Dec 2023 16:45:25 +0900, Jaewon Kim wrote:
> ExynosAutov920 SADK is ExynosAutov920 SoC based SADK(Samsung Automotive
> Development Kit) board. It has 16GB(8GB + 8GB) LPDDR5 RAM and 256GB
> (128GB + 128GB) UFS.
> 
> This is minimal support board device-tree.
>  * Serial console
>  * GPIO Key
>  * PWM FAN
> 
> [...]

Applied, thanks!

[2/4] arm64: dts: exynos: add minimal support for exynosautov920 sadk board
      https://git.kernel.org/krzk/linux/c/57de428eaca2b9af1a35df96c7adcad4b5ea79f9

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

